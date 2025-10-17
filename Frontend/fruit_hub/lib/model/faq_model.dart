import 'package:get/get.dart';

class FaqModel {
  String question;
  String answer;
  RxBool isShowAns;

  FaqModel(
      {required this.question, required this.answer, bool isShowAns = false})
      : isShowAns = isShowAns.obs;
}
