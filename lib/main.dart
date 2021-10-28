import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List JSON',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'User List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Fetch content from the json file

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mock Data'),
      ),
      body: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString("assets/MOCK_DATA for Flutter layouting.json"),
          builder: (context, users) {
            var list = json.decode(users.data.toString());
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Image(image:NetworkImage(list[index]["avatar"]?.toString() ?? 'https://icons.iconarchive.com/icons/diversity-avatars/avatars/256/robot-03-icon.png'), fit: BoxFit.fill,),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  list[index]["first_name"].toString()+" "+list[index]["first_name"].toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  list[index]["username"].toString(),
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  list[index]["status"]?.toString() ?? "status...!",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if(list[index]["messages"]!= null)...[
                                Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  list[index]["last_seen_time"].toString(),
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.orangeAccent,
                                    radius: 12,
                                    child: Text(
                                      list[index]["messages"]?.toString() ?? "",
                                      style: TextStyle(color: Colors.black, fontSize:12),
                                    ),
                                  ),
                                ),
                              ]else...[
                                Padding(
                                padding: EdgeInsets.only(left: 8, right: 8),
                                child: Text(
                                  list[index]["last_seen_time"].toString(),
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 12,
                                    child: Text(
                                     "",
                                    ),
                                  ),
                                ),
                              ]
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
      ),
    );
  }
}
