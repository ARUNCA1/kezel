class DataModel {
 var array;

  DataModel({required this.array,});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      array: json['array'],

    );
  }
}