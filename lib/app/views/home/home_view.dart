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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Searching',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      suffixIcon: Icon(
                        Icons.person_search,
                        color: Colors.grey,
                      ),
                    ),
                    onChanged: controller.changeSearchField,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.filter_alt_rounded,
                    color: Colors.grey,
                    size: 30,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            Expanded(
              child: Observer(
                builder: (context) => controller.loadingUsers
                    ? Center(child: Text('Carregando'))
                    : controller.searchField.isNotEmpty
                        ? controller.resultsFilters.isNotEmpty
                            ? ListView.builder(
                                itemCount: controller.resultsFilters.length,
                                itemBuilder: (_, index) {
                                  final item = controller.resultsFilters[index];

                                  return UserItemWidget(
                                    user: item,
                                  );
                                },
                              )
                            : Center(
                                child: Text(
                                  'Nenhum resultado encontrado',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              )
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
            ),
          ],
        ),
      ),
    );
  }
}
