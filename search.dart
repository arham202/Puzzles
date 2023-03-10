import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String channelTitle;

  Video({required this.id, required this.title, required this.thumbnailUrl, required this.channelTitle});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id']['videoId'],
      title: json['snippet']['title'],
      thumbnailUrl: json['snippet']['thumbnails']['high']['url'],
      channelTitle: json['snippet']['channelTitle'],
    );
  }
}

class YoutubeScreen extends StatefulWidget {

  @override
  _YoutubeScreenState createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Video> _videos = [];

  _searchYoutube(String query) async {
    const apiKey = "AIzaSyCZB6jgkENt3fNy5PIY4LYGPJT5TfHn8XE";
    var url = "https://www.googleapis.com/youtube/v3/search"
        "?part=snippet"
        "&maxResults=10"
        "&q=$query"
        "&type=video"
        "&key=$apiKey";

    var response = await http.get(Uri.parse(url));
    var decodedJson = jsonDecode(response.body);

    setState(() {
      _videos = decodedJson['items'].map<Video>((item) {
        return Video.fromJson(item);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "Search on YouTube",
          ),
          onSubmitted: (query) => _searchYoutube(query),
        ),
      ),
      body: ListView.builder(
        itemCount: _videos.length,
        itemBuilder: (context, index) {

          return ListTile(
            leading: Image.network(_videos[index].thumbnailUrl),
            title: Text(_videos[index].title),
            subtitle: Text(_videos[index].channelTitle),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoPlayerScreen(
                  videoId: _videos[index].id,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
class VideoPlayerScreen extends StatefulWidget {
  final String videoId;
  VideoPlayerScreen({required this.videoId});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
