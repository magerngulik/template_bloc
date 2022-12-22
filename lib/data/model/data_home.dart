class DataHomeModel {
  String? fullname;
  String? email;
  String? profile;
  String? title;
  String? gambarProduct;
  String? category;
  String? image;

  DataHomeModel(
      {this.fullname,
      this.email,
      this.profile,
      this.title,
      this.gambarProduct,
      this.category,
      this.image});

  DataHomeModel.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    email = json['email'];
    profile = json['profile'];
    title = json['title'];
    gambarProduct = json['gambar_product'];
    category = json['category'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = fullname;
    data['email'] = email;
    data['profile'] = profile;
    data['title'] = title;
    data['gambar_product'] = gambarProduct;
    data['category'] = category;
    data['image'] = image;
    return data;
  }
}
