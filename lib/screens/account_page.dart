import 'package:fe_store/config/theme_data.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(
                      "https://assets.ayobandung.com/crop/0x0:0x0/750x500/webp/photo/2022/06/13/871363699.jpg"),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 10),
                  child: Text(
                    "username@email.com",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.logout_outlined),
            label: Text(
              'Log Out',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(300, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: raisinBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}
