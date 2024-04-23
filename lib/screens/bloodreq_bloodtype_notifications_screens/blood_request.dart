import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BloodRequest extends StatelessWidget {
  const BloodRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 100,
          title: Row(
            children: [
              IconButton(
                onPressed: (){},
                icon: const Icon(CupertinoIcons.chevron_back,
                  size: 30,
                ),
              ),
              Container(
                height: 40,
                width: 260,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200]!,
                      offset: const Offset(1, 3),
                      blurRadius: 6,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.bloodtype,
                        color: Color(0xff81201a),
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 12,),
                    Text(
                      'Request a Blood',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff81201a),
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.bloodtype_outlined,
                size: 40,
                color: Color(0xff81201a),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Blood',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Roboto-Regular'
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[200]!,
                        offset: const Offset(1, 3),
                        blurRadius: 6,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: const Row(
                    children: [
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                        '3',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                            fontFamily: 'Roboto-Regular',
                            color: Colors.black
                        ),
                      ),
                      Spacer(
                        flex: 7,
                      ),
                      Text(
                        'Urgent Request',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto-Regular',
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  'Attached',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Roboto-Regular',
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[200]!,
                        offset: const Offset(1, 3),
                        blurRadius: 6,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 2,
                      ),
                      const Icon(
                        Icons.download,
                        size: 50,
                        color: Color(0xff81201a),
                      ),
                      const Spacer(
                        flex: 7,
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xff81201a),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextButton(
                          onPressed: (){},
                          child: const Text(
                            'Download',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto-Regular',
                            ),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  'Time',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Roboto-Regular',
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  height: 90,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[200]!,
                        offset: const Offset(1, 3),
                        blurRadius: 6,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Text(
                      '10/15/2022',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 28,
                        fontFamily: 'Roboto-Regular',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 55,),
                Center(
                  child: Container(
                    width: 160,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xff81201a),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: TextButton(
                      onPressed: (){},
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto-Regular',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300]!,
                offset: const Offset(1, 4),
                blurRadius: 6,
                spreadRadius: 6,
              ),
            ],
          ),
          child: CurvedNavigationBar(
            height: 70,
            buttonBackgroundColor: Colors.white,
            onTap: (index){},
            items: const [
              Icon(
                Icons.home,
                size: 35,
                color: Colors.black,
              ),
              Icon(
                Icons.bloodtype,
                size: 35,
                color: Colors.black,
              ),
              Icon(
                  Icons.person,
              size: 35,
                color: Colors.black,
              )
            ],
            backgroundColor: Color(0xff81201a),
            color: Colors.white,
            animationDuration: Duration(milliseconds: 600),
          ),
        ),
      ),
    );
  }
}
