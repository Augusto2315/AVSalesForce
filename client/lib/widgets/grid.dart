import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Grid extends StatefulWidget {
  final List<Object> source = [];
  final bool editing = true;

  Grid({Key? key, required List<Object> source, required bool editing})
      : super(key: key);

  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      source: widget.source,
      allowEditing: widget.editing,
      allowSorting: true,
      allowSwiping: true,
      columns: widget.columns,
    );
  }
}
