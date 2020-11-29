import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pallubasa_andalanga/screens/choice.dart';
import 'package:pallubasa_andalanga/screens/curency.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller1 = new TextEditingController(text: "0");
  TextEditingController controller2 = new TextEditingController(text: "0");
  TextEditingController controller3 = new TextEditingController(text: "0");
  TextEditingController controller4 = new TextEditingController(text: "0");
  TextEditingController controller5 = new TextEditingController(text: "0");
  TextEditingController controller6 = new TextEditingController(text: "0");
  // String harga;
  int num1, num2, num3, num4, num5,num6,num7, result1, result2;
  int finalresult = 0;
  int pallubasa = 12000;
  int nasi = 3000;
  int telur = 4000;
  int air = 4000;
  int bungkus = 13000;
  int setengah = 0;
  bool chek = false;
  bool chek2 = false;

  final formatter = new NumberFormat("#,###");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          "Kasir Pallubasa Andalanga",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Pallubasa",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        icon: Icon(Icons.fastfood),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
                      controller: controller1,
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  SizedBox(width: 30.0),
                  Flexible(
                    child: TextField(
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        labelText: "Nasi",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        icon: Icon(Icons.fastfood),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
                      controller: controller2,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Telur",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        icon: Icon(Icons.fastfood),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
                      controller: controller3,
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Air",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        icon: Icon(Icons.fastfood),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
                      controller: controller4,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                                      child: TextField(
                      decoration: InputDecoration(
                        labelText: "Uang",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        icon: Text('Rp',style: TextStyle(fontWeight: FontWeight.w900),),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
                      controller: controller5,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        CurrencyInputFormatter(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Bungkus",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        icon: Icon(Icons.shopping_cart),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.number,
                      controller: controller6,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    shape: StadiumBorder(),
                    color: Theme.of(context).accentColor,
                    child: Text(
                      "HITUNG",
                      style: TextStyle(color: Theme.of(context).primaryColor,),
                    ),
                    onPressed: () {
                      setState(() {
                        chek = true;
                        num1 = int.parse(controller1.text);
                        num2 = int.parse(controller2.text);
                        num3 = int.parse(controller3.text);
                        num4 = int.parse(controller4.text);
                        num6 = int.parse(controller6.text);
                        
                        String numm5 = controller5.text;
                        List ar = numm5.split(',');

                        num5 = int.parse(ar.join());
                        // debugPrint(num5.toString());

                        result2 = num5;
                        result1 = ((pallubasa * num1) +
                            (nasi * num2) +
                            (telur * num3) +
                            (air * num4) + (bungkus * num6) + setengah);
                        finalresult = result2 - result1;
                        return finalresult;
                      });
                    },
                    splashColor: Colors.amber,
                  ),
                  Flexible(
                child: Choices('Setengah', chek2: chek2,onSelect: (v){
                  setState(() {
                    chek2 = !chek2;
                    if(chek2==true){
                    setengah = 6000;
                    }else{
                      setengah = setengah;
                    }
                  });
                },)
              ),
                  RaisedButton(
                    shape: StadiumBorder(),
                    color: Theme.of(context).accentColor,
                    child: Text(
                      "RESET",
                      style: TextStyle(color: Theme.of(context).primaryColor,),
                    ),
                    onPressed: () {
                      setState(() {
                        chek = false;
                        chek2 = false;
                        controller1.text = "0";
                        controller2.text = "0";
                        controller3.text = "0";
                        controller4.text = "0";
                        controller5.text = "0";
                        controller6.text = "0";
                        setengah = 0;
                        result1 = 0;
                        result2 = 0;
                        finalresult = 0;
                      });
                    },
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView(
                  children: <Widget>[
                    chek == true
                        ? result2 != 0
                            ? result1 <= result2
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Total Pembayaran   : " +
                                          formatter.format(result1)),
                                      Text("Total Uang                : " +
                                          formatter.format(result2)),
                                      Text("Kembalian                 : " +
                                          formatter.format(finalresult)),
                                      Text("Detail Pesanan         : " +
                                          "\nPallubasa: " +
                                          num1.toString() +
                                          "\nNasi: " +
                                          num2.toString() +
                                          "\nTelur: " +
                                          num3.toString() +
                                          "\nAir Mineral: " +
                                          num4.toString()),
                                    ],
                                  )
                                : Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Center(
                                      child: Text(
                                        "Uang Anda Kurang " +
                                            formatter.format(finalresult),
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  )
                            : Text("Total Bayar: " + result1.toString())
                        : Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Center(
                              child: Text(
                                "STRUK",
                                style: TextStyle(
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
