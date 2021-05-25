import 'package:coodesh_challenge_f2/app/controllers/home_controller.dart';
import 'package:coodesh_challenge_f2/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class GenderSelector extends StatelessWidget {
  final controller = GetIt.I.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          height: 42,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.orange),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: controller.toggleGenderFilter,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          controller.genderFilterSelected == GenderFilter.Male
                              ? AppColors.orange
                              : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        bottomLeft: Radius.circular(4),
                      ),
                    ),
                    child: Text(
                      'Male',
                      style: TextStyle(
                        color:
                            controller.genderFilterSelected == GenderFilter.Male
                                ? Colors.white
                                : AppColors.orange,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: controller.toggleGenderFilter,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          controller.genderFilterSelected != GenderFilter.Male
                              ? AppColors.orange
                              : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                    child: Text(
                      'Female',
                      style: TextStyle(
                        color:
                            controller.genderFilterSelected != GenderFilter.Male
                                ? Colors.white
                                : AppColors.orange,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
