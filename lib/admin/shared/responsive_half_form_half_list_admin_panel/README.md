# basm allah elrahman elrahim

## Admin Panel Responsive 

### How  to Navigate to page form, while in mobile you just see page listview : 

```
            ButtonApp( "Add User",   (){
              PageSelectionCubit.get(context).showNextPage();
            })
```

### How to Handle when user press back button, while he is already opened form page, while user need to return back to page list
```
 PageSelectionCubit.get(context).showPreviousPage();
```

### Example

* test example 
````
    return ResponsiveHalfFormHalfListAdminPanel(
        pageList: Column(
          children: [
            TextApp( "list user item 1"),
            TextApp( "list user item 2"),
            TextApp( "list user item 3"),
            ButtonApp( "Add User",   (){
              PageSelectionCubit.get(context).showNextPage();
            })
          ],
        ),
      pageForm: Column(
        children: [
          TextFieldApp(  hint_text: "input field 1", width: 100,),
          TextFieldApp(  hint_text: "input field 2", width: 100,),
          TextFieldApp(  hint_text: "input field 3", width: 100,),
        ],
      ),

    );
````