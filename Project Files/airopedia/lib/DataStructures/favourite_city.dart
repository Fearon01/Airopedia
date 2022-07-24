final String favouriteTable = 'favourites';

class FavouriteCityFields 
{
  static final List<String> values = 
  [
    id, name, stateName, countryName
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String stateName = 'stateName';
  static final String countryName = 'countryName';
}

class FavouriteCity 
{
  final int? id;
  final String name;
  final String stateName;
  final String countryName;

  const FavouriteCity({
    this.id,
    required this.name, 
    required this.stateName,
    required this.countryName
    });

  Map<String, Object?> ConvertToJson() => 
  {
    FavouriteCityFields.id: id,
    FavouriteCityFields.name: name,
    FavouriteCityFields.stateName: stateName,
    FavouriteCityFields.countryName: countryName
  };

  FavouriteCity Copy({
    int? id,
    String? name,
    String? stateName,
    String? countryName,


  }) => FavouriteCity(
    id: id ?? this.id, 
    name: name ?? this.name,
    stateName: stateName ?? this.stateName,
    countryName: countryName ?? this.countryName
    );

  static FavouriteCity FromJson(Map<String, Object?> json) => FavouriteCity(
    id: json[FavouriteCityFields.id] as int,
    name: json[FavouriteCityFields.name] as String,
    stateName: json[FavouriteCityFields.stateName] as String,
    countryName: json[FavouriteCityFields.countryName] as String
    );
}