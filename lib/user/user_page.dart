import 'dart:math';

import 'package:admin_backend/api/user_api.dart';
import 'package:admin_backend/util/system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../api/net.dart';
import '../config.dart';
import '../model/menu_model.dart';

import 'package:flutter/cupertino.dart';

import '../protobuf/generated/common.pb.dart';
import '../protobuf/generated/user.pb.dart';
import '../util/util.dart';
import '../widget/admin_paginated_data_table.dart';
import '../widget/button.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<UserPage> {
  bool _editMode = false;

  @override
  void initState() {
    super.initState();
    _sourceData = SourceData();
    _sourceData.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_sourceData.isLoading) {
      return const Center(
        child: CupertinoActivityIndicator(
          radius: 50,
        ),
      );
    }
    return _buildTable();
  }

  late SourceData _sourceData;

  Widget _buildTable() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          SizedBox(
            width: 1000,
            child: AdminPaginatedDataTable(
              source: _sourceData,
              header: const Text('用户管理'),
              actions: [
                GestureDetector(
                    onTap: () {
                      _sourceData.getFirstPage();
                    },
                    child: const Icon(Icons.refresh)),
                GestureDetector(
                  onTap: () {
                    _editMode = !_editMode;
                    setState(() {});
                  },
                  child: Icon(
                    _editMode ? Icons.cancel_outlined : Icons.edit,
                  ),
                )
              ],
              headingRowHeight: 50.0,
              dataRowHeight: 60.0,
              showFirstLastButtons: true,
              showCheckboxColumn: _editMode,
              rowsPerPage: _sourceData.rowsPerPage,
              onPageChanged: (int page) async {
                if (_sourceData.currentPage == page-1) {
                  await _sourceData.getNextPage();
                } else if (_sourceData.currentPage == page + 1) {
                  await _sourceData.getPreviousPage();
                } else if (page == 1) {
                  await _sourceData.getFirstPage();
                } else if (page-1 ==
                    _sourceData.rowCount ~/ _sourceData.rowsPerPage) {
                    _sourceData.getLastPage();
                }
              },
              availableRowsPerPage: const [10, 20, 50],
              onRowsPerPageChanged: (value) async {
                _sourceData.rowsPerPage = value!;
                await _sourceData.getFirstPage();
                setState(() {});
              },
              sortAscending: _sourceData.sortAscending,
              sortColumnIndex: 1,
              onSelectAll: (state) =>
                  setState(() => _sourceData.selectAll(state!)),
              columns: ['id', '昵称', '手机号/邮箱', '性别', '地区']
                  .map((e) => DataColumn(
                      label: SizedBox(height: 80, child: SelectableText(e))))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

class SourceData extends DataTableSource {
  bool sortAscending = true;
  int rowsPerPage = 10;
  int currentPage = 1;
  bool isLoading = false;
  int _totalCount = 0;
  final List _selectedData = [];

  SourceData() {
    getFirstPage();
  }

  Future getFirstPage() async {
    await _getUserList(1);
  }
  Future getLastPage() async {
    await _getUserList((_totalCount~/rowsPerPage+1));
  }
  Future getNextPage() async {
    return _getUserList(currentPage + 1);
  }

  Future getPreviousPage() async {
    return _getUserList(currentPage - 1);
  }

  Future _getUserList(int page) async {
    isLoading = true;
    UserListResp? resp = await UserAPI.getUserList(page, rowsPerPage);
    if (resp?.code == 1 ?? false) {
      _userList.clear();
      _selectedData.clear();
      _userList.addAll(resp!.data);
      _totalCount = resp!.totalCount.toInt();
      currentPage = page;
      isLoading = false;
      notifyListeners();
    }
    isLoading = false;
    return Future(() => null);
  }

  @override
  DataRow? getRow(int index) {
    // if (index >= _userList.length) {
    //   print('index:$index ${_userList.length} ${_selectedData.length}');
    // }
    int idx = index%rowsPerPage;
    User user = _userList[idx];
    return DataRow.byIndex(
        index: index,
        selected: _selectedData.contains(_userList[idx]),
        onSelectChanged: (bool? selected) {
          if (selected == false) {
            _selectedData.remove(_userList[idx]);
          } else if (selected == true) {
            _selectedData.add(_userList[idx]);
          }
          notifyListeners();
        },
        cells: [
          user.id.toString(),
          user.name,
          user.phone.isNotEmpty
              ? user.phone
              : user.email,
          user.sex == 1 ? '男' : '女',
          user.countryName
        ]
            .map(
                (e) => DataCell(SelectableText(e, textAlign: TextAlign.center)))
            .toList());
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _totalCount;

  @override
  int get selectedRowCount => _selectedData.length;

  void selectAll(bool checked) {
    _selectedData.clear();
    if (checked) {
      _selectedData.addAll(_userList);
    }
    notifyListeners(); //通知监听器去刷新
  }

  final List<User> _userList = [];
}
