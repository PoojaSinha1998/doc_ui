import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../constant/custom_colors.dart';
import '../widgets/CustomShadowButton.dart';
import '../widgets/text_component.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: WillPopScope(
            onWillPop: () async => false,
            child: SafeArea(
                child: Scaffold(
                    resizeToAvoidBottomInset: true,
                    body: LayoutBuilder(builder: (BuildContext context,
                        BoxConstraints viewportConstraints) {
                      return Container(
                          color: CustomColors.themeColor,
                          width: double.infinity,
                          height: double.infinity,
                          child: SingleChildScrollView(
                              child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: viewportConstraints.maxHeight,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30.0, bottom: 15.0),
                                            child: myText(
                                                'ENTER VERIFICATION CODE',
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.bold,
                                                color: CustomColors.cWhite),
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 80,
                                                height: 60,
                                                child: CountryCodePicker(
                                                  onChanged: (e) =>
                                                      print(e.toLongString()),
                                                  initialSelection: 'IN',
                                                  showCountryOnly: false,
                                                  showOnlyCountryWhenClosed:
                                                      false,
                                                  showFlag: false,
                                                  showDropDownButton: true,
                                                  favorite: ['+39', 'FR'],
                                                ),
                                              ),

                                              Expanded(
                                                child: TextField(
                                                  controller: _controller,
                                                  decoration: InputDecoration(
                                                      suffixIcon: IconButton(
                                                        onPressed:
                                                            _controller.clear,
                                                        icon: Icon(Icons.clear),
                                                      ),
                                                      border: InputBorder.none,
                                                      hintText: '123 456 1234'),
                                                ),
                                              )
                                              // CustomTextField(
                                              //   width: 350,
                                              //   controller: TextEditingController(),
                                              //   text: '',
                                              //   hintText: 'Username (phone or email)',
                                              //   bgColor: textFeildColor,
                                              //   onChanged: (v) {},
                                              // ),
                                            ],
                                          ),
                                          myText(
                                              'We will send you an SMS with the verification code to this number.',
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: CustomColors.cWhite),
                                          CustomShadowButtom(
                                            text: 'LOGIN',
                                            onTap: signIn,
                                          ),
                                        ]),
                                  ))));
                    })))));
  }

  signIn(){
    Navigator.of(context).pushNamed('doc_home_page');
    if (_formKey.currentState!.validate()) {


    }
  }
}
