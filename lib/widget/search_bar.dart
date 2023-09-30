import 'package:flutter/material.dart';
import '../locale/k.dart';

class SearchBar extends StatefulWidget {
  const SearchBar(
      {super.key, required this.onSearch, this.hintText, this.onCancel});

  final String? hintText;
  final void Function(String) onSearch;
  final void Function()? onCancel;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: AlignmentDirectional.center,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                focusNode: _focusNode,
                controller: _searchController,
                textAlignVertical: TextAlignVertical.top,
                onSubmitted: (String value) {
                  widget.onSearch.call(_searchController.text);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  //去掉输入框的下滑线
                  fillColor: const Color(0xFFE1E1E1),
                  filled: true,
                  hintText: widget.hintText ?? K.getTranslation('search_hint'),
                  hintStyle:
                      const TextStyle(color: Colors.grey, fontSize: 12.0),
                  contentPadding: const EdgeInsets.all(12.0),
                  enabledBorder: null,
                  disabledBorder: null,
                  alignLabelWithHint: true,
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      widget.onSearch.call(_searchController.text);
                    },
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_searchController.text.isNotEmpty)
                        IconButton(
                          icon: const Icon(Icons.cancel),
                          onPressed: () {
                            _searchController.clear();
                            widget.onCancel?.call();
                          },
                        ),
                      if (_focusNode.hasFocus)
                        IconButton(
                          icon: Text(
                            K.getTranslation('confirm'),
                            style: const TextStyle(color: Color(0xFF919191),fontSize: 12),
                          ),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            widget.onSearch?.call(_searchController.text);
                          },
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
