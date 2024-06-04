import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Onboarding extends StatelessWidget{
  static const String routeName = '/onboarding';

  static Route route(){
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => Onboarding(),
    );
  }

  static const List<Tab> tabs = <Tab> [
    Tab(text: 'Start'),
    Tab(text: 'Number'),
    Tab(text: 'Verification'),
    Tab(text: 'Username'),
  ];

  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context){
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener((){
          if (!tabController.indexIsChanging) {}
        });
        return Scaffold(
        backgroundColor: Colors.white,
        appBar:  AppBar(
          toolbarHeight: 60.0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/cupid.png', 
                    height: 50.0,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Cupid',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ],
              ), // any logo we make, just a placeholder for now
            ],
          ),
        ),
        body: TabBarView(
          children:[
            Start(tabController: tabController),
            Number(tabController: tabController),
            Verification(tabController: tabController),
            Username(tabController: tabController),
          ],
        ),
      );
      },)
    );    
  }
}

class CustomOnboardingHeader extends StatelessWidget{
  final String text;
  
  const CustomOnboardingHeader({
    required this.text,
  });

  @override
  Widget build(BuildContext context){
    return Text(
      text,
      style: TextStyle(
        fontSize: 40,
      ),
    );
  }
}

class CustomNumberInput extends StatelessWidget{
  final String text;



  const CustomNumberInput({
    required this.text,
  });

  @override
  Widget build(BuildContext context){
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: text,
      ),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }
}

class CustomTextInput extends StatelessWidget{
  final String text;

  const CustomTextInput({
    required this.text,
  });

  @override
  Widget build(BuildContext context){
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: text,
      ),
    );
  }
}



class CustomButton extends StatelessWidget{
  final TabController tabController;
  final String text;

  const CustomButton({
    Key? key,
    required this.tabController,
    required this.text,
  }) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: (){
        tabController.animateTo(tabController.index + 1);
      }, 
      child: Text(text),
    );
  }
}

class Start extends StatelessWidget{
  final TabController tabController;

  const Start({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            children: [
              SizedBox(height: 150),
              Text(
                'Welcome to Cupid',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                'blah blah blah blah'
              ),
              SizedBox(height: 100),
            ],
          ),
          CustomButton(tabController: tabController, text: 'LET\'S GET STARTED',),
        ],
      ),
    );
  }
}

class Number extends StatelessWidget{
  final TabController tabController;

  const Number({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            children: [
              CustomOnboardingHeader(text: 'What\'s your phone number?'),
              CustomNumberInput(text: 'Please enter your number'),
            ],
          ),
          CustomButton(tabController: tabController, text: 'CONTINUE',),
        ],
      ),
    );
  }
}

// class Number extends StatelessWidget {
//   final TabController tabController;
//   final TextEditingController phoneController = TextEditingController();

//   Number({Key? key, required this.tabController}) : super(key: key);

//   void verifyPhoneNumber(BuildContext context) async {
//     FirebaseAuth _auth = FirebaseAuth.instance;
//     // Firebase phone number verification logic here
//     await _auth.verifyPhoneNumber(
//       phoneNumber: phoneController.text,
//       verificationCompleted: (AuthCredential credential) {
//         // Handle automatic (silent) authentication
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         // Handle errors
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to verify phone number: ${e.message}")));
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         // Save the verificationId and move to the verification screen
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) => Verification(tabController: tabController, verificationId: verificationId)));
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         // Handle timeout
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             children: [
//               CustomOnboardingHeader(text: 'What\'s your phone number?'),
//               TextField(
//                 controller: phoneController,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(hintText: 'Please enter your number'),
//                 inputFormatters: <TextInputFormatter>[
//                   FilteringTextInputFormatter.digitsOnly,
//                 ],
//               ),
//             ],
//           ),
//           CustomButton(
//             tabController: tabController,
//             text: 'CONTINUE',
//             onPressed: () => verifyPhoneNumber(context),
//           ),
//         ],
//       ),
//     );
//   }
// }


class Verification extends StatelessWidget{
  final TabController tabController;

  const Verification({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            children: [
              CustomOnboardingHeader(text: 'Did you get a verification code?'),
              CustomNumberInput(text: 'XXXXXX'),
            ],
          ),
          CustomButton(tabController: tabController, text: 'CONTINUE',),
        ],
      ),
    );
  }
}

class Username extends StatelessWidget{
  final TabController tabController;

  const Username({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            children: [
              CustomOnboardingHeader(text: 'What would you like your username to be?'),
              Text('This will not show up on your profile. It is just for your friends to find you.'),
              CustomTextInput(text: 'Please enter your username'),
            ],
          ),
          CustomButton(tabController: tabController, text: 'CONTINUE',),
        ],
      ),
    );
  }
}


/*
class Verification extends StatelessWidget {
  final TabController tabController;
  final String verificationId;
  final TextEditingController codeController = TextEditingController();

  Verification({Key? key, required this.tabController, required this.verificationId}) : super(key: key);

  void signInWithPhoneNumber(BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: codeController.text.trim(),
      );
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      // Navigate to next screen or perform some action
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to sign in: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CustomOnboardingHeader(text: 'Did you get a verification code?'),
              TextField(
                controller: codeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'XXXXXX'),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ],
          ),
          CustomButton(
            tabController: tabController,
            text: 'CONTINUE',
            onPressed: () => signInWithPhoneNumber(context),
          ),
        ],
      ),
    );
  }
}
*/
