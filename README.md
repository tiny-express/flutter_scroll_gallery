# flutter_scroll_gallery

A Flutter package that helps you to create a zoomable carousel with scrollable thumbnail at the bottom

Inspired from [flutter_image_carousel](https://github.com/theobouwman/flutter_image_carousel) and [ScrollGalleryView](https://github.com/VEINHORN/ScrollGalleryView)

## Installing

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_scroll_gallery: ^0.1.0
```

```dart
import 'package:flutter_scroll_gallery/flutter_scroll_gallery.dart';
```

## Usage

```dart
new ScrollGallery(
  <ImageProvider>[
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
  interval: new Duration(seconds: 3),)
);
```

To disable auto-play, do not set the **interval**

## Showcase

![Showcase](showcase.gif)