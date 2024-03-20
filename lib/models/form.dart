
class FeedbackForm {

  String _email;
  String _mess;
  String _food;
  String _feedback;

  FeedbackForm(this._email, this._mess, this._food, this._feedback);

  // Method to make GET parameters.
  String toParams() =>
      "?email=$_email&mess=$_mess&food=$_food&feedback=$_feedback";


}
