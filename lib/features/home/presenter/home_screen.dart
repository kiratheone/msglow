import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:msglow/component/app_const.dart';
import 'package:msglow/component/app_route.dart';
import 'package:msglow/component/widget/app_style.dart';
import 'package:msglow/component/widget/product_item/product_type_1.dart';
import 'package:msglow/component/widget/product_item/product_type_2.dart';

class HomeScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalScaffoldKey;

  const HomeScreen({Key key, this.globalScaffoldKey}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];


class _HomeScreenState extends State<HomeScreen> {

  int _current = 0;
  final List<Widget> imageSliders = imgList.map((item) => Container(
    width: double.infinity,
    child: Image.network(item, fit: BoxFit.fitWidth),
  )).toList();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _header(),
          _banner(),
          _bannerInfo(),
          _productMenu(),
          _productList1(),
          _productList2(),
          _bannerRecommendation(),
          _productList3()
        ],
      ),
    );
  }

  Widget _itemBanner() => Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.map((url) {
            int index = imgList.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? AppStyle.primaryDark
                    : Colors.grey[350],
              ),
            );
          }).toList(),
        ),
      ]
  );

  SliverToBoxAdapter _banner() => SliverToBoxAdapter(
    child: _itemBanner(),
  );

  SliverToBoxAdapter _bannerInfo() => SliverToBoxAdapter(
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 24),
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      color: AppStyle.backgroundGray,
      child: Text("Waspada Penipuan & Produk Palsu", style: AppStyle.texStyle16(textColor: AppStyle.textColor4),),
    ),
  );

  SliverToBoxAdapter _productMenu() => SliverToBoxAdapter(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text("Produk Terbaru", style: AppStyle.texStyle16Bold(textColor: AppStyle.textColor2)),
          Spacer(),
          Text("See More", style: AppStyle.texStyle16Bold(textColor: AppStyle.primary)),
        ],
      ),
    ),
  );

  SliverToBoxAdapter _productList1() {
    double currentWidth = MediaQuery.of(context).size.width / 2.2;
    return SliverToBoxAdapter(
      child: Container(
        height: currentWidth * 16 / 9,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ProductType1(
                width: currentWidth,
                title: "Product lasjdlasjdlask jdlajdlasjdlkasjd",
                imgUrl: AppConst.dummyImage,
                price: "60000",
                isDiscount: true,
                discountPercent: "40",
                discountPrice: "30000",
              ),
            );
          },
        ),
      ),
    );
  }

  SliverToBoxAdapter _productList2() {
    double currentWidth = MediaQuery.of(context).size.width / 2.2;
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 16),
        height: currentWidth * 14.5 / 9,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ProductType1(
                width: currentWidth,
                title: "Product lasjdlasjdlask jdlajdlasjdlkasjd",
                imgUrl: AppConst.dummyImage,
                price: "60000",
                isDiscount: false,
                discountPercent: "40",
                discountPrice: "30000",
              ),
            );
          },
        ),
      ),
    );
  }

  SliverToBoxAdapter _productList3() {
    double currentWidth = MediaQuery.of(context).size.width / 2 - 6;
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 16),
        height: currentWidth * 15 / 9,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index){
            return ProductType2(
              width: currentWidth,
              title: "Product lasjdlasjdlask jdlajdlasjdlkasjd",
              imgUrl: AppConst.dummyImage,
              price: "60000",
              isDiscount: true,
              discountPercent: "40",
              discountPrice: "30000",
            );
          },
        ),
      ),
    );
  }

  SliverToBoxAdapter _bannerRecommendation() => SliverToBoxAdapter(
    child: Container(
      margin: EdgeInsets.only(left: 12, right: 12, top: 48, bottom: 16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect (
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: AppConst.dummyImage,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    ),
  );

  Widget _header() => SliverAppBar(
    floating: true,
    centerTitle: true,
    leading: IconButton(
      onPressed: () => widget.globalScaffoldKey.currentState.openDrawer(),
      icon: Icon(Icons.menu),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/img/img_logo.png", width: 30, height: 30),
        Text("Oryza MS Glow", style: AppStyle.texStyle18Bold(textColor: Colors.white))
      ],
    ),

    actions: [
      IconButton(
        icon: const Icon(Icons.search),
        tooltip: 'Search',
        onPressed: () => Navigator.pushNamed(context, AppRoute.searchScreen),
      )
    ],
  );
}

