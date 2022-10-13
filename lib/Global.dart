import 'package:assets_audio_player/assets_audio_player.dart';

class Global{

  static List myAudio = [
    {
      'image': 'https://timesofindia.indiatimes.com/thumb/msid-66204436,width-1200,height-900,resizemode-4/.jpg',
      'name': 'Dandiya Remix - Laila me Laila',
      'path': 'audio/a1.mp3',
      'controller': AssetsAudioPlayer(),
      'isPlaying': false,
    },
    {
      'image': 'https://rukminim1.flixcart.com/image/416/416/k51cpe80/sticker/7/x/c/beautiful-dandiya-dancer-wall-medium-41-dandiya-dancer-666-god-original-imafntgyzhjnsg8c.jpeg?q=70',
      'name': 'Payal Hai Chankaiye',
      'path': 'audio/a2.mp3',
      'controller': AssetsAudioPlayer(),
      'isPlaying': false,
    },
    {
      'image': 'https://i.pinimg.com/736x/0f/76/d0/0f76d0bffd7c7623eaa0ee6d9d40c583.jpg',
      'name': 'Dandiya Remix - 123 ka 4',
      'path': 'audio/a3.mp3',
      'controller': AssetsAudioPlayer(),
      'isPlaying': false,
    },
    {
      'image': 'https://im.idiva.com/content/2015/Oct/ram-leela-stills.jpg',
      'name': 'Dandiya Remix - amplifier',
      'path': 'audio/a4.mp3',
      'controller': AssetsAudioPlayer(),
      'isPlaying': false,
    },
    {
      'image': 'https://png.pngtree.com/png-vector/20200912/ourlarge/pngtree-dandiya-raas-couple-dancing-garba-night-png-image_2343821.jpg',
      'name': 'Dandiya Remix - Balam Pikchari',
      'path': 'audio/a5.mp3',
      'controller': AssetsAudioPlayer(),
      'isPlaying': false,
    },
    {
      'image': 'https://n3.sdlcdn.com/imgs/j/k/m/VCREATE-DECOR-Dandiya-dance-girl-SDL790095514-3-5c8b4.jpg',
      'name': 'Dandiya Remix - Bodyguard',
      'path': 'audio/a6.mp3',
      'controller': AssetsAudioPlayer(),
      'isPlaying': false,
    },
    {
      'image': 'https://n3.sdlcdn.com/imgs/j/k/m/VCREATE-DECOR-Dandiya-dance-girl-SDL790095514-3-5c8b4.jpg',
      'name': 'Dandiya Remix',
      'path': 'audio/a7.mp3',
      'controller': AssetsAudioPlayer(),
      'isPlaying': false,
    },
  ];

  static List currentAudio = [];
  static int currentAudioIndex = 0;

}