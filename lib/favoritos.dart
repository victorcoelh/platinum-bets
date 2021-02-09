import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'sidebar.dart';

class Favoritos extends StatefulWidget {
  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  List<String> _lista = [
    "Atlanta Hawks",
    "Milwaukee Bucks",
    "Brooklyn Nets",
    "Los Angeles Lakers",
    "Golden State Warriors",
    "Philadelphia 76ers",
    "Miami Heat",
    "Dallas Mavericks",
    "Houston Rockets"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Times Favoritos"),
        centerTitle: true,
      ),
      drawer: Sidebar(),
      body: Column(
        children: [
                Expanded(
                    child: ListView.builder(
                    itemCount: _lista.length,
                    padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                    itemBuilder: (context, index) {
                      return Column(children: [
                        ListTile(
                            title: Text(_lista[index]),
                            subtitle: Text("adiado"),
                            leading: Icon(Icons.account_box_rounded),
                            trailing: IconButton(
                              icon: Icon(Icons.more_vert),
                              onPressed: () {},
                            )),
                        Divider()
                      ]);
                    })),
          SizedBox(
            height: 40.0,
            width: double.infinity,
            child: RaisedButton(
              color: Colors.teal[200],
              child: Icon(Icons.keyboard_arrow_up),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ));
              },
            ),
          )
        ],
      )
    );
  }
}
