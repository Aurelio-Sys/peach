class Post {

  String idPost;
  String username;
  String image;
  String likes;
  String createdAt;
  String updatedAt;
  String password;
  String email;
  String profilePic;
  String follower;
  String isActive;

  Post(
      {this.idPost,
      this.username,
      this.image,
      this.likes,
      this.createdAt,
      this.updatedAt,
      this.password,
      this.email,
      this.profilePic,
      this.follower,
      this.isActive});

  Post.fromJson(Map<String, dynamic> json) {
    idPost = json['idPost'];
    username = json['username'];
    image = json['image'];
    likes = json['likes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    password = json['password'];
    email = json['email'];
    profilePic = json['profilePic'];
    follower = json['follower'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idPost'] = this.idPost;
    data['username'] = this.username;
    data['image'] = this.image;
    data['likes'] = this.likes;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['password'] = this.password;
    data['email'] = this.email;
    data['profilePic'] = this.profilePic;
    data['follower'] = this.follower;
    data['isActive'] = this.isActive;
    return data;
  }
}
