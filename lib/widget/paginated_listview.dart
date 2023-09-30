import 'package:admin_backend/model/paginated_model.dart';
import 'package:admin_backend/util/type_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginatedListView extends StatefulWidget {
  final PaginatedModel paginatedModel;
  final NullableIndexedWidgetBuilder itemBuilder;

  const PaginatedListView(
      {super.key, required this.itemBuilder, required this.paginatedModel});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PaginatedListView> {
  late final TextEditingController _pageNoController;
  int _nextPage = 1;

  @override
  void initState() {
    super.initState();
    _pageNoController =
        TextEditingController(text: '${widget.paginatedModel.currentPage}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              itemBuilder: widget.itemBuilder,
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 5,
                  color: Colors.grey.withOpacity(0.1),
                );
              },
              itemCount: widget.paginatedModel.length),
        ),
        _buildPagingButtons(),
      ],
    );
  }

  _buildPagingButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {},
          child: const Icon(Icons.skip_previous),
        ),
        SizedBox(
            width: 80,
            height: 50,
            child: TextField(
              controller: _pageNoController,
              onChanged: (String value) {
                _nextPage = TypeUtil.parseInt(value);
              },
            )),
        ElevatedButton(
          onPressed: () {
            widget.paginatedModel.goToPage(_nextPage);
          },
          child: const Text('确定'),
        ),
        GestureDetector(onTap: () {}, child: const Icon(Icons.skip_next)),
      ],
    );
  }
}
