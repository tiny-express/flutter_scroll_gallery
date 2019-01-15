import 'package:flutter/material.dart';
import 'package:flutter_scroll_gallery/flutter_scroll_gallery.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyImageGallery(),
    );
  }
}

class MyImageGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter Scroll Gallery"),
      ),
      body: new ScrollGallery(<ImageProvider>[
        new NetworkImage("https://flutter.io/images/homepage/header-illustration.png"),
        new NetworkImage("https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg"),
        new NetworkImage("https://cdn-images-1.medium.com/max/1219/1*TFZQzyVAHLVXI_wNreokGA.png"),
        new NetworkImage("https://cdn-images-1.medium.com/max/744/1*L2IaQThqx4lzz3G1m-e07Q.png"),
        // new NetworkImage("https://flutter.io/images/homepage/header-illustration.png"),
        // new NetworkImage("https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg"),
        // new NetworkImage("https://cdn-images-1.medium.com/max/1219/1*TFZQzyVAHLVXI_wNreokGA.png"),
        // new NetworkImage("https://cdn-images-1.medium.com/max/744/1*L2IaQThqx4lzz3G1m-e07Q.png"),
        // new NetworkImage("https://flutter.io/images/homepage/header-illustration.png"),
        // new NetworkImage("https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg"),
        // new NetworkImage("https://cdn-images-1.medium.com/max/1219/1*TFZQzyVAHLVXI_wNreokGA.png"),
        // new NetworkImage("https://cdn-images-1.medium.com/max/744/1*L2IaQThqx4lzz3G1m-e07Q.png")
      ],
      interval: new Duration(seconds: 3),
      backgroundColor: Colors.blue,
      initialIndex: 2,
      onPageChange: (index) {
        print(index);
      },)
    );
  }
}
