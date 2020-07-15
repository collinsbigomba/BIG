import 'package:flutter/material.dart';

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
            image: DecorationImage(image: AssetImage('crowd-1056764__340.webp'),fit: BoxFit.cover),
             
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
        child: Image.asset(
          'assets/bokeh-2097345__340.webp',
          width: width,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Started"),
        centerTitle: true,
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
