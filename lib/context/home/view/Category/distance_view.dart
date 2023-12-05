import 'package:flutter/material.dart';

import '../../../../common/constants.dart';

class DistanceView extends StatelessWidget {
  const DistanceView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 4.0,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: 22,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: _DistanceCard(),
        );
      },
    );
  }
}

class _DistanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            color: randomColor(),
            width: 240,
          ),
        ),
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Positioned(
            top: 8.0,
            left: 8.0,
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.share_arrival_time_sharp),
                iconSize: 30.0,
                color: Colors.blueAccent,
                onPressed: () => print('Add to Story'),
              ),
            )),
        const Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            'Story name',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
