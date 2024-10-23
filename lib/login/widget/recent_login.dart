import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/login/widget/user_card.dart';
import 'package:login_ui/model/user.dart';

class RecentLogin extends StatelessWidget {
  RecentLogin({super.key});

  final List<User> _userList = [
    User(
      name: 'Aliana Hepburn',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxctjU21pUENIsGN1F4qY21P7GfdEbhTMp2g&s',
    ),
    User(
      name: 'Andrew Pochink',
      imageUrl:
          'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoSizeText(
            'Welcome to Design Guild',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w600,
              color: Color(0xFF3C2C20),
            ),
            maxLines: 1,
          ),
          const AutoSizeText(
            'Join the world’s largest community for designers',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          const AutoSizeText(
            'Recent Logins',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 156,
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _userList.length + 1,
                primary: true,
                itemBuilder: (context, index) {
                  return UserCard(
                    user: index < _userList.length ? _userList[index] : null,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 20,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
