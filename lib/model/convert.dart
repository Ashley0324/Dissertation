import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: const <Widget>[
        ListTile(title: Text('Drawings')),
        ListTile(title: Text('Photographs')),
        ListTile(title: Text('Textiles')),
        ListTile(title: Text('Portraits')),
        ListTile(title: Text('Architecture')),
        ListTile(title: Text('Paintings')),
        ListTile(title: Text('Porcelain')),
        ListTile(title: Text('Sculpture')),
      ],
    );
  }

  @override
  TextInputType get keyboardType => TextInputType.text;

  Future _fetchPosts() async {
    http.Response response =
    await http.get(Uri.parse('https://api.vam.ac.uk/v2/objects/search?q=$query&id_place=x28980&images_exist=1'));
    final data = await json.decode(response.body);
    return data;
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: _fetchPosts(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final post = snapshot.data;
          return ListTile(
            title: Text(post["_primaryTitle"], maxLines: 4),
            subtitle: Text(post["_primaryDate"], maxLines: 6),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}