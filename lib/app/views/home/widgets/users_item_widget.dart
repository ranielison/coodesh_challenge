import 'package:coodesh_challenge_f2/app/models/user.dart';
import 'package:coodesh_challenge_f2/app/utils/app_colors.dart';
import 'package:coodesh_challenge_f2/app/views/home/widgets/modal_details_user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unicons/unicons.dart';

class UserItemWidget extends StatelessWidget {
  final User user;

  static final dformat = DateFormat('dd/MM/yyyy');

  const UserItemWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (_) {
            return ModalDetailsUser(
              user: user,
            );
          },
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                height: 45,
                width: 45,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(user.picture!.medium!),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${user.name!.first!} ${user.name!.last!}',
                          style: TextStyle(
                            color: AppColors.navyBlue,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          UniconsLine.globe,
                          color: AppColors.skyBlue,
                          size: 20,
                        ),
                        SizedBox(width: 3),
                        Text(
                          user.nat!,
                          style: TextStyle(
                            color: AppColors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          user.gender!,
                          style: TextStyle(
                            color: AppColors.skyBlue,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          dformat
                              .format(DateTime.parse(user.registered!.date!)),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
