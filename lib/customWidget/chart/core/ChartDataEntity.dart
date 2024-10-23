
class ChartDataEntity {

  double  pointX;
  double  pointY;

  ChartDataEntity( this.pointX, this.pointY);

  @override
  String toString() {
    return 'ChartDataEntity{pointX: $pointX, pointY: $pointY}';
  }
}