
class ReopModel {
  final int id;
  final String imageUrl;
  final String caption;
  final String category;
  ReopModel(this.id,this.imageUrl,this.caption,this.category);

  ReopModel.fromJson(Map<String,dynamic> json)
    : id = json['id'],
      imageUrl = json['image'],
      caption = json['caption'],
      category = json['category'];
  
}