import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  final bool loading;
  final String errorMessage;
  final bool needsReloadWidget;
  final RefreshCallback? reloadFunction;

  const BaseScreen({
    Key? key,
    required this.child,
    required this.loading,
    this.errorMessage = '',
    this.needsReloadWidget = false,
    this.reloadFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            child,
            Visibility(
              visible: loading,
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                color: Colors.black.withAlpha(70),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Visibility(
              visible: errorMessage.isNotEmpty,
              child: RefreshIndicator(
                onRefresh: () async {
                  reloadFunction?.call();
                },
                child: Stack(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      color: Colors.black.withAlpha(70),
                      child: Center(
                        child: Text(errorMessage),
                      ),
                    ),
                    ListView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
