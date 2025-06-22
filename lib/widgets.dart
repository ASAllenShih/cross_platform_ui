import 'package:cross_platfrom_ui/widgets/app.dart';
import 'package:cross_platfrom_ui/widgets/button.dart';
import 'package:cross_platfrom_ui/widgets/dialog.dart';
import 'package:cross_platfrom_ui/widgets/field.dart';
import 'package:cross_platfrom_ui/widgets/material_item.dart';
import 'package:cross_platfrom_ui/widgets/modal.dart';
import 'package:cross_platfrom_ui/widgets/section.dart';
import 'package:cross_platfrom_ui/widgets/selection.dart';
import 'package:cross_platfrom_ui/widgets/tile.dart';

class Widgets {
  static final appRouter = App.router;
  static final scaffold = App.scaffold;
  static final appBar = App.bar;
  static final textButton = Button.text;
  static final elevatedButton = Button.elevated;
  static final filledButton = Button.filled;
  static final dialogButton = Button.dialog;
  static final showDialog = Dialog.show;
  static final textField = Field.text;
  static final textFormField = Field.textForm;
  static final textSearchField = Field.textSearch;
  static final tabBar = MaterialItem.tabBar;
  static final showModalPopup = Modal.showPopup;
  static final actionSheet = Modal.actionSheet;
  static final actionSheetAction = Modal.actionSheetAction;
  static final listSection = Section.list;
  static final formSection = Section.form;
  static final radio = Selection.radio;
  static final listTile = Tile.list;
}
