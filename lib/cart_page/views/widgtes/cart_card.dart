import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunruleapp/app/data/prodect_model.dart';
import 'package:sunruleapp/cart_page/views/widgtes/prodectdetails.dart';

class Cartcard extends StatelessWidget {
  Cartcard({Key? key, required this.prodectmodel}) : super(key: key);

  final Prodectmodel prodectmodel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 12.h, left: 20.h, right: 20.h, bottom: 20.h),
      child: Card(
        elevation: 8,
        child: Container(
          color: Colors.white.withOpacity(0.9),
          width: MediaQuery.of(context).size.width,
          height: 190.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.all(12.0.r),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.r),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          width: 150.w,
                          height: 120.h,
                          child: Image.network(
                            prodectmodel.image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Prodectdeatils(prodectmodel: prodectmodel),
                ],
              ),
              Center(child: TextButton(onPressed: () {}, child: Text("Remove")))
            ],
          ),
        ),
      ),
    );
  }
}
