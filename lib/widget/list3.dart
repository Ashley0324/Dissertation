import 'package:flutter/material.dart';
import '../widget/category_card3.dart';
import '../model/NHM.dart';

class Body3 extends StatelessWidget {
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
                      itemCount: collections3.length,
                      itemBuilder: (context, index) => CategoryCard(
                          itemIndex: index,
                          collection3:collections3[index],
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