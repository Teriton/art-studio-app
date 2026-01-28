import 'package:art_studio_app/models/user.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.user});

  final User user;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .all(8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(),
            child: Row(
              children: [
                CircleAvatar(),
                Text("${widget.user.firstName} ${widget.user.lastName}"),
              ],
            ),
          ),
          Text("Email:"),
          Text(widget.user.email),
          Text("Phone number:"),
          Text(widget.user.phoneNumber),
        ],
      ),
    );
  }
}
