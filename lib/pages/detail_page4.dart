import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../model/tate_modern.dart';
import 'ar_page2.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'collect_page.dart';
import 'detail_page3.dart';

class DetailsScreen extends StatelessWidget {
  final Collection4 collection4;
  const DetailsScreen({Key?key, required this.collection4}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: buildAppBar(context),
      body:Body(
        collection4: collection4,
      ),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      padding: EdgeInsets.only(left: 20),
      icon: SvgPicture.asset("images/back.svg"),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    centerTitle: false,
    title: Text(
      'Back'.toUpperCase(),
      style: Theme.of(context).textTheme.bodyText2,
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset('assets/icons/cart_with_item.svg'),
        onPressed: () {},
      ),
    ],
  );
}

class Body extends StatelessWidget {
  final Collection4 collection4;
  const Body({Key?key, required this.collection4}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      bottom:false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child:Hero(
                      tag: collection4.name,
                      child: CollectionPoster(
                        size: size,
                        image: collection4.image,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      collection4.name,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Text(
                    collection4.date,
                    style:const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black45,
                    ),
                  ),
                  Text(
                    collection4.author,
                    style:const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black45,
                    ),
                  ),
                  Text(
                    collection4.type,
                    style:const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black45,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      collection4.description,
                      style:const TextStyle(
                        color:Colors.black45,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(height:20.0),
                ],
              ),
            ),
            const SizedBox(height:30),
            ARSceneButton(image:collection4.image),
          ],
        ),
      ),
    );
  }
}

class CollectionPoster extends StatelessWidget {
  const CollectionPoster({
    Key?key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String image;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      // the height of this container is 80% of our width
      height: size.width * 0.8,

      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: size.width * 0.7,
            width: size.width * 0.7,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Image.network(
            image,
            height: size.width,
            width: size.width,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}

class ARSceneButton extends ConsumerWidget {
  const ARSceneButton({
    Key? key,
    required this.image
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),

        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: <Widget>[
          const Spacer(),
          Image.asset(
            "images/AR.png",
            height: 20,
          ),
          const SizedBox(width: 10,),
          TextButton.icon(
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ARPage(image:image)));
            },
            icon: SvgPicture.asset(
              "",
              height: 18,
            ),
            label: const Text(
              'AR scene',
              style: TextStyle(
                color:Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}