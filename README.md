# flutter_scroll_gallery

A Flutter package that help you to create Image carousels with scroll thumbnail in bottom

Inspired from [flutter_image_carousel](https://github.com/theobouwman/flutter_image_carousel) and [ScrollGalleryView](https://github.com/VEINHORN/ScrollGalleryView)

## Installing

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_scroll_gallery: ^0.0.1
```

```dart
import 'package:flutter_scroll_gallery/flutter_scroll_gallery.dart';
```

## Usage

```dart
new ScrollGallery(<ImageProvider>[
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

To disable auto-play, dont set **interval**

## Showcase

![Showcase](showcase.gif)