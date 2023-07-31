// To parse this JSON data, do
//
//     final moduleModel = moduleModelFromJson(jsonString);

import 'dart:convert';

class ModuleModel {
  String? status;
  List<Module>? data;
  String? message;

  ModuleModel({
    this.status,
    this.data,
    this.message,
  });

  factory ModuleModel.fromRawJson(String str) =>
      ModuleModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModuleModel.fromJson(Map<String, dynamic> json) => ModuleModel(
        status: json["status"],
        data: List<Module>.from(json["data"].map((x) => Module.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Module {
  int? id;
  String? moduleName;
  String? moduleType;
  String? thumbnail;
  String? status;
  int? storesCount;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? icon;
  int? themeId;
  String? description;
  int? allZoneService;
  List<dynamic>? translations;

  Module({
    this.id,
    this.moduleName,
    this.moduleType,
    this.thumbnail,
    this.status,
    this.storesCount,
    this.createdAt,
    this.updatedAt,
    this.icon,
    this.themeId,
    this.description,
    this.allZoneService,
    this.translations,
  });

  factory Module.fromRawJson(String str) => Module.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        id: json["id"],
        moduleName: json["module_name"],
        moduleType: json["module_type"],
        thumbnail: json["thumbnail"],
        status: json["status"],
        storesCount: json["stores_count"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        icon: json["icon"],
        themeId: json["theme_id"],
        description: json["description"],
        allZoneService: json["all_zone_service"],
        translations: List<dynamic>.from(json["translations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "module_name": moduleName,
        "module_type": moduleType,
        "thumbnail": thumbnail,
        "status": status,
        "stores_count": storesCount,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "icon": icon,
        "theme_id": themeId,
        "description": description,
        "all_zone_service": allZoneService,
        "translations": List<dynamic>.from(translations!.map((x) => x)),
      };
}
