import 'package:flutter/material.dart';
import 'package:pdp_ui_intro/pages/home_page.dart';

import '../utils/Strings.dart';

class IntroPage extends StatefulWidget {
  static const id = 'intro_page';
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState(){
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.pushReplacementNamed(context, HomePage.id);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Skip', style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.w400),),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          PageView(
            onPageChanged: (int page){
              setState((){
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
                makePage(
                  image: 'assets/images/img.png',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent
                ),
              makePage(
                  image: 'assets/images/img_1.png',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent
              ),
              makePage(
                  image: 'assets/images/img_2.png',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent
              ),
            ],
          )
        ],
      ),
    );
  }
  Widget makePage({image, title, content, reverse = false}){
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
              SizedBox(height: 10,),
            ],
          ),
          Text(title, style: TextStyle(
            color: Colors.green,
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 30,),
          Text(content, textAlign: TextAlign.center, style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w400
          ),)
        ],
      ),
    );
  }


  Widget _indicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive? 30: 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator(){
    List<Widget> indicators = [];
    for(int i = 0; i < 3; i++){
      if(currentIndex == i){
        indicators.add(_indicator(true));
      }else{
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

}
