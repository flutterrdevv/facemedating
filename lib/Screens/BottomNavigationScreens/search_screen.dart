import 'package:flutter/material.dart';
import 'package:tinder/constant.dart';
import 'package:tinder/widgets/custom_textfield.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({
    Key? key,
  }) : super(key: key);
  static String id = 'searchScreen';
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextField(
                    controller: searchController,
                    icon: Icons.search,
                    hint: '',
                    label: 'Search Friends, topics, trends'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Friends',
                      style: TextStyle(
                          color: kSecondaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Hashtags',
                      style: TextStyle(color: Colors.grey, fontSize: 17),
                    ),
                    const Text(
                      'Topics',
                      style: TextStyle(color: Colors.grey, fontSize: 17),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Image(image: AssetImage('assets/search/1.png')),
                    Image(image: AssetImage('assets/search/2.png')),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Image(image: AssetImage('assets/search/3.png')),
                    Image(image: AssetImage('assets/search/4.png')),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Trends',
                  style: TextStyle(color: kSecondaryColor, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Image(image: AssetImage('assets/search/5.png')),
                    Image(image: AssetImage('assets/search/6.png')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
