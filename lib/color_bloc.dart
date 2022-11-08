import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc() : super(Colors.amber) {
    on<ColorToAmber>((event, emit) => emit(Colors.amber));
    on<ColorToLightBlue>((event, emit) => emit(Colors.lightBlue));
  }
}

abstract class ColorEvent {}

class ColorToLightBlue extends ColorEvent {}

class ColorToAmber extends ColorEvent {}
