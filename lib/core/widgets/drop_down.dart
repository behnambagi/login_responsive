import 'package:flutter/material.dart';

class DropDown<T> extends StatelessWidget {
  const DropDown(
      {Key? key,
      required this.onChanged,
      required this.items,
      required this.value, this.icon,
        this.selectedItemBuilder, this.hint, this.label, this.subLabel, this.horizontalPadding})
      : super(key: key);

  final List<DropdownMenuItem<T>> items;
  final List<Widget> Function(BuildContext)? selectedItemBuilder;
  final void Function(T?) onChanged;
  final String? label;
  final String? subLabel;
  final double? horizontalPadding;
  final Widget? icon;
  final Widget? hint;
  final T? value;

  @override
  Widget build(BuildContext context) {
    return

      Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (subLabel != null)
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child:
                          Text(subLabel!, style: const TextStyle(fontSize: 12)),
                        ),
                      ),
                    if (label != null)
                      Text(label!,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 7),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black12, width: 1)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1, horizontal:10),
                  child: DropdownButton<T>(
                    focusColor: Colors.black12,
                    hint: hint,
                    items: items,
                    onChanged: onChanged,
                    value: value,
                    icon: icon,
                    elevation: 1,
                    borderRadius: BorderRadius.zero,
                    selectedItemBuilder: selectedItemBuilder,
                    underline: const SizedBox(),

                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
