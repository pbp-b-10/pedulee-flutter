class Blood{
  String golonganDarah;
  String rhesus;
  String penyakitBawaan = "";
  String lokasiDonor;
  Blood(this.golonganDarah,this.rhesus,this.penyakitBawaan,this.lokasiDonor);
}
class ListBlood{
  static List<Blood> data = [];
}