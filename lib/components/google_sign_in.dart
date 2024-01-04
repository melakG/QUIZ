
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../config.dart';
import '../services/api_client.dart';

class GoogleSignIn extends StatefulWidget {
  final url;
  const GoogleSignIn({super.key, this.url});
  @override
  State<GoogleSignIn> createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {


  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();



  @override
  void initState() {
    super.initState();
   
    flutterWebviewPlugin.onDestroy.listen((_) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Webview Destroyed')));
      }
    });

    flutterWebviewPlugin.onUrlChanged.listen((String url) {

if (url.contains(Config.GoogleSignInUrl)) {
        flutterWebviewPlugin.close();
        ApiClient.signInWithGoogle(url, context).then((value) => {
              if (value == true)
                {
                  setState(() {
                    
                  }),
                }
              else
                {
                  setState(() {
                   
                  }),
                },
            });
      }








    });

    flutterWebviewPlugin.onProgressChanged.listen((double progress) {
      if (mounted) {}
    });

    flutterWebviewPlugin.onScrollYChanged.listen((double y) {
      if (mounted) {}
    });
    flutterWebviewPlugin.onStateChanged.listen((event) async {
      if (mounted) {
        switch (event.type) {
          case WebViewState.shouldStart:
            {}
            break;
          case WebViewState.abortLoad:
            {}
            break;
          case WebViewState.startLoad:
            {}
            break;
          case WebViewState.finishLoad:
            {}
            break;
        }
      } else {}
    });

  flutterWebviewPlugin.launch(
                                        widget.url,
                                        
                                        clearCookies: true,
                                        withJavascript: true,
                                        withLocalStorage: true,
                                        withZoom: false,
                                        supportMultipleWindows: true,
                                        allowFileURLs: true,
                                      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:400,
     child: SafeArea(
                child: WebviewScaffold(
                  userAgent: 'random',
                  url: widget.url,
                ),
              )
    );
  }
} 