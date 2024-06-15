import 'package:clean_and_green_admin_app/Controllers/AuthController.dart';
import 'package:clean_and_green_admin_app/Controllers/FetchWorker.dart';
import 'package:clean_and_green_admin_app/Models/FetchWorker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InformationDepartmentScreen extends StatefulWidget {
  InformationDepartmentScreen({required this.category, super.key});

  String category;

  @override
  State<InformationDepartmentScreen> createState() =>
      _InformationDepartmentScreenState();
}

class _InformationDepartmentScreenState
    extends State<InformationDepartmentScreen> {
  final MyModelController1 _controller = Get.put(MyModelController1());
  AuthController auth = Get.put(AuthController());

  TextEditingController _searchController = TextEditingController();
  SharedPreferences? _prefs;

  @override
  Widget build(BuildContext context) {
    _controller.fetchAllModels();

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 220, 215, 215),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          ),
          title: Text(
            '${widget.category}',
            style: const TextStyle(
              fontSize: 30,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 221, 216, 216),
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  labelText: 'Search by Name',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                onChanged: (value) {
                  _controller.filterModels(value);
                },
              ),
            ),
            Obx(
              () {
                if (_controller.fworker.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  WorkerFetch? fetchWorker =
                      _controller.fworker.firstWhereOrNull(
                    (fetchWorker) => fetchWorker.designation == widget.category,
                  );

                  // Check if the model was found
                  if (fetchWorker == null) {
                    return const Center(
                        child: Text(
                            'No data available for the current user email'));
                  }
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                        },
                        child: ListView.builder(
                          itemCount: _controller.filteredModels.length,
                          itemBuilder: (context, index) {
                            WorkerFetch fetchWorker =
                                _controller.filteredModels[index];
                            return InkWell(
                              onTap: () {
                                _showWorkerDetailsDialog(context, fetchWorker);
                                // _navigateToNextPage(context, model.email);
                              },
                              child: Card(
                                color: const Color.fromARGB(255, 186, 184, 183),
                                elevation: 3,
                                child: ListTile(
                                  // leading: Icon(Icons.person),
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(fetchWorker.profilePhoto),
                                  ),
                                  title: Text(
                                    fetchWorker.name,
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    fetchWorker.address,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Ptserif',
                                        color: Colors.black),
                                  ),
                                  trailing: Text(
                                    fetchWorker.city,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Roboto',
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showWorkerDetailsDialog(
      BuildContext context, WorkerFetch fetchWorker) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Worker Details',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: ${fetchWorker.name}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'Address: ${fetchWorker.address}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'Designation: ${fetchWorker.designation}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'Organization: ${fetchWorker.organization}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'Mobile Number: ${fetchWorker.mobileNumber}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'Email: ${fetchWorker.email}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                'Close',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        );
      },
    );
  }
}
