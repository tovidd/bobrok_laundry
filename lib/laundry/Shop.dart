import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LaundryType{
  final int id;
  final String name;
  final String description;
  final double minPrice;
  final double maxPrice;
  final int minDay;
  final int maxDay;
  final IconData icon;

  LaundryType(this.id, this.name, this.description, this.minPrice, this.maxPrice, this.minDay, this.maxDay, this.icon);
}

class LaundryService{
  final int id;
  final int type;
  final String name;
  final String description;
  final double price;
  final int day;
  final IconData icon;

  LaundryService(this.id, this.type, this.name, this.description, this.price, this.day, this.icon);
}

class ShopScreen extends StatelessWidget {
  final LaundryType laundryType1= LaundryType(1, "Regular", "Suitable for regular", 3000.0, 7000.0, 1, 3, Icons.devices);

  final LaundryType laundryType2= LaundryType(2, "Monthly", "Suitable for monthly", 2000.0, 7000.0, 1, 3, Icons.devices_other);

  final List<LaundryService> laundryService1= List.generate(
    7,
    (i) => LaundryService(i, 1, "Regular " + (i+1).toString(), "This package will be done after the package changes time (2 hours) has finished. The package will be delivered to the address you registered, \n\nhappy washing!", (1000)*(i+1).toDouble(), (i+1), Icons.attach_money)
  );

  final List<LaundryService> laundryService2= List.generate(
    2,
    (i) => LaundryService(i, 1, "Montly " + (i+1).toString(), "This package will be done after the package changes time (2 hours) has finished. The package will be delivered to the address you registered, \n\nhappy washing!", (1000)*(i+1).toDouble(), (i+1), Icons.money_off)
  );

  ShopScreen({Key key, laundryType}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    Widget column= Card(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft, 
                end: Alignment.centerRight, 
                stops: [0.01, 0.99],
                colors: <Color>[
                  Colors.yellow, Colors.lightGreenAccent
                ],
              ),
            ),
            child: ListTile(
              leading: Icon(laundryType1.icon),
              title: Text(laundryType1.name),
              subtitle: Text(laundryType1.description.toString() + "\n\n" + laundryType1.minPrice.toStringAsFixed(0) + " up to " + laundryType1.maxPrice.toStringAsFixed(0) + " IDR / Kg"  + "\n" + laundryType1.minDay.toString() + " until " + laundryType1.maxDay.toString() + " day(s)"),
              trailing: Text(laundryService1.length.toString() + " items"),
              onTap: (){
                Navigator.push(
                  context, 
                  laundryType1.id == 1 
                  ? MaterialPageRoute(builder: (context)=> LaundryTypeScreen(laundryService: laundryService1, type: laundryType1.id)) 
                  : MaterialPageRoute(builder: (context)=> LaundryTypeScreen(laundryService: laundryService2, type: laundryType2.id))
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft, 
                end: Alignment.centerRight, 
                stops: [0.01, 0.99],
                colors: <Color>[
                  Colors.yellow, Colors.lightGreenAccent
                ],
              ),
            ),
            child: ButtonTheme.bar(
              child: new ButtonBar(
                children: <Widget>[
                  new FlatButton(
                    child: const Text('See more'),
                    onPressed: (){
                      Navigator.push(
                        context, 
                        laundryType1.id == 1 
                        ? MaterialPageRoute(builder: (context)=> LaundryTypeScreen(laundryService: laundryService1, type: laundryType1.id)) 
                        : MaterialPageRoute(builder: (context)=> LaundryTypeScreen(laundryService: laundryService2, type: laundryType2.id))
                      );
                    }
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
    
    Widget column2= Card(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft, 
                end: Alignment.centerRight, 
                stops: [0.01, 0.99],
                colors: <Color>[
                  Colors.lightGreenAccent, Colors.lightBlueAccent
                ],
              ),
            ),
            child: ListTile(
              leading: Icon(laundryType2.icon),
              title: Text(laundryType2.name),
              subtitle: Text(laundryType2.description.toString() + "\n\n" + laundryType2.minPrice.toStringAsFixed(0) + " up to " + laundryType2.maxPrice.toStringAsFixed(0) + " IDR / Kg"  + "\n" + laundryType2.minDay.toString() + " until " + laundryType2.maxDay.toString() + " day(s)", textAlign: TextAlign.justify,),
              trailing: Text(laundryService2.length.toString() + " items"),
              onTap: (){
                Navigator.push(
                  context, 
                  laundryType2.id == 2
                  ? MaterialPageRoute(builder: (context)=> LaundryTypeScreen(laundryService: laundryService2, type: laundryType2.id))
                  : MaterialPageRoute(builder: (context)=> LaundryTypeScreen(laundryService: laundryService1, type: laundryType1.id)) 
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft, 
                end: Alignment.centerRight, 
                stops: [0.01, 0.99],
                colors: <Color>[
                  Colors.lightGreenAccent, Colors.lightBlueAccent
                ],
              ),
            ),
            child: ButtonTheme.bar(
              child: new ButtonBar(
                children: <Widget>[
                  new FlatButton(
                    child: const Text('See more'),
                    onPressed: (){
                      Navigator.push(
                        context, 
                        laundryType2.id == 2
                        ? MaterialPageRoute(builder: (context)=> LaundryTypeScreen(laundryService: laundryService2, type: laundryType2.id))
                        : MaterialPageRoute(builder: (context)=> LaundryTypeScreen(laundryService: laundryService1, type: laundryType1.id)) 
                      );
                    }
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
    
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            column, 
            column2
          ],
        )
      ),
    );
  } //Widget

} //Shop


class LaundryTypeScreen extends StatelessWidget {
  final List<LaundryService> laundryService;
  final int type;
  LaundryTypeScreen({Key key, @required this.laundryService, @required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget column= ListView.builder(
      itemCount: laundryService.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft, 
                    end: Alignment.centerRight, 
                    stops: [0.01, 0.99],
                    colors: type == 1 
                    ? <Color>[Colors.yellowAccent, Colors.lightGreenAccent]
                    : <Color>[Colors.lightGreenAccent, Colors.lightBlueAccent]
                  ),
                ),
                child: ListTile(
                  leading: Icon(laundryService[index].icon),
                  title: Text(laundryService[index].name),
                  subtitle: Text(laundryService[index].description.toString() + "\n\n" + laundryService[index].price.toStringAsFixed(0) + " IDR / Kg" + "\n" + laundryService[index].day.toString() + " day(s)", textAlign: TextAlign.justify,),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context)=> LaundryTypeDetailScreen(laundryService: laundryService[index])),
                    );
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft, 
                    end: Alignment.centerRight, 
                    stops: [0.01, 0.99],
                    colors: type == 1 
                    ? <Color>[Colors.yellowAccent, Colors.lightGreenAccent]
                    : <Color>[Colors.lightGreenAccent, Colors.lightBlueAccent]
                  ),
                ),
                child: ButtonTheme.bar(
                  child: new ButtonBar(
                    children: <Widget>[
                      new FlatButton(
                        child: const Text('See more'),
                        onPressed: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context)=> LaundryTypeDetailScreen(laundryService: laundryService[index])),
                          );
                        }
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          // color: Colors.yellow,
        );
      },
    );

    return Container(
      child: column,
      color: Colors.yellow[100],
    );
  }
}

class LaundryTypeDetailScreen extends StatelessWidget{
  final LaundryService laundryService;
  LaundryTypeDetailScreen({Key key, @required this.laundryService}) : super(key: key); 

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent[400],
        title: Text(laundryService.name, style: TextStyle(color: Colors.black),),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.lightBlueAccent,
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  color: Colors.yellow[100],
                ),
              ),
            ],
          ), 
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  padding: new EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    right: 20.0,
                    left: 20.0),
                  child: new Container(
                    height: 70.0,
                    width: double.infinity,
                    child: new Card(
                      color: Colors.white,
                      elevation: 4.0,
                      child: Center(
                        child: Text(laundryService.name, style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                ), 
                Container(
                  alignment: Alignment.topCenter,
                  padding: new EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.005,
                    right: 20.0,
                    left: 20.0),
                  child: new Container(
                    width: double.infinity,
                    child: new Card(
                      color: Colors.white,
                      elevation: 4.0,
                      child: Container(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 15.0, bottom: 15.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                children: <Widget>[
                                  Container(child: Icon(Icons.hourglass_empty)),
                                  SizedBox(width: 10.0,),
                                  Text(laundryService.day.toString() + " day(s) work")
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                children: <Widget>[
                                  Container(child: Icon(Icons.attach_money)),
                                  SizedBox(width: 10.0,),
                                  Text(laundryService.price.toString() + " IDR / Kg")
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                children: <Widget>[
                                  Container(child: Icon(Icons.access_time)),
                                  SizedBox(width: 10.0,),
                                  Text("Package changes in 2 hours")
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                children: <Widget>[
                                  Container(child: Icon(Icons.not_interested)),
                                  SizedBox(width: 10.0,),
                                  Text("Uncancleable")
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                children: <Widget>[
                                  Opacity(opacity: 0.0, child: Container(child: Icon(Icons.attach_money), color: Colors.blue)), 
                                  SizedBox(width: 10.0,),
                                  Flexible(child: Text(laundryService.description, textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: FloatingActionButton(
              onPressed: (){},
              child: Icon(Icons.add, size: 30.0, color: Colors.black),
              backgroundColor: Colors.lightGreenAccent[400],
            ),
          )
        ],
      ),
    );
  }
}
