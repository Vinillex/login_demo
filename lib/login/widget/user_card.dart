import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/model/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({required this.user, super.key});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.all(
          20,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFC1A28B),
          ),
          borderRadius: BorderRadius.circular(20),
          color: (user != null) ? null : const Color(0xFFF1EAE4),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFDFCFC2),
                ),
                child: (user != null)
                    ? Image.network(
                        user!.imageUrl,
                        fit: BoxFit.cover,
                      )
                    : const Align(
                        child: Icon(
                          Icons.add,
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AutoSizeText(
              (user != null) ? user!.name : 'Add Account',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF3C2C20),
              ),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
