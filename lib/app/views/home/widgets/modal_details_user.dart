import 'package:coodesh_challenge_f2/app/models/user.dart';
import 'package:coodesh_challenge_f2/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unicons/unicons.dart';

class ModalDetailsUser extends StatelessWidget {
  final User user;

  const ModalDetailsUser({
    Key? key,
    required this.user,
  }) : super(key: key);

  static final dformat = DateFormat('dd/MM/yyyy');

  Widget _buildItemData({
    required IconData icon,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.orange),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: AppColors.skyBlue,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.fromLTRB(10, 60, 10, 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${user.name!.first} ${user.name!.last}',
                style: TextStyle(
                  color: AppColors.skyBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'ID: ${user.id!.value ?? "unavailable"}',
                style: TextStyle(
                  color: AppColors.skyBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildItemData(
                icon: UniconsLine.envelope,
                value: user.email!,
              ),
              _buildItemData(
                icon: user.gender == 'male'
                    ? UniconsLine.mars
                    : UniconsLine.venus,
                value: user.gender!,
              ),
              _buildItemData(
                icon: UniconsLine.gift,
                value: dformat.format(DateTime.parse(user.dob!.date!)),
              ),
              _buildItemData(
                icon: UniconsLine.globe,
                value: user.nat!,
              ),
              _buildItemData(
                icon: UniconsLine.phone,
                value: user.phone!,
              ),
              _buildItemData(
                icon: UniconsLine.map_marker,
                value:
                    '${user.location!.street}, ${user.location!.city}, ${user.location!.state}, ${user.location!.postcode}',
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 5, color: AppColors.orange),
              image: DecorationImage(
                image: NetworkImage(user.picture!.large!),
              ),
            ),
          ),
        ),
        Positioned(
          top: 60,
          right: 10,
          child: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.grey,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }
}
