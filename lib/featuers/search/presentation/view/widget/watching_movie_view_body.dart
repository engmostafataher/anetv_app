import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WatchingMovieViewBody extends StatefulWidget {
  final String url;

  const WatchingMovieViewBody({super.key, required this.url});

  @override
  WatchingMovieViewBodyState createState() => WatchingMovieViewBodyState();
}

class WatchingMovieViewBodyState extends State<WatchingMovieViewBody> {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  late WebViewController _webViewController;
  late final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();

    // Initialize WebView controller if the URL contains iframe or web links
    if (widget.url.contains('<iframe') ||
        widget.url.contains('vk.com') ||
        widget.url.contains('drive.google.com')) {
      _webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(widget.url));
    } else if (widget.url.contains('drive.google.com')) {
      // Handle Google Drive direct video URL
      try {
        final fileId = _extractGoogleDriveFileId(widget.url);
        final downloadUrl =
            'https://drive.google.com/uc?export=download&id=$fileId';
        _videoPlayerController =
            VideoPlayerController.networkUrl(Uri.parse(downloadUrl));
        _initializeVideoPlayerFuture = _videoPlayerController.initialize();
      } catch (e) {
        print('Error processing Google Drive URL: $e');
      }
    } else {
      print('Unsupported video URL: ${widget.url}');
    }
  }

  String _extractGoogleDriveFileId(String url) {
    final match = RegExp(r"/d/([a-zA-Z0-9_-]+)/").firstMatch(url);
    if (match != null && match.group(1) != null) {
      return match.group(1)!;
    } else {
      throw Exception('Invalid Google Drive URL');
    }
  }

  @override
  void dispose() {
    if (_videoPlayerController.value.isInitialized) {
      _videoPlayerController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor:
            Color(0xff1F1F1F), //Color(0xff1D1D1D), //Color(0xff1c1d1f),
        centerTitle: true,
        title: const Text("Watching Movie"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: widget.url.contains('<iframe') ||
              widget.url.contains('vk.com') ||
              widget.url.contains('drive.google.com')
          ? WebViewWidget(controller: _webViewController)
          : widget.url.contains('drive.google.com')
              ? FutureBuilder<void>(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return Center(
                            child:
                                Text('Error loading video: ${snapshot.error}'));
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AspectRatio(
                            aspectRatio:
                                _videoPlayerController.value.aspectRatio,
                            child: VideoPlayer(_videoPlayerController),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (_videoPlayerController.value.isPlaying) {
                                  _videoPlayerController.pause();
                                } else {
                                  _videoPlayerController.play();
                                }
                              });
                            },
                            child: Icon(
                              _videoPlayerController.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )
              : const Center(child: Text('Invalid Video URL')),
    );
  }
}
