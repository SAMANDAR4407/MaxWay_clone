import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerView extends StatelessWidget {
  const ShimmerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (__, _) => const SizedBox(height: 10,),
      itemCount: 5,
      itemBuilder: (_, i) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 22,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.1),
                highlightColor: Colors.grey.withOpacity(0.3),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 28,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 350,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(width: 10,),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (_, ind) {
                    if(ind == 0){
                      return const Row(
                        children: [
                          SizedBox(width: 20,),
                          ChildShimmer()
                        ],
                      );
                    }
                    return const ChildShimmer();
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class ChildShimmer extends StatelessWidget {
  const ChildShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    clipBehavior: Clip.antiAlias,
    width: MediaQuery.of(context).size.width * 0.8,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20)),
    child: Shimmer.fromColors(
    baseColor: Colors.grey.withOpacity(0.1),
    highlightColor: Colors.grey.withOpacity(0.3),
    child: Container(
      color: Colors.white,
    ),
      ),
    );
  }
}