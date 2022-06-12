import 'package:flutter/material.dart';
import '../utils/Strings.dart';
import 'home_page.dart';

class IntroPage extends StatefulWidget {
  static const String id = "intro_page";

  IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
                  image: 'assets/images/img.png',
              ),
              makePage(
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent,
                  image: 'assets/images/img_1.png',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 230,),
                  makePage(
                    title: Strings.stepThreeTitle,
                    content: Strings.stepThreeContent,
                      image: 'assets/images/img_2.png',
                  ),
                  SizedBox(height: 150,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 20,left: 20,),
                      child: Text('Skip',style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.w400),),
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget makePage({title, content, image, reverse = false}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 30,),
          Text(title, style: TextStyle(
              color: Colors.red,
              fontSize: 30,
              fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 30,),
          Text(content, textAlign: TextAlign.center, style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w400
          ),),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(image),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i<3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

}