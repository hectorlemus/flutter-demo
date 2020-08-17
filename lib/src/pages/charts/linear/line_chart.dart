import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_demo/src/pages/charts/linear_sales.dart';
import 'package:flutter_demo/src/repository/chart_repository.dart';

class LineChart extends StatelessWidget {
  final ChartRepository repository;

  const LineChart({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return _lineChart();
  }

  Widget _lineChart() {
    final List<charts.Series> seriesList = _series();

    return new charts.LineChart(
      seriesList,
      animate: false,
      defaultRenderer: new charts.LineRendererConfig(includePoints: true),
    );
  }

  List<charts.Series<LinearSales, int>> _series() {
    final data = repository.getSales();

    return [
      new charts.Series<LinearSales, int>(
        id: 'sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}
