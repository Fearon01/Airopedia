final String observationTable = 'observations';

class ObservationFields 
{
  static final List<String> values = 
  [
    id, name, stateName, countryName
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String stateName = 'stateName';
  static final String countryName = 'countryName';
  static final String observation = 'observation';
}

class Observation 
{
  final int id;
  final String name;
  final String stateName;
  final String countryName;

  const Observation({
    required this.id,
    required this.name, 
    required this.stateName,
    required this.countryName
    });

  Map<String, Object?> ConvertToJson() => 
  {
    ObservationFields.id: id,
    ObservationFields.name: name,
    ObservationFields.stateName: stateName,
    ObservationFields.countryName: countryName
  };

  Observation Copy({
    int? id,
    String? name,
    String? stateName,
    String? countryName,


  }) => Observation(
    id: id ?? this.id, 
    name: name ?? this.name,
    stateName: stateName ?? this.stateName,
    countryName: countryName ?? this.countryName
    );

  static Observation FromJson(Map<String, Object?> json) => Observation(
    id: json[ObservationFields.id] as int,
    name: json[ObservationFields.name] as String,
    stateName: json[ObservationFields.stateName] as String,
    countryName: json[ObservationFields.countryName] as String
    );
}