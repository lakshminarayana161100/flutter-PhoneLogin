import 'package:flutter/material.dart';


class NetworkTabPage extends StatefulWidget {
  const NetworkTabPage({Key? key}) : super(key: key);

  @override
  State<NetworkTabPage> createState() => _NetworkTabPageState();
}

class _NetworkTabPageState extends State<NetworkTabPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          "Network"
      ),
    );;
  }
}
