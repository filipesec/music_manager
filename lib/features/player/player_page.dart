import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerPage extends StatefulWidget {
  final String musicPath;
  final String name;
  final String artist;
  final String? coverPath;

  const PlayerPage({
    super.key,
    required this.musicPath,
    required this.name,
    required this.artist,
    required this.coverPath,
  });

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late AudioPlayer _player;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  late StreamSubscription<Duration?> _positionSubscription;
  late StreamSubscription<Duration?> _durationSubscription;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _initPlayer();

    _player.playingStream.listen((playing) {
      if (mounted) {
        setState(() {
          _isPlaying = playing;
        });
      }
    });
  }

  Future<void> _initPlayer() async {
    await _player.setFilePath(widget.musicPath);
    _duration = _player.duration ?? Duration.zero;

    _positionSubscription = _player.positionStream.listen((position) {
      if (mounted) {
        setState(() {
          _position = position;
        });
      }
    });

    _durationSubscription = _player.durationStream.listen((duration) {
      if (mounted) {
        setState(() {
          _duration = duration ?? Duration.zero;
        });
      }
    });
  }

  void _play() async {
    await _player.play();
  }

  void _pause() async {
    await _player.pause();
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    _durationSubscription.cancel();
    _player.stop();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.primary),
          onPressed: () {
            _player.stop();
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Tocando Agora',
          style: TextStyle(color: colors.primary, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: widget.coverPath != null && widget.coverPath!.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        File(widget.coverPath!),
                        fit: BoxFit.cover,
                        width: 200,
                        height: 200,
                      ),
                    )
                  : Icon(Icons.music_note, size: 80, color: Colors.white),
            ),
            const Padding(padding: EdgeInsets.only(top: 24)),
            Text(
              widget.name,
              style: TextStyle(
                color: colors.onSurface,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 8)),
            Text(
              widget.artist,
              style: TextStyle(color: colors.onSurface, fontSize: 18),
            ),
            const Padding(padding: EdgeInsets.only(top: 16)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  Text(
                    _position.toString().split('.').first,
                    style: TextStyle(color: colors.onSurface, fontSize: 12),
                  ),
                  Expanded(
                    child: Slider(
                      value: _position.inSeconds.toDouble(),
                      max: _duration.inSeconds.toDouble(),
                      onChanged: (value) async {
                        final position = Duration(seconds: value.toInt());
                        await _player.seek(position);
                      },
                      activeColor: colors.primary,
                    ),
                  ),
                  Text(
                    _duration.toString().split('.').first,
                    style: TextStyle(color: colors.onSurface, fontSize: 12),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 32)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _isPlaying ? _pause : _play,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: colors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
