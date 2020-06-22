import 'data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage
            ? Color.fromRGBO(247, 100, 59, 1)
            : Color.fromRGBO(247, 229, 226, 1),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    slideIndex = index;
                  });
                },
                children: <Widget>[
                  SlideTile(
                    imagePath: mySLides[0].getImageAssetPath(),
                  ),
                  SlideTile(
                    imagePath: mySLides[1].getImageAssetPath(),
                  ),
                  SlideTile(
                    imagePath: mySLides[2].getImageAssetPath(),
                  )
                ],
              ),
              Positioned(
                bottom: 150.0,
                left: 30.0,
                child: Text(
                  'Modern\nInterior',
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.w800,
                    height: 0.95,
                    color: Color.fromRGBO(84, 35, 25, 1),
                  ),
                ),
              ),
              Positioned(
                bottom: 90.0,
                left: 31.0,
                child: Text(
                  'Giving your home a new style\nevery style',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(206, 199, 199, 1),
                  ),
                ),
              ),
              Positioned(
                bottom: 50.0,
                left: 30.0,
                child: Container(
                  child: Row(
                    children: [
                      for (int i = 0; i < 3; i++)
                        i == slideIndex
                            ? _buildPageIndicator(true)
                            : _buildPageIndicator(false),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20.0,
                right: 30.0,
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(247, 100, 59, 1),
                      borderRadius: BorderRadius.circular(130.0 / 2),
                    ),
                    width: 155.0,
                    height: 40.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Get started',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 26.0,
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  final imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipPath(
          clipper: BackgroundClipper(),
          child: Container(
            height: size.height * 0.8,
            color: Color.fromRGBO(255, 234, 228, 1),
          ),
        ),
        ClipPath(
          clipper: ImageClipper(),
          child: Container(
            child: Image.asset(
              imagePath,
              height: size.height * 0.65,
              width: size.width,
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.98);
    var firstCtrlPoint = Offset(size.width * 0.45, size.height + 10);
    var firstEndPoint = Offset(size.width * 0.8, size.height * 0.813);
    path.quadraticBezierTo(firstCtrlPoint.dx, firstCtrlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width * 0.8, size.height * 0.815);

    var secondCtrlPoint = Offset(size.width * 0.81, size.height * 0.84);
    var secondEndPoint = Offset(size.width, size.height * 0.98);
    path.quadraticBezierTo(secondCtrlPoint.dx, secondCtrlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.7);
    var firstCtrlPoint = Offset(size.width * 0.25, size.height * 0.9);
    var firstEndPoint = Offset(size.width * 0.8, size.height);
    path.quadraticBezierTo(firstCtrlPoint.dx, firstCtrlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width * 0.8, size.height);

    var secondCtrlPoint = Offset(size.width * 0.95, size.height * 0.87);
    var secondEndPoint = Offset(size.width, size.height * 0.7);
    path.quadraticBezierTo(secondCtrlPoint.dx, secondCtrlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
