import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gunshop/screens/guns_list_view.dart';
import '../Reuse_Widget/reuse_widget.dart';
import '../data.dart/list_gun.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Controller
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  ScrollController _scrollController1 = ScrollController();
   void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtent1 = _scrollController1.position.minScrollExtent;
      double maxScrollExtent1 = _scrollController1.position.maxScrollExtent;
      //
      animateToMaxMin(maxScrollExtent1, minScrollExtent1, maxScrollExtent1, 20,
          _scrollController1);
    });
  }

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: seconds,), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                children: <Widget>[
                  GunsListView(
                  scrollController: _scrollController1,
                  images: movies1,
                ),
                  SizedBox(
                    height: 5,
                  ),
                  ReuseableTextfield('example@gmail.com', Icons.email_outlined,
                      false, _emailcontroller),
                  SizedBox(
                    height: 10,
                  ),
                  ReuseableTextfield('Password', Icons.lock_outlined, true,
                      _passwordcontroller),
                  forgotPassWord(context),
                  SignInSignUpButton(context, false, () {}),
                  SignUpButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row SignUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account?",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
            onTap: () {},
            child: const Text(
              ' Sign Up',
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }

  Widget forgotPassWord(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 32,
      alignment: Alignment.topRight,
      child:  TextButton(
        child: const Text(
          'Forgot Password',
          style: TextStyle(color: Colors.white60),
          textAlign: TextAlign.right,
        ),
        onPressed: () {},
      ),
    );
  }
}

