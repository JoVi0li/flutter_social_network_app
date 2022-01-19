import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -42,
          right: 157,
          width: 80,
          height: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset('assets/images/unsplash_jmURdhtm7Ng.png'),
          ),
        ),
        Positioned(
          top: 0,
          width: MediaQuery.of(context).size.width,
          height: 367,
          child: Container(
            height: 367,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Column(
              children: [
                ClipRRect(
                  child: Image.asset('assets/images/unsplash_jmURdhtm7Ng.png'),
                ),
                Row(
                  children: const [
                    Icon(Icons.add),
                    Icon(Icons.add),
                    Icon(Icons.add),
                    Icon(Icons.add),
                  ],
                ),
                Column(
                  children: const [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(),
                          TextSpan(),
                        ],
                      ),
                    ),
                    Text('data'),
                  ],
                ),
                Container(),
                Row(
                  children: const [
                    Icon(Icons.ac_unit),
                    Text('data'),
                    Text('data'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
