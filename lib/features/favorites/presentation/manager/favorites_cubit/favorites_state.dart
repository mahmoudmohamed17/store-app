part of 'favorites_cubit.dart';

abstract class FavoritesState{
  
}

final class FavoritesInitial extends FavoritesState {}
final class FavoritesAdded extends FavoritesState {}
final class FavoritesRemoved extends FavoritesState {}
final class FavoritesEmpty extends FavoritesState {}
