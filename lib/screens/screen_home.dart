import 'package:flutter/material.dart';
import 'package:myapp/providers/button_provider.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 32),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 38, height: 19),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Back',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff5DB075),
                        fontSize: 16),
                  ),
                ),
                const SizedBox(width: 71, height: 36),
                const Text(
                  'Feed',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                      fontSize: 30),
                ),
                const SizedBox(width: 39, height: 19),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Filter',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff5DB075),
                        fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xffE8E8E8),
                filled: true,
              ),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 77,
                      width: 343,
                      color: const Color(0xffF6F6F6),
                      child: const ListTile(
                        title: Text(
                          'Header',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xff000000),
                          ),
                        ),
                        subtitle: Text(
                          "He 'll want to use your yacht, and I don't want this thing smelling like fish.",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xff000000),
                          ),
                        ),
                        trailing: Text(
                          "8m ago",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xffBDBDBD),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
      return BottomNavigationBar(
      currentIndex: context.watch<ButtonProvider>().selectedIndex,
      onTap: (index) {
        context.read<ButtonProvider>().selecteButtom(index);
      },
      items: [
        _buildBottomNavigationBarItem(context, 0),
        _buildBottomNavigationBarItem(context, 1),
        _buildBottomNavigationBarItem(context, 2),
        _buildBottomNavigationBarItem(context, 3),
        _buildBottomNavigationBarItem(context, 4),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(BuildContext context, int index) {
    return BottomNavigationBarItem(
      icon: Selector<ButtonProvider, int>(
        selector: (_, provider) => provider.selectedIndex,
        builder: (context, selectedIndex, child) {
          return Icon(
            Icons.circle,
            color: selectedIndex == index ? Color(0xff5DB075) : Color(0xffE8E8E8),
            size: 32,
          );
        },
      ),
      label: '',
    );
  }
}
