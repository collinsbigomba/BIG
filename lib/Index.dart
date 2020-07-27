import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(Hem());

class Hem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('crowd-1056764__340.webp'),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                Navbar(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: LandingPage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopNavbar();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopNavbar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}

class DesktopNavbar extends StatefulWidget {
  @override
  _DesktopNavbarState createState() => _DesktopNavbarState();
}

class _DesktopNavbarState extends State<DesktopNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(48),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -2),
                blurRadius: 30,
                color: Colors.black.withOpacity(0.18))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'CollinsBigombas Music Studio',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
          Row(
            children: [
              RaisedButton(
                  child: Text(
                    'Home',
                    style: TextStyle(color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  onPressed: () {}),
              SizedBox(
                width: 30,
              ),
              RaisedButton(
                  child: Text(
                    'About Us',
                    style: TextStyle(color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutUs()));
                  }),
              SizedBox(
                width: 30,
              ),
              RaisedButton(
                  child: Text(
                    'Porfolio',
                    style: TextStyle(color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Portfolio()));
                  }),
              SizedBox(
                width: 30,
              ),
              RaisedButton(
                  child: Text(
                    'Get Started',
                    style: TextStyle(color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GetStarted()));
                  }),
              SizedBox(
                width: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class MobileNavbar extends StatefulWidget {
  @override
  _MobileNavbarState createState() => _MobileNavbarState();
}

class _MobileNavbarState extends State<MobileNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(48),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, -2),
                  blurRadius: 30,
                  color: Colors.black.withOpacity(0.18))
            ]),
        child: Column(children: [
          Text(
            'CollinsBigombas Music Studio',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    child: Text(
                      'Home',
                      style: TextStyle(color: Colors.black),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    onPressed: () {}),
                SizedBox(
                  width: 30,
                ),
                RaisedButton(
                    child: Text(
                      'About Us',
                      style: TextStyle(color: Colors.black),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AboutUs()));
                    }),
                SizedBox(
                  width: 30,
                ),
                RaisedButton(
                    child: Text(
                      'Porfolio',
                      style: TextStyle(color: Colors.black),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Portfolio()));
                    }),
                SizedBox(
                  width: 30,
                ),
                RaisedButton(
                    child: Text(
                      'Get Started',
                      style: TextStyle(color: Colors.black),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GetStarted()));
                    }),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
        ]));
  }
}

class LandingPage extends StatelessWidget {
  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        width: width,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, //align elements on the left
          children: [
            Text(
              'Music \nDevelopers',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white),
            ),
            Text(
              'We have taken each and every project handed over to us as a challenge which has helped us to us achieve a high project success rate',
              style: TextStyle(color: Colors.white, fontSize: 17),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: Image.asset(
            'assets/bokeh-2097345__340.webp',
            width: width,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 2),
          );
        } else {
          return Column(
            children: pageChildren(constraints.biggest.width),
          );
        }
      },
    );
  }
}

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About US"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}

class Portfolio extends StatefulWidget {
  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Portfolio"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [],
      ),
    );
  }
}

class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  String _firstName;
  String _lastName;
  String _email;
  String _password;
  String _phoneNumber;

  final GlobalKey<FormState> _formkey = GlobalKey<
      FormState>(); //using global key which is the standard way of using forms in flutter

  Widget _buildfirstName() {
    //functions that return widgets
    return TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.perm_identity),
          labelText: 'FirstName',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        maxLength: 12,
        validator: (String value) {
          if (value.isEmpty) {
            return "FirstName is required";
          }
          return null;
        },
        onSaved: (String value) {
          _firstName = value; // set the state
        });
  }

  Widget _buildlastName() {
    return TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.perm_identity),
          labelText: 'lastName',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        maxLength: 12,
        validator: (String value) {
          if (value.isEmpty) {
            return "lastName is required";
          }
          return null;
        },
        onSaved: (String value) {
          _lastName = value; // set the state
        });
  }

  Widget _buildemail() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.email),
          hintText: 'collinsbigomba8@gmail.com',
          labelText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        maxLength: 30,
        validator: (String value) {
          if (value.isEmpty) {
            return "Email is required";
          }
          //if(!RegExp(^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$).hasMatch(value)) {
          //return 'please enter a valid Email';
          //}
          return null;
        },
        onSaved: (String value) {
          _email = value; // set the state
        });
  }

  Widget _buildpassword() {
    return TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.phonelink_lock),
          labelText: 'password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        maxLength: 15,
        validator: (String value) {
          if (value.isEmpty) {
            return "password is required";
          }
          return null;
        },
        onSaved: (String value) {
          _password = value; // set the state
        });
  }

  Widget _buildphoneNumber() {
    return TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: Icon(Icons.phone),
          labelText: 'phoneNumber',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return "phonenumber is required";
          }
          return null;
        },
        onSaved: (String value) {
          _phoneNumber = value; // set the state
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Started"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(25),
            child: Center(
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 75,
                      child: Icon(
                        FontAwesomeIcons.bitcoin,
                        color: Colors.deepOrange,
                        size: 50,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _buildfirstName(),
                    _buildlastName(),
                    _buildemail(),
                    _buildpassword(),
                    _buildphoneNumber(),
                    RaisedButton(
                        hoverColor: Colors.yellow,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        elevation: 5,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(
                                10))), //rounded edges of the button
                        onPressed: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('Signing In, Please Wait.....')));
                          if (!_formkey.currentState.validate()) {
                            //form to validate itself
                            return;
                          }
                          _formkey.currentState
                              .save(); // saves data entered and wenever the .save function is called, it  calls the onsaved method on each function

                          print(_firstName);
                          print(_lastName);
                          print(_email);
                          print(_password);
                          print(_phoneNumber);
                          //signUp();

                          //gets u to the home screen
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
