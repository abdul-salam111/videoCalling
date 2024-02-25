import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'dart:math' as math;

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key, required this.title});
  final String title;
  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Enter meeting id',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (con) => CallPage(
                          callingId: controller.text.toString(),
                        )));
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class CallPage extends StatelessWidget {
  final String? callingId;
  const CallPage({super.key, this.callingId});

  @override
  Widget build(BuildContext context) {
    final String localUserId= math.Random().nextInt(1000).toString();
    return SafeArea(child: ZegoUIKitPrebuiltCall(
    appID: 1392376092, // your AppID,
    appSign: '231e5f973ec0d15f35bbdeb622c62957481d0990fab7c08d7b9f99cfed98c688',
    userID: localUserId,
    userName: 'User $localUserId',
    callID: callingId!,
    config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
   
  
  )
  );
  }
}
