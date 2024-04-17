import 'dart:math';

double radiansFromDegrees(double degrees) {
  return degrees * (pi / 180);
}

double degreesFromRadians(double radians) {
  return radians * (180 / pi);
}

double randomFromRange(double min, double max) {
  return (Random().nextDouble() * (max - min + 1)) + min;
}

int randomIntFromRange(int min, int max) {
  return (Random().nextDouble() * (max - min + 1)).round() + min;
}
