class News {
  Map<int, String> news = {
    1: "assets/images/news1.jpg",
    2: "assets/images/news2.jpg",
    3: "assets/images/news3.jpg",
    4: "assets/images/news4.jpg",
  };

  List getNews() {
    return news.values.toList();
  }
}
