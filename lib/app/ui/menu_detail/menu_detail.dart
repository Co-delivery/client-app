import 'package:flutter/material.dart';

import 'package:codelivery/app/ui/menu_detail/components/body.dart';
import 'package:codelivery/app/ui/menu_detail/components/bottom_fixed_button.dart';

class MenuDetailPage extends StatelessWidget {
  const MenuDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            )),
        body: MenuDetailBody(),
        bottomSheet: BottomFixedButton());
  }
}
