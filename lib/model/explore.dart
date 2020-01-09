class Explore {
  String idExplore;
  String idPost;
  String createdAt;
  String updatedAt;
  String username;
  String image;
  String likes;
  String password;
  String email;
  String profilePic;
  String follower;
  String isActive;

  Explore(
      {this.idExplore,
      this.idPost,
      this.createdAt,
      this.updatedAt,
      this.username,
      this.image,
      this.likes,
      this.password,
      this.email,
      this.profilePic,
      this.follower,
      this.isActive});

  Explore.fromJson(Map<String, dynamic> json) {
    idExplore = json['idExplore'];
    idPost = json['idPost'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    username = json['username'];
    image = json['image'];
    likes = json['likes'];
    password = json['password'];
    email = json['email'];
    profilePic = json['profilePic'];
    follower = json['follower'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idExplore'] = this.idExplore;
    data['idPost'] = this.idPost;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['username'] = this.username;
    data['image'] = this.image;
    data['likes'] = this.likes;
    data['password'] = this.password;
    data['email'] = this.email;
    data['profilePic'] = this.profilePic;
    data['follower'] = this.follower;
    data['isActive'] = this.isActive;
    return data;
  }
}
