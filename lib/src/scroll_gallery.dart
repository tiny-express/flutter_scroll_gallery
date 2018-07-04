import 'package:flutter/material.dart';
import 'dart:async';

class ScrollGallery extends StatefulWidget {
  final double height;
  final double thumbnailSize;
  final List<ImageProvider> imageProviders;
  final BoxFit fit;
  final Duration interval;
  final Color borderColor;

  ScrollGallery(this.imageProviders,
      {this.height,
      this.thumbnailSize,
      this.fit,
      this.interval,
      this.borderColor});

  @override
  _ScrollGalleryState createState() => _ScrollGalleryState();
}

class _ScrollGalleryState extends State<ScrollGallery>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;
  PageController _pageController;
  Timer _timer;
  int _currentIndex = 0;
  bool _reverse = false;

  @override
  void initState() {
    if (widget.interval != null) {
      _timer = new Timer.periodic(widget.interval, (_) {
        if (_currentIndex == widget.imageProviders.length - 1) {
          _reverse = true;
        }
        if (_currentIndex == 0) {
          _reverse = false;
        }

        if (_reverse) {
          _pageController.previousPage(
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        } else {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        }
      });
    }

    _scrollController = new ScrollController();
    _pageController = new PageController();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController?.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
      double itemSize =
          (widget.thumbnailSize != null ? widget.thumbnailSize : 48.0) + 8.0;
      _scrollController.animateTo(itemSize * index / 2,
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    });
  }

  Widget _buildImagePageView() {
    return Expanded(
        child: new PageView(
      onPageChanged: _onPageChanged,
      controller: _pageController,
      children: widget.imageProviders.map((image) {
        return new Image(
          fit: widget.fit != null ? widget.fit : null,
          image: image,
        );
      }).toList(),
    ));
  }

  void _selectImage(int index) {
    setState(() {
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  Widget _buildImageThumbnail() {
    var _thumbnailSize =
        widget.thumbnailSize != null ? widget.thumbnailSize : 48.0;

    return new Container(
        height: _thumbnailSize,
        child: new ListView.builder(
          controller: _scrollController,
          itemCount: widget.imageProviders.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            var _decoration;
            if (_currentIndex == index) {
              var _borderColor =
                  widget.borderColor != null ? widget.borderColor : Colors.red;
              _decoration = new BoxDecoration(
                  border: new Border.all(color: _borderColor, width: 2.0),
                  color: Colors.white);
            } else {
              _decoration = new BoxDecoration(color: Colors.white);
            }

            return new GestureDetector(
                onTap: () {
                  _selectImage(index);
                },
                child: new Container(
                  decoration: _decoration,
                  margin: const EdgeInsets.only(left: 8.0),
                  child: new Image(
                    image: widget.imageProviders[index],
                    fit: BoxFit.cover,
                    width: _thumbnailSize,
                    height: _thumbnailSize,
                  ),
                ));
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height != null ? widget.height : double.infinity,
        color: Colors.black,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildImagePageView(),
            _buildImageThumbnail(),
            new SizedBox(height: 8.0)
          ],
        ));
  }
}
