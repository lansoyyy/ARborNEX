class Plant {
  final String name;
  final String scientificName;
  final String description;
  final String light;
  final String soil;
  final String watering;
  final String humidity;
  final String temperature;
  final List<String> idealUses;
  final List<String> tips;

  Plant({
    required this.name,
    required this.scientificName,
    required this.description,
    required this.light,
    required this.soil,
    required this.watering,
    required this.humidity,
    required this.temperature,
    required this.idealUses,
    required this.tips,
  });
}
