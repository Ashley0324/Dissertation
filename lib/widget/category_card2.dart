import 'package:flutter/material.dart';
import 'package:test3/pages/details_page2.dart';
import '../model/VA.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key?key,
    required this.itemIndex,
    required this.collection2,
    required this.press
  }) : super(key: key);
  final int itemIndex;
  final Collection2 collection2;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      height: 160,
      child: InkWell(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              GestureDetector(
                onTap:(){
                  Navigator.push(context,MaterialPageRoute(builder: (_){
                    return DetailsScreen(collection2: collection2);
                  }));
                },),
              Container(
                height: 136,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: itemIndex.isEven ? Colors.blue: Colors.orangeAccent,
                  boxShadow: const [kDefaultShadow],
                ),
                child: Container(
                  margin: const EdgeInsets.only(right:10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),),),
              Positioned(
                  top:0,
                  right: 0,
                  child: Hero(
                      tag:collection2.name,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          height:160,
                          width:200,
                          child:Image.network(
                            collection2.image,
                            fit:BoxFit.fitWidth,
                          )
                      )
                  )
              ),
              Positioned(
                  bottom:0,
                  left:0,
                  child: SizedBox(
                    height:136,
                    width: size.width - 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0
                          ),
                          child: Text(
                            collection2.name,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0
                          ),
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DetailsScreen(collection2: collection2)),
                              );
                            },
                            child: const Text(
                              'Read more >>',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline,
                                color:Colors.orange,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30.0,
                            vertical: 5,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(22),
                              topRight: Radius.circular(22),
                            ),
                          ),
                          child: Text(
                            collection2.location,
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ],
          )
      ),
    );
  }
}

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);