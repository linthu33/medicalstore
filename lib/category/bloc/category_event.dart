part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {
  const CategoryEvent();
}

class CategoryLoadedEvent extends CategoryEvent {
  List<Object?> get props => [];
}
