import 'package:pedulee/models/serializer.dart';

abstract class JSONAble {
  Map<String, dynamic> toJson();
}

class DjangoModelItem<E extends JSONAble> extends JSONAble {
  String model = "";
  int pk = 0;
  E fields;

  DjangoModelItem({
    required this.model,
    required this.pk,
    required this.fields,
  });

  @override
  toJson() {
    Map<String, dynamic> m = {};

    m['model'] = model;
    m['pk'] = pk;
    m['fields'] = fields.toJson();
    return m;
  }

  factory DjangoModelItem.fromJson(
      Map<String, dynamic> json, Serializer<E> serializer) {
    return DjangoModelItem(
      model: json["model"],
      pk: json["pk"],
      fields: serializer.fromJson(json["fields"]),
    );
  }
}
