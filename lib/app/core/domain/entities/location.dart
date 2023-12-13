part of 'entities.dart';

class Location extends Equatable {
  const Location({
    required this.name,
    required this.region,
    required this.country,
  });

  factory Location.empty() {
    return const Location(
      name: '',
      region: '',
      country: '',
    );
  }

  Location copyWith({
    String? name,
    String? region,
    String? country,
  }) {
    return Location(
      name: name ?? this.name,
      region: region ?? this.region,
      country: country ?? this.country,
    );
  }

  final String name;
  final String region;
  final String country;

  @override
  List<Object?> get props => [
        name,
        region,
        country,
      ];
}
