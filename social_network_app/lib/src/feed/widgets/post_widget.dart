import 'package:flutter/material.dart';
import 'package:social_network_app/src/utils/constanst.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: MediaQuery.of(context).size.width,
      height: 407.0,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 0.0,
            child: Container(
              width: 398,
              height: 367,
              decoration: BoxDecoration(
                color: shadowColor,
                borderRadius: BorderRadius.circular(30),
                border: const Border(
                  bottom: BorderSide(
                    color: accentColor,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                  top: BorderSide(
                    color: accentColor,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                  left: BorderSide(
                    color: accentColor,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                  right: BorderSide(
                    color: accentColor,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: SizedBox(
                      height: 237,
                      width: 398,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1644631863314-4634a550a193?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.comment,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Felipe Augusto  " "Pôr do sol maravilhoso!",
                                style: Theme.of(context).textTheme.headline6,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Há 9 minutos!",
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    fontSize: 11,
                                  ),
                        ),
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                            ),
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 2,
                            color: accentColor,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Você e outras 110 pessoas",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(fontSize: 11),
                            ),
                            const Spacer(),
                            Text(
                              "14 comentários",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(fontSize: 11),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: SizedBox(
                height: 80,
                width: 80,
                child: Image.network(
                  'https://images.unsplash.com/photo-1552058544-f2b08422138a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1998&q=80',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
