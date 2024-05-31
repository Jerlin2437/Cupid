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
