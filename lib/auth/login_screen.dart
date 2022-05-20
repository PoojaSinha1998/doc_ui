import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../constant/custom_colors.dart';
import '../helper/helpers.dart';
import '../widgets/CustomShadowButton.dart';
import '../widgets/text_component.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controller = TextEditingController();
  String? phoneNumber;
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
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                                        children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30.0, bottom: 1.0),
                                                child: myText(
                                                    'ENTER YOUR MOBILE NUMBER',
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: CustomColors.cWhite),
                                              ),
                                              const SizedBox(height: 5),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: EasyContainer(
                                                  elevation: 0,
                                                  borderRadius: 10,
                                                  color: Colors.transparent,
                                                  child: Form(
                                                    key: _formKey,
                                                    child: IntlPhoneField(
                                                      autofocus: true,

                                                      invalidNumberMessage:
                                                      'Invalid Phone Number!',
                                                      textAlignVertical:
                                                      TextAlignVertical.center,
                                                      style: const TextStyle(
                                                          fontSize: 22,color: CustomColors.brightOrange),
                                                      onChanged: (phone) =>
                                                      phoneNumber =
                                                          phone.completeNumber,
                                                      initialCountryCode: 'IN',
                                                      flagsButtonPadding:
                                                      const EdgeInsets.only(
                                                          right: 10),

                                                      showDropdownIcon: true,
                                                      dropdownIconPosition:
                                                      IconPosition.trailing,
                                                      showCountryFlag: false,
                                                      keyboardType:
                                                      TextInputType.phone,
                                                    ),
                                                  ),
                                                ),
                                              ),


                                              myText(
                                                  'We will send you an SMS with the verification \ncodeto this number.',
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: CustomColors.cWhite),
                                            ],
                                          ),
                                          // Row(
                                          //   children: [
                                          //     SizedBox(
                                          //       width: 80,
                                          //       height: 60,
                                          //       child: CountryCodePicker(
                                          //         onChanged: (e) =>
                                          //             print(e.toLongString()),
                                          //         initialSelection: 'IN',
                                          //         showCountryOnly: false,
                                          //         showOnlyCountryWhenClosed:
                                          //             false,
                                          //         showFlag: false,
                                          //         showDropDownButton: true,
                                          //         favorite: ['+39', 'FR'],
                                          //       ),
                                          //     ),
                                          //
                                          //     Expanded(
                                          //       child: TextField(
                                          //         controller: _controller,
                                          //         decoration: InputDecoration(
                                          //             suffixIcon: IconButton(
                                          //               onPressed:
                                          //                   _controller.clear,
                                          //               icon: Icon(Icons.clear),
                                          //             ),
                                          //             border: InputBorder.none,
                                          //             hintText: '123 456 1234'),
                                          //       ),
                                          //     )
                                          //     // CustomTextField(
                                          //     //   width: 350,
                                          //     //   controller: TextEditingController(),
                                          //     //   text: '',
                                          //     //   hintText: 'Username (phone or email)',
                                          //     //   bgColor: textFeildColor,
                                          //     //   onChanged: (v) {},
                                          //     // ),
                                          //   ],
                                          // ),

                                          CustomShadowButtom(
                                            status: true,
                                            text: 'LOGIN',
                                            onTap: () async {
                                              if (isNullOrBlank(phoneNumber) ||
                                                  !_formKey.currentState!
                                                      .validate()) {
                                                showSnackBar(
                                                    'Please enter a valid phone number!');
                                              } else {
                                                signIn();
                                              }
                                            },
                                          ),
                                        ]),
                                  ))));
                    })))));
  }

  signIn() {
    GlobalConstant.phoneNumber = phoneNumber!;
    print("Phone number${phoneNumber}");
    Navigator.pushNamed(
      context,
      'verification_screen',
      arguments: phoneNumber,
    );
  }
}
