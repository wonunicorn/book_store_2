class ApiConstants{
  static const String baseUrlWithQuery = "https://www.googleapis.com/books/v1/volumes?q=";
  static const String baseUrlWithId = "https://www.googleapis.com/books/v1/volumes/";

  static const String getFictionUrl = "https://www.googleapis.com/books/v1/volumes?q=Fiction&maxResults=40";
  static const String getNovelUrl = "https://www.googleapis.com/books/v1/volumes?q=novel&maxResults=39";
  static const String getActionUrl = "https://www.googleapis.com/books/v1/volumes?q=action+adventure&maxResults=39";
  static const String getHorrorUrl = "https://www.googleapis.com/books/v1/volumes?q=horror&maxResults=39";

}