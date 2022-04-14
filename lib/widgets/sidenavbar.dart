import 'package:flutter/material.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            ListItem(
              label: "Hello World",
              icon: Icons.quiz
            )
          ],
        ),
      ),
    );
  }

  Widget ListItem({
    required String label,
    required IconData icon
  }){
    final color = Colors.white;
    final hoverColor = Colors.white60;

    return ListTile(
      leading: Icon(icon, color: color,),
      title: Text(label,),
      onTap: () {
      
      },
    );
  }
}