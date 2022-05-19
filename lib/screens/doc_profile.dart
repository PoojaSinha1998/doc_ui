import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constant/custom_colors.dart';
import '../widgets/text_component.dart';

class DocProfile extends StatefulWidget {
  const DocProfile({Key? key}) : super(key: key);

  @override
  State<DocProfile> createState() => _DocProfileState();
}

class _DocProfileState extends State<DocProfile> {
  int val = -1;

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
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              controller: scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
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
                              decoration: BoxDecoration(
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
                                Container(
                                 child:
                                 CircleAvatar(
                                   radius: 50,
                                   backgroundColor: Colors.black,
                                   child: CircleAvatar(
                                     radius: 50,
                                     backgroundImage: NetworkImage(
                                         'https://scontent.ftun7-1.fna.fbcdn.net/v/t39.30808-6/s552x414/255729438_2061962933967301_6536194202848894171_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=8WN5tCaKhNQAX8wbDdB&_nc_ht=scontent.ftun7-1.fna&oh=00_AT-vQcebr_3_dyt5y7xkSu5mO6tTdZSL7pr80y15zU8aOQ&oe=61CD0B9D'),
                                   ),
                                 ),
                                ),
                                myText("Mehrin", fontSize: 12, fontWeight: FontWeight.bold),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 45,
                  ),
                  ListTile(
                    title: Center(child: Text('Iheb Meftah')),
                    subtitle: Center(child: Text('Computer Science Student ')),
                  ),
                  ListTile(
                    title: Text('About me '),
                    subtitle: Text(
                        'Iheb Meftah ,étudiant en Licence Science Inforamtiques specialite Anlayse De Donnees et Big Data  '),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text('Education'),
                    subtitle: Text(
                        'Higher Institute of Computer Science and Multimedia of Sfax '),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )));
  }
}
