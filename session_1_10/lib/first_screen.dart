import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.amber),
      body: Padding(
        // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        // padding: const EdgeInsets.fromLTRB(30, 40, 20, 20),
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // Image.asset('assets/img1.jpg',
            //     fit: BoxFit.cover, width: 300, height: 400),
            Container(
              height: 200,
              width: 300,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // shape: BoxShape.circle,

                  color: Colors.amber),
              child: Image.network(
                'https://media.licdn.com/dms/image/D4D12AQFokz2r5PX1VA/article-cover_image-shrink_720_1280/0/1661664763671?e=2147483647&v=beta&t=Pvh_n_KfKzK5oLV1Vl1G-leweqiwbi0TGzrhzsfQheE',
                width: 300,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // const CircleAvatar(
            //   radius: 100,
            //   backgroundColor: Colors.amber,
            //   backgroundImage: AssetImage('assets/img1.jpg'),
            // ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'https://media.licdn.com/dms/image/D4D12AQFokz2r5PX1VA/article-cover_image-shrink_720_1280/0/1661664763671?e=2147483647&v=beta&t=Pvh_n_KfKzK5oLV1Vl1G-leweqiwbi0TGzrhzsfQheE',
                width: 250,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            // Container(
            //   height: 200,
            //   width: double.infinity,
            //   margin: const EdgeInsets.all(20),
            //   padding: const EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            //       // border: Border.all(color: Colors.white, width: 5),
            //       boxShadow: const [
            //         BoxShadow(
            //             offset: Offset(10, 10),
            //             color: Colors.grey,
            //             spreadRadius: 5,
            //             blurRadius: 20)
            //       ],
            //       // shape: BoxShape.circle,
            //       image: const DecorationImage(
            //           fit: BoxFit.cover, image: AssetImage('assets/img1.jpg')),
            //       color: Colors.amber),
            //   child: const Text('data'),
            // )
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }
}
