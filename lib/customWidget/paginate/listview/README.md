# PaginateListview Example


## 1- in presentation layer
``` 
        List<DriverModel> data = cubit.driversResponse?.drivers??[];
        return PaginateListview(
          padding: EdgeInsets.only(bottom: 100.hr ),
          children:  data.map<Widget>( (model ) => DriverMangeItem(model )).toList(),
          isLoadingNextPage:   state is DriversDownloadingListState,
          onScrollArriveBottomAndValidToGetNextPageChange: (   ){
            cubit.getNextPageDriver();
          },
        );
```

## 2- in cubit 
```
getFirstPageDriver() async {
  downloadDriverPage= 1;
  driversResponse = null;
  downloadDrivers();
}


getNextPageDriver() async {
  int current = driversResponse?.meta?.currentPage??1;
  downloadDriverPage  = current  + 1;
  downloadDrivers();
}


downloadDrivers() async {
  Log.i("downloadDrivers() - start downloadDriverPage: $downloadDriverPage");

  /// emit
  emit(DriversDownloadingListState());


  Either<Failure, DriversResponse> either = await driversDownloadUsecase( downloadDriverPage );
  return either.fold((failure) {
    var msg = getFailureMessage(failure);
    Log.i("downloadDrivers() - failure: $failure");
    emit(DriversDownloadListErrorState(msg));
  }, (response) async {

    /// update page
    downloadDriverPage = response.meta?.currentPage??1;
    Log.i("downloadDrivers() - success - downloadDriverPage: $downloadDriverPage");

    /// choose : append or replace first page
    if( downloadDriverPage == 1  ) {
      driversResponse = response;
    }  else {
      if( driversResponse != null ){
        driversResponse!.drivers.addAll( response.drivers );
      } else {
        driversResponse = response;
      }
    }

    emit(DriversDownloadListCompleteState(  ));
  });
}
``` 