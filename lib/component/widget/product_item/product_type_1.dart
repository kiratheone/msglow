import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:msglow/component/widget/app_style.dart';
import 'package:msglow/component/extension/string.dart';

class ProductType1 extends StatelessWidget {

  final String imgUrl;
  final String title;
  final String price;
  final String discountPrice;
  final String discountPercent;
  final bool isDiscount;
  final double width;

  const ProductType1({Key key, this.imgUrl, this.title, this.price, this.discountPrice = "0", this.discountPercent = "0", this.isDiscount = false, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imgProduct(),
            _titleProduct(),
            _priceProduct(),
            _discountProduct()
          ],
        ),
      ),
    );
  }

  Widget _imgProduct() => Stack(
    children: [
      AspectRatio(
        aspectRatio: 1 / 1,
        child: ClipRRect (
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          child: CachedNetworkImage(
            imageUrl: imgUrl,
          ),
        ),
      ),
      Positioned(
        right: 0,
        top: 12,
        child: Builder(
          builder: (context){
            if(!isDiscount) return Container();

            return Container(
              decoration: BoxDecoration(
                  color: AppStyle.backgroundRed,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))
              ),
              padding: EdgeInsets.all(8),
              child: Text("- $discountPercent%", style: AppStyle.texStyle16(textColor: Colors.white)),
            );
          },
        ),
      )
    ],
  );

  Widget _titleProduct() => Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    color: AppStyle.primary,
    child: Text(title, style: AppStyle.texStyle14Bold(textColor: Colors.white), maxLines: 2, overflow: TextOverflow.ellipsis,),
  );

  Widget _priceProduct() => Container(
    padding: EdgeInsets.all(8),
    child: Text(price.toRupiah(), style: AppStyle.texStyle14Bold(textColor: AppStyle.primary)),
  );

  Widget _discountProduct() => Container(

    padding: EdgeInsets.all(8),
    child: Builder(
      builder: (context){
        if(!isDiscount){
          return Container();
        }

        return Row(
          children: [
            Text(discountPrice.toRupiah(), style: AppStyle
                .texStyle14(textColor: AppStyle.textColor)
                .copyWith(decoration: TextDecoration.lineThrough)
            ),
            SizedBox(width: 4),
            Text("$discountPercent% Off", style: AppStyle.texStyle14Bold(textColor: AppStyle.primary),)
          ],
        );
      },
    ),
  );
}
