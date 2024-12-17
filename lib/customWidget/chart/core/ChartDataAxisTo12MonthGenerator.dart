
import 'package:fastor_app_ui_widget/customWidget/chart/core/ChartDataModel.dart';

@Deprecated("convert data size to 12 month")
class ChartDataAxisTo12MonthGenerator {

  List<ChartDataModel> result12month = [];

  double defaultValuePointX = 0;

  List<ChartDataModel> dataToCheck;

  ChartDataAxisTo12MonthGenerator( this.dataToCheck);

  List<ChartDataModel>   generate12MonthByValuesOfXPoint() {
    if( dataToCheck.isEmpty  ) return [];
    if( dataToCheck.length == 12 ) return dataToCheck;

    _initDefaultValue();
    _setEmptyMonthsValueAsPreviousValue();

    return result12month;
  }


  _initDefaultValue(){
    defaultValuePointX = dataToCheck.first.pointX;
  }


  void _setEmptyMonthsValueAsPreviousValue() {

    for( int monthIdToCheck = 1; monthIdToCheck <=12 ; monthIdToCheck++ ) {
      ChartDataModel? monthModel = _searchMonthModelByMonthId( monthIdToCheck);
      bool isMonthIdNotFoundInData = monthModel == null;
      if(  isMonthIdNotFoundInData ) {
        ChartDataModel previousValue = _getPreviousValue(monthIdToCheck);
        result12month.add( previousValue );
      } else {
        result12month.add( monthModel );
      }
    }
  }


  ChartDataModel? _searchMonthModelByMonthId(int monthIdToCheck) {
    ChartDataModel? result = null;
    for (var element in dataToCheck) {
        if( element.pointX == monthIdToCheck ) {
          result = element;
          break ;
        }
      }
      return result;
  }

  ChartDataModel _getPreviousValue(int monthIdToCheck) {
    int firstPreviousMonth = monthIdToCheck - 1;
    for( int i =  firstPreviousMonth ; i <  monthIdToCheck && i > 0 ; i-- ) {
      ChartDataModel? monthPrevious = _searchMonthModelByMonthId( monthIdToCheck);
      if( monthPrevious != null ) return monthPrevious;
    }
    return _generateDefaultPreviousMonthByDefaultValue(monthIdToCheck);
  }


  ChartDataModel _generateDefaultPreviousMonthByDefaultValue(int monthIdToCheck ) {
    int firstPreviousMonth = monthIdToCheck - 1;
    return ChartDataModel( firstPreviousMonth.toDouble() , defaultValuePointX );
  }

}
