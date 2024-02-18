// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:shared_preferences/shared_preferences.dart';

import 'settings_persistence.dart';

/// An implementation of [SettingsPersistence] that uses
/// `package:shared_preferences`.
class LocalStorageSettingsPersistence extends SettingsPersistence {
  final Future<SharedPreferences> instanceFuture =
      SharedPreferences.getInstance();

  @override
  Future<bool> getAudioOn({required bool defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getBool('audioOn') ?? defaultValue;
  }

  @override
  Future<bool> getMusicOn({required bool defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getBool('musicOn') ?? defaultValue;
  }

  @override
  Future<bool> getSoundsOn({required bool defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getBool('soundsOn') ?? defaultValue;
  }

  @override
  Future<double> getMusicVolume({required double defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getDouble('musicVolume') ?? defaultValue;
  }

  @override
  Future<double> getSoundsVolume({required double defaultValue}) async {
    final prefs = await instanceFuture;
    return prefs.getDouble('soundsVolume') ?? defaultValue;
  }

  @override
  Future<void> saveAudioOn(bool value) async {
    final prefs = await instanceFuture;
    await prefs.setBool('audioOn', value);
  }

  @override
  Future<void> saveMusicOn(bool value) async {
    final prefs = await instanceFuture;
    await prefs.setBool('musicOn', value);
  }

  @override
  Future<void> saveSoundsOn(bool value) async {
    final prefs = await instanceFuture;
    await prefs.setBool('soundsOn', value);
  }

  @override
  Future<void> saveMusicVolume(double value) async {
    final prefs = await instanceFuture;
    await prefs.setDouble('musicVolume', value);
  }

  @override
  Future<void> saveSoundsVolume(double value) async {
    final prefs = await instanceFuture;
    await prefs.setDouble('soundsVolume', value);
  }
}