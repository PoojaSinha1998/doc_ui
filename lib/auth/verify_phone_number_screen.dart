import 'package:doc_app/helper/helpers.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';

import '../constant/custom_colors.dart';
import '../widgets/CustomShadowButton.dart';
import '../widgets/pin_input_field.dart';
import '../widgets/text_component.dart';

class VerifyPhoneNumberScreen extends StatefulWidget {
  static const id = 'VerifyPhoneNumberScreen';


  // final String phoneNumber;

  const VerifyPhoneNumberScreen({
    Key? key,
    // required this.phoneNumber,
  }) : super(key: key);

  @override
  State<VerifyPhoneNumberScreen> createState() =>
      _VerifyPhoneNumberScreenState();
}

class _VerifyPhoneNumberScreenState extends State<VerifyPhoneNumberScreen>
    with WidgetsBindingObserver {
  bool isKeyboardVisible = false;
  bool? valuefirst = false;
  late final ScrollController scrollController;
  var otp;
  @override
  void initState() {
    print("Phone number ${ GlobalConstant.phoneNumber}");
    scrollController = ScrollController();
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomViewInsets = WidgetsBinding.instance!.window.viewInsets.bottom;
    isKeyboardVisible = bottomViewInsets > 0;
  }

  // scroll to bottom of screen, when pin input field is in focus.
  Future<void> _scrollToBottomOnKeyboardOpen() async {
    while (!isKeyboardVisible) {
      await Future.delayed(const Duration(milliseconds: 50));
    }

    await Future.delayed(const Duration(milliseconds: 250));

    await scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FirebasePhoneAuthHandler(
        phoneNumber:  GlobalConstant.phoneNumber,
        onLoginSuccess: (userCredential, autoVerified) async {
          log(
            VerifyPhoneNumberScreen.id,
            msg: autoVerified
                ? 'OTP was fetched automatically!'
                : 'OTP was verified manually!',
          );

          showSnackBar('Phone number verified successfully!');

          log(
            VerifyPhoneNumberScreen.id,
            msg: 'Login Success UID: ${userCredential.user?.uid}',
          );

          Navigator.pushNamedAndRemoveUntil(
            context,
            'doc_home_page',
            (route) => false,
          );
        },
        onLoginFailed: (authException) {
          showSnackBar('Something went wrong!');
          log(VerifyPhoneNumberScreen.id, error: authException.message);
          // handle error further if needed
        },
        builder: (context, controller) {
          return Scaffold(
            backgroundColor: CustomColors.themeColor,
            body: controller.codeSent
                ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30.0, bottom: 1.0),
                              child: myText(
                                  'ENTER VERIFICATION CODE',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.cWhite),
                            ),
                            const SizedBox(height: 10),
                            const Divider(),

                            PinInputField(
                              length: 6,

                              onFocusChange: (hasFocus) async {
                                if (hasFocus) await _scrollToBottomOnKeyboardOpen();
                              },
                              onSubmit: (enteredOTP) async {

                                otp = enteredOTP;
                              },
                            ),
                            myText(
                              "We've sent an SMS with a verification code to ${ GlobalConstant.phoneNumber}",
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.cWhite,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: Colors.greenAccent,
                                  value: this.valuefirst,
                                  onChanged: (value) async {
                                    setState(() {
                                      this.valuefirst = value;
                                    });
                                  },
                                ),
                                myText(
                                  "I agree the terms of Use and Privacy Policy",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.cWhite,
                                ),
                              ],
                            ),

                            CustomShadowButtom(
                              status:valuefirst,
                              text: 'VERIFY',
                              onTap: () async {
                                if(valuefirst!) {
                                  final isValidOTP = await controller.verifyOTP(
                                    otp: otp,
                                  );
                                  // Incorrect OTP
                                  if (!isValidOTP) {
                                    showSnackBar('The entered OTP is invalid!');
                                  }
                                }
                              },
                            ),
                          ],
                        ),


                      ],
                    ),
                )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      // CustomLoader(),
                      SizedBox(height: 50),
                      Center(
                        child: Text(
                          'Sending OTP',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
