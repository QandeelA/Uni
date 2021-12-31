import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'DonorHome.dart';
import 'Login.dart';
import 'Profile.dart';
import 'SplashScreen.dart';
import 'TipsAndNews.dart';
import 'WhoCanDonate.dart';
class LoginDonor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black26,
          title: Text('Request for Blood '),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.red,
            child: ListView(
              // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Images/data.png"),
                          fit: BoxFit.cover,
                        )
                    ), child: null,
                  ),
                  ListTile(
                    title: const Text('Tips and News'),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              TipsAndNews())); // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Profile'),
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              ProfileApp())); // Update the state of the app.
                      // ...
                    },
                  ),

                  ListTile(
                    title: const Text('Donor Information'),

                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(
                          builder: (context) => DonorHome()));
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Who can Donate?'),

                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => donate()));
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Log Out'),

                    onTap: () {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (context) => blooddonation()));
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ]
            ),
          ),
        ),
        backgroundColor: Colors.red,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: LoginDonorPage(),
          ),
        ),
      ),
    );
  }
}

class LoginDonorPage extends StatefulWidget {
  const LoginDonorPage({Key key}) : super(key: key);

  @override
  _LoginDonorPageState createState() => _LoginDonorPageState();
}

class _LoginDonorPageState extends State<LoginDonorPage> {
  String _bloodType = 'A+', v = "A+";
  @override
  Widget build(BuildContext context) {
    const elementsSpacer = SizedBox(height: 16);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              //  key: _formKey,
              child: Column(
                children: [
                  _patientNameField(),
                  elementsSpacer,
                  _contactNumberField(),
                  elementsSpacer,
                  //  _bloodTypeSelector(),
                  elementsSpacer,
                  _medicalCenterSelector(),
                  elementsSpacer,
                  _requestDatePicker(),
                  elementsSpacer,
                  _noteField(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child:RawMaterialButton(
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      fillColor: Colors.deepOrangeAccent,
                      elevation: 10.0,
                      constraints: BoxConstraints.tightFor(width: 60.0, height: 60.0),
                      shape: CircleBorder(),
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => Login_Page()));
                        //Send to API
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _submit() async {


  }

  Widget _patientNameField() => TextFormField(
    // controller: _patientNameController,
    keyboardType: TextInputType.name,
    textCapitalization: TextCapitalization.words,
    // validator: (v) => Validators.required(v, 'Patient name'),
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Patient Name',
    ),
  );

  Widget _contactNumberField() => TextFormField(
    //controller: _contactNumberController,
    keyboardType: TextInputType.phone,
    // validator: (v) =>
    // Validators.required(v, 'Contact number') ?? Validators.phone(v),
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Contact number',
      prefixText: '+92 ',
    ),
  );

  Widget _noteField() => TextFormField(
    //controller: _noteController,
    keyboardType: TextInputType.multiline,
    textCapitalization: TextCapitalization.sentences,
    minLines: 3,
    maxLines: 5,
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Notes (Optional)',
      alignLabelWithHint: true,
    ),
  );

  /* Widget _bloodTypeSelector() => DropdownButtonFormField<String>(
   value: _bloodType,
   onChanged: (v) => setState(() => _bloodType = v!),
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Blood Type',
    ),
   items: BloodTypeUtils.bloodTypes
        .map((v) => DropdownMenuItem(value: v, child: Text(v)))
      .toList(),
  );*/

  Widget _medicalCenterSelector() => GestureDetector(
    /*onTap: () async {
      final picked = await showModalBottomSheet<MedicalCenter>(
        context: context,
        builder: (_) => const MedicalCenterPicker(),
        isScrollControlled: true,
      );
      if (picked != null) {
        setState(() => _medicalCenter = picked);
      }
    },*/
    child: AbsorbPointer(
      child: TextFormField(
        //  key: ValueKey<String>(_medicalCenter?.name ?? 'none'),
        //  initialValue: _medicalCenter?.name,
        // validator: (_) => _medicalCenter == null
        //     ? '* Please select a medical center'
        //     : null,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Medical Center',
        ),
      ),
    ),
  );

  Widget _requestDatePicker() => GestureDetector(
    onTap: () async {
      final today = DateTime.now();
      final picked = await showDatePicker(
        context: context,
        initialDate: today,
        firstDate: today,
        lastDate: today.add(const Duration(days: 365)),
      );
      if (picked != null) {
        //   setState(() => _requestDate = picked);
      }
    },
    child: AbsorbPointer(
      child: TextFormField(
        //  key: ValueKey<DateTime>(_requestDate ?? DateTime.now()),
        //  initialValue: Tools.formatDate(_requestDate),
        //  validator: (_) =>
        //    _requestDate == null ? '* Please select a date' : null,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Request date',
          helperText: 'The date on which you need the blood to be ready',
        ),
      ),
    ),
  );

  void _resetFields() {
    //  _patientNameController.clear();
    //   _contactNumberController.clear();
    //   _noteController.clear();
    setState(() {
      //    _requestDate = null;
      //   _medicalCenter = null;
    });
  }
}

class BloodTypeUtils {
  static var bloodTypes;
}
