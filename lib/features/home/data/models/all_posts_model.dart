import 'package:post_screen/features/home/domain/entities/all_posts_entity.dart';

class AllPostsModel extends AllPostsEntity {
  int? total;
  int? skip;
  int? limit;

  AllPostsModel({this.total, this.skip, this.limit});

  AllPostsModel.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(Posts.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
}

class Posts extends PostEntity {
  Posts({
    super.id,
    super.title,
    super.body,
    super.userId,
    super.tags,
    super.reactions,
  });

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    userId = json['userId'];
    tags = json['tags'].cast<String>();
    reactions = json['reactions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['userId'] = userId;
    data['tags'] = tags;
    data['reactions'] = reactions;
    return data;
  }
}
