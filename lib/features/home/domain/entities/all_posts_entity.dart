class AllPostsEntity {
  List<PostEntity>? posts;

  AllPostsEntity({
    this.posts,
  });
}

class PostEntity {
  int? id;
  String? title;
  String? body;
  int? userId;
  List<String>? tags;
  int? reactions;

  PostEntity(
      {this.id, this.title, this.body, this.userId, this.tags, this.reactions});
}
