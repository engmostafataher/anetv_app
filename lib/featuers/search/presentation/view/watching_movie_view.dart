import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../manager/watching_movie_cubit/video_player_cubit.dart';
import 'widget/watching_movie_view_body.dart';

class WatchingMovieView extends StatefulWidget {
  final String url;

  const WatchingMovieView({super.key, required this.url});

  @override
  WatchingMovieViewState createState() => WatchingMovieViewState();
}

class WatchingMovieViewState extends State<WatchingMovieView> {
  late VideoPlayerController _controller;
  late WebViewController _webViewController;
  bool isIframe = false;

  @override
  void initState() {
    super.initState();
    _checkUrlForIframe();
  }

  void _checkUrlForIframe() {
    if (widget.url.contains("<iframe") && widget.url.contains("</iframe>")) {
      setState(() {
        isIframe = true;
      });
    } else {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
        ..initialize().then((_) {
          setState(() {});
        }).catchError((e) {
          // Handle video loading errors (e.g., unsupported format)
          print("Error loading video: $e");
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isIframe && _webViewController == null) {
      _webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(widget.url));
    }

    return Scaffold(
      appBar: AppBar(title: Text('Watch Movie - ${widget.url}')),
      body: Center(
        child: isIframe
            ? WebViewWidget(
                controller: _webViewController) // Display WebView for iframe
            : _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : const CircularProgressIndicator(),
      ),
      floatingActionButton: isIframe
          ? null // No play/pause button for WebView
          : FloatingActionButton(
              onPressed: () {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (!isIframe) {
      _controller.dispose();
    }
  }
}
