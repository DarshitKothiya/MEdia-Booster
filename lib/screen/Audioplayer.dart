import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../Global.dart';
import 'audioplaypage.dart';

class AudioPlayer extends StatefulWidget {
  const AudioPlayer({Key? key}) : super(key: key);

  @override
  State<AudioPlayer> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  String totalDuaration = '0:00:00';

  @override
  void initState() {
    super.initState();

    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: Global.myAudio.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: (){
              setState(() {
                Global.currentAudioIndex = index;
                Global.currentAudio.add(Global.myAudio[Global.currentAudioIndex]);
                showDialog(
                    context: context,
                    builder: (context) {
                      return  const playpage();
                    });
              });
            },
            leading: const Icon(Icons.music_note),
            title: Text('${Global.myAudio[index]['name']}'),
          );
        },
      ),
    );
  }
}


