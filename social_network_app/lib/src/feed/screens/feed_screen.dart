import 'package:flutter/material.dart';
import 'package:social_network_app/src/feed/widgets/app_bar.dart';
import 'package:social_network_app/src/feed/widgets/post_widget.dart';
import 'package:social_network_app/src/utils/constanst.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: CustomScrollView(
        slivers: [
           CustomSliverAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const PostWidget();
              },
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
