final String observationTable = 'observations';

class ObservationFields 
{
  static final List<String> values = 
  [
    id, name, stateName, countryName, observation, observationTitle, observationTime
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String stateName = 'stateName';
  static final String countryName = 'countryName';
  static final String observation = 'observation';
  static final String observationTitle = 'observationTitle';
  static final String observationTime = 'observationTime';
}

class Observation 
{
  final int? id;
  final String name;
  final String stateName;
  final String countryName;
  String observation;
  String observationTitle;
  DateTime observationTime;

  Observation({
    this.id,
    required this.name, 
    required this.stateName,
    required this.countryName,
    required this.observation,
    required this.observationTitle,
    required this.observationTime
    });

  Map<String, Object?> ConvertToJson() => 
  {
    ObservationFields.id: id,
    ObservationFields.name: name,
    ObservationFields.stateName: stateName,
    ObservationFields.countryName: countryName,
    ObservationFields.observation: observation,
    ObservationFields.observationTitle: observationTitle,
    ObservationFields.observationTime: observationTime.toIso8601String()
  };

  Observation Copy({
    int? id,
    String? name,
    String? stateName,
    String? countryName,
    String? observation,
    String? observationTitle,
    DateTime? observationTime


  }) => Observation(
    id: id ?? this.id, 
    name: name ?? this.name,
    stateName: stateName ?? this.stateName,
    countryName: countryName ?? this.countryName,
    observation: observation ?? this.observation,
    observationTitle: observationTitle ?? this.observationTitle,
    observationTime: observationTime ?? this.observationTime
    );

  static Observation FromJson(Map<String, Object?> json) => Observation(
    id: json[ObservationFields.id] as int,
    name: json[ObservationFields.name] as String,
    stateName: json[ObservationFields.stateName] as String,
    countryName: json[ObservationFields.countryName] as String,
    observation: json[ObservationFields.observation] as String,
    observationTitle: json[ObservationFields.observationTitle] as String,
    observationTime: DateTime.parse(json[ObservationFields.observationTime] as String)
    );
}