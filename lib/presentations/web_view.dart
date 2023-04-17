import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebView extends StatefulWidget {
  const WebView({Key? key, required this.title, required this.urlToArticle,}) : super(key: key);

  final String title;
  final String urlToArticle;

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {

  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
          Icons.close,
        ),),
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: InAppWebView(
                  initialFile: widget.urlToArticle,
                  onWebViewCreated: (InAppWebViewController controller){
                    _webViewController = controller;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
