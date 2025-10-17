import 'package:fruit_hub/model/faq_model.dart';
import 'package:get/get.dart';

class FaqController extends GetxController {
  RxDouble animatedAnswerContainerHeight = 0.0.obs;

  //Answer should be display only one at once. (No multiple diplay is allowed)
  RxInt previousShowFaqItemIndex = 0.obs;

  List<FaqModel> faqList = [
    FaqModel(
      question: "What is FruitHub",
      answer:
          "The Pritchett-Dunphy-Tucker clan is a wonderfully large and blended family. They give us an honest and often hilarious look into the sometimes warm, sometimes twisted, embrace of the modern family. The Pritchett-Dunphy-Tucker clan is a wonderfully large and blended family. They give us an honest and often hilarious look into the sometimes warm, sometimes twisted, embrace of the modern family. The Pritchett-Dunphy-Tucker clan is a wonderfully large and blended family. They give us an honest and often hilarious look into the sometimes warm, sometimes twisted, embrace of the modern family.",
    ),
    FaqModel(
      question: "Why shoud you use the app",
      answer:
          "The Pritchett-Dunphy-Tucker clan is a wonderfully large and blended family. They give us an honest and often hilarious look into the sometimes warm, sometimes twisted, embrace of the modern family. The Pritchett-Dunphy-Tucker clan is a wonderfully large and blended family. They give us an honest and often hilarious look into the sometimes warm, sometimes twisted, embrace of the modern family. The Pritchett-Dunphy-Tucker clan is a wonderfully large and blended family. They give us an honest and often hilarious look into the sometimes warm, sometimes twisted, embrace of the modern family.",
    ),
    FaqModel(
      question: "How to order step by step",
      answer:
          "The Pritchett-Dunphy-Tucker clan is a wonderfully large and blended family. They give us an honest and often hilarious look into the sometimes warm, sometimes twisted, embrace of the modern family. The Pritchett-Dunphy-Tucker clan is a wonderfully large and blended family. They give us an honest and often hilarious look into the sometimes warm, sometimes twisted, embrace of the modern family. The Pritchett-Dunphy-Tucker clan is a wonderfully large and blended family. They give us an honest and often hilarious look into the sometimes warm, sometimes twisted, embrace of the modern family.",
    )
  ];

  void toggleIsShowAnswer(index) {
    //First close previous item answer if the faq item is different from previous
    if (previousShowFaqItemIndex != index) {
      faqList[previousShowFaqItemIndex.value].isShowAns(false);
    }

    //Then display current item answer
    faqList[index].isShowAns.value = !faqList[index].isShowAns.value;

    //Store current faqItem index as previous
    previousShowFaqItemIndex(index);
    faqList[index].isShowAns.isTrue
        ? animatedAnswerContainerHeight(100)
        : animatedAnswerContainerHeight(0);
  }
}
