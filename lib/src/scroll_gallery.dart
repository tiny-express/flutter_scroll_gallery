import 'dart:async';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

typedef void OnPageChange(int index);

class ScrollGallery extends StatefulWidget {
  final double height;
  final double thumbnailSize;
  final List<ImageProvider> imageProviders;
  final BoxFit fit;
  final Duration interval;
  final Color borderColor;
  final Color backgroundColor;
  final bool zoomable;
  final int initialIndex;
  final OnPageChange onPageChange;

  ScrollGallery(this.imageProviders,
      {this.height = double.infinity,
      this.thumbnailSize = 48.0,
      this.borderColor = Colors.red,
      this.backgroundColor = Colors.black,
      this.zoomable = true,
      this.fit = BoxFit.contain,
      this.interval,
      this.initialIndex = 0,
      this.onPageChange});

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
  bool _lock = false;

  @override
  void initState() {
    _scrollController = new ScrollController();
    _pageController = new PageController(initialPage: widget.initialIndex);
    _currentIndex = widget.initialIndex;
    if (widget.interval != null && widget.imageProviders.length > 1) {
      _timer = new Timer.periodic(widget.interval, (_) {
        if (_lock) {
          return;
        }

        if (_currentIndex == widget.imageProviders.length - 1) {
          _reverse = true;
        }
        if (_currentIndex == 0) {
          _reverse = false;
        }

        if (_reverse) {
          _pageController?.previousPage(
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        } else {
          _pageController?.nextPage(
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        }
      });
    }

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
    if (widget.onPageChange != null) {
      widget.onPageChange(index);
    }
    setState(() {
      _currentIndex = index;
      double itemSize = widget.thumbnailSize + 8.0;
      _scrollController?.animateTo(itemSize * index / 2,
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    });
  }

  Widget _zoomableImage(image) {
    return new PhotoView(
      backgroundDecoration: BoxDecoration(color: widget.backgroundColor),
      imageProvider: image,
      minScale: PhotoViewComputedScale.contained,
      scaleStateChangedCallback: (PhotoViewScaleState state) {
        setState(() {
          _lock = state != PhotoViewScaleState.initial;
          print(state);
        });
      },
    );
  }

  Widget _notZoomableImage(image) {
    return new Image(image: image, fit: widget.fit);
  }

  Widget _buildImagePageView() {
    return Expanded(
        child: new PageView(
      physics: _lock ? NeverScrollableScrollPhysics() : null,
      onPageChanged: _onPageChanged,
      controller: _pageController,
      children: widget.imageProviders.map((image) {
        return (widget.zoomable
            ? _zoomableImage(image)
            : _notZoomableImage(image));
      }).toList(),
    ));
  }

  void _selectImage(int index) {
    setState(() {
      _pageController?.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
      _lock = false;
    });
  }

  Widget _buildImageThumbnail() {
    return new Container(
        height: widget.thumbnailSize,
        child: new ListView.builder(
          controller: _scrollController,
          itemCount: widget.imageProviders.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            var decoration = new BoxDecoration(color: Colors.white);

            if (_currentIndex == index) {
              decoration = new BoxDecoration(
                  border: new Border.all(color: widget.borderColor, width: 2.0),
                  color: Colors.white);
            }

            return new GestureDetector(
                onTap: () {
                  _selectImage(index);
                },
                child: new Container(
                  decoration: decoration,
                  margin: const EdgeInsets.only(left: 8.0),
                  child: new Image(
                    image: widget.imageProviders[index],
                    fit: widget.fit,
                    width: widget.thumbnailSize,
                    height: widget.thumbnailSize,
                  ),
                ));
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        color: widget.backgroundColor,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildImagePageView(),
            new SizedBox(height: 8.0),
            _buildImageThumbnail(),
            new SizedBox(height: 8.0)
          ],
        ));
  }
}
