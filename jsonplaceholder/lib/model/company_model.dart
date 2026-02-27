class CompanyModel {
  final String? name1;
  final String? catchPhrase;
  final String? bs;

  CompanyModel({
    this.name1,
    this.catchPhrase,
    this.bs
  });

  factory CompanyModel.fromJson(Map<String,dynamic> json) {
    return CompanyModel(
      name1: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs']
    );
  }
}