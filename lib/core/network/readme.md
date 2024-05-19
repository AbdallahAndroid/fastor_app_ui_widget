## NetworkManager

---

### Simple Example


#### Request Information

#### Generate Body 

```
    Map<String, dynamic> body = Map();
    body[ "payment_method"] =  "cash";
    body[ "price"] = "123";
```


#### Generate Bearer Token in Header
```
    var token = await UserSingleTone.instance().getToken();
    Map<String, String> header = NetworkHeaderTools.bearerToken( token );
```

###  Call Class "NetworkManagerDio.dart" 
We will return the response in format JSON 
```
    NetworkManagerDio(url, headers:  header, body: body, callback: (status, msg, json){
         
            parseJson(json );

        });
    }

```

### Callback Parameter  

what is the callback for
``` 
 callback: (status, msg, json){
```

This is value of 
``` 
bool status, String msg, Map<String, dynamic> json
```

---
 

### Full Example

#### typedef

```
typedef CityListCallBack = Function(bool status, String msg , ResponseCityList response );

```

##### class CityListAPI

```

class CityListAPI   {


  int? page ;
  late CityListCallBack callBackCity;

  //data
  ResponseCityList response =  ResponseCityList();
 

  Future  getData(  CityListCallBack callBack) async {
    this.callBackCity = callBack;

    await _startAPIGetAll();
  }


  Future _startAPIGetAll() async  {
  
    String url = BackendConstant.baseUrl_v1 + "/city/?paginator=10000000&page=1"   ;
 
    //header
    var token = await UserSingleTone.instance().getToken();
    Map<String, String> header = NetworkHeaderTools.bearerToken( token );

    NetworkManagerDio(url, headers:  header,  callback: (status, msg, json){

      if( status ) {
        parseJson(json );
      } else  {
        callBackCity( false , msg , response );
      }

    });
  }

  //------------------------------------------------------------------- parse

  void parseJson(Map<String, dynamic> mapJson ) {

    try {

      response = ResponseCityList.fromJson( mapJson);

      //check
      if ( ValidateResponse.isFailed( response.code) ) {
        callBackCity( false, "Failed to download", response ) ;
        return;
      }

      //check have data
      if ( response.data == null  ) {
        callBackCity( false,"Failed to download data"  , response) ;
        return;
      }

      //callback success
      callBackCity( true,"Success", response   );

    } catch (e ){
      Log.i( "exe: " + e.toString() );
      callBackCity( false, e.toString(), response ) ;
    }
  }

}
```

##### Class Response :

* i am used website for generate POJO using [javiercbk](https://javiercbk.github.io/json_to_dart/) 

```

class ResponseCityList {
  String? status;
  int? code;
  DataCity? data;

  ResponseCityList({this.status, this.code, this.data});

  ResponseCityList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    data = json['data'] != null ? new DataCity.fromJson(json['data']) : null;
  }

  @override
  String toString() {
    return 'ResponseListCity{status: $status, code: $code, data: $data}';
  }
}

class DataCity {

  List<MCity>? data;
  int? currentPage;
  int? total;

  @override
  String toString() {
    return 'DataCity{data: $data, currentPage: $currentPage, totalBar: $total}';
  }


  DataCity.fromJson(Map<String, dynamic> json) {

    if (json['data'] != null) {
      data = <MCity>[];
      json['data'].forEach((v) {
        data!.add(new MCity().fromJson(v));
       // Log.i( "DataCity - fromJson - data: " + data.toString() );
      });
    }
    currentPage = json['current_page'];
    total = json['total'];
  }


}

```

---

### Validate Response Json
* use class "ValidateResponse.dart"

* method return boolean when value is 1 
``` 
ValidateResponse.isSuccess()
```

* method used to change status, example change status of product from "favorite" to "unfavorite" and vise versa

``` 
var viseVersa = ValidateResponse.changeStatus()
```

---

###  NetworkType

#### Enum of Network type
``` 
enum NetworkType{
get,
post,
put,
delete,
file
}
```

---

#### Upload File
* What is class "xFile" it's famous used by plugin "cross_file".
* Generate XFile used by [image picker](https://pub.dev/packages/image_picker)    

##### class "NetworkRequestFile"

this class used to set the path of file of "xFile" and set the key/value of file


##### Example upload file type "xFile"
```

  Future _startAPI() async  {
  
    //body request
    Map<String, dynamic> body = Map();
    body[ "payment_method"] =  "cash";
    body[ "price"] = "123";
    
    //set type requestFile
    NetworkRequestFile?  requestFile = NetworkRequestFile.fromXFileAndBody( xFile!, body );
 
    //header
    var token = await UserSingleTone.instance().getToken();
    Map<String, String> header = NetworkHeaderTools.bearerToken( token );

    NetworkManagerDio(urlApiLink,
        type: NetworkType.file ,
        requestFile: requestFile,
        headers:  header,
        callback: (status, msg, json){

            parseJson(json );

        });
```
