import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:multimedia/Global.dart';

class playpage extends StatefulWidget {
  const playpage({Key? key}) : super(key: key);

  @override
  State<playpage> createState() => _playpageState();
}

class _playpageState extends State<playpage> {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  bool isSongPlay = false;
  String totalDuaration = "00:00:00";

  songPlay (){
    audioPlayer.open(
      Audio(Global.myAudio[Global.currentAudioIndex]['path']),
      autoStart: false,
      showNotification: true,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   songPlay();
    print("-----------------------------------------------");
    print(Global.currentAudio[Global.currentAudioIndex]["name"]);
    print("-----------------------------------------------");
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          color: Colors.blueGrey,
          height: 400,
          width: 350,
          child: Column(
            children: [
              const SizedBox(height: 60),
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage('${Global.myAudio[Global.currentAudioIndex]['image']}'),
              ),
              const SizedBox(height: 10),
              Text('${Global.myAudio[Global.currentAudioIndex]['name']}'),
              const SizedBox(height: 25),
              StreamBuilder(
                stream: audioPlayer.currentPosition,
                builder: (context, AsyncSnapshot snapshot) {
                  Duration data = audioPlayer.currentPosition.value;

                  return Column(
                    children: [
                      Slider(
                        min: 0,
                        max: (audioPlayer.current.hasValue)
                            ? audioPlayer
                            .current.value!.audio.duration.inSeconds
                            .toDouble()
                            : 1,
                        value: (audioPlayer.current.hasValue)
                            ? data.inSeconds.toDouble()
                            : 0,
                        activeColor: Colors.blue,
                        thumbColor: Colors.teal,
                        inactiveColor: Colors.grey.withOpacity(0.4),
                        onChanged: (val) {
                          audioPlayer
                              .seek(Duration(seconds: val.toInt()));
                        },
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 15),
                          Text("${data.toString().split(".")[0]}"),
                          const Spacer(),
                          Text(totalDuaration),
                          const SizedBox(width: 15),
                        ],
                      )
                    ],
                  );
                },
              ),
              const SizedBox(height: 15),
              StreamBuilder(
                  stream: audioPlayer.isPlaying,
                  builder: (context, AsyncSnapshot snapshot) {
                    isSongPlay = audioPlayer.isPlaying.value;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // const Spacer(flex: 3),
                        IconButton(
                          icon: const Icon(Icons.skip_previous_sharp,
                              size: 40),
                          onPressed: () {
                            setState(() {
                              if (Global.currentAudioIndex > 0) {
                                audioPlayer.stop();
                                Global.currentAudioIndex--;
                                songPlay();
                              } else {
                                audioPlayer.stop();
                                Global.currentAudioIndex = 6;
                                songPlay();
                              }
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            (isSongPlay)
                                ? Icons.pause_circle_filled_sharp
                                : Icons.play_circle_fill_sharp,
                            size: 50,
                          ),
                          onPressed: () async {
                            await audioPlayer.playOrPause();
                            setState(() {
                              totalDuaration = audioPlayer
                                  .current.value!.audio.duration
                                  .toString()
                                  .split(".")[0];
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.skip_next_sharp,
                              size: 40),
                          onPressed: () {
                            setState(() {
                              if (Global.currentAudioIndex < 6) {
                                audioPlayer.stop();
                                Global.currentAudioIndex++;
                                songPlay();
                              } else {
                                audioPlayer.stop();
                                Global.currentAudioIndex = 0;
                                songPlay();
                              }
                            });
                          },
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.stop();
  }
}
