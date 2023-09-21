import 'package:disaster_management/screens/user_pages.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class FormsUser extends StatefulWidget {
  @override
  State<FormsUser> createState() => _FormsUserState();
}

class _FormsUserState extends State<FormsUser> {
  TextEditingController _locationController = TextEditingController();
  final List<String> disasterTypes = ['Flood', 'Earthquake', 'Fire', 'Tornado'];

  final List<String> sinceTypes = [
    '10 minutes',
    '30 mins',
    '1 hour',
    'More than 1 hour'
  ];

  void getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
    _locationController.text = '${position.latitude}, ${position.longitude}';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Type of Disaster',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField<String>(
                  value: null, // Initial value
                  items: disasterTypes.map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    print('Selected Disaster Type: $newValue');
                  },
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Time Since Disaster (Approx)',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField<String>(
                  value: null,
                  items: sinceTypes.map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    print('Selected Since Type: $newValue');
                  },
                ),
                const SizedBox(
                  height: 35,
                ),
                TextField(
                  controller: _locationController,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Enter your location here',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () => getLocation(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 65),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        color: Color.fromARGB(255, 19, 41, 61),
                      ),
                      child: const Text(
                        'Get Location',
                        style: TextStyle(
                            color: Color.fromARGB(255, 223, 235, 246),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserPage(),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 65),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        color: Color.fromARGB(255, 19, 41, 61),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            color: Color.fromARGB(255, 223, 235, 246),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
