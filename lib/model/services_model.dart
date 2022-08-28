class ServiceModel {
  final String username;
  final String uid;
  final String postId;
  final List<String> tags;
  final String description;
  final String? serviceType;
  final String shopImage;
  final String petCareName;

  ServiceModel(
      {required this.uid,
      required this.postId,
      required this.username,
      required this.description,
      required this.petCareName,
      required this.serviceType,
      required this.shopImage,
      required this.tags});

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "tags": tags,
        "description": description,
        "serviceType": serviceType,
        "shopImage": shopImage,
        "petCareName": petCareName,
        "postId": postId
      };
}
