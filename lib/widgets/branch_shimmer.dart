import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BranchesShimmer extends StatelessWidget {
  const BranchesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            margin: const EdgeInsets.all(10),
                            height: 50,
                            width: 50
                          ),
                        ),
                      ),
                      // const SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 15,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height:18,
                            width: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1,indent: 15, endIndent: 15,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              margin: const EdgeInsets.all(10),
                              height: 50,
                              width: 50
                          ),
                        ),
                      ),
                      // const SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 15,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height:18,
                            width: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1,indent: 15, endIndent: 15,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              margin: const EdgeInsets.all(10),
                              height: 50,
                              width: 50
                          ),
                        ),
                      ),
                      // const SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 15,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height:18,
                            width: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1,indent: 15, endIndent: 15,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              margin: const EdgeInsets.all(10),
                              height: 50,
                              width: 50
                          ),
                        ),
                      ),
                      // const SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 15,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height:18,
                            width: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1,indent: 15, endIndent: 15,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              margin: const EdgeInsets.all(10),
                              height: 50,
                              width: 50
                          ),
                        ),
                      ),
                      // const SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 15,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height:18,
                            width: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1,indent: 15, endIndent: 15,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              margin: const EdgeInsets.all(10),
                              height: 50,
                              width: 50
                          ),
                        ),
                      ),
                      // const SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 15,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height:18,
                            width: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1,indent: 15, endIndent: 15,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              margin: const EdgeInsets.all(10),
                              height: 50,
                              width: 50
                          ),
                        ),
                      ),
                      // const SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 15,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height:18,
                            width: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1,indent: 15, endIndent: 15,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              margin: const EdgeInsets.all(10),
                              height: 50,
                              width: 50
                          ),
                        ),
                      ),
                      // const SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 15,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height:18,
                            width: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1,indent: 15, endIndent: 15,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              margin: const EdgeInsets.all(10),
                              height: 50,
                              width: 50
                          ),
                        ),
                      ),
                      // const SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 15,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height:18,
                            width: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1,indent: 15, endIndent: 15,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              margin: const EdgeInsets.all(10),
                              height: 50,
                              width: 50
                          ),
                        ),
                      ),
                      // const SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 15,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.grey.withOpacity(0.3),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height:18,
                            width: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
