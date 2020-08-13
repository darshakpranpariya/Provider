
import 'package:flutter/material.dart';
import 'package:implement_provider/models/all_task.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Implement Provider',
      theme: ThemeData(
        primarySwatch: Colors.yellowAccent[300],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => AllTask(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.filter_list),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {},
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text(
                  "My All Task",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(width: 10.0),
                IconButton(
                  icon: Icon(Icons.note),
                  color: Colors.white,
                  iconSize: 30.0,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 180.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: Consumer<AllTask>(
              builder: (context, alltask, child) {
                return alltask.listOfTask.length!=null ? 
                ListView.builder(
                  padding: EdgeInsets.only(top: 40.0),
                  itemCount: alltask.listOfTask.length,
                  itemBuilder: (context, index) {
                    return buildTaskTile(context, index, alltask);
                  },
                ) 
                : Center(child: Text("There is no task..."));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<AllTask>(context,listen: false).addTask("Reading", "documentation...");
          print("hello");
        },
        autofocus: true,
        elevation: 7.0,
        tooltip: "Add New Task",
        backgroundColor: Color(0xFF21BFBD),
        child: Icon(
          Icons.add,
          size: 30.0,
        ),
      ),
    );
  }

  Widget buildTaskTile(BuildContext context, int index, AllTask alltask) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) {},
          // ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: "assets/11.jpg",
                    child: Image(
                        image: AssetImage("assets/11.jpg"),
                        fit: BoxFit.cover,
                        height: 75.0,
                        width: 75.0),
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    children: <Widget>[
                      Text(
                        alltask.listOfTask[index].taskName,
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        alltask.listOfTask[index].taskDetails,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon:Icon(Icons.done,color: Colors.black,),
              color: Colors.white,
              onPressed: (){}
            )
          ],
        ),
      ),
    );
  }
}
