import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu, color: Colors.white)),
          centerTitle: true,
          title: const Text(
            'My First App',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                color: Colors.white,
                onPressed: () {
                  print('Ay 7aga');
                },
                icon: const Icon(Icons.search)),
            IconButton(
                color: Colors.white,
                onPressed: () {
                  print('Ay 7aga');
                },
                icon: const Icon(Icons.notifications_outlined))
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.account_circle_rounded,
                  size: 90,
                  color: Colors.grey,
                ),
                const SizedBox(height: 15),
                const Text(
                  'Sayed Abdul-Aziz',
                  style: TextStyle(
                      // decoration: TextDecoration.lineThrough,
                      // decorationColor: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Colors.deepOrange),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Flutter Developer',
                  style: TextStyle(
                      // decoration: TextDecoration.lineThrough,
                      // decorationColor: Colors.white,
                      fontSize: 18,
                      color: Colors.grey),
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.facebook,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 15),
                    Icon(
                      Icons.camera_alt,
                      color: Colors.redAccent,
                    ),
                    SizedBox(width: 15),
                    Icon(
                      Icons.snapchat,
                      color: Colors.yellow,
                    ),
                    SizedBox(width: 15),
                    Icon(
                      Icons.telegram,
                      color: Colors.blue,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [.2, 2],
                          colors: [Colors.black, Colors.deepOrange]),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'GO to my Website',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                      )
                    ],
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
