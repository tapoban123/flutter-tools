import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'built_post.g.dart';

abstract class BuiltPost implements Built<BuiltPost, BuiltPostBuilder> {
  int? get id;

  String get title;
  String get body;

  BuiltPost._();

  factory BuiltPost([Function(BuiltPostBuilder b) updates]) = _$BuiltPost;

  static Serializer<BuiltPost> get serializer => _$builtPostSerializer;
}
