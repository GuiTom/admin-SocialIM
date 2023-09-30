abstract class PaginatedModel implements List{
  void refresh();
  void nextPage();
  void prePage();
  void goToPage(int page);
  int get currentPage;
}