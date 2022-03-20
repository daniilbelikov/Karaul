import 'package:flutter/material.dart';
import 'package:karaul/helpers/constants.dart';
import 'package:audioplayers/audioplayers.dart';

class SignalProvider with ChangeNotifier {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache cache = AudioCache();
  bool isPlaying = false;

  get currentPlayingState => isPlaying;

  Future<void> startAudio() async {
    if (isPlaying) {
      await audioPlayer.stop();
      isPlaying = false;
      notifyListeners();
    } else {
      audioPlayer = await cache.loop(ConstAssets.alarmAsset);
      isPlaying = true;
      notifyListeners();
    }
  }
}
