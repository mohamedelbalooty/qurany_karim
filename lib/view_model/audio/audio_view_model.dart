// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:flutter/material.dart';
// import 'package:qurany_karim/model/error_result.dart';
// import 'package:qurany_karim/model/surah.dart';
// import 'package:qurany_karim/model/surah_audio.dart';
// import 'package:qurany_karim/repositories/surah_audio/remote_service.dart';
// import 'states.dart';
//
// class AudioViewModel extends ChangeNotifier {
//   AudioDataStates audioDataStates;
//   bool openedAudio = false;
//   Surah surah;
//   void isOpenedAudio() {
//     openedAudio = true;
//     notifyListeners();
//   }
//
//   void selectSurahId(Surah selected) {
//     surah = selected;
//     notifyListeners();
//   }
//
//   List<AyahAudio> _surahAudio;
//
//   List<AyahAudio> get surahAudio => _surahAudio;
//
//   ErrorResult _error;
//
//   ErrorResult get error => _error;
//
//   SurahAudioRemoteService _service = SurahAudioRemoteService();
//
//   Future<void> getSurahAudio(
//       {@required int surahId, @required String elderFormat}) async {
//     player.stop();
//     isPlaying = false;
//     audioDataStates = AudioDataStates.Loading;
//     notifyListeners();
//     await _service
//         .getSurahAudio(surahId: surahId, elderFormat: elderFormat)
//         .then((value) {
//       value.fold((left) {
//         _surahAudio = left;
//         audioDataStates = AudioDataStates.Loaded;
//       }, (right) {
//         _error = right;
//         audioDataStates = AudioDataStates.Error;
//       });
//     });
//     notifyListeners();
//   }
//
//   AssetsAudioPlayer player = AssetsAudioPlayer();
//   bool isPlaying = false;
//   PlayState playState = PlayState.Initial;
//   void playSurahAudio() async{
//     isPlaying = !isPlaying;
//     playState = PlayState.Playing;
//     await player.open(
//       Playlist(
//         audios: _surahAudio.map((e) => Audio.network(e.audio)).toList(),
//         startIndex: 0,
//       ),
//       loopMode: LoopMode.none,
//     );
//     player.playerState.listen((state) {
//       if(state == PlayerState.stop){
//         isPlaying = false;
//         playState = PlayState.Ended;
//       }
//       notifyListeners();
//     });
//     notifyListeners();
//   }
//
//   pauseAudio() async{
//     await player.playOrPause();
//     isPlaying = !isPlaying;
//     playState = PlayState.Paused;
//     notifyListeners();
//   }
//
//   stopAudio() async{
//     await player.stop();
//   }
//
//   void disposeData() {
//     openedAudio = false;
//     surah = null;
//     // player.dispose();
//   }
// }
//