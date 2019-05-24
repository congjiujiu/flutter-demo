import 'package:mobx/mobx.dart';

abstract class _QuestionModel with Store {
  @observable
  int value = 0;
}