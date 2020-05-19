class ProvinceCase {
  String provinceName;
  int positive;
  int death;
  int recovered;

  ProvinceCase({
    this.provinceName,
    this.positive,
    this.death,
    this.recovered,
  });

  factory ProvinceCase.fromJson(Map<String, dynamic> json) {
    return ProvinceCase(
      provinceName: json['Provinsi'],
      positive: json['Kasus_Posi'],
      recovered: json['Kasus_Semb'],
      death: json['Kasus_Meni'],
    );
  }
}
