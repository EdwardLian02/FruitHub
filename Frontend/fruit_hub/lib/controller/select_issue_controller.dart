import 'package:get/get.dart';

class SelectIssueController extends GetxController {
  RxString selectedIssueValue = ''.obs;
  List issuesValue = [
    'option1',
    'option2',
    'option3',
    'option4',
  ];

  void onSelect(String value) {
    print(value);
    selectedIssueValue(value);
  }
}
