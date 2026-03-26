import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTextStyles {
  static const TextStyle white20Bold = TextStyle(
    fontSize: 20,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle white16Bold = TextStyle(
      fontSize: 16,
      color: AppColors.white,
      fontWeight: FontWeight.bold
  );
  static const TextStyle white14Bold = TextStyle(
    fontSize: 14,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle white12Bold = TextStyle(
    fontSize: 12,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle black24Bold = TextStyle(
      fontSize: 24,
      color: AppColors.black,
      fontWeight: FontWeight.bold
  );
  static const TextStyle black16Bold = TextStyle(
      fontSize: 16,
      color: AppColors.black,
      fontWeight: FontWeight.bold
  );
  static const TextStyle black14Bold = TextStyle(
      fontSize: 14,
      color: AppColors.black,
      fontWeight: FontWeight.bold
  );

  static const TextStyle gold24Bold = TextStyle(
      fontSize: 24,
      color: AppColors.gold,
      fontWeight: FontWeight.bold
  );
  static const TextStyle gold20Bold = TextStyle(
      fontSize: 20,
      color: AppColors.gold,
      fontWeight: FontWeight.bold
  );
  static const TextStyle gold16Bold = TextStyle(
      fontSize: 16,
      color: AppColors.gold,
      fontWeight: FontWeight.bold
  );
}
