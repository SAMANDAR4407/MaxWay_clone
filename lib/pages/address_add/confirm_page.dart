import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmPage extends StatefulWidget {
  final String pinnedLocation;
  const ConfirmPage({super.key, required this.pinnedLocation});

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {

  final nameController = TextEditingController();
  final apartmentController = TextEditingController();
  final floorController = TextEditingController();
  final entranceController = TextEditingController();
  final nameNode = FocusNode();
  final apartmentNode = FocusNode();
  final entranceNode = FocusNode();
  final floorNode = FocusNode();

  var name = '';
  var apartment = '';
  var entrance = '';
  var floor = '';

  @override
  void initState() {
    nameController.addListener(() {
      name = nameController.text;
    });
    apartmentController.addListener(() {
      apartment = apartmentController.text;
    });
    entranceController.addListener(() {
      entrance = entranceController.text;
    });
    floorController.addListener(() {
      floor = floorController.text;
    });
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAEAEA),
      appBar: AppBar(
        title: const Text('Yetkazib berish manzili', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 16, horizontal: 12),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.all(Radius.circular(10))),
              child:  Row(
                children: [
                  const Icon(
                      CupertinoIcons.paperplane,
                      size: 25
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: Text(
                      widget.pinnedLocation,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.only(left: 12,bottom: 4, top: 4),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.all(Radius.circular(10))),
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
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: 'manzil',
                    hintStyle: const TextStyle(
                      color: Color(0xFFC4C4C4),
                      fontSize: 14,
                    ),
                    suffixIcon: nameController.text.isNotEmpty
                        ? InkWell(
                        onTap: () => nameController.text = '',
                        child: const Icon(Icons.close,
                            color: Color(0xFFAFAFAF)))
                        : null,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(child: Container(
                    padding: const EdgeInsets.only(left: 12,bottom: 4, top: 4),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: apartmentController,
                        focusNode: apartmentNode,
                        onTapOutside: (event) {
                          apartmentNode.unfocus();
                          setState(() {});
                        },
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'xonadon',
                          hintStyle: const TextStyle(
                            color: Color(0xFFC4C4C4),
                            fontSize: 14,
                          ),
                          suffixIcon: apartmentController.text.isNotEmpty
                              ? InkWell(
                              onTap: () => apartmentController.text = '',
                              child: const Icon(Icons.close,
                                  color: Color(0xFFAFAFAF)))
                              : null,
                        ),
                      ),
                    ),
                  ),),
                  const SizedBox(width: 12,),
                  Expanded(child: Container(
                    padding: const EdgeInsets.only(left: 12,bottom: 4, top: 4),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: entranceController,
                        focusNode: entranceNode,
                        onTapOutside: (event) {
                          entranceNode.unfocus();
                          setState(() {});
                        },
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'kirish',
                          hintStyle: const TextStyle(
                            color: Color(0xFFC4C4C4),
                            fontSize: 14,
                          ),
                          suffixIcon: entranceController.text.isNotEmpty
                              ? InkWell(
                              onTap: () => entranceController.text = '',
                              child: const Icon(Icons.close,
                                  color: Color(0xFFAFAFAF)))
                              : null,
                        ),
                      ),
                    ),
                  ),),
                  const SizedBox(width: 12,),
                  Expanded(child: Container(
                    padding: const EdgeInsets.only(left: 12,bottom: 4, top: 4),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10))),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: floorController,
                        focusNode: floorNode,
                        onTapOutside: (event) {
                          floorNode.unfocus();
                          setState(() {});
                        },
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'qavat',
                          hintStyle: const TextStyle(
                            color: Color(0xFFC4C4C4),
                            fontSize: 14,
                          ),
                          suffixIcon: floorController.text.isNotEmpty
                              ? InkWell(
                              onTap: () => floorController.text = '',
                              child: const Icon(Icons.close,
                                  color: Color(0xFFAFAFAF)))
                              : null,
                        ),
                      ),
                    ),
                  ),),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                if(nameController.text.isEmpty) return;
                if(apartmentController.text.isEmpty) return;
                if(entranceController.text.isEmpty) return;
                if(floorController.text.isEmpty) return;
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    vertical: 16, horizontal: 16),
                decoration: const BoxDecoration(
                    color: Color(0xff51267D),
                    borderRadius:
                    BorderRadius.all(Radius.circular(10))),
                child: const Text(
                  'Manzilni qo\'shish',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white,fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}