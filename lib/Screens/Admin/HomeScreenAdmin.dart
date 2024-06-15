import 'package:clean_and_green_admin_app/Screens/Admin/Departments.dart';
import 'package:clean_and_green_admin_app/Screens/Admin/Reports.dart';
import 'package:clean_and_green_admin_app/Widgets/Card3D.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Clean & Green',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 35,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.grey,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.grey, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "  Welcome ",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PlayFair'),
              ),
              const Text(
                '      Mohd Abbas',
                style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PlayFair'),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: SizedBox(
                  height: 240,
                  width: 190,
                  child: ThreeDCard(
                      imageUrl:
                          'https://as1.ftcdn.net/v2/jpg/07/05/33/36/1000_F_705333642_NJWDTbflUNh3CCFSxP7ixCMsCNJj6qum.webp',
                      text: "Departrments",
                      onPressed: () {
                        Get.to(() => DepartmentsScreen());
                      }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 240,
                  width: 190,
                  child: ThreeDCard(
                      imageUrl:
                          'https://img.freepik.com/free-vector/hand-drawn-cartoon-business-planning_23-2149158459.jpg?t=st=1718383880~exp=1718387480~hmac=5f9531900839f240a0f009c0eca82f158106720d7317abd71adac06bd5431c4e&w=900',
                      text: "Reports",
                      onPressed: () {
                        Get.to(() => ReportScreen());
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
