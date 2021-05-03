import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberPickerSheet {

  NumberPickerSheet._();

  static Future<int?> show({
    required BuildContext context,
    required int itemNumber,
    void Function(int)? onSelectedItemChanged,
  }) async {
    int? selectedItem;

    await showModalBottomSheet<void>(
      context: context, 
      isDismissible: false,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: CupertinoButton(
                onPressed: () {
                  Navigator.of(context).pop();
                }, 
                child: Text(
                  '完了',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 220,
              child: CupertinoPicker.builder(
                itemExtent: 40,
                childCount: itemNumber,
                onSelectedItemChanged: (index) {
                  final itemValue = index + 1;
                  selectedItem = itemValue;

                  if (onSelectedItemChanged != null) {
                    onSelectedItemChanged(itemValue);
                  }
                }, 
                itemBuilder: (_, index) {
                  return Center(child: Text('${index + 1}'));
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      }
    );

    return selectedItem;
  }
}