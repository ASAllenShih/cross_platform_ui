import 'package:cross_platform_ui/cross_platform/button.dart' as button;
import 'package:cross_platform_ui/cross_platform_device_type.dart';
import 'package:cross_platform_ui/cross_platform_type.dart';
import 'package:cross_platform_ui/cross_platform_ui.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Modal {
  static Future<T?> showPopup<T>({
    CrossPlatformDeviceType? type,
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    bool? barrierDismissible,
  }) {
    type ??= CrossPlatformDeviceType(main: CrossPlatformType.cupertino);
    return type.data({
      CrossPlatformType.cupertino: () => showCupertinoModalPopup<T>(
        context: context,
        builder: builder,
        barrierDismissible: barrierDismissible ?? true,
      ),
    }).data;
  }

  static CrossPlatformUi actionSheet({
    CrossPlatformDeviceType? type,
    Widget? title,
    Widget? message,
    List<Widget>? actions,
    Widget? cancelButton,
  }) {
    type ??= CrossPlatformDeviceType(main: CrossPlatformType.cupertino);
    return type.data({
      CrossPlatformType.cupertino: () => CupertinoActionSheet(
        title: title,
        message: message,
        actions: actions,
      ),
    });
  }

  static CrossPlatformUi actionSheetAction({
    CrossPlatformDeviceType? type,
    required void Function() onPressed,
    bool isDefaultAction = false,
    bool isDestructiveAction = false,
    required Widget child,
  }) {
    type ??= CrossPlatformDeviceType(main: CrossPlatformType.cupertino);
    return type.data({
      CrossPlatformType.cupertino: () => CupertinoActionSheetAction(
        onPressed: onPressed,
        isDefaultAction: isDefaultAction,
        isDestructiveAction: isDestructiveAction,
        child: child,
      ),
    });
  }

  static CrossPlatformUi dropdownMenu<T>({
    CrossPlatformDeviceType? type,
    Widget? label,
    Widget? leadingIcon,
    Widget? cancel,
    required List<DropdownMenuEntry<T>> dropdownMenuEntries,
    T? initialSelection,
    void Function(T?)? onSelected,
    BuildContext? context,
  }) {
    type ??= CrossPlatformDeviceType();
    return type.data({
      CrossPlatformType.material: () => DropdownMenu<T>(
        label: label,
        leadingIcon: leadingIcon,
        dropdownMenuEntries: dropdownMenuEntries,
        initialSelection: initialSelection,
        enableFilter: true,
        onSelected: onSelected,
      ),
      CrossPlatformType.cupertino: () => button.Button.elevated(
        type: type,
        onPressed: () async {
          if (context == null || !context.mounted) {
            return;
          }
          bool isTriggered = false;
          final result = await showPopup<T>(
            context: context,
            builder: (BuildContext content) {
              return actionSheet(
                title: label,
                actions: dropdownMenuEntries
                    .map(
                      (DropdownMenuEntry<T> dropdownMenuEntry) =>
                          actionSheetAction(
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
                                initialSelection == dropdownMenuEntry.value,
                          ).widget,
                    )
                    .toList(),
                cancelButton: cancel != null
                    ? actionSheetAction(
                        onPressed: () {
                          if (!content.mounted) {
                            return;
                          }
                          Navigator.of(content).pop();
                        },
                        child: cancel,
                        isDestructiveAction: true,
                      ).widget
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
            if (leadingIcon != null) leadingIcon,
            if (label != null) label,
            if (dropdownMenuEntries
                .where(
                  (DropdownMenuEntry<T> menu) => menu.value == initialSelection,
                )
                .isNotEmpty)
              Text(
                ': ${dropdownMenuEntries.where((DropdownMenuEntry<T> menu) => menu.value == initialSelection).first.label}',
              ),
          ],
        ),
      ).widget,
      CrossPlatformType.fluent: () => DropDownButton(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leadingIcon != null) leadingIcon,
            if (label != null) label,
            if (dropdownMenuEntries
                .where(
                  (DropdownMenuEntry<T> menu) => menu.value == initialSelection,
                )
                .isNotEmpty)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (dropdownMenuEntries
                          .where(
                            (DropdownMenuEntry<T> menu) =>
                                menu.value == initialSelection,
                          )
                          .first
                          .leadingIcon !=
                      null)
                    dropdownMenuEntries
                        .where(
                          (DropdownMenuEntry<T> menu) =>
                              menu.value == initialSelection,
                        )
                        .first
                        .leadingIcon!,
                  Text(
                    ': ${dropdownMenuEntries.where((DropdownMenuEntry<T> menu) => menu.value == initialSelection).first.label}',
                  ),
                  if (dropdownMenuEntries
                          .where(
                            (DropdownMenuEntry<T> menu) =>
                                menu.value == initialSelection,
                          )
                          .first
                          .trailingIcon !=
                      null)
                    dropdownMenuEntries
                        .where(
                          (DropdownMenuEntry<T> menu) =>
                              menu.value == initialSelection,
                        )
                        .first
                        .trailingIcon!,
                ],
              ),
          ],
        ),
        items: dropdownMenuEntries
            .map(
              (DropdownMenuEntry<T> dropdownMenuEntry) => MenuFlyoutItem(
                leading: dropdownMenuEntry.leadingIcon,
                text: Text(dropdownMenuEntry.label),
                trailing: dropdownMenuEntry.trailingIcon,
                onPressed: () {
                  if (onSelected != null) {
                    onSelected(dropdownMenuEntry.value);
                  }
                },
                selected: initialSelection == dropdownMenuEntry.value,
              ),
            )
            .toList(),
      ),
    });
  }
}
