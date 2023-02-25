import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ItemModel {
  @JsonKey(name: 'albumId')
  final int? albumId;
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'thumbnailUrl')
  final String? thumbnailUrl;

  ItemModel(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
