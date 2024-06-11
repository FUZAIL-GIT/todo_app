import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/constant/app_constant.dart';
import 'package:todo_app/core/extensions/buildcontext_extension.dart';
import 'package:todo_app/core/managers/cache_manager.dart';

class ThemeManager extends GetxController {
  late ThemeMode _themeMode;
  final CacheManager _cacheManager = CacheManager.instance;
  ThemeMode get themeMode => _themeMode;

  void updateThemeMode(ThemeMode mode) {
    _themeMode = mode;
    _cacheManager.saveData(AppConstant.themeMode, mode.name);
    update();
  }

  Future<void> initThemeMode() async {
    await _cacheManager.getData(AppConstant.themeMode).then((value) {
      if (value == null || value.isEmpty) {
        _themeMode = ThemeMode.system;
      } else {
        _themeMode = ThemeMode.values.firstWhere(
          (e) => e.name == value,
          orElse: () => ThemeMode.system,
        );
      }
      update();
    });
  }

  Widget getThemeModeSwitch(BuildContext context) {
    return GetBuilder(
      init: ThemeManager(),
      builder: (controller) {
        return Row(
          children: ThemeMode.values.map((e) {
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.updateThemeMode(e);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  margin: const EdgeInsets.only(
                    right: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: controller.themeMode == e
                        ? context.colorScheme.onBackground
                        : Colors.transparent,
                    border: Border.all(
                      color: context.colorScheme.onBackground,
                    ),
                  ),
                  child: Text(
                    e.name.capitalize!,
                    textAlign: TextAlign.center,
                    style: context.textTheme.labelMedium!.copyWith(
                      color: controller.themeMode == e
                          ? context.colorScheme.background
                          : context.colorScheme.onBackground,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
