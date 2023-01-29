import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test3/pages/detail_page3.dart';
import 'login_page.dart';
import 'collection_AR_page.dart';

class CollectPage extends ConsumerWidget {
  const CollectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.watch(collectImages);
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Collection'),
        backgroundColor:Colors.orange,
      ),
      body: Stack(
        children:[
          GridView.builder(itemBuilder: (_,i){
        final item = images[i];
        return Image.network('$item',width: 200,height: 200,fit: BoxFit.cover,);
      },
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 20,
          vertical: 20,
        ),
      ),
          const LoginBtnIconWidget(image: '',),
    ]
    ));
  }
}

class LoginBtnIconWidget extends StatelessWidget {
  const LoginBtnIconWidget({
    Key?key,
    required this.image
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        GradientBtnWidget(
          height:48,
          width: 160,
          child: Row(
            children: [
              const SizedBox(width: 34),
              const BtnTextWhiteWidget(
                text: 'AR Scene',
              ),
              const Spacer(),
              Image.asset(
                "images/AR.png",
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 24),
            ],
          ),
          onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CollectionARPage(image:image)));
        },
        )
      ],
    );
  }
}