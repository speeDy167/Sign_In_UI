import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class GunsListView extends StatelessWidget {
  final ScrollController scrollController;
  final List images;
  const GunsListView({Key? key, required this.scrollController, required this.images}) : super(key: key);

  @override
    Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  'assets/images/${images[index]}',
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }
}