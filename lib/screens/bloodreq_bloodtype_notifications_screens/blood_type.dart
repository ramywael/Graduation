import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../custom_widgets/blood_type_container.dart';


class BloodType extends StatelessWidget {
   const BloodType({super.key});

   final List<BloodTypeContainer> bloodTypes = const [
    BloodTypeContainer(
        bloodType: "A+",
        name: "Sarah Johnson",
        governorate: "Los Angeles",
        timeLimit: "2 days"),
    BloodTypeContainer(
        bloodType: "O-",
        name: "Michael Watson",
        governorate: "New York",
        timeLimit: "1 days"),
    BloodTypeContainer(
        bloodType: "B+",
        name: "Emily Parker",
        governorate: "Chicago",
        timeLimit: "3 days"),
    BloodTypeContainer(
        bloodType: "A+",
        name: "Sarah Johnson",
        governorate: "Los Angeles",
        timeLimit: "2 days"),
    BloodTypeContainer(
        bloodType: "O-",
        name: "Michael Watson",
        governorate: "New York",
        timeLimit: "1 days"),
    BloodTypeContainer(
        bloodType: "B+",
        name: "Emily Parker",
        governorate: "Chicago",
        timeLimit: "3 days"),
    BloodTypeContainer(
        bloodType: "A+",
        name: "Sarah Johnson",
        governorate: "Los Angeles",
        timeLimit: "2 days"),
    BloodTypeContainer(
        bloodType: "O-",
        name: "Michael Watson",
        governorate: "New York",
        timeLimit: "1 days"),
    BloodTypeContainer(
        bloodType: "B+",
        name: "Emily Parker",
        governorate: "Chicago",
        timeLimit: "3 days"),
  ];

   final List<String>titles = const[
     'Chat', 'Home', 'Profile'
   ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200]!,
                  offset: const Offset(1, 3),
                  blurRadius: 6,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: AppBar(
              toolbarHeight: 85,
              scrolledUnderElevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: (){},
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  )
              ),
              title: const Text(
                'BloodConnect',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'Roboto-Regular',
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 25),
          child: ListView.builder(
              itemCount: bloodTypes.length,
              itemBuilder: (context,index){
                return bloodTypes[index];
              }),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200]!,
                offset: const Offset(1, 4),
                blurRadius: 6,
                spreadRadius: 8,
              ),
            ],
          ),
          height: 70,
          child: BottomNavigationBar(
            items:  [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/rocketchat.svg',
                  height: 30,
                ),
                  label: ''
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Color(0xff413d3d),
                  size: 35,
                ),
                  label: ''
              ),
              const BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Color(0xff413d3d),
                  size: 35,
                ),
                label: ''
              ),
            ],
            selectedFontSize: 0,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xff81201a),
            type: BottomNavigationBarType.fixed,
            onTap: (index){},
          ),
        ),
      ),
    );
  }
}
