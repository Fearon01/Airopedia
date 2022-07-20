final String cityTable = 'cities';

class CityFields 
{
  static final List<String> values = 
  [
    id, name, stateName, countryName, lastAccess, aqiValue, currentTemperature, minTemp, humidity, windSpeed, windDirection, weatherIcon
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String stateName = 'stateName';
  static final String countryName = 'countryName';
  static final String lastAccess = 'lastAccessed';
  static final String aqiValue = 'aqi';
  static final String currentTemperature = 'currentTemp';
  static final String minTemp = 'minTemp';
  static final String humidity = 'humidity';
  static final String windSpeed = 'windSpeed';
  static final String windDirection = 'windDirection';
  static final String weatherIcon = 'weatherIcon';
}

class City 
{
  final int? id;
  final String name;
  final String stateName;
  final String countryName;
  final DateTime lastAccess;
  final int aqiValue;
  final int currentTemperature;
  final int minTemp;
  final int humidity;
  final int windSpeed;
  final int windDirection;
  final String weatherIcon;

  const City({
    this.id,
    required this.name, 
    required this.stateName,
    required this.countryName,
    required this.lastAccess,
    required this.aqiValue,
    required this.currentTemperature,
    required this.minTemp,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
    required this.weatherIcon
    });

  Map<String, Object?> ConvertToJson() => 
  {
    CityFields.id: id,
    CityFields.name: name,
    CityFields.stateName: stateName,
    CityFields.countryName: countryName,
    CityFields.lastAccess: lastAccess.toIso8601String(),
    CityFields.aqiValue: aqiValue,
    CityFields.currentTemperature: currentTemperature,
    CityFields.minTemp: minTemp,
    CityFields.humidity: humidity,
    CityFields.windSpeed: windSpeed,
    CityFields.windDirection: windDirection,
    CityFields.weatherIcon: weatherIcon
  };

  City Copy({
    int? id,
    String? name,
    String? stateName,
    String? countryName,
    DateTime? lastAccess,
    int? aqiValue,
    int? currentTemperature,
    int? minTemp,
    int? humidity,
    int? windSpeed,
    int? windDirection,
    String? weatherIcon


  }) => City(
    id: id ?? this.id, 
    name: name ?? this.name,
    stateName: stateName ?? this.stateName,
    countryName: countryName ?? this.countryName,
    lastAccess: lastAccess ?? this.lastAccess,
    aqiValue: aqiValue ?? this.aqiValue,
    currentTemperature: currentTemperature ?? this.currentTemperature,
    minTemp: minTemp ?? this.minTemp,
    humidity: humidity ?? this.humidity,
    windSpeed: windSpeed ?? this.windSpeed,
    windDirection: windDirection ?? this.windDirection,
    weatherIcon: weatherIcon ?? this.weatherIcon
    );

  static City FromJson(Map<String, Object?> json) => City(
    id: json[CityFields.id] as int?,
    name: json[CityFields.name] as String,
    stateName: json[CityFields.stateName] as String,
    countryName: json[CityFields.countryName] as String,
    lastAccess: DateTime.parse(json[CityFields.lastAccess] as String),
    aqiValue: json[CityFields.aqiValue] as int,
    currentTemperature: json[CityFields.currentTemperature] as int,
    minTemp: json[CityFields.minTemp] as int,
    humidity: json[CityFields.humidity] as int,
    windSpeed: json[CityFields.windSpeed] as int,
    windDirection: json[CityFields.windDirection] as int,
    weatherIcon: json[CityFields.weatherIcon] as String
    );
}