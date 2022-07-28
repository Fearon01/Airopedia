final String recentTable = 'recently_visited';

class RecentCityFields 
{
  static final List<String> values = 
  [
    id, name, stateName, countryName, lastAccess
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String stateName = 'stateName';
  static final String countryName = 'countryName';
  static final String lastAccess = 'lastAccess';
}

class RecentCity 
{
  final int? id;
  final String name;
  final String stateName;
  final String countryName;
  final DateTime lastAccess;

  set lastAccess(DateTime newTime) 
  {
    lastAccess = newTime;
  }

  const RecentCity({
    this.id,
    required this.name, 
    required this.stateName,
    required this.countryName,
    required this.lastAccess
    });

  Map<String, Object?> ConvertToJson() => 
  {
    RecentCityFields.id: id,
    RecentCityFields.name: name,
    RecentCityFields.stateName: stateName,
    RecentCityFields.countryName: countryName,
    RecentCityFields.lastAccess: lastAccess.toIso8601String()
  };

  RecentCity Copy({
    int? id,
    String? name,
    String? stateName,
    String? countryName,
    DateTime? lastAccess


  }) => RecentCity(
    id: id ?? this.id, 
    name: name ?? this.name,
    stateName: stateName ?? this.stateName,
    countryName: countryName ?? this.countryName,
    lastAccess: lastAccess ?? this.lastAccess

    );

  static RecentCity FromJson(Map<String, Object?> json) => RecentCity(
    id: json[RecentCityFields.id] as int,
    name: json[RecentCityFields.name] as String,
    stateName: json[RecentCityFields.stateName] as String,
    countryName: json[RecentCityFields.countryName] as String,
    lastAccess: DateTime.parse(json[RecentCityFields.lastAccess] as String)
    );
}