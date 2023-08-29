import 'package:demo_max_way/core/api/food_api.dart';
import 'package:demo_max_way/pages/branch_page/bloc/branch_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/branch_shimmer.dart';
import 'branch_page.dart';

class BranchListPage extends StatefulWidget {
  const BranchListPage({super.key});

  @override
  State<BranchListPage> createState() => _BranchListPageState();
}

class _BranchListPageState extends State<BranchListPage> {
  final bloc = BranchBloc(FoodApi());

  @override
  void initState() {
    bloc.add(LoadBranches());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchBloc, BranchState>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFF6F6F6),
          appBar: AppBar(
            surfaceTintColor: Colors.white,
            shadowColor: Colors.grey[300],
            backgroundColor: Colors.white,
            scrolledUnderElevation: 1,
            title: const Text(
              'Filiallar',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          body: Builder(
            builder: (context) {
              if(state.status == BranchStatus.loading && state.branches.isEmpty){
                return const SingleChildScrollView(child: BranchesShimmer());
              }
              final list = state.branches;
              try{
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Material(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => BranchPage(branch: list[0])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/maxway_purple.png',width: 60,height: 60,),
                                const SizedBox(width: 10,),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(list[0].name,
                                      style: const TextStyle(
                                        fontSize: 15, ),
                                    ),
                                    Text(list[0].destination,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                )),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5,)
                              ],
                            ),
                          ),
                        ),
                        const Divider(height: 1,indent: 15, endIndent: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => BranchPage(branch: list[1])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/maxway_purple.png',width: 60,height: 60,),
                                const SizedBox(width: 10,),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(list[1].name,
                                      style: const TextStyle(
                                        fontSize: 15, fontWeight: FontWeight.w400),
                                    ),
                                    Text(list[1].destination,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                )),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5,)
                              ],
                            ),
                          ),
                        ),
                        const Divider(height: 1,indent: 15, endIndent: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => BranchPage(branch: list[2])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/maxway_purple.png',width: 60,height: 60,),
                                const SizedBox(width: 10,),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(list[2].name,
                                      style: const TextStyle(
                                        fontSize: 15, ),
                                    ),
                                    Text(list[2].destination,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                )),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5,)
                              ],
                            ),
                          ),
                        ),
                        const Divider(height: 1,indent: 15, endIndent: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => BranchPage(branch: list[3])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/maxway_purple.png',width: 60,height: 60,),
                                const SizedBox(width: 10,),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(list[3].name,
                                      style: const TextStyle(
                                        fontSize: 15, ),
                                    ),
                                    Text(list[3].destination,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                )),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5,)
                              ],
                            ),
                          ),
                        ),
                        const Divider(height: 1,indent: 15, endIndent: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => BranchPage(branch: list[4])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/maxway_purple.png',width: 60,height: 60,),
                                const SizedBox(width: 10,),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(list[4].name,
                                      style: const TextStyle(
                                        fontSize: 15, ),
                                    ),
                                    Text(list[4].destination,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                )),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5,)
                              ],
                            ),
                          ),
                        ),
                        const Divider(height: 1,indent: 15, endIndent: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => BranchPage(branch: list[5])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/maxway_purple.png',width: 60,height: 60,),
                                const SizedBox(width: 10,),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(list[5].name,
                                      style: const TextStyle(
                                        fontSize: 15, ),
                                    ),
                                    Text(list[5].destination,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                )),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5,)
                              ],
                            ),
                          ),
                        ),
                        const Divider(height: 1,indent: 15, endIndent: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => BranchPage(branch: list[6])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/maxway_purple.png',width: 60,height: 60,),
                                const SizedBox(width: 10,),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(list[6].name,
                                      style: const TextStyle(
                                        fontSize: 15, ),
                                    ),
                                    Text(list[6].destination,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                )),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5,)
                              ],
                            ),
                          ),
                        ),
                        const Divider(height: 1,indent: 15, endIndent: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => BranchPage(branch: list[7])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/maxway_purple.png',width: 60,height: 60,),
                                const SizedBox(width: 10,),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(list[7].name,
                                      style: const TextStyle(
                                        fontSize: 15, ),
                                    ),
                                    Text(list[7].destination,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                )),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5,)
                              ],
                            ),
                          ),
                        ),
                        const Divider(height: 1,indent: 15, endIndent: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => BranchPage(branch: list[8])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/maxway_purple.png',width: 60,height: 60,),
                                const SizedBox(width: 10,),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(list[8].name,
                                      style: const TextStyle(
                                        fontSize: 15, ),
                                    ),
                                    Text(list[8].destination,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                )),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5,)
                              ],
                            ),
                          ),
                        ),
                        const Divider(height: 1,indent: 15, endIndent: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => BranchPage(branch: list[9])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/maxway_purple.png',width: 60,height: 60,),
                                const SizedBox(width: 10,),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(list[9].name,
                                      style: const TextStyle(
                                        fontSize: 15, ),
                                    ),
                                    Text(list[9].destination,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                )),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5,)
                              ],
                            ),
                          ),
                        ),
                        const Divider(height: 1,indent: 15, endIndent: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => BranchPage(branch: list[10])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/maxway_purple.png',width: 60,height: 60,),
                                const SizedBox(width: 10,),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(list[10].name,
                                      style: const TextStyle(
                                        fontSize: 15, ),
                                    ),
                                    Text(list[10].destination,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                )),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5,)
                              ],
                            ),
                          ),
                        ),
                        const Divider(height: 1,indent: 15, endIndent: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => BranchPage(branch: list[11])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/maxway_purple.png',width: 60,height: 60,),
                                const SizedBox(width: 10,),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(list[11].name,
                                      style: const TextStyle(
                                        fontSize: 15, ),
                                    ),
                                    Text(list[11].destination,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                )),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5,)
                              ],
                            ),
                          ),
                        ),
                        const Divider(height: 1,indent: 15, endIndent: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => BranchPage(branch: list[12])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/maxway_purple.png',width: 60,height: 60,),
                                const SizedBox(width: 10,),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(list[12].name,
                                      style: const TextStyle(
                                        fontSize: 15, ),
                                    ),
                                    Text(list[12].destination,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                )),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5,)
                              ],
                            ),
                          ),
                        ),
                        const Divider(height: 1,indent: 15, endIndent: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => BranchPage(branch: list[13])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/maxway_purple.png',width: 60,height: 60,),
                                const SizedBox(width: 10,),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(list[13].name,
                                      style: const TextStyle(
                                        fontSize: 15, ),
                                    ),
                                    Text(list[13].destination,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                )),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5,)
                              ],
                            ),
                          ),
                        ),
                        const Divider(height: 1,indent: 15, endIndent: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => BranchPage(branch: list[14])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/maxway_purple.png',width: 60,height: 60,),
                                const SizedBox(width: 10,),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(list[13].name,
                                      style: const TextStyle(
                                        fontSize: 15, ),
                                    ),
                                    Text(list[13].destination,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                )),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5,)
                              ],
                            ),
                          ),
                        ),
                        const Divider(height: 1,indent: 15, endIndent: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => BranchPage(branch: list[15])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/maxway_purple.png',width: 60,height: 60,),
                                const SizedBox(width: 10,),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(list[15].name,
                                      style: const TextStyle(
                                        fontSize: 15, ),
                                    ),
                                    Text(list[15].destination,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                )),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5,)
                              ],
                            ),
                          ),
                        ),
                        const Divider(height: 1,indent: 15, endIndent: 15,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) => BranchPage(branch: list[16])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/maxway_purple.png',width: 60,height: 60,),
                                const SizedBox(width: 10,),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(list[16].name,
                                      style: const TextStyle(
                                        fontSize: 15, ),
                                    ),
                                    Text(list[16].destination,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey[600]),
                                    ),
                                  ],
                                )),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 5,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }catch(e){
                return Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const Icon(Icons.error, color: Colors.red,size: 40),
                     Text('$e')
                    ],
                  ),
                );
              }
            }
          ),
        );
      },
    );
  }
}
