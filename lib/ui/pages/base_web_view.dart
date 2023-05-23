// Flutter imports:
import 'package:coffee_beanventory/constant/constants.dart';
import 'package:coffee_beanventory/enum/color_index_enum.dart';
import 'package:coffee_beanventory/global/global_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Package imports:
import 'package:webview_flutter/webview_flutter.dart';

class BaseWebView extends ConsumerStatefulWidget {
  const BaseWebView({
    required this.title,
    required this.url,
    this.needAppBar = true,
    super.key,
  });

  final String title;
  final String url;
  final bool needAppBar;

  static Route<BaseWebView> route({
    required String title,
    required String url,
    bool needAppBar = true,
  }) {
    return MaterialPageRoute<BaseWebView>(
      builder: (_) => BaseWebView(
        title: title,
        url: url,
        needAppBar: needAppBar,
      ),
    );
  }

  @override
  ConsumerState<BaseWebView> createState() => _BaseWebViewState();
}

class _BaseWebViewState extends ConsumerState<BaseWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorIndexEnum = ref.watch(globalManagerProvider.select((value) => value.colorIndex));
    _controller.loadRequest(
      Uri.parse(widget.url),
    );
    return SafeArea(
      child: Scaffold(
        appBar: widget.needAppBar
            ? AppBar(
                title: Text(widget.title),
                backgroundColor: colorIndexEnum.colors[backgroundColor],
              )
            : null,
        body: WebViewWidget(
          controller: _controller,
        ),
      ),
    );
  }
}
