import 'package:flutter/material.dart';
import 'api.dart';

class NewUserInfo extends StatefulWidget {
  @override
  _NewUserInfoState createState() => _NewUserInfoState();
}

class _NewUserInfoState extends State<NewUserInfo> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _resumeController = TextEditingController();
  final _profilePicController = TextEditingController();
  final _satController = TextEditingController();
  final _actController = TextEditingController();
  final _mcatController = TextEditingController();
  final _gmatController = TextEditingController();
  final _lsatController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}