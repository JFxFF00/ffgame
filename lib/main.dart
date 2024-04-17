import 'dart:math' as math;

import 'package:ffgame/game.dart';
import 'package:ffgame/world.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

/// This example simply adds a rotating white square on the screen.
/// If you press on a square, it will be removed.
/// If you press anywhere else, another square will be added.
void main() {
  runApp(
    GameWidget(game: FFGame()),
  );
}
