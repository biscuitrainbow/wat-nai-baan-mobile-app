import 'package:flutter/material.dart';

class FilterBar extends StatefulWidget {
  final List<String> items;
  final Function(List<String> selectedItems) onChanged;
  final Color textColor;
  final Color backgroundColor;
  final Color activeTextColor;
  final Color activeBackgroundColor;
  final EdgeInsets itemMargin;
  final bool warped;

  FilterBar({
    @required this.items,
    @required this.onChanged,
    this.textColor,
    this.backgroundColor,
    this.activeTextColor,
    this.activeBackgroundColor,
    this.itemMargin = const EdgeInsets.only(right: 8.0),
    this.warped = false,
  });

  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  Set<String> selectedItems = Set();

  bool isSelected(String item) {}

  Widget _buildChip(String item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedItems.contains(item)) {
            selectedItems.remove(item);
            return;
          }

          selectedItems.add(item);
        });

        widget.onChanged(selectedItems.toList());
      },
      child: Container(
        margin: widget.itemMargin,
        child: Chip(
          shape: StadiumBorder(side: BorderSide(color: selectedItems.contains(item) ? widget.activeBackgroundColor : Colors.blueGrey.shade100)),
          backgroundColor: selectedItems.contains(item) ? widget.activeBackgroundColor : widget.backgroundColor,
          label: Text(item, style: TextStyle(color: selectedItems.contains(item) ? widget.activeTextColor : widget.textColor)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.warped
        ? Wrap(
            direction: Axis.horizontal,
            children: widget.items.map((text) => _buildChip(text)).toList(),
          )
        : Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: widget.items.map((text) => _buildChip(text)).toList(),
            ),
          );
  }
}
