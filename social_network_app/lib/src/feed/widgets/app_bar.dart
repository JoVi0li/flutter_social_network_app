import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:social_network_app/src/global/widgets/outlined_input.dart';
import 'package:social_network_app/src/utils/constanst.dart';

class CustomSliverAppBar extends StatelessWidget {
  CustomSliverAppBar({Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      snap: false,
      // titleSpacing: 0.0,
      toolbarHeight: 152,
      expandedHeight: 400,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      shadowColor: shadowColor,
      elevation: 10,
      foregroundColor: Colors.white,
      titleTextStyle: Theme.of(context).textTheme.headline1,
      title: const Padding(
        padding: EdgeInsets.only(
          left: 15,
        ),
        child: Text("Domingo,\n09 de Janeiro de 2022"),
      ),
      titleSpacing: 0.0,
      backgroundColor: accentColor,
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 15,
            top: 45,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Lottie.asset(
                'assets/lottie/sunclouds_animation.json',
                width: 48,
              ),
              Text(
                '22°C',
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      fontSize: 18,
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        
        background: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 5,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (ctx, index) {
                      return Container(
                        width: 100,
                        height: 140,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: shadowColor,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/unsplash_jmURdhtm7Ng.png',
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: TextFormField(
                    controller: _textEditingController,
                    validator: (value) {},
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2.0,
                          color: Colors.white,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2.0,
                          color: Colors.red,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2.0,
                          color: Colors.red,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2.0,
                          color: Colors.white,
                        ),
                      ),
      
                      labelText: 'Pesquise o que ou quem deseja encontrar',
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.white70),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.search_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyText1,
                    cursorColor: Colors.white,
                    obscureText: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
