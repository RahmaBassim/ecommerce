import 'package:e_commerce/shared/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateWidget extends StatelessWidget {
final double rate;
const RateWidget({super.key, required this.rate});
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      tapOnlyMode: true,
      ignoreGestures: true,
      initialRating: rate,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      unratedColor: ColorsManager.softGrey,
      itemSize: 25,
      itemBuilder: (context, _) =>
      const Icon(Icons.star, color: Colors.amber,),
      onRatingUpdate: (rating) {},
    );
  }
}
