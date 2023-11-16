import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kezel/Pages/Splash.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../product.dart';
import '../provider/baseprovider.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  @override
 void initState() {
    // TODO: implement initState

    cart();
    final postModel = Provider.of<DataClass>(context, listen: false);


    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DataClass>(context, listen: false).fetchData();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>Splash()));

            },
          ),
        ),

    body:
    arrayname==null?Container():

    Consumer<DataClass>(
      builder: (context, apiProvider, _) {
        if (apiProvider.data.isEmpty) {
          return CircularProgressIndicator();
        } else {
          return  Container(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Text(
                          'Discover Our Menu',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ro',
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              child: ListView.builder(
                                itemCount: 4,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          indexx = index;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          left: index == 0 ? 4 : 0,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color:
                                          indexx == index ? Colors.blue: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: indexx == index
                                                  ? Colors.black
                                                  : Colors.transparent,
                                              offset: indexx == index
                                                  ? Offset(1, 1)
                                                  : Offset(0, 0),
                                              blurRadius: indexx == index ? 7 : 0,
                                            )
                                          ],
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 17),
                                            child: Text(
                                              category[index],
                                              style: TextStyle(
                                                fontSize: 16,
                                                color:
                                                indexx == index ? Colors.white : Colors.blue,
                                                fontFamily: 'ro',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Text(
                                  'Special Offer',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'ro',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      sliver:

                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => Home2(arrayname[index])),
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
                                          backgroundImage: NetworkImage(arrayname[index]["slider_image"]),
                                        ),
                                      ),
                                    ),


                                    SizedBox(height: 20),
                                    Text(
                                      arrayname[index]["name"].toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.blue,
                                        fontFamily: 'ro',
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          '100 min',
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
                          childCount: arrayname.length,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 270,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                      ),
                    )



                  ],
                ),
              );



        }
      },
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

}
