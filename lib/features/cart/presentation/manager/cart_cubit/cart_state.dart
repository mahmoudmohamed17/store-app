part of 'cart_cubit.dart';

abstract class CartState {
  
}

final class CartInitial extends CartState {}
final class CartAdded extends CartState {}
final class CartRemoved extends CartState {}
final class CartEmpty extends CartState {}
final class CartProductIncrement extends CartState {}
final class CartProductDecrement extends CartState {}
