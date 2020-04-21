import 'package:flutter/material.dart';

void main()=>runApp(FuelCalculator());

class FuelCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fuel Calculator",
      home:Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

final currencyTypes=['LKR','Dollar','Pounds'];
String currency='LKR';

String resultText="";

TextEditingController distanceController=TextEditingController();
TextEditingController fuelUnitController=TextEditingController();
TextEditingController fuelPriceController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.directions_car,color: Colors.amber,),
        title:Text("Fuel Calculator"),
      ),
      body: Container(
        padding:EdgeInsets.all(17),
        child:Column(children: <Widget>[
          TextField(
            controller: fuelUnitController,
            decoration: InputDecoration(
              labelText:"Distance per Fuel Unit",
              hintText: "eg 17",
            ),keyboardType: TextInputType.number
          ,),
          TextField(
            controller: distanceController,
            decoration: InputDecoration(
              labelText:"Distance Travel",
              hintText: "eg 35km",
            ),keyboardType: TextInputType.number
          ,),
          TextField(
            controller: fuelPriceController,
            decoration: InputDecoration(
              labelText:"Price Per Fuel Unit",
              hintText: " eg Rs. 455",
            ),keyboardType: TextInputType.number
          ,),
          DropdownButton<String>
          (
            items: currencyTypes.map((String value)
            {
              return DropdownMenuItem<String>(
                value: value,
                child:Text(value),
              );
            }).toList(),
            value: currency,
            onChanged: (String value)
            {
              changed(value);
            },
          ),
          RaisedButton(
            color:Colors.amber,
            child: Text("Calculate Total"),
            onPressed: (){
              setState(() {
                resultText=calculateFuelPrice();
              });
            }),
            SizedBox(),
            Text(resultText,style: TextStyle(color:Colors.blueAccent,fontSize:20.0),)
        ],)
      ),
    );
  }
  changed(String value)
  {
    setState(() {
      this.currency=value;
    });
  }
  String calculateFuelPrice()
  {
  double distanceTravelled=double.parse(distanceController.text);
  double fuelUnits=double.parse(fuelUnitController.text);
  double priceFuel=double.parse(fuelPriceController.text);

  double totalCost=(distanceTravelled/fuelUnits)*priceFuel;
  String resultText="Total Cost "+totalCost.toString()+" "+currency;
  return resultText;
  }
}

