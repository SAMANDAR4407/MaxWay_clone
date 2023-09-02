
import 'package:demo_max_way/pages/base/base_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/pref.dart';
import '../../../utils/utils.dart';
import 'account_manage.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final pref = PrefHelper();
  String name = '';
  String phone = '';
  String date = '';

  final nameController = TextEditingController();
  final nameNode = FocusNode();
  final phoneController = TextEditingController();
  final phoneNode = FocusNode();
  final dateController = TextEditingController();
  final dateNode = FocusNode();

  Future<void> load() async {
    final user = (await pref.getUserData()).split('#');
    name = user[0];
    phone = user[1];
    date = user[2];
    setState(() {});
  }

  @override
  void initState() {
    load().then((value) {
      nameController.text = name;
      phoneController.text = phone;
      dateController.text = date;
    });
    nameController.addListener(() {
      name = nameController.text;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Profilni tahrirlash",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              height: 320,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Ism"),
                  const SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.only(left: 12, bottom: 4, top: 4),
                    decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: nameController,
                        focusNode: nameNode,
                        onTapOutside: (event) {
                          nameNode.unfocus();
                          setState(() {});
                        },
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Ismingizni kiriting',
                          hintStyle: TextStyle(
                              fontSize: 14
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Telefon raqami"),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 12, bottom: 4, top: 4),
                    decoration: BoxDecoration(color: Colors.grey[100], borderRadius: const BorderRadius.all(Radius.circular(10))),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: phoneController,
                        readOnly: true,
                        onTapOutside: (event) {
                          phoneNode.unfocus();
                          setState(() {});
                        },
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Tug'ilgan sana"),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 12, bottom: 4, top: 4),
                    decoration: BoxDecoration(color: Colors.grey[100], borderRadius: const BorderRadius.all(Radius.circular(10))),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        readOnly: true,
                        onTap: () {
                          _openBottomSheet(context);
                        },
                        controller: dateController,
                        focusNode: dateNode,
                        onTapOutside: (event) {
                          dateNode.unfocus();
                          setState(() {});
                        },
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Tug\'ilgan kuningizni kiriting',
                            hintStyle: const TextStyle(
                              fontSize: 14
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset('assets/images/calendar.svg'),
                            )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => const AccountManagement()));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    "Shaxsiy hisobni boshqarish",
                    style: TextStyle(color: Color(0xff51267D),fontSize: 12),
                  ),
                )),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Material(
              clipBehavior: Clip.antiAlias,
              color: const Color(0xff51267D),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  if(nameController.text.isEmpty) {
                    showToast(['Ismingizni kiriting!'], context,gravity: ToastGravity.BOTTOM, color: Colors.red);
                  } else {
                    pref.setUserData(name, phone, dateController.text);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HostPage()));
                  }
                },
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.065,
                  child: const Center(child: Text(
                    'Tasdiqlang',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _updateData(String newData) {
    setState(() {
      dateController.text = newData;
    });
  }

  void _openBottomSheet(BuildContext context) async {
    String newData = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const WidgetPage();
      },
    );
    _updateData(newData);
  }
}

class WidgetPage extends StatefulWidget {
  @override
  State<WidgetPage> createState() => _WidgetPageState();

  const WidgetPage({super.key});
}

class _WidgetPageState extends State<WidgetPage> {
  var _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)), color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
            child: Text(
              "Tug'ilgan kuningiz",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          const SizedBox(height: 5),
          const Divider(height: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DatePickerWidget(
              looping: false,
              initialDate: DateTime.now(),
              firstDate: DateTime(1930),
              lastDate: DateTime(2023),
              dateFormat: "dd/MMMM/yyyy",
              onChange: (DateTime newDate, _) {
                setState(() {
                  _selectedDate = newDate;
                });
              },
              pickerTheme: const DateTimePickerTheme(
                // cancel: TextButton(onPressed: _button, child: Text("Cancel")),
                itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
                dividerColor: Colors.blueAccent,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Material(
              clipBehavior: Clip.antiAlias,
              color: const Color(0xff51267D),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop("${_selectedDate.day<10 ? "0${_selectedDate.day}":_selectedDate.day}.${_selectedDate.month<10 ? "0${_selectedDate.month}":_selectedDate.month}.${_selectedDate.year}");
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: const Center(child: Text(
                    'Tasdiqlang',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
