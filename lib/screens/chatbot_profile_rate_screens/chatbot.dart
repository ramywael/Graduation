import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Chatbot extends StatelessWidget {
  final Widget screenName;
  const Chatbot({super.key, required this.screenName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
            color: Color(0xfff0f0f0),
          ),
          child: AppBar(
            scrolledUnderElevation: 0,
            toolbarHeight: 100,
            backgroundColor: Colors.transparent,
            leading:  IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screenName,));
              }, icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
            ),
            ),
            title:  const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xfff0f0f0),
                      radius: 28,
                      child: Icon(
                        Icons.android,
                        color: Color(0xff81201a),
                        size: 50,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Color(0xff286e34),
                      radius: 6.0,
                    )
                  ],
                ),
                SizedBox(width: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chatbot',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 19,
                        fontWeight: FontWeight.w900,

                      ),
                    ),
                    SizedBox(height: 3,),
                    Text(
                      'Connect Now',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize:16,
                          fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                )
              ],
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: SvgPicture.asset(
                    'assets/icons/rocketchatRed_chatBot.svg',
                    height: 30,
                  )
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: 0.4,
                  image: AssetImage(
                    'assets/images/onBoarding1.png',
                  ),
                  fit: BoxFit.cover,
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 35),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.android,
                        color: Color(0xff81201a),
                        size: 45,
                      ),
                      const SizedBox(width: 10),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 225,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: const Color(0xfff0f0f0),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'How can i assist you',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 35,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 225,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: const Color(0xff81201a),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'I need to request blood donation.',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/images/chat_photo.jpeg"),
                                fit: BoxFit.cover
                            )
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 35,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.android,
                        color: Color(0xff81201a),
                        size: 45,
                      ),
                      const SizedBox(width: 10),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 225,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: const Color(0xfff0f0f0),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'How can i assist you',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 35,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 225,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: const Color(0xff81201a),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'I need to request blood donation.',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/images/chat_photo.jpeg"),
                                fit: BoxFit.cover
                            )
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 35,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.android,
                        color: Color(0xff81201a),
                        size: 45,
                      ),
                      const SizedBox(width: 10),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 225,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: const Color(0xfff0f0f0),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'How can i assist you',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 35,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 225,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: const Color(0xff81201a),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'I need to request blood donation.',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/images/chat_photo.jpeg"),
                                fit: BoxFit.cover
                            )
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 35,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.android,
                        color: Color(0xff81201a),
                        size: 45,
                      ),
                      const SizedBox(width: 10),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 225,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: const Color(0xfff0f0f0),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'How can i assist you',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 35,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 225,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: const Color(0xff81201a),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'I need to request blood donation.',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/images/chat_photo.jpeg"),
                                fit: BoxFit.cover
                            )
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 35,),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40)
        ),
        child: BottomAppBar(
          elevation: 0,
          color: const Color(0xfff0f0f0),
          height: 100,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300]!,
                        offset: const Offset(1, 3),
                        blurRadius: 6,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Type your message ...',
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: Color(0xff8d8d8d),
                              fontWeight: FontWeight.w600
                          )
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 3,),
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xffbcb0b0)
                ),
                child: IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.send,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
