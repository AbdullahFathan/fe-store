import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Selamat Datang",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Material(
                  type: MaterialType.transparency,
                  child: Ink(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54, width: 3),
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.filter_alt_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}
