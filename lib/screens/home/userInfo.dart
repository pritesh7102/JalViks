import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class userList extends StatefulWidget {
  const userList({super.key});

  @override
  State<userList> createState() => _userListState();
}

class _userListState extends State<userList> {
  @override
  Widget build(BuildContext context) {
    final info = Provider.of<QuerySnapshot>(context);
    print(info);
    return Container();
  }
}
