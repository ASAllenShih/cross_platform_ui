import 'package:cross_platform_ui/cross_platform/button.dart';
import 'package:cross_platform_ui/cross_platform/cupertino/action_sheet.dart';
import 'package:cross_platform_ui/cross_platform/cupertino/action_sheet_action.dart';
import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:cross_platform_ui/method/method_widget.dart';
import 'package:cross_platform_ui/ui/widget/ui_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossPlatformDropdownMenu<T>
    extends CrossPlatformUi<CrossPlatformDropdownMenu<T>>
    with UiWidget {
  CrossPlatformDropdownMenu({
    dynamic label,
    dynamic leadingIcon,
    dynamic cancel,
    required List<DropdownMenuEntry<T>> dropdownMenuEntries,
    T? initialSelection,
    void Function(T?)? onSelected,
    BuildContext? context,
    super.type,
  }) : super(
         datas: {
           CrossPlatformType.material: () => DropdownMenu<T>(
             label: methodWidgetOrNull(label),
             leadingIcon: methodWidgetOrNull(leadingIcon),
             dropdownMenuEntries: dropdownMenuEntries,
             initialSelection: initialSelection,
             enableFilter: true,
             onSelected: onSelected,
           ),
           CrossPlatformType.cupertino: () => CrossPlatformButtonElevated(
             onPressed: () async {
               if (context == null || !context.mounted) {
                 return;
               }
               bool isTriggered = false;
               final result = await showCupertinoModalPopup<T>(
                 context: context,
                 builder: (BuildContext content) {
                   return CrossPlatformCupertinoActionSheet(
                     title: methodWidgetOrNull(label),
                     actions: dropdownMenuEntries
                         .map(
                           (DropdownMenuEntry<T> dropdownMenuEntry) =>
                               CrossPlatformCupertinoActionSheetAction(
                                 onPressed: () {
                                   if (!content.mounted) {
                                     return;
                                   }
                                   isTriggered = true;
                                   Navigator.of(
                                     content,
                                   ).pop(dropdownMenuEntry.value);
                                 },
                                 child: Text(dropdownMenuEntry.label),
                                 isDefaultAction:
                                     initialSelection ==
                                     dropdownMenuEntry.value,
                               ),
                         )
                         .toList(),
                     cancelButton: methodWidgetOrNull(cancel) != null
                         ? CrossPlatformCupertinoActionSheetAction(
                             onPressed: () {
                               if (!content.mounted) {
                                 return;
                               }
                               Navigator.of(content).pop();
                             },
                             child: methodWidgetOrNull(cancel),
                             isDestructiveAction: true,
                           )
                         : null,
                   ).widget;
                 },
               );
               if (onSelected != null && isTriggered) {
                 onSelected(result);
               }
             },
             child: Row(
               mainAxisSize: MainAxisSize.min,
               children: [
                 if (methodWidgetOrNull(leadingIcon) != null)
                   methodWidget(leadingIcon),
                 if (methodWidgetOrNull(label) != null) methodWidget(label),
                 if (dropdownMenuEntries
                     .where(
                       (DropdownMenuEntry<T> menu) =>
                           menu.value == initialSelection,
                     )
                     .isNotEmpty)
                   Text(
                     ': ${dropdownMenuEntries.where((DropdownMenuEntry<T> menu) => menu.value == initialSelection).first.label}',
                   ),
               ],
             ),
             type: type,
           ).widget,
         },
       );
}
