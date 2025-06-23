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
  driversResponse = null;
  downloadDrivers();
}


getNextPageDriver() async {
  int current = driversResponse?.meta?.currentPage??1;
  int next  = current  + 1;
  downloadDrivers(next );
}


downloadDrivers(int nextPage ) async {
  Log.i("downloadDrivers() - start downloadDriverPage: nextPage");

  /// emit
  emit(DriversDownloadingListState());


  Either<Failure, DriversResponse> either = await driversDownloadUsecase( nextPage );
  return either.fold((failure) {
    var msg = getFailureMessage(failure);
    Log.i("downloadDrivers() - failure: $failure");
    emit(DriversDownloadListErrorState(msg));
  }, (response) async {
 
    _chooseAppendOrReplace(response);

    emit(DriversDownloadListCompleteState(  ));
  });
}




  void _chooseAppendOrReplace(DriversResponse responseNew) {

    /// case  the old Response not found, means first time download data
    if( driversResponse == null ){
      driversResponse = responseNew;
      return;
    }

    /// case first page (reset first page )
    int newPage = responseNew.meta?.currentPage??1;
    bool isFirstPage = newPage  == 1;
    if( isFirstPage  ) {
      driversResponse = responseNew;
      return;
    }

    /// validate : this page already download before
    int previous = driversResponse?.meta?.currentPage??1;
    bool isPageAlreadyDownloaded = newPage == previous ;
    Log.i("_chooseAppendOrReplace()  - previous: $previous /newPage: $newPage"
        " /isPageAlreadyDownloaded: $isPageAlreadyDownloaded");
    if( isPageAlreadyDownloaded ){
      return;
    }

    /// update meta
    driversResponse!.meta = responseNew.meta;

    ///default append
    driversResponse!.drivers.addAll( responseNew.drivers );
  }

``` 