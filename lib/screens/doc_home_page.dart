

import 'package:doc_app/model/doc_list_res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/service_locator.dart';
import '../data/utils/response_state.dart';
import '../model/tests_modal.dart';
import '../ui_view/error_screen.dart';
import '../ui_view/loading_screen.dart';
import '../view_model/doc_view_model.dart';
import 'navigation_drawer.dart';
import '../widgets/text_component.dart';

class DocHomePage extends StatefulWidget {
  const DocHomePage({Key? key}) : super(key: key);

  @override
  State<DocHomePage> createState() => _DocHomePageState();
}

class _DocHomePageState extends State<DocHomePage> {
  int? selectedIndex;
  DocViewModel _docRelationViewModel =
  serviceLocator<DocViewModel>();
  List<Widget> relationColumnContent=[];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();
    _docRelationViewModel.loadDocProfileList();
  }
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
              ChangeNotifierProvider<DocViewModel>(
                create: (context) => _docRelationViewModel,
                child: Consumer<DocViewModel>(
                    builder: (context, model, child) {
                      switch (_docRelationViewModel.listofbooks.state) {
                        case ResponseState.LOADING:
                          return Container(child: LoadingScreen());
                          break;
                        case ResponseState.ERROR:
                          print(
                              "EXCEPTION ${_docRelationViewModel.listofbooks.exception}");
                          return ErrorScreen(_docRelationViewModel
                              .listofbooks.exception
                              .toString());
                          break;
                        case ResponseState.COMPLETE:
                          relationColumnContent=[];

                          if (_docRelationViewModel.listofbooks.data?.length != 0) {
                            for (int i = 0; i < _docRelationViewModel.listofbooks.data!.length; i++) {
                              relationColumnContent.add(

                                  testsList(_docRelationViewModel.listofbooks.data
                                  ));
                            }
                            return Column(
                              // physics: ScrollPhysics(),
                              // shrinkWrap: true,
                                children: relationColumnContent
                            );
                            // setState(() {
                            //
                            // });
                          }
                          else{
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child:Text(
                                  "No Data Found",
                                  style: TextStyle(
                                      fontFamily: 'RobotoMono',
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            );
                          }



                          break;
                        case ResponseState.LOADING:
                          // TODO: Handle this case.
                          break;
                        case ResponseState.COMPLETE:
                          // TODO: Handle this case.
                          break;
                        case ResponseState.ERROR:
                          // TODO: Handle this case.
                          break;
                      }
                      return const Padding(
                        padding: EdgeInsets.all(10.0),
                        child:Center(
                          child: Text(
                            "No Data Available",
                            style: TextStyle(
                                fontFamily: 'RobotoMono',
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      );
                    }),
              ),

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

  Widget testsList(List<DocListRes>? data) {
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
