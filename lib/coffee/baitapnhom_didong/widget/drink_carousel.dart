import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrinkCarousel extends StatefulWidget {
  @override
  State<DrinkCarousel> createState() => _DrinkCarouselState();
}

class _DrinkCarouselState extends State<DrinkCarousel> {
  PageController pageController = PageController(viewportFraction: 0.9 );

  int imagesPos = 0;
  List<String> images = [
    "https://ongbi.vn/wp-content/uploads/2022/09/CA-PHE-MUOI.jpg",
    "https://bizweb.dktcdn.net/thumb/grande/100/004/714/articles/ca-phe-da.png?v=1586258829727",
    "https://chefjob.vn/wp-content/uploads/2020/07/cappuccino-cafe-cua-y.jpg",
    "https://media.istockphoto.com/photos/cappuccino-with-coffee-beans-picture-id523167980?k=6&m=523167980&s=612x612&w=0&h=M3haXBG2oinWVAFrIqKn4XcgTPWygjVAmFn-0GZEdFM=",
    "https://icdn.dantri.com.vn/thumb_w/640/2021/02/10/ca-phe-muoi-la-mieng-o-hue-thuc-khach-muon-thuong-thuc-phai-kien-nhan-chodocx-1612964716831.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
     child: CarouselSlider.builder(
        options: CarouselOptions(
        enlargeFactor: 2,
        enlargeCenterPage: true,
        autoPlay: true,
        viewportFraction: 1,
        aspectRatio: 2.0,
        initialPage: imagesPos,
        onPageChanged: (index, reason){
        setState(() {
          imagesPos = index;
        });
        }
        ),
        itemCount: images.length,
        itemBuilder: (context, index, realIndex) =>
          Container(
            child: Image.network(images[index]),
          ),
     ),
    );
  }

}
