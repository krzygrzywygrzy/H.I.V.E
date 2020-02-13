import 'package:flutter/material.dart';
import 'package:hive/const.dart';
import 'package:hive/services/measurement.dart';
import 'package:hive/widgets/average_rich_text.dart';

class Details extends StatefulWidget {
  Details({this.name, this.detalis, this.unit});
  final String name, unit;
  final List<Measurement> detalis;
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int sliderValue, measurement;
  List<int> values = [];
  double x = 0;

  @override
  initState() {
    super.initState();
    fetchData();
    print(widget.unit);
  }

  String returnTime() {
    String time = '';
    int minutes = (x.floor() - sliderValue) * 10;
    if (minutes == 0)
      time = ' - teraz';
    else if (minutes > 0 && minutes < 60)
      time = ' - $minutes min. temu';
    else if (minutes == 60)
      time = ' - 1h temu';
    else if (minutes > 60) {
      int hours = (minutes / 60).floor();
      int min = minutes - (hours * 60);
      time = ' -'+ '$hours'+'h $min min. temu';
    }
    return time;
  }
  String average (int dataAmount){
    String average = '';
    if(dataAmount > values.length) average = ' -';
    else{
      int add = 0;
      for (int i = values.length -1; i>= values.length - dataAmount ; i--)
        add += values[i];
      int avrg = (add / dataAmount).floor();
      average = avrg.toString();
    }
    return average;
  }

  fetchData() {
    for (int i = 0; i <= widget.detalis.length - 1; i++) {
      switch (widget.name) {
        case 'Temperatura':
          values.add(widget.detalis[i].temperature.floor());
          break;
        case 'Waga':
          values.add(widget.detalis[i].weight.floor());
          break;
        case 'Ciśnienie':
          values.add(widget.detalis[i].pressure.floor());
          break;
        case 'Wilgotność':
          values.add(widget.detalis[i].humidity.floor());
          break;
        case 'Pyły pm2,5':
          values.add(widget.detalis[i].pm25.floor());
          break;
        case 'Pyły pm10':
          values.add(widget.detalis[i].pm10.floor());
          break;
        default:
          break;
      }
    }
    setState(() {
      x = widget.detalis.length - 1.truncateToDouble();
      sliderValue = widget.detalis.length - 1;
      measurement = values[sliderValue];
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(kBrown),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.name,
                  style: kTextStyleTwo.copyWith(
                      color: Color(kOrange), fontSize: 40)),
            ),
            Slider(
              activeColor: Color(kOrange),
              inactiveColor: Color(kBrown),
              value: sliderValue.toDouble(),
              min: 0,
              max: x,
              onChanged: (double value) {
                setState(() {
                  sliderValue = value.toInt();
                  measurement = values[sliderValue];
                });
              },
            ),
            RichText(
              text: TextSpan(
                text: '$measurement',
                style: kOvalButtonValue.copyWith(color: Color(kOrange)),
                children: <TextSpan>[
                  TextSpan(
                    text: widget.unit,
                    style: kOvalButtonValue.copyWith(
                        fontSize: 20, color: Color(kOrange)),
                  ),
                  TextSpan(
                    text: returnTime(),
                    style: kOvalButtonValue.copyWith(fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25,),
            AverageRichText(
              label: 'Średnia: ',
              average: average(values.length),
              unit: widget.unit,
            ),
            AverageRichText(
              label: 'Średnia dobowa:',
              average: average(144),
              unit: widget.unit,
            ),
          ],
        ),
      ),
    );
  }
}


