import 'package:cross_platform_ui/cross_platform/app.dart';
import 'package:cross_platform_ui/cross_platform/button.dart';
import 'package:cross_platform_ui/cross_platform/dialog.dart';
import 'package:cross_platform_ui/cross_platform/field.dart';
import 'package:cross_platform_ui/cross_platform/material_item.dart';
import 'package:cross_platform_ui/cross_platform/modal.dart';
import 'package:cross_platform_ui/cross_platform/section.dart';
import 'package:cross_platform_ui/cross_platform/selection.dart';
import 'package:cross_platform_ui/cross_platform/tile.dart';

class CrossPlatform {
  static final appRouter = App.router;
  static final scaffold = App.scaffold;
  static final appBar = App.bar;
  static final textButton = Button.text;
  static final elevatedButton = Button.elevated;
  static final filledButton = Button.filled;
  static final dialogButton = Button.dialog;
  static final showDialog = Dialog.show;
  static final alertDialog = Dialog.alert;
  static final textField = Field.text;
  static final textFormField = Field.textForm;
  static final textSearchField = Field.textSearch;
  static final tabBar = MaterialItem.tabBar;
  static final showModalPopup = Modal.showPopup;
  static final actionSheet = Modal.actionSheet;
  static final dropdownMenu = Modal.dropdownMenu;
  static final actionSheetAction = Modal.actionSheetAction;
  static final listSection = Section.list;
  static final formSection = Section.form;
  static final radio = Selection.radio;
  static final listTile = Tile.list;
}
