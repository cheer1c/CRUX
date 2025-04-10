package crux;

final class Authors {
  // TODO: Add author information.
  static final Author[] all = {new Author("Eric Che", "76483202", "eche2@ics.uci.edu"),};
}


final class Author {
  final String name;
  final String studentId;
  final String uciNetId;

  Author(String name, String studentId, String uciNetId) {
    this.name = name;
    this.studentId = studentId;
    this.uciNetId = uciNetId;
  }
}
