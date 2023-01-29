import 'package:flutter/material.dart';
import '../widget/category_card2.dart';
import '../model/VA.dart';

class Body2 extends StatelessWidget {
  final list=collections2.shuffle();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Expanded(
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top:70),
                      decoration: const BoxDecoration(
                        color:Color(0xFFF1EFF1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: collections2.length,
                      itemBuilder: (context, index) => CategoryCard(
                          itemIndex: index,
                          collection2:collections2[index],
                          press: (){}
                      ),
                    )
                  ],
                )
            )
          ],
        )
    );
  }
}