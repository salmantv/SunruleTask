import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sunruleapp/app/data/prodect_model.dart';

class CartPageController extends GetxController {
  Stream<List<Prodectmodel>> cartdata() =>
      FirebaseFirestore.instance.collection("cart").snapshots().map((event) =>
          event.docs.map((e) => Prodectmodel.fromJson(e.data())).toList());
  int cartprodect = 0;
  int totelpyment = 0;

  void cartprodectlength(int length) {
    this.cartprodect = length;
  }

  paymentlogic(List<Prodectmodel> data) {
    totelpyment = 0;
    for (var i = 0; i < data.length; i++) {
      totelpyment += data[i].price!;
    }
    update();
  }

  void delet() async {
    await FirebaseFirestore.instance.collection('products').doc().delete();
  }
}
