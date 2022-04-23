class FacebookModel {
  late String name;
  late String email;

  late String id;
  late FacebookPhotoModel facebookPhotoModel;

  FacebookModel({
    required this.name,
    required this.email,
    required this.id,
    required this.facebookPhotoModel,
  });

  FacebookModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];

    id = json['id'];
    facebookPhotoModel = FacebookPhotoModel.fromJson(json['picture']['data']);
  }
}

class FacebookPhotoModel {
  late int height;
  late String url;
  late int width;

  FacebookPhotoModel(
      {required this.height, required this.url, required this.width});

  FacebookPhotoModel.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }
}
