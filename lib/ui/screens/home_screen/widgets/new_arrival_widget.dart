import 'package:flutter/material.dart';

import '../../feed_screen/feed_screen.dart';

class NewArrivalWidget extends StatelessWidget {
  const NewArrivalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'New Arrival',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        const Spacer(),
        const Text(
          'View all',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          alignment: Alignment.center,
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(-1, 2),
                    blurRadius: 10,
                    color: Colors.grey.withOpacity(.5))
              ]),
          child: TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FeedScreen())),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.purple,
            ),
          ),
        ),
      ],
    );
  }
}
