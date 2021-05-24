import 'package:coodesh_challenge_f2/app/controllers/home_controller.dart';
import 'package:coodesh_challenge_f2/app/views/home/widgets/users_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomeView extends StatelessWidget {
  final controller = GetIt.I.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pharma Inc',
          style: TextStyle(color: Color(0xFFF26522)),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Observer(
        builder: (context) => controller.loadingUsers
            ? Center(child: Text('Carregando'))
            : ListView.builder(
                itemCount: controller.users.length,
                itemBuilder: (_, index) {
                  final item = controller.users[index];

                  return UserItemWidget(
                    user: item,
                  );
                },
              ),
      ),
    );
  }
}
