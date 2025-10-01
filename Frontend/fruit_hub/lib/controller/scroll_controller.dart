import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ScrollableController extends GetxController {
  late ScrollController scrollController;
  RxBool isShowPinnedAppBar = false.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    // print('Current scroll position: ${scrollController.position.pixels}');

    if (scrollController.position.pixels > 195.0) {
      print("True");
      isShowPinnedAppBar(true);
    } else {
      print("False");
      isShowPinnedAppBar(false);
    }
    // if (scrollController.position.pixels ==
    //     scrollController.position.maxScrollExtent) {
    //   isShowPinnedAppBar(true);
    //   // Implement logic for loading more data (e.g., infinite scrolling)
    // } else {
    //   isShowPinnedAppBar(false);
    // }
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }
}
