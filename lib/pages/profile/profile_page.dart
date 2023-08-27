import 'package:demo_max_way/core/pref.dart';
import 'package:demo_max_way/pages/branch_page/branch_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final pref = PrefHelper();
  String name = '';
  String phone = '';

  Future<void> load() async {
    final user = (await pref.getUserData()).split('#');
    name = user[0];
    phone = user[1];
    setState(() {});
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: const Color(0xFFF6F6F6),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        phone,
                        style: TextStyle(fontSize: 17, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit_rounded,
                        size: 20,
                        color: Colors.grey[600],
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.placemark,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            'Mening manzillarim',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    indent: 15,
                    endIndent: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => const BranchListPage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.map_pin_ellipse,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            'Filiallar',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    indent: 15,
                    endIndent: 15,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings_outlined,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            'Sozlamalar',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    indent: 15,
                    endIndent: 15,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            'Xizmat haqida',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          )),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            const Text(
              'Versiyasi 1.0',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
