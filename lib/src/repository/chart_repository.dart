import 'package:flutter_demo/src/pages/charts/linear_sales.dart';

class ChartRepository {
  List<LinearSales> getSales() {
    // Get from API
    return [
      new LinearSales(0, 100),
      new LinearSales(1, 40),
      new LinearSales(2, 60),
      new LinearSales(3, 20),
      new LinearSales(4, 70),
    ];
  }
}
