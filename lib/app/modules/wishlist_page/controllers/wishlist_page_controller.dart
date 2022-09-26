import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunruleapp/app/data/prodect_model.dart';
import 'package:sunruleapp/constLoginc/views/const_view.dart';

class WishlistPageController extends GetxController {
  final data = FirebaseFirestore.instance.collection("prodects");
  RangeValues currentRangeValues = const RangeValues(40, 80);
  String shirt = "";
  String tshirt = "";
  String janse = "";

  int size = 0;

  Stream<List<Prodectmodel>> getalldata() => FirebaseFirestore.instance
          .collection("prodects")
          .snapshots()
          .map((event) {
        return event.docs.map((e) {
          return Prodectmodel.fromJson(e.data());
        }).toList();
      });

  getda() =>
      FirebaseFirestore.instance.collection("cart").snapshots().map((event) =>
          event.docs.map((e) => Prodectmodel.fromJson(e.data())).toList());

  Future addcart(Prodectmodel prodectmodel) async {
    Stream<List<Prodectmodel>> list;
    int flage = 0;
    list = await getda();
    final data = await list.first;
    for (var i = 0; i < data.length; i++) {
      if (data[i].id == prodectmodel.id) {
        flage = 1;
        break;
      }
    }
    if (flage == 0) {
      await FirebaseFirestore.instance
          .collection("cart")
          .doc()
          .set(prodectmodel.toJson());
    } else {
      fluttertoast("Aldrady Added");
    }
  }
}
