// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sarena/colors.dart';
import 'package:sarena/screens/acadlib.dart';
import 'package:sarena/widgets/sidenavbar.dart';

class acadhome extends StatelessWidget {
  const acadhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Academics"), centerTitle: true,
      ),
      drawer: SideNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Explore our full E-Book library",
                          style: GoogleFonts.montserrat(fontSize: 30)),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Explore now",
                              style: GoogleFonts.montserrat(fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: StadiumBorder()),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Explore our full E-Book library customized for academics",
                          style: GoogleFonts.montserrat(fontSize: 30)),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              runApp(MaterialApp(
                                  home: acadLib(),
                                  debugShowCheckedModeBanner: false));
                            },
                            child: Text(
                              "Explore now",
                              style: GoogleFonts.montserrat(fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: StadiumBorder()),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Explore our full E-Book library customized for exams",
                          style: GoogleFonts.montserrat(fontSize: 30)),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Explore now",
                              style: GoogleFonts.montserrat(fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: StadiumBorder()),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
