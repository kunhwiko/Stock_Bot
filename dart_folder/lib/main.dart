import 'package:flutter/material.dart';
import 'stock.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';

void main(){
  return runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<List<Stock>> parseJson() async{
    String text = await rootBundle.loadString('assets/data.json');
    List<dynamic> decodedList = json.decode(text);
    List<Stock> data = [null,null,null,null,null];
    for(int i = 0; i < 5; i++){
      data[i] = Stock.fromJson(decodedList[i]);
    }
    return data;
  }

  _launchURL(String path) async{
    if (await canLaunch(path)){
      await launch(path);
    }else{
      throw 'Cannot launch url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: FutureBuilder<List<Stock>>(
          future : parseJson(),
          builder : (context,snapshot) {
            if (snapshot.hasData && snapshot.data != null){
              return new Scaffold(
                body: TabBarView(
                  children: [
                    new Column(
                      children: [
                        Row(
                          mainAxisAlignment : MainAxisAlignment.center,
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 25.0),
                                child: Text(
                                  snapshot.data[0].symbols,
                                  style : TextStyle(
                                    color : Colors.white,
                                    fontWeight : FontWeight.bold,
                                    fontSize : 18
                                  )
                                ),
                                color : Colors.red[200],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
                                color : Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child : Image(
                            image : AssetImage('assets/image1.png'),
                          ),
                          color : Colors.white,
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 25.0),
                                color : Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              flex : 3,
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 16.0, 5.0, 15.0),
                                child: Text(
                                  '   Profit  : ',
                                  style : TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                color : Colors.white,
                              ),
                            ),
                            Expanded(
                              flex : 4,
                              child : Container(
                                padding : EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 15.0),
                                child: Text(
                                  (double.parse(snapshot.data[0].closePrices) - double.parse(snapshot.data[0].openPrices)).toString().substring(0,7),
                                  style : TextStyle(
                                    color : double.parse(snapshot.data[0].closePrices) - double.parse(snapshot.data[0].openPrices) >= 0? Colors.green : Colors.red,
                                  ),
                                ),
                                color : Colors.white,
                              ),
                            ),
                            Expanded(
                              flex : 3,
                              child : Container(
                                color : Colors.white,
                                child: IconButton(
                                  onPressed: () => _launchURL("https://finance.yahoo.com/quote/" + snapshot.data[0].symbols),
                                  icon : Icon(Icons.assessment),
                                  color : Colors.red[200],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
                                color : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    new Column(
                      children: [
                        Row(
                          mainAxisAlignment : MainAxisAlignment.center,
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 25.0),
                                child: Text(
                                    snapshot.data[1].symbols,
                                    style : TextStyle(
                                        color : Colors.white,
                                        fontWeight : FontWeight.bold,
                                        fontSize : 18
                                    )
                                ),
                                color : Colors.amber[200],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
                                color : Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child : Image(
                            image : AssetImage('assets/image2.png'),
                          ),
                          color : Colors.white,
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 25.0),
                                color : Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              flex : 3,
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 16.0, 5.0, 15.0),
                                child: Text(
                                  '   Profit  : ',
                                  style : TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                color : Colors.white,
                              ),
                            ),
                            Expanded(
                              flex : 4,
                              child : Container(
                                padding : EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 15.0),
                                child: Text(
                                  (double.parse(snapshot.data[1].closePrices) - double.parse(snapshot.data[1].openPrices)).toString().substring(0,7),
                                  style : TextStyle(
                                    color : double.parse(snapshot.data[1].closePrices) - double.parse(snapshot.data[1].openPrices) >= 0? Colors.green : Colors.red,
                                  ),
                                ),
                                color : Colors.white,
                              ),
                            ),
                            Expanded(
                              flex : 3,
                              child : Container(
                                color : Colors.white,
                                child: IconButton(
                                  onPressed: () => _launchURL("https://finance.yahoo.com/quote/" + snapshot.data[1].symbols),
                                  icon : Icon(Icons.assessment),
                                  color : Colors.amber[200],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
                                color : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    new Column(
                      children: [
                        Row(
                          mainAxisAlignment : MainAxisAlignment.center,
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 25.0),
                                child: Text(
                                    snapshot.data[2].symbols,
                                    style : TextStyle(
                                        color : Colors.white,
                                        fontWeight : FontWeight.bold,
                                        fontSize : 18
                                    )
                                ),
                                color : Colors.lightGreen[200],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
                                color : Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child : Image(
                            image : AssetImage('assets/image3.png'),
                          ),
                          color : Colors.white,
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 25.0),
                                color : Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              flex : 3,
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 16.0, 5.0, 15.0),
                                child: Text(
                                  '   Profit  : ',
                                  style : TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                color : Colors.white,
                              ),
                            ),
                            Expanded(
                              flex : 4,
                              child : Container(
                                padding : EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 15.0),
                                child: Text(
                                  (double.parse(snapshot.data[2].closePrices) - double.parse(snapshot.data[2].openPrices)).toString().substring(0,7),
                                  style : TextStyle(
                                    color : double.parse(snapshot.data[2].closePrices) - double.parse(snapshot.data[2].openPrices) >= 0? Colors.green : Colors.red,
                                  ),
                                ),
                                color : Colors.white,
                              ),
                            ),
                            Expanded(
                              flex : 3,
                              child : Container(
                                color : Colors.white,
                                child: IconButton(
                                  onPressed: () => _launchURL("https://finance.yahoo.com/quote/" + snapshot.data[2].symbols),
                                  icon : Icon(Icons.assessment),
                                  color : Colors.lightGreen[200],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
                                color : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    new Column(
                      children: [
                        Row(
                          mainAxisAlignment : MainAxisAlignment.center,
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 25.0),
                                child: Text(
                                    snapshot.data[3].symbols,
                                    style : TextStyle(
                                        color : Colors.white,
                                        fontWeight : FontWeight.bold,
                                        fontSize : 18
                                    )
                                ),
                                color : Colors.lightBlue[200],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
                                color : Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child : Image(
                            image : AssetImage('assets/image4.png'),
                          ),
                          color : Colors.white,
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 25.0),
                                color : Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              flex : 3,
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 16.0, 5.0, 15.0),
                                child: Text(
                                  '   Profit  : ',
                                  style : TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                color : Colors.white,
                              ),
                            ),
                            Expanded(
                              flex : 4,
                              child : Container(
                                padding : EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 15.0),
                                child: Text(
                                  (double.parse(snapshot.data[3].closePrices) - double.parse(snapshot.data[3].openPrices)).toString().substring(0,7),
                                  style : TextStyle(
                                    color : double.parse(snapshot.data[3].closePrices) - double.parse(snapshot.data[3].openPrices) >= 0? Colors.green : Colors.red,
                                  ),
                                ),
                                color : Colors.white,
                              ),
                            ),
                            Expanded(
                              flex : 3,
                              child : Container(
                                color : Colors.white,
                                child: IconButton(
                                  onPressed: () => _launchURL("https://finance.yahoo.com/quote/" + snapshot.data[3].symbols),
                                  icon : Icon(Icons.assessment),
                                  color : Colors.lightBlue[200],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
                                color : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    new Column(
                      children: [
                        Row(
                          mainAxisAlignment : MainAxisAlignment.center,
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 25.0),
                                child: Text(
                                    snapshot.data[4].symbols,
                                    style : TextStyle(
                                        color : Colors.white,
                                        fontWeight : FontWeight.bold,
                                        fontSize : 18
                                    )
                                ),
                                color : Colors.deepPurple[200],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
                                color : Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child : Image(
                            image : AssetImage('assets/image5.png'),
                          ),
                          color : Colors.white,
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 25.0),
                                color : Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              flex : 3,
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 16.0, 5.0, 15.0),
                                child: Text(
                                  '   Profit  : ',
                                  style : TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                color : Colors.white,
                              ),
                            ),
                            Expanded(
                              flex : 4,
                              child : Container(
                                padding : EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 15.0),
                                child: Text(
                                  (double.parse(snapshot.data[4].closePrices) - double.parse(snapshot.data[4].openPrices)).toString().substring(0,7),
                                  style : TextStyle(
                                    color : double.parse(snapshot.data[4].closePrices) - double.parse(snapshot.data[4].openPrices) >= 0? Colors.green : Colors.red,
                                  ),
                                ),
                                color : Colors.white,
                              ),
                            ),
                            Expanded(
                              flex : 3,
                              child : Container(
                                color : Colors.white,
                                child: IconButton(
                                  onPressed: () => _launchURL("https://finance.yahoo.com/quote/" + snapshot.data[4].symbols),
                                  icon : Icon(Icons.assessment),
                                  color : Colors.deepPurple[200],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children : <Widget>[
                            Expanded(
                              child : Container(
                                padding : EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
                                color : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                bottomNavigationBar: new TabBar(
                  tabs: [
                    Tab(
                      icon: new Icon(Icons.filter_1),
                    ),
                    Tab(
                      icon: new Icon(Icons.filter_2),
                    ),
                    Tab(
                      icon: new Icon(Icons.filter_3),
                    ),
                    Tab(
                      icon: new Icon(Icons.filter_4),
                    ),
                    Tab(icon: new Icon(Icons.filter_5),)
                  ],
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[500],
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.all(5.0),
                  indicatorColor: Colors.white,
                ),
                backgroundColor: Colors.grey[100],
              );
            }else{
              return Center(child:CircularProgressIndicator());
            }
          }
        ),
      ),
    );
  }
}