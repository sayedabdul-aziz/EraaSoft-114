import 'package:chat_app_ui_1_17/colors.dart';
import 'package:chat_app_ui_1_17/user.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});

  List<UserModel> users = [
    UserModel(
        name: 'Mohammed Salah',
        image:
            'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt56898e11bc1fa509/64e7029fb832d932750b5ba0/GOAL_-_Blank_WEB_-_Facebook_-_2023-08-24T081104.814.png?auto=webp&format=pjpg&width=3840&quality=60',
        lastMsg: 'Hi, Mo',
        time: '10:00 PM'),
    UserModel(
        name: 'Mohammed Ahmed',
        image:
            'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt56898e11bc1fa509/64e7029fb832d932750b5ba0/GOAL_-_Blank_WEB_-_Facebook_-_2023-08-24T081104.814.png?auto=webp&format=pjpg&width=3840&quality=60',
        lastMsg: 'Hi, Mo',
        time: '10:00 PM'),
    UserModel(
        name: 'Ahmed Zizo',
        image:
            'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt56898e11bc1fa509/64e7029fb832d932750b5ba0/GOAL_-_Blank_WEB_-_Facebook_-_2023-08-24T081104.814.png?auto=webp&format=pjpg&width=3840&quality=60',
        lastMsg: 'Hi, zizo',
        time: '10:00 PM'),
    UserModel(
        name: 'Mohammed Elneny',
        image:
            'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt56898e11bc1fa509/64e7029fb832d932750b5ba0/GOAL_-_Blank_WEB_-_Facebook_-_2023-08-24T081104.814.png?auto=webp&format=pjpg&width=3840&quality=60',
        lastMsg: 'Hi, elneny',
        time: '10:00 PM'),
    UserModel(
        name: 'Mahmoud Trezuegt',
        image:
            'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt56898e11bc1fa509/64e7029fb832d932750b5ba0/GOAL_-_Blank_WEB_-_Facebook_-_2023-08-24T081104.814.png?auto=webp&format=pjpg&width=3840&quality=60',
        lastMsg: 'Hi, truz',
        time: '10:00 PM'),
    UserModel(
        name: 'Ahmed Ali',
        image:
            'https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt56898e11bc1fa509/64e7029fb832d932750b5ba0/GOAL_-_Blank_WEB_-_Facebook_-_2023-08-24T081104.814.png?auto=webp&format=pjpg&width=3840&quality=60',
        lastMsg: 'Hi, ali',
        time: '10:00 PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      // PreferredSize
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Chats',
          style: TextStyle(color: AppColors.whiteColor),
        ),
        actions: [
          IconButton(
              color: AppColors.whiteColor,
              onPressed: () {},
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Favourite Contacts',
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Stack(
                              // alignment: Alignment.bottomRight,
                              children: [
                                // image
                                CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                      users[index].image,
                                    )),

                                // badge
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: AppColors.primaryColor,
                                    child: const CircleAvatar(
                                      radius: 7,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              users[index].name.split(' ')[1],
                              style: TextStyle(color: AppColors.whiteColor),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: users.length),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(users[index].image)),
                      title: Text(
                        users[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(users[index].lastMsg),
                      trailing: Text(users[index].time),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: users.length),
            ),
          )
        ],
      ),
    );
  }
}
