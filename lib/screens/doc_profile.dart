import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../constant/custom_colors.dart';
import '../widgets/text_component.dart';

class DocProfile extends StatefulWidget {
  const DocProfile({Key? key}) : super(key: key);

  @override
  State<DocProfile> createState() => _DocProfileState();
}

class _DocProfileState extends State<DocProfile> {
  int val = -1;
  var  gfront ;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: CustomColors.cBackground,
            body: SingleChildScrollView(
              controller: scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Column(children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 4,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: Container(
                                  decoration:
                                      BoxDecoration(color: CustomColors.themeColor),
                                ),
                              ),
                              Positioned(
                                top: 80,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  height: 150,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      color: CustomColors.cWhite),
                                ),
                              ),
                              Positioned(
                                top: 30,
                                left: 0,
                                right: 0,
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: (){

                                        imageModalBottomSheet(context);
                                      },
                                      child: Container(
                                       child: CircleAvatar(
                                         radius: 50,
                                         backgroundColor: Colors.black,
                                         child: gfront != null ? ClipRRect(
                                             borderRadius: BorderRadius.circular(10),
                                             child: Container(child: Image.file(gfront,height: 150,))) :
                                         Container(
                                           height: 150,
                                           decoration: BoxDecoration(

                                               borderRadius: BorderRadius.circular(5)
                                           ),
                                       ),
                                      ),
                                    )
                                    ),
                                    myText("Mehrin", fontSize: 12, fontWeight: FontWeight.bold),
                                    ElevatedButton(
                                      child: Text('EDIT PROFILE'),
                                      onPressed: () {
                                        print('Pressed');
                                      },
                                    )



                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: myText("PERSONAL DETAILS", fontSize: 20, fontWeight: FontWeight.bold,),
                      ),

                      Column(
                        children: [
                          container("FISRT NAME", "MEHRIN MEHRIN"),
                          container("LAST NAME", "MEHRIN MEHRIN"),
                          container("GENDER", "MEHRIN MEHRIN"),
                          container("CONTACT NUMBER", "MEHRIN MEHRIN")
                        ],
                      ),
                      Container(
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: myText("DATE OF BIRTH",textAlign: TextAlign.left, fontSize: 12, fontWeight: FontWeight.bold,color: CustomColors.darkGrey))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          datOfBirthContainer("CONTACT NUMBER", "MEHRIN MEHRIN"),
                          datOfBirthContainer("CONTACT NUMBER", "MEHRIN MEHRIN"),
                          datOfBirthContainer("CONTACT NUMBER", "MEHRIN MEHRIN"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          datOfBirthContainer("CONTACT NUMBER", "MEHRIN MEHRIN"),
                          datOfBirthContainer("CONTACT NUMBER", "MEHRIN MEHRIN"),
                          datOfBirthContainer("CONTACT NUMBER", "MEHRIN MEHRIN"),
                        ],
                      )
                    ],
                  ),
                  const Positioned(

                    left: 15,
                      top: 10,
                      child: Icon(Icons.arrow_back,color: CustomColors.cWhite, size: 20,)),
                ],
              ),
            )));
  }

  Widget container(String heading, String name)
  {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: CustomColors.cWhite,
        height: 70,
        child :Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            myText("$heading", fontSize: 12, fontWeight: FontWeight.bold,color: CustomColors.darkGrey),
            myText("$name", fontSize: 12, fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }
  Widget datOfBirthContainer(String heading, String name)
  {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(

        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          color: CustomColors.cWhite,
        ),

        height: 70,
        child :Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            myText("$heading", fontSize: 12, fontWeight: FontWeight.bold,color: CustomColors.darkGrey),
            myText("$name", fontSize: 12, fontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }

  //Bottom Sheet
  void imageModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 150.0,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton.extended(
                    label:
                    Text('Camera'),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      //image = "";
                      getImageFile(ImageSource.camera);
                    },
                    heroTag: UniqueKey(),
                    icon: Icon(Icons.camera),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton.extended(
                    label:
                    Text('Gallery'),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();

                      getImageFile(ImageSource.gallery);
                    },
                    heroTag: UniqueKey(),
                    icon: Icon(Icons.photo_library),
                  ),
                )
              ],
            ),
          );
        });
  }
  getImageFile(ImageSource source) async {
    //pickImage(source: source);
    final picker = ImagePicker();
    var selectedimage = await picker.pickImage(source: source);
    ImageCropper imageCropper = ImageCropper();
    if (selectedimage != null) {
      gfront = selectedimage;
    }
  }
}


