import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currencies = ['ABOUT US', 'HOME', 'INFO'];
  var _currentItemSelected = 'ABOUT US';

  var _currencie = ['OUR SAFARIS', 'DETAILS', 'HOTELS'];
  var _currentItemSelecteed = 'OUR SAFARIS';

  var _curencies = [
    'DESTINATIONS',
    'PLACES',
  ];
  var _curentItemSelected = 'DESTINATIONS';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 5,
        leading:
            IconButton(icon: Icon(FontAwesomeIcons.wifi), onPressed: () {}),
        title: Text('Plot 56,57 Luguard Ave, Entebbe  | +256 775207450'),
        actions: [
          IconButton(icon: Icon(FontAwesomeIcons.facebook), onPressed: () {}),
          SizedBox(width: 10),
          IconButton(icon: Icon(FontAwesomeIcons.twitter), onPressed: () {}),
          SizedBox(width: 10),
          IconButton(icon: Icon(FontAwesomeIcons.instagram), onPressed: () {}),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        children: [
          navBar(),
          Row(
            children: [
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'lion.webp',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              IconButton(
                  iconSize: 50,
                  color: Colors.green,
                  icon: Icon(FontAwesomeIcons.whatsapp),
                  onPressed: () {}),
              SizedBox(width: 10),
              Card(
                child: Text(
                  'WhatsApp Wild \n Discoveries Safaris',
                  style: TextStyle(fontSize: 19, letterSpacing: 1),
                ),
              )
            ],
          ),
          Column(
            children: [
              Center(
                  child: Text(
                'Uganda Geurilla Adventures, Chimp Trekking Safaris And Murchison Falls',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(17),
                child: Text(
                    'Mountain geurillas are commonly found in the 3 states of Uganda, Rwanda and Congo and from the current study, Uganda shares 51% of the world geurilla population. With our expertise, we shall plan a geurilla trip to Uganda or Rwanda which best fits ur budget. Start planning ur next geurilla trekking safari with our help, We have a couple of planned geurilla trekking safaris and wildlife safaris but they might not interest you and you may want some help. \n Yes we can give you all the help you need. Lets get started'),
              ),
              Center(child: Text('Gorilla Tracking Adventure and safaris')),
              SizedBox(height: 10),
              images(),
            ],
          )
        ],
      ),
    );
  }

  Widget navBar() => MediaQuery.of(context).size.width >= 1400
      ? Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white24,
              child: Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/tiger.webp'),
                      backgroundColor: Colors.white,
                      radius: 75,
                      /*Icon(
                      FontAwesomeIcons.university,
                      color: Colors.deepOrange,
                      size: 50,
                    ),*/
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        'Wild Discoveries Safaris',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        'Exploring the Pearl of Africa',
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      DropdownButton(
                        items: _currencies.map((String dropDownStringItem) {
                          return DropdownMenuItem(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem));
                        }).toList(),
                        onChanged: (valueSelected) {
                          setState(() {
                            this._currentItemSelected = valueSelected;
                          });
                        },
                        value: _currentItemSelected,
                      ),
                      SizedBox(width: 20),
                      DropdownButton(
                        items: _currencie.map((String dropDownStringItem) {
                          return DropdownMenuItem(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem));
                        }).toList(),
                        onChanged: (valueSelected) {
                          setState(() {
                            this._currentItemSelecteed = valueSelected;
                          });
                        },
                        value: _currentItemSelecteed,
                      ),
                      SizedBox(width: 20),
                      DropdownButton(
                        items: _curencies.map((String dropDownStringItem) {
                          return DropdownMenuItem(
                              value: dropDownStringItem,
                              child: Text(dropDownStringItem));
                        }).toList(),
                        onChanged: (valueSelected) {
                          setState(() {
                            this._curentItemSelected = valueSelected;
                          });
                        },
                        value: _curentItemSelected,
                      ),
                      SizedBox(width: 50),
                      Text('CONTACT US'),
                      SizedBox(width: 50),
                      Text('PAY ONLINE'),
                      SizedBox(width: 10),
                      IconButton(
                          icon: Icon(FontAwesomeIcons.search),
                          onPressed: () {}),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      : MediaQuery.of(context).size.width >= 800
          ? Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white24,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/tiger.webp'),
                          backgroundColor: Colors.white,
                          radius: 75,
                          /*Icon(
                      FontAwesomeIcons.university,
                      color: Colors.deepOrange,
                      size: 50,
                    ),*/
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            'Wild Discoveries Safaris',
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            'Exploring the Pearl of Africa',
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(width: 20),
                          DropdownButton(
                            items: _currencies.map((String dropDownStringItem) {
                              return DropdownMenuItem(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem));
                            }).toList(),
                            onChanged: (valueSelected) {
                              setState(() {
                                this._currentItemSelected = valueSelected;
                              });
                            },
                            value: _currentItemSelected,
                          ),
                          SizedBox(width: 20),
                          DropdownButton(
                            items: _currencie.map((String dropDownStringItem) {
                              return DropdownMenuItem(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem));
                            }).toList(),
                            onChanged: (valueSelected) {
                              setState(() {
                                this._currentItemSelecteed = valueSelected;
                              });
                            },
                            value: _currentItemSelecteed,
                          ),
                          SizedBox(width: 20),
                          DropdownButton(
                            items: _curencies.map((String dropDownStringItem) {
                              return DropdownMenuItem(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem));
                            }).toList(),
                            onChanged: (valueSelected) {
                              setState(() {
                                this._curentItemSelected = valueSelected;
                              });
                            },
                            value: _curentItemSelected,
                          ),
                          SizedBox(width: 50),
                          Text('CONTACT US'),
                          SizedBox(width: 50),
                          Text('PAY ONLINE'),
                          SizedBox(width: 10),
                          IconButton(
                              icon: Icon(FontAwesomeIcons.search),
                              onPressed: () {}),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white24,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/tiger.webp'),
                          backgroundColor: Colors.white,
                          radius: 75,
                          /*Icon(
                      FontAwesomeIcons.university,
                      color: Colors.deepOrange,
                      size: 50,
                    ),*/
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            'Wild Discoveries Safaris',
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            'Exploring the Pearl of Africa',
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(width: 20),
                          DropdownButton(
                            items: _currencies.map((String dropDownStringItem) {
                              return DropdownMenuItem(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem));
                            }).toList(),
                            onChanged: (valueSelected) {
                              setState(() {
                                this._currentItemSelected = valueSelected;
                              });
                            },
                            value: _currentItemSelected,
                          ),
                          SizedBox(width: 20),
                          DropdownButton(
                            items: _currencie.map((String dropDownStringItem) {
                              return DropdownMenuItem(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem));
                            }).toList(),
                            onChanged: (valueSelected) {
                              setState(() {
                                this._currentItemSelecteed = valueSelected;
                              });
                            },
                            value: _currentItemSelecteed,
                          ),
                          SizedBox(width: 20),
                          DropdownButton(
                            items: _curencies.map((String dropDownStringItem) {
                              return DropdownMenuItem(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem));
                            }).toList(),
                            onChanged: (valueSelected) {
                              setState(() {
                                this._curentItemSelected = valueSelected;
                              });
                            },
                            value: _curentItemSelected,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ); // else its only 1 icon displayed

  Widget images() => MediaQuery.of(context).size.width >= 800
      ? Row(
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      padding: EdgeInsets.only(left: 60),
                      alignment: Alignment.centerLeft,
                      child: Image.asset('tiger.webp'),
                    ),
                    SizedBox(height: 10),
                    Text('3 days, 2 nights'),
                    SizedBox(height: 10),
                    Text('Gorilla trekking Bwindi'),
                    SizedBox(height: 10),
                    OutlineButton(
                        child: Text(
                          'View Safari',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {}),
                    SizedBox(height: 10),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      child: Image.asset('white.webp'),
                    ),
                    SizedBox(height: 10),
                    Text('3 days, 2 nights'),
                    SizedBox(height: 10),
                    Text('Gorilla trekking Bwindi'),
                    SizedBox(height: 10),
                    OutlinedButton(
                        child: Text(
                          'View Safari',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {}),
                    SizedBox(height: 10),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      padding: EdgeInsets.only(right: 10),
                      alignment: Alignment.centerRight,
                      child: Image.asset('wolf.webp'),
                    ),
                    SizedBox(height: 10),
                    Text('3 days, 2 nights'),
                    SizedBox(height: 10),
                    Text('Gorilla trekking Bwindi'),
                    SizedBox(height: 10),
                    OutlinedButton(
                        child: Text(
                          'View Safari',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {}),
                    SizedBox(height: 10),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      padding: EdgeInsets.only(right: 10),
                      alignment: Alignment.centerRight,
                      child: Image.asset('lioness.webp'),
                    ),
                    SizedBox(height: 10),
                    Text('3 days, 2 nights'),
                    SizedBox(height: 10),
                    Text('Gorilla trekking Bwindi'),
                    SizedBox(height: 10),
                    OutlinedButton(
                        child: Text(
                          'View Safari',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {}),
                    SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ],
        )
      : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      padding: EdgeInsets.only(left: 60),
                      alignment: Alignment.centerLeft,
                      child: Image.asset('tiger.webp'),
                    ),
                    SizedBox(height: 10),
                    Text('3 days, 2 nights'),
                    SizedBox(height: 10),
                    Text('Gorilla trekking Bwindi'),
                    SizedBox(height: 10),
                    OutlinedButton(
                        child: Text('View Safari',
                            style: TextStyle(color: Colors.red)),
                        onPressed: () {}),
                    SizedBox(height: 10),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      child: Image.asset('white.webp'),
                    ),
                    SizedBox(height: 10),
                    Text('3 days, 2 nights'),
                    SizedBox(height: 10),
                    Text('Gorilla trekking Bwindi'),
                    SizedBox(height: 10),
                    OutlinedButton(
                        child: Text(
                          'View Safari',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {}),
                    SizedBox(height: 10),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      padding: EdgeInsets.only(right: 10),
                      alignment: Alignment.centerRight,
                      child: Image.asset('wolf.webp'),
                    ),
                    SizedBox(height: 10),
                    Text('3 days, 2 nights'),
                    SizedBox(height: 10),
                    Text('Gorilla trekking Bwindi'),
                    SizedBox(height: 10),
                    OutlinedButton(
                        child: Text(
                          'View Safari',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {}),
                    SizedBox(height: 10),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      padding: EdgeInsets.only(right: 10),
                      alignment: Alignment.centerRight,
                      child: Image.asset('lioness.webp'),
                    ),
                    SizedBox(height: 10),
                    Text('3 days, 2 nights'),
                    SizedBox(height: 10),
                    Text('Gorilla trekking Bwindi'),
                    SizedBox(height: 10),
                    OutlinedButton(
                        child: Text(
                          'View Safari',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {}),
                    SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ],
        ); // else its only 1 icon displayed

}
