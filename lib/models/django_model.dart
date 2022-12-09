import 'package:pedulee/models/serializer.dart';

class DjangoModelItem<E> {
  String model = "";
  int pk = 0;
  E fields;

  DjangoModelItem({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory DjangoModelItem.fromJson(
      Map<String, dynamic> json, Serializer<E> serializer) {
    return DjangoModelItem(
      model: json["model"],
      pk: json["pk"],
      fields: serializer.fromJson(json["fields"]),
    );
  }
}
