import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/custom_button.dart';
import 'package:flutter_application_2/widgets/tile_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        centerTitle: true,
        title: const Text(
          'Doctor Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Header
              Row(
                children: [
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/55.jpg'),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dr. Ahmed Tarek',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const Text(
                        'Dentist',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      const Row(
                        children: [
                          Icon(
                            Icons.star_half_rounded,
                            color: Colors.amber,
                            size: 22,
                          ),
                          Text(
                            '3',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          FloatingActionButton(
                              backgroundColor:
                                  Colors.lightBlueAccent.withOpacity(.3),
                              mini: true,
                              elevation: 0,
                              child: const Icon(Icons.call),
                              onPressed: () {}),
                          FloatingActionButton(
                              backgroundColor:
                                  Colors.lightBlueAccent.withOpacity(.3),
                              mini: true,
                              elevation: 0,
                              child: const Icon(Icons.call),
                              onPressed: () {})
                        ],
                      )
                    ],
                  )
                ],
              ),
              // bio
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      Text(
                        'Former Head of Dentist of Cairo University.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              // work details
              const SizedBox(
                height: 20,
              ),

              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.lightBlueAccent.withOpacity(.3)),
                child: const Column(
                  children: [
                    TileItem(
                        icon: Icons.local_hospital, text: 'Cairo Hospital'),
                    SizedBox(height: 15),
                    TileItem(
                        icon: Icons.watch_later_outlined,
                        text: '10:00 - 18:00'),
                    SizedBox(height: 15),
                    TileItem(
                        icon: Icons.location_on_rounded, text: 'Cairo, Egypt'),
                  ],
                ),
              ),
              // divider
              const Padding(
                padding: EdgeInsets.all(20),
                child: Divider(
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
              ),
              // details card
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.lightBlueAccent.withOpacity(.3)),
                child: const Column(
                  children: [
                    TileItem(
                        icon: Icons.local_hospital, text: 'Cairo Hospital'),
                    SizedBox(height: 15),
                    TileItem(
                        icon: Icons.watch_later_outlined,
                        text: '10:00 - 18:00'),
                    SizedBox(height: 15),
                    TileItem(
                        icon: Icons.location_on_rounded, text: 'Cairo, Egypt'),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Buttons
              CustomButton(
                  text: 'Chat With Doctor',
                  onPressed: () {},
                  bgColor: Colors.green),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  text: 'Book an APPOINTMEMNT',
                  onPressed: () {
                    //
                  },
                  bgColor: Colors.lightBlue)
            ],
          ),
        ),
      ),
    );
  }
}
