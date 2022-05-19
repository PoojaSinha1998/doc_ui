

import 'package:flutter/material.dart';

import '../model/tests_modal.dart';
import '../screens/navigation_drawer.dart';
import '../widgets/text_component.dart';

class DocHomePage extends StatefulWidget {
  const DocHomePage({Key? key}) : super(key: key);

  @override
  State<DocHomePage> createState() => _DocHomePageState();
}

class _DocHomePageState extends State<DocHomePage> {
  int? selectedIndex;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(

          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20))
          ),
          child: DrawerWidget(context),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 70),
          child: Column(
            children: [
              appBar(),
              testsList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              size: 20,
            )),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 10,),
            myText(
              'BIMA DOCTOR',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }

  Widget testsList() {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 30, right: 30),
        child: Column(
          children: List.generate(
              dummyTests.length,
              (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          circleImage(dummyTests.elementAt(index).imageUrl, dummyTests.elementAt(index).colors!),
                         
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                myText(dummyTests.elementAt(index).testName, fontSize: 12, fontWeight: FontWeight.bold),
                                myText(dummyTests.elementAt(index).testName, fontSize: 12, fontWeight: FontWeight.bold),
                                myText(dummyTests.elementAt(index).testName, fontSize: 12, fontWeight: FontWeight.bold),
                              ],
                            ),
                          ),
                         

                   
                         GestureDetector(
                             onTap: navigateToProfile,
                             child: const Icon(Icons.arrow_forward_ios_rounded))
                        ],
                      ),
                    ),
                  )),
        ));
  }

  Widget circleImage(String image, List<Color> clr) {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: clr),
        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
      ),
      child: Padding(padding: const EdgeInsets.all(12.0), child: Image.asset(image)
          //  Image(image: AssetImage(image)),
          ),
    );
  }



  void navigateToProfile() {
    Navigator.of(context).pushNamed('doc_profile');
  }
}
