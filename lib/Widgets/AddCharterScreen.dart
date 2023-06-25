import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task/Widgets/AddCharterScreen1.dart';

class AddCharterScreen extends StatefulWidget {
  const AddCharterScreen({super.key});

  @override
  State<AddCharterScreen> createState() => _AddCharterScreenState();
}

class _AddCharterScreenState extends State<AddCharterScreen> {

  getUserInfo() async {
  String email="xihoh55496@dineroa.com";
  String password="Marlo@123";
  final response = await http.get(
    Uri.parse('https://asia-southeast1-marlo-bank-dev.cloudfunctions.net/api_dev/contracts/charterers/search?charterer_name=C'),
    // Send authorization headers to the backend.
    headers: {
      'authtoken':'eyJhbGciOiJSUzI1NiIsImtpZCI6ImE5NmFkY2U5OTk5YmJmNWNkMzBmMjlmNDljZDM3ZjRjNWU2NDI3NDAiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbWFybG8tYmFuay1kZXYiLCJhdWQiOiJtYXJsby1iYW5rLWRldiIsImF1dGhfdGltZSI6MTY2OTg4MDg4MiwidXNlcl9pZCI6IlJoSGdiY1U0cHZNMGR3RE90d1piTlhPOTlRMjMiLCJzdWIiOiJSaEhnYmNVNHB2TTBkd0RPdHdaYk5YTzk5UTIzIiwiaWF0IjoxNjY5ODgwODgyLCJleHAiOjE2Njk4ODQ0ODIsImVtYWlsIjoieGlob2g1NTQ5NkBkaW5lcm9hLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ4aWhvaDU1NDk2QGRpbmVyb2EuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.tcnVAKHuPZhDvBwd-SLUyhmZRMZeeGDCYQC5iT6p9zZTy3D_iUbmmdYNJDBgcrs_HFbudIOzyAor_zOMcxWYTNCwcSBYKAFYkAhhpyGD7iv2zYEwCN7nl22V0IQFHP5GZJ_DLgU3cp9GCaEC7qwY06hF8_wd6754Kn_qQL_E2o3vIKwjEbUAYFLPozaTA3GCLf5pfsoQPxfZ0WFwTCKVH7KriLgP1Wk0XHyIiEYuBZtzTtW2sliaPpSKRLy2UGergXih6Dr3kayXTvd1Yjmu_HogSl3jCannNu6JhkyWXxjefPsKrPCSgzf6hVjp7eJs_8ZHTz_6Bhp7kfh3tu3S7A', // HttpHeaders.authorizationHeader: base64Encode(utf8.encode('${email}:${password}')),
    },
  );
    }
    
    @override
    void initState(){
      super.initState();
      getUserInfo();
    }
    List<dynamic> _foundUsers = [];
void _runFilter(String enteredKeyword)async {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      // results = _allUsers;
    } else {
       final response = await http.get(
    Uri.parse('https://asia-southeast1-marlo-bank-dev.cloudfunctions.net/api_dev/contracts/charterers/search?charterer_name=${enteredKeyword}'),
    // Send authorization headers to the backend.
    headers: {
      'authtoken':'eyJhbGciOiJSUzI1NiIsImtpZCI6ImE5NmFkY2U5OTk5YmJmNWNkMzBmMjlmNDljZDM3ZjRjNWU2NDI3NDAiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbWFybG8tYmFuay1kZXYiLCJhdWQiOiJtYXJsby1iYW5rLWRldiIsImF1dGhfdGltZSI6MTY2OTg4MDg4MiwidXNlcl9pZCI6IlJoSGdiY1U0cHZNMGR3RE90d1piTlhPOTlRMjMiLCJzdWIiOiJSaEhnYmNVNHB2TTBkd0RPdHdaYk5YTzk5UTIzIiwiaWF0IjoxNjY5ODgwODgyLCJleHAiOjE2Njk4ODQ0ODIsImVtYWlsIjoieGlob2g1NTQ5NkBkaW5lcm9hLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJ4aWhvaDU1NDk2QGRpbmVyb2EuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.tcnVAKHuPZhDvBwd-SLUyhmZRMZeeGDCYQC5iT6p9zZTy3D_iUbmmdYNJDBgcrs_HFbudIOzyAor_zOMcxWYTNCwcSBYKAFYkAhhpyGD7iv2zYEwCN7nl22V0IQFHP5GZJ_DLgU3cp9GCaEC7qwY06hF8_wd6754Kn_qQL_E2o3vIKwjEbUAYFLPozaTA3GCLf5pfsoQPxfZ0WFwTCKVH7KriLgP1Wk0XHyIiEYuBZtzTtW2sliaPpSKRLy2UGergXih6Dr3kayXTvd1Yjmu_HogSl3jCannNu6JhkyWXxjefPsKrPCSgzf6hVjp7eJs_8ZHTz_6Bhp7kfh3tu3S7A'
      });
  final responseJson = jsonDecode(response.body);
  if (kDebugMode) {
    print(responseJson['data']);
  }
      results = responseJson['data'];
          // .where((data) =>
          //     data["chartererName"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          // .toList();

      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }
  @override
  Widget build(BuildContext context) {
    return 
    Padding(
        padding: const EdgeInsets.all(10),
        child: 
    Column(
          children: [
            Row(
            children: const [
              Padding(padding: EdgeInsets.only(left: 10),
              child:
            Text("Charterer",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,)
              )
            )
          ]
        ),
          const SizedBox(
              height: 20,
            ),
            TextField(
             onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                hintText: "Search",
                suffixIcon: const Icon(Icons.search),
                // prefix: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             _foundUsers.isNotEmpty
                  ?
                  ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 50,
              maxHeight: 400,
            ),child:
            Container(
              // height: 400,
              child:
            Card(
               shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                    //  physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) =>
                      Row(children: [
                        Padding(padding: const EdgeInsets.only(bottom: 10,top:10,left:10,right: 10),
                        child: 
                        Row(children: [
                        SizedBox(
                          width: 300,
                          child: 
                        Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text(_foundUsers[index]['chartererName'],style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 18),
                       ),
                    ]
                        ),
                        )
                        ],
                        ),
                      ),
                    ]
                    ,),
                      // Card(
                      //   elevation: 1,
                      //   margin: const EdgeInsets.symmetric(vertical: 2),
                      //   child:  Text(_foundUsers[index]['chartererName'],style: const TextStyle(fontWeight: FontWeight.normal),),
                      // ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 12),
                    ),
            ),
            )
            ): const Text(
                      '',
                      style: TextStyle(fontSize: 12),
                    ),
            const SizedBox(height: 10,),
             Row(
            children:  [
              const Padding(padding: EdgeInsets.only(left: 10),
              child:
            Text("Can't find your Charterer?",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
              fontSize: 16,)
              ),),
               InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCharterScreen1()));
                },child:
              const Text("Add now",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.normal,
              fontSize: 16,)
              )
               ),
            ]
            ),
          ]
        )
      );
  }
}

// class URLS {
//     static const String BASE_URL = 'https://asia-southeast1-marlo-bank-dev.cloudfunctions.net/api_dev/contracts/charterers';
//     static const String USERNAME ="xihoh55496@dineroa.com"; 
//     static const String PASSWORD = "Marlo@123";
// }