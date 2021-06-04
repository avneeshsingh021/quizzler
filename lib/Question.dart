class Question {
  late String questionText;
  late bool
      questionAnswer; //The primary reason this was created was to allow for non-null fields, that did not have to be immediately initialized

  // Question(String q, bool a) {
  //   questionText = q;
  //   questionAnswer = a;
  // }

  // syntatic  sugar constructor this keyword con be used to intitialize it
  Question(this.questionText,this.questionAnswer);

}
