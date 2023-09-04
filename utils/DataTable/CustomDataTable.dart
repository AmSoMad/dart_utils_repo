import 'package:flutter/material.dart';

Widget buildCustomDataTable({
  required List<Map<String, dynamic>>? dataList, // dataList를 nullable로 변경
  bool enableHorizontalScroll = false,
  bool enableVerticalScroll = false,
}) {
  // dataList가 null이거나 크기가 0인 경우의 예외 처리
  if (dataList == null || dataList.isEmpty) {
    return Center(
      child: Text("데이터가 존재하지 않습니다.", style: TextStyle(fontSize: 24),),
    );
  }
  final columnLabels = dataList.isNotEmpty ? dataList[0].keys.toList() : [];

  return SingleChildScrollView(
    scrollDirection: enableHorizontalScroll ? Axis.horizontal : Axis.vertical,
    child: SingleChildScrollView(
      scrollDirection: enableVerticalScroll ? Axis.vertical : Axis.horizontal,
      child: DataTable(
        columns: columnLabels.map((label) => DataColumn(label: Text(label.toString()))).toList(),
        rows: dataList.map((row) {
          return DataRow(
            cells: columnLabels.map((label) => DataCell(Text(row[label]?.toString() ?? ''))).toList(),
          );
        }).toList(),
      ),
    ),
  );
}
