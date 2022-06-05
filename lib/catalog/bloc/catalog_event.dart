part of 'catalog_bloc.dart';

@immutable
abstract class CatalogEvent {
  const CatalogEvent();
}

class CatalogLoadedApiEvent extends CatalogEvent {
  @override
  // ignore: override_on_non_overriding_member
  List<Object?> get props => [];
}

class CatalogLoadIdEvent extends CatalogEvent {
  final String Id;

  const CatalogLoadIdEvent({required this.Id});
  List<Object?> get props => [Id];
}
