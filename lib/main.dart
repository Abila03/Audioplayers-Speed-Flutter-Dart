import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cerita Rakyat Indonesia',
      theme: ThemeData(
        primaryColor: Colors.blue, // Warna utama (biru)
      ),
      home: CeritaRakyatPage(),
    );
  }
}

class CeritaRakyatPage extends StatelessWidget {
  final AudioPlayer audioPlayer = AudioPlayer();
  final String audioPath = 'assets/audio.mp3'; // Lokasi file audio

  playAudio(double speed) async {
    await audioPlayer.setUrl(audioPath);
    await audioPlayer.setPlaybackRate(speed); // Memperbaiki parameter speed
    await audioPlayer.play(audioPath);
  }

  stopAudio() async {
    await audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ringkasan Cerita Legenda Situ Bagendit',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue), // Ubah warna teks menjadi biru
            ),
            SizedBox(height: 20.0),
            Text(
              'Nyai Endit, seorang tengkulak kaya raya yang kikir, mengeksploitasi petani dengan harga murah untuk kemudian menjual kembali dengan harga tinggi. Ketika mengadakan pesta, ia menolak memberi makanan kepada seorang pengemis tua. Namun, kejadian tak terduga terjadi ketika ia menemui tongkat tua yang ajaib, yang bisa dicabut oleh pengemis tua itu sendiri. Tongkat itu memancarkan air, menyelamatkan desa, tetapi Nyai Endit tenggelam dalam keserakahannya.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.green), // Ubah warna teks menjadi hijau
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => playAudio(
                      1.0), // Mainkan suara dengan kecepatan normal (1x)
                  child: Text('Play'),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () =>
                      playAudio(2.0), // Mainkan suara dengan kecepatan 2x
                  child: Text('2x'),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () =>
                      playAudio(3.0), // Mainkan suara dengan kecepatan 3x
                  child: Text('3x'),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () =>
                      playAudio(4.0), // Mainkan suara dengan kecepatan 4x
                  child: Text('4x'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: stopAudio, // Hentikan pemutaran suara
              child: Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }
}
