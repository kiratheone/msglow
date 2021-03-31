import 'package:flutter/material.dart';
import 'package:msglow/component/widget/app_style.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _content(),
    );
  }

  Widget _content() => Column(
    children: [
      SizedBox(height: 8),
      _searchBar()
    ],
  );

  Widget _searchBar() => SafeArea(
    child: Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: AppStyle.primary),
        ),
        Expanded(
          child: _textInputSearch(),
        ),
        SizedBox(width : 8),

      ],
    ),
  );

  Widget _textInputSearch() => TextField(
    controller: _searchController,
    obscureText: true,
    autocorrect: true,
    decoration: AppStyle.textInputDecorator(
        enableBorderColor: AppStyle.primary[300],
        focusBorderColor: AppStyle.primary,
        hint: "Search",
        icon: Icon(Icons.search, size: 20),
        iconSuffix: InkWell(
            child: Icon(Icons.close, size: 20),
            onTap: () => _searchController.clear()
        ),
    ),
  );
}
