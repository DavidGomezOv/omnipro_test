// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      json['albumId'] as int?,
      json['id'] as int?,
      json['title'] as String?,
      json['url'] as String?,
      json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
