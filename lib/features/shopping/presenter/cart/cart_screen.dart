import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:msglow/component/app_const.dart';
import 'package:msglow/component/widget/app_style.dart';
import 'package:msglow/component/widget/cart_counter.dart';
import 'package:msglow/component/widget/msglow_app_bar.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  List<int> _cartCounter = [0,0,0,0,0,0,0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MsGlowAppBar(
        title: "Keranjang",
        automaticallyImplyLeading: false,
      ),
      body: _body(),
    );
  }

  Widget _body() => SingleChildScrollView(
    child: Column(
      children: [
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(16),
          shrinkWrap: true,
          itemCount: 7,
          itemBuilder: (context, index){
            return _itemCart(
              index: index,
              imgUrl: AppConst.dummyImage,
              itemName: "Gamping",
              itemPrice: "Rp 700.000",
              onDelete: (){},
            );
          },
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: Divider(height: 1, color: Colors.black,),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text("Total Price", style: AppStyle.texStyle14Bold()),
              Spacer(),
              Text("Rp 1.118.000", style: AppStyle.texStyle14Bold(textColor: AppStyle.primary)),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: AppPrimaryButton(
            title: "Check Out",
            onPressed: (){ },
          ),
        )
      ],
    ),
  );

  Widget _itemCart({String itemName, String itemPrice, String imgUrl, VoidCallback onDelete, int index}){
    return Card(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: CachedNetworkImage(
                      imageUrl: imgUrl,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(itemName, style: AppStyle.texStyle14Bold(textColor: AppStyle.textColor2)),
                    SizedBox(height: 16),
                    Text(itemPrice, style: AppStyle.texStyle14Bold(textColor: AppStyle.primary))
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 4,
            right: 0,
            child: IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.delete_outline_outlined, color: Colors.grey,),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: CartCounter(
              initialValue: _cartCounter[index],
              minValue: 0,
              maxValue: 99,
              onChanged: (value){
                setState(() {
                  _cartCounter[index]= value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }


}
