import 'package:get/get.dart';

class FaqController extends GetxController {
  RxDouble animatedAnswerContainerHeight = 0.0.obs;
  RxBool isShowAnswer = false.obs;

  void toggleIsShowAnswer() {
    isShowAnswer(!isShowAnswer.value);
    isShowAnswer.isTrue
        ? animatedAnswerContainerHeight(100)
        : animatedAnswerContainerHeight(0);
  }
}
