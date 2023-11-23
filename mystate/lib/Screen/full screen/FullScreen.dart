import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

import '../List view/Search Photos/Search_Photos.dart';

class FullScreen extends StatelessWidget {
  FullScreen({super.key, required this.imageurl});
  String imageurl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InkWell(
            onDoubleTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPhotos(),
                  ));
            },
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Image.network(
                imageurl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () async {
            var status = await Permission.storage.request();
            if (status == PermissionStatus.granted) {
              FileDownloader.downloadFile(
                url: imageurl,
                onProgress: (fileName, progress) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Downloading...")),
                  );
                },
                onDownloadCompleted: (path) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Download Complete")),
                  );
                },
              );
            }
          },
          child: Icon(Icons.download, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
