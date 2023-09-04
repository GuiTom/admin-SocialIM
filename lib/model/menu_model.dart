class MenuModel {
  MenuModel._(this.name, this.pageRoute, this.icon, this.subMenus);

  final String name;
  final String pageRoute;
  final String icon;
  final List<MenuModel> subMenus;

  factory MenuModel.fromMap(Map<String, dynamic> map){
    return MenuModel._(map['name'], map['pageRoute'], map['icon'],
        map['subMenus'] == null ? <MenuModel>[]:(map['subMenus'] as List).map((e) =>
        MenuModel.fromMap(e)).toList()
    );
  }
}