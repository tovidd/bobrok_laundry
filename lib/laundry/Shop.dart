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
    6,
    (i) => LaundryService(i, 1, "Regular " + (i+1).toString(), "Regular description " + (i+1).toString(), (1000)*(i+1).toDouble(), (i+1), Icons.attach_money)
  );

  final List<LaundryService> laundryService2= List.generate(
    6,
    (i) => LaundryService(i, 1, "Montly " + (i+1).toString(), "Monthly description " + (i+1).toString(), (1000)*(i+1).toDouble(), (i+1), Icons.money_off)
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
              subtitle: Text(laundryType1.description.toString() + "\n\n" + "IDR " + laundryType1.minPrice.toStringAsFixed(0) + " up to " + laundryType1.maxPrice.toStringAsFixed(0)  + "\n" + laundryType1.minDay.toString() + " until " + laundryType1.maxDay.toString() + " day(s)"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: (){
                Navigator.push(
                  context, 
                  laundryType1.id == 0 
                  ? MaterialPageRoute(builder: (context)=> LaundryTypeScreen(laundryService: laundryService1)) 
                  : MaterialPageRoute(builder: (context)=> LaundryTypeScreen(laundryService: laundryService2))
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
                        MaterialPageRoute(builder: (context)=> LaundryTypeScreen(laundryService: laundryService1)),
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
              subtitle: Text(laundryType2.description.toString() + "\n\n" + "IDR " + laundryType2.minPrice.toStringAsFixed(0) + " up to " + laundryType2.maxPrice.toStringAsFixed(0)  + "\n" + laundryType2.minDay.toString() + " until " + laundryType2.maxDay.toString() + " day(s)"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: (){
                Navigator.push(
                  context, 
                  laundryType2.id == 0 
                  ? MaterialPageRoute(builder: (context)=> LaundryTypeScreen(laundryService: laundryService1)) 
                  : MaterialPageRoute(builder: (context)=> LaundryTypeScreen(laundryService: laundryService2))
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
                        MaterialPageRoute(builder: (context)=> LaundryTypeScreen(laundryService: laundryService1)),
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
    
    return Container(
      child: Column(
        children: <Widget>[
          column, 
          column2
        ],
      )
    );
  } //Widget

} //Shop


class LaundryTypeScreen extends StatelessWidget {
  final List<LaundryService> laundryService;
  LaundryTypeScreen({Key key, @required this.laundryService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget column= ListView.builder(
      itemCount: laundryService.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: <Widget>[
              new ListTile(
                leading: Icon(laundryService[index].icon),
                title: Text(laundryService[index].name),
                subtitle: Text(laundryService[index].description.toString() + "\n\n" + "IDR " + laundryService[index].price.toStringAsFixed(0) + "\n" + laundryService[index].day.toString() + " day(s)"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              new ButtonTheme.bar(
                child: new ButtonBar(
                  children: <Widget>[
                    new FlatButton(
                      child: const Text('See more'),
                      onPressed: (){
                      }
                    )
                  ],
                ),
              ),
            ],
          ),
          color: Colors.yellow,
        );
      },
    );

    return Container(
      child: column,
      color: Colors.yellow[50],
    );
  }
}
