import 'package:coodesh_challenge_f2/app/controllers/home_controller.dart';
import 'package:coodesh_challenge_f2/app/utils/app_colors.dart';
import 'package:coodesh_challenge_f2/app/views/home/widgets/gender_selector.dart';
import 'package:coodesh_challenge_f2/app/views/home/widgets/users_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:unicons/unicons.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = GetIt.I.get<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.scrollController.addListener(() {
      if (controller.scrollController.position.pixels ==
          controller.scrollController.position.maxScrollExtent) {
        controller.loadUsers();
      }
    });
  }

  Future<bool> _onWillPopScope() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pharma Inc',
            style: TextStyle(color: AppColors.navyBlue),
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
                        suffixIcon: Observer(
                          builder: (_) {
                            return IconButton(
                              icon: Icon(
                                controller.searchMode == SearchMode.Name
                                    ? Icons.person_search
                                    : UniconsLine.globe,
                                color: AppColors.skyBlue,
                              ),
                              onPressed: controller.toggleSearchMode,
                            );
                          },
                        ),
                      ),
                      onChanged: controller.changeSearchField,
                    ),
                  ),
                  Observer(
                    builder: (_) {
                      return IconButton(
                        icon: Icon(
                          Icons.filter_alt_rounded,
                          color: controller.enabledFilters
                              ? AppColors.orange
                              : Colors.grey,
                          size: 30,
                        ),
                        onPressed: controller.toggleEnabledFilters,
                      );
                    },
                  )
                ],
              ),
              Observer(
                builder: (_) {
                  return Visibility(
                    visible: controller.enabledFilters,
                    child: GenderSelector(),
                  );
                },
              ),
              Expanded(
                child: Observer(
                  builder: (context) => controller.searchField.isNotEmpty ||
                          controller.enabledFilters
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
                      : controller.loadingUsers && controller.users.isEmpty
                          ? Center(
                              child: SpinKitThreeBounce(
                                color: AppColors.orange,
                                size: 25,
                              ),
                            )
                          : ListView.builder(
                              itemCount: controller.users.length + 1,
                              controller: controller.scrollController,
                              itemBuilder: (_, index) {
                                if (index == controller.users.length) {
                                  return Center(
                                    child: SpinKitThreeBounce(
                                      color: AppColors.orange,
                                      size: 25,
                                    ),
                                  );
                                } else {
                                  final item = controller.users[index];
                                  return UserItemWidget(
                                    user: item,
                                  );
                                }
                              },
                            ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
