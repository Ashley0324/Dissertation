import 'package:flutter/material.dart';
import '../widget/category_card4.dart';
import '../model/tate_modern.dart';

class Body4 extends StatelessWidget {
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
                      itemCount: collections4.length,
                      itemBuilder: (context, index) => CategoryCard(
                          itemIndex: index,
                          collection4:collections4[index],
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