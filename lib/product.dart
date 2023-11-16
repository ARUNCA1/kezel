import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../models/mlodels.dart';

import '../provider/baseprovider.dart';
import 'Pages/Splash.dart';
import 'Pages/home.dart';


class Home2 extends StatefulWidget {
  final array;

  Home2(this.array);


  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  int indexx = 0;
  List category = ['All', 'Lunch', 'Dinner', 'Breackfast'];
  List categoryname = ['dinner', 'lunch', 'dinner', 'fast'];
  List food = [
    ['burger', 'omlet', 'grilled wings', 'Grilled ribs'],
    ['pizza', 'steak', 'pasta', 'burger'],
    ['burger', 'omlet', 'grilled wings', 'Grilled ribs'],
    ['pancake', 'egg', 'banana', 'egg'],
  ];
  var arrayname;
  int length=0;

  @override
  void initState() {
    // TODO: implement initState
    // final postModel = Provider.of<DataClass>(context, listen: false);
    // postModel.getPostData();
    // for(var i=0;i<widget.array.length;i++)
    // length=widget.array['products'];

    cart();

    super.initState();
  }

  Widget build(BuildContext context) {
    // final viewModel = Provider.of<LoginViewModel>(context);
    // Map<dynamic, dynamic> req = {
    //   "key":"restaurant",
    //   "value":"LeisureInnVKL"
    // };
    // // Call the login method in the view model with the request
    // viewModel.login(req);


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Home()));

          },
        ),
      ),

      body:
      arrayname==null?Container():
      CustomScrollView(
        slivers: [
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          //     child: Text(
          //       'Popular category',
          //       style: TextStyle(
          //         fontSize: 20,
          //         color: Colors.blue,
          //         fontFamily: 'ro',
          //       ),
          //     ),
          //   ),
          // ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  // Container(
                  //   height: 60,
                  //   child: ListView.builder(
                  //     itemCount: 4,
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: ((context, index) {
                  //       return Padding(
                  //         padding: const EdgeInsets.only(right: 10),
                  //         child: GestureDetector(
                  //           onTap: () {
                  //             setState(() {
                  //               indexx = index;
                  //             });
                  //           },
                  //           child: Container(
                  //             margin: EdgeInsets.only(
                  //               top: 5,
                  //               bottom: 5,
                  //               left: index == 0 ? 4 : 0,
                  //             ),
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(20),
                  //               color:
                  //               indexx == index ? Colors.blue: Colors.white,
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   color: indexx == index
                  //                       ? Colors.black
                  //                       : Colors.transparent,
                  //                   offset: indexx == index
                  //                       ? Offset(1, 1)
                  //                       : Offset(0, 0),
                  //                   blurRadius: indexx == index ? 7 : 0,
                  //                 )
                  //               ],
                  //             ),
                  //             child: Center(
                  //               child: Padding(
                  //                 padding: const EdgeInsets.symmetric(
                  //                     horizontal: 17),
                  //                 child: Column(
                  //                   children: [
                  //                     Text(
                  //                       category[index],
                  //                       style: TextStyle(
                  //                         fontSize: 16,
                  //                         color:
                  //                         indexx == index ? Colors.white : Colors.blue,
                  //                         fontFamily: 'ro',
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     }),
                  //   ),
                  // ),
                  //
                  //
                  SizedBox(height: 15),
                  // Row(
                  //   children: [
                  //     Text(
                  //       'Popular',
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //         color: Colors.blue,
                  //         fontFamily: 'ro',
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  //
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) => Splash()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 185, 185, 185),
                            offset: Offset(1, 1),
                            blurRadius: 15,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(right: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Icon(Icons.favorite_border)],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            child:
                            CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 65,
                              backgroundImage: AssetImage('assets/bottombar/loading.gif'),
                              child: CircleAvatar(
                                radius: 65,
                                backgroundColor: Colors.transparent,
                                backgroundImage: NetworkImage( widget.array["products"][index]['image']),
                              ),
                            ),
                          ),



                          Text(

                           widget.array["products"][index]['name'].toString(),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                              fontFamily: 'ro',
                            ),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            widget.array["products"][index]['desc'].toString(),
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.blue,
                              fontFamily: 'ro',
                            ),
                          ),

                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                widget.array["products"][index]['currency']+ "" +widget.array["products"][index]['amount'],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontFamily: 'ro',
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.blue, size: 15),
                                  Text(
                                    '4.2',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      fontFamily: 'ro',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },

                childCount: widget.array['products'].length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 270,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),
        ],
      ),
    );


  }

  cart()async{
    http.Response response=await http.post(Uri.parse("https://kezel.co/api/getAllDigitalMenu.php"),body:{"restaurant":"LeisureInnVKL",});
    String data=response.body;
    log(data+"ddddddddddddddd");
    if(response.statusCode==200){
      String data=response.body;
      setState(() {
        arrayname=jsonDecode(data)["menu_items"];
      });


    }

  }
// Future insertFormToDatabase() async{
//   var url = Uri.parse("https://kezel.co/api/getAllDigitalMenu.php");
//   var headers = {
//     'Content-Type': 'application/x-www-form-urlencoded'
//   };
//   var request = http.Request('POST', url);
//   request.bodyFields = {
//     "restaurant":"LeisureInnVKL"
//   };
//   request.headers.addAll(headers);
//   http.StreamedResponse response = await request.send();
//   if (response.statusCode == 200) {
//     print("success");
//     print(await response.stream.bytesToString());
//     return true;
//   }
//   else {
//     print("failed");
//     print(response.reasonPhrase);
//     return false;
//   }
// }
//
}
