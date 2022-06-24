import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

const _wavUrl1 = 'https://luan.xyz/files/audio/coins.wav';
const _wavUrl2 = 'https://luan.xyz/files/audio/laser.wav';
const _mp3Url1 = 'https://luan.xyz/files/audio/ambient_c_motion.mp3';
const _mp3Url2 = 'https://luan.xyz/files/audio/nasa_on_a_mission.mp3';
const _streamUrl =
    'https://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/nonuk/sbr_low/ak/bbc_radio_one.m3u8';

const _asset1 = 'laser.wav';
const _asset2 = 'nasa_on_a_mission.mp3';

class SourcesTab extends StatefulWidget {
  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> {
  final player = AudioPlayer();
  Future<void> setSource(Source source) async {
     await player.play(UrlSource(_mp3Url1));
    // await player.setSource(source).then((value) {
      // print(result.);
    // });
    print('Completed setting source.');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setSource(UrlSource(_wavUrl1));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            child: Text('Remote URL WAV 1 - coins.wav'),
            onPressed: () => setSource(UrlSource(_wavUrl1)),
          ),
          TextButton(
            child: Text('Remote URL WAV 2 - laser.wav)'),
            onPressed: () => setSource(UrlSource(_wavUrl2)),
          ),
          TextButton(
            child: Text('Remote URL MP3 1 - ambient_c_motion.mp3'),
            onPressed: () => setSource(UrlSource(_mp3Url1)),
          ),
          TextButton(
            child: Text('Remote URL MP3 2 - nasa_on_a_mission.mp3'),
            onPressed: () => setSource(UrlSource(_mp3Url2)),
          ),
          TextButton(
            child: Text('Remote URL 3 - BBC stream'),
            onPressed: () => setSource(UrlSource(_streamUrl)),
          ),
          TextButton(
            child: Text('Asset 1 - laser.wav'),
            onPressed: () => setSource(AssetSource(_asset1)),
          ),
          TextButton(
            child: Text('Asset 2 - nasa.mp3'),
            onPressed: () => setSource(AssetSource(_asset2)),
          ),
          TextButton(
            child: Text('Bytes - Local - laser.wav'),
            onPressed: () async {
              final bytes = await AudioCache.instance.loadAsBytes(_asset1);
              setSource(BytesSource(bytes));
            },
          ),
          TextButton(
            child: Text('Bytes - Remote - ambient.mp3'),
            onPressed: () async {
              final bytes = await readBytes(Uri.parse(_mp3Url1));
              setSource(BytesSource(bytes));
            },
          ),
          // TODO(luan): Add local files via file picker
        ],
      ),
    );
  }
}
