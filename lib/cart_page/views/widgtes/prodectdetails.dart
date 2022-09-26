import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sunruleapp/app/data/prodect_model.dart';
import 'package:sunruleapp/cart_page/views/widgtes/sizeshowbutton.dart';

class Prodectdeatils extends StatelessWidget {
  Prodectdeatils({required this.prodectmodel});

  final Prodectmodel prodectmodel;

  String value = '60';
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 4,
      child: Container(
        width: 300.w,
        height: 120.h,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 15.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                prodectmodel.brand!,
                style: TextStyle(fontSize: 14.h, fontWeight: FontWeight.bold),
              ),
              Text(
                prodectmodel.name!,
                style: TextStyle(fontSize: 10.h),
              ),
              Row(
                children: [
                  Text(
                    prodectmodel.price!.toString(),
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 13.h,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "${value}% Off",
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 13.h,
                          color: Colors.green),
                    ),
                  )
                ],
              ),
              Text(
                "You save \$500.00",
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 12.h,
                    color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}
