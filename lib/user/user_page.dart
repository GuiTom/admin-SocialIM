import 'dart:math';

import 'package:admin_backend/api/user_api.dart';
import 'package:admin_backend/util/system.dart';
import 'package:admin_backend/widget/search_bar.dart';
import 'package:collection/collection.dart';
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
              header: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '用户管理',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  SizedBox(
                    width: 300,
                    height: 200,
                    child: SearchBar(
                      onSearch: (String keyWord) {
                        _sourceData.search(keyWord);
                      },
                      onCancel: () {
                        _sourceData.search(null);
                      },
                      hintText: '输入用户id或昵称',
                    ),
                  ),
                ],
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    _sourceData.editMode = !_sourceData.editMode;

                    setState(() {});
                  },
                  child: Icon(
                    _sourceData.editMode ? Icons.cancel_outlined : Icons.edit,
                  ),
                )
              ],
              headingRowHeight: 50.0,
              dataRowHeight: 60.0,
              showFirstLastButtons: true,
              showCheckboxColumn: _sourceData.editMode,
              rowsPerPage: _sourceData.rowsPerPage,
              onPageChanged: (int page) async {
                if (_sourceData.currentPage == page - 1) {
                  await _sourceData.getNextPage();
                } else if (_sourceData.currentPage == page + 1) {
                  await _sourceData.getPreviousPage();
                } else if (page == 1) {
                  await _sourceData.getFirstPage();
                } else if (page - 1 ==
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
              columns: ['操作', 'id', '昵称', '手机号/邮箱', '性别', '地区']
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

  bool _editMode = false;
  String? _keyWorkd;
  bool isLoading = false;
  int _totalCount = 0;
  final List _selectedData = [];

  set editMode(bool value) {
    _editMode = value;
    if(!value){
      _selectedData.clear();
      notifyListeners();
    }
  }

  bool get editMode {
    return _editMode;
  }

  SourceData() {
    getFirstPage();
  }

  Future getFirstPage() async {
    await _getUserList(1);
  }

  Future getLastPage() async {
    await _getUserList((_totalCount ~/ rowsPerPage + 1));
  }

  Future search(String? keyWorkd) async {
    _keyWorkd = keyWorkd;
    await _getUserList(1);
  }

  Future getNextPage() async {
    return _getUserList(currentPage + 1);
  }

  Future getPreviousPage() async {
    return _getUserList(currentPage - 1);
  }

  Future updateUser(int id) async {}

  Future _getUserList(int page) async {
    isLoading = true;
    if (_keyWorkd != null && _keyWorkd!.isNotEmpty) {
      UserListResp? resp =
          await UserAPI.searchUsers(_keyWorkd!, page, rowsPerPage);
      if (resp?.code == 1) {
        _userList.clear();
        _selectedData.clear();
        _userList.addAll(resp!.data);
        _totalCount = resp!.totalCount.toInt();
        currentPage = page;
        isLoading = false;
        notifyListeners();
      }
    } else {
      UserListResp? resp = await UserAPI.getUserList(page, rowsPerPage);
      if (resp?.code == 1) {
        _userList.clear();
        _selectedData.clear();
        _userList.addAll(resp!.data);
        _totalCount = resp!.totalCount.toInt();
        currentPage = page;
        isLoading = false;
        notifyListeners();
      }
    }
    isLoading = false;
  }

  @override
  DataRow? getRow(int index) {
    int idx = index % rowsPerPage;
    User user = _userList[idx];
    return DataRow.byIndex(
        index: index,
        selected: _selectedData.contains(_userList[idx]),
        onSelectChanged: (bool? selected) {
          if (!editMode) return;
          if (selected == false) {
            _selectedData.remove(_userList[idx]);
          } else if (selected == true) {
            _selectedData.add(_userList[idx]);
          }
          notifyListeners();
        },
        cells: [
          '',
          user.id.toString(),
          user.name,
          user.phone.isNotEmpty ? user.phone : user.email,
          user.sex == 1 ? '男' : '女',
          user.countryName
        ]
            .mapIndexed((index, e) => DataCell(Builder(
                  builder: (BuildContext context) {
                    if (index == 0) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                              onTap: () {
                                updateUser(user.id.toInt());
                              },
                              child: const Icon(Icons.edit_note_outlined)),
                        ],
                      );
                    }
                    return SelectableText(e, textAlign: TextAlign.center);
                  },
                )))
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
