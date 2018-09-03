import 'package:flutter/material.dart';

enum FilterMode {
  single,
  multiple,
}

class FilterBar extends StatefulWidget {
  final List<FilterItem> items;
  final Function(List<String> selectedItems) onItemsSelected;
  final Function(String selectedItem) onItemSelected;
  final Color textColor;
  final Color backgroundColor;
  final Color activeTextColor;
  final Color activeBackgroundColor;
  final EdgeInsets itemMargin;
  final bool warped;
  final FilterMode filterMode;

  FilterBar({
    @required this.items,
    @required this.onItemsSelected,
    this.onItemSelected = null,
    this.textColor,
    this.backgroundColor,
    this.activeTextColor,
    this.activeBackgroundColor,
    this.itemMargin = const EdgeInsets.only(right: 8.0),
    this.warped = false,
    this.filterMode = FilterMode.multiple,
  });

  FilterBar.singleSelection({
    @required this.items,
    @required this.onItemSelected,
    this.onItemsSelected = null,
    this.textColor,
    this.backgroundColor,
    this.activeTextColor,
    this.activeBackgroundColor,
    this.itemMargin = const EdgeInsets.only(right: 8.0),
    this.warped = false,
    this.filterMode = FilterMode.single,
  });

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  Set<FilterItem> selectedItems = Set();
  FilterItem selectedItem = null;

  bool _isSelected(FilterItem item) {
    return selectedItems.contains(item) || selectedItem == item;
  }

  Widget _getAvatar(FilterItem item) {
    if (item.deselectedAvatar != null && item.selectedAvatar != null) {
      return _isSelected(item) ? item.deselectedAvatar : item.selectedAvatar;
    }

    return null;
  }

  Widget _buildChip(FilterItem item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          switch (widget.filterMode) {
            case FilterMode.single:
              if (selectedItem == item) {
                selectedItem = null;
                widget.onItemSelected(null);
                return;
              }

              selectedItem = item;
              widget.onItemSelected(item.title);
              break;

            case FilterMode.multiple:
              if (selectedItems.contains(item)) {
                selectedItems.remove(item);
                return;
              }

              selectedItems.add(item);
              widget.onItemsSelected(selectedItems.map((item) => item.title).toList());
              break;
          }
        });
      },
      child: Container(
        margin: widget.itemMargin,
        child: Chip(
          avatar: _getAvatar(item),
          shape: StadiumBorder(side: BorderSide(color: _isSelected(item) ? widget.activeBackgroundColor : Colors.blueGrey.shade100)),
          backgroundColor: _isSelected(item) ? widget.activeBackgroundColor : widget.backgroundColor,
          label: Text(item.title, style: TextStyle(color: _isSelected(item) ? widget.activeTextColor : widget.textColor)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.warped
        ? Wrap(
            direction: Axis.horizontal,
            children: widget.items.map((item) => _buildChip(item)).toList(),
          )
        : Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: widget.items.map((item) => _buildChip(item)).toList(),
            ),
          );
  }
}

class FilterItem {
  final String title;
  final Widget selectedAvatar;
  final Widget deselectedAvatar;

  FilterItem({
    @required this.title,
    this.selectedAvatar,
    this.deselectedAvatar,
  });

  @override
  bool operator ==(Object other) => identical(this, other) || other is FilterItem && runtimeType == other.runtimeType && title == other.title;

  @override
  int get hashCode => title.hashCode;
}
