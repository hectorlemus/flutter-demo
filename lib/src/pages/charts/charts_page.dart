import 'package:flutter/material.dart';
import 'package:flutter_demo/src/pages/charts/donut/donut_chart.dart';
import 'package:flutter_demo/src/pages/charts/linear/line_chart.dart';
import 'package:flutter_demo/src/repository/chart_repository.dart';

class ChartsPage extends StatefulWidget {
  final ChartRepository repository = new ChartRepository();

  @override
  _ChartsPageState createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Charts'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: _charts(),
    );
  }

  Widget _charts() {
    return ListView(
      children: [
        _lineChart(),
        _donutChart(),
      ],
    );
  }

  Widget _lineChart() {
    return _chart(
      chartName: 'Line Chart',
      chart: LineChart(
        repository: widget.repository,
      ),
    );
  }

  Widget _donutChart() {
    return _chart(
      chartName: 'Donut Chart',
      chart: DonutChart(
        repository: widget.repository,
      ),
    );
  }

  Widget _chart({
    @required String chartName,
    @required StatelessWidget chart,
  }) {
    return Card(
      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Text(
                '$chartName',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 250.0,
              child: chart,
            ),
          ],
        ),
      ),
    );
  }
}
