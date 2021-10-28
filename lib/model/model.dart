class FirstList {
  final int id;
  final String title;
  final String icon;

  FirstList(this.id, this.title, this.icon);
}

class SecondList {
  final int id;
  final int parentId;
  final String title;

  SecondList(this.id, this.parentId, this.title);
}

class Question {
  final int id;
  final int parentId;
  final int level;
  final int booksPublishedNum;
  final String question;
  final String answer;
  final String dummy_1;
  final String dummy_2;
  final String explanation;
  final int isChecked;
  final int isPassed;

  Question(
      this.id,
      this.parentId,
      this.level,
      this.booksPublishedNum,
      this.question,
      this.answer,
      this.dummy_1,
      this.dummy_2,
      this.explanation,
      this.isChecked,
      this.isPassed);
}
