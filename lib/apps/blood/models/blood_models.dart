import "dart:convert";

class Blood{
  Blood({
    required this.golonganDarah,
    required this.rhesus,
    required this.penyakitBawaan,
    required this.lokasiDonor,
});
  final String golonganDarah;
  final String rhesus;
  final String penyakitBawaan;
  final String lokasiDonor;

  factory Blood.fromRawJson(String str) => Blood.fromJson(json.decode(str));
  String toRawJson()=> json.encode(toJson());

  factory Blood.fromJson(Map<String,dynamic>json)=>Blood(
    golonganDarah: json["fields"]["golonganDarah"],
    rhesus: json["fields"]["rhesus"],
    penyakitBawaan: json["fields"]["penyakitBawaan"],
    lokasiDonor: json["fields"]["lokasiDonor"]
  );

  Map<String,dynamic>toJson()=>{
    "golonganDarah" : golonganDarah,
    "rhesus" : rhesus,
    "penyakitBawaan":penyakitBawaan,
    "lokasiDonor":lokasiDonor,
  };
}