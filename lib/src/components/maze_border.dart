import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class MazeBorder extends RectangleComponent {
  MazeBorder()
      : super(
          position: Vector2(0, 0),
          size: Vector2(800, 600),
          anchor: Anchor.center,
          paint: Paint()
            ..color = Colors.white.withValues( alpha: 0.5) 
            ..style = PaintingStyle.stroke
            ..strokeWidth = 10,
        );
}