import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/request/uredi_korisnika_request.dart';
import 'package:flutter_application_1/models/response/korisnik_response.dart';
import 'package:flutter_application_1/providers/korisnik_provider.dart';
import 'package:flutter_application_1/utils/auth_utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UrediProfil extends StatefulWidget {
  @override
  UrediProfilState createState() => UrediProfilState();
}

class UrediProfilState extends State<UrediProfil> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _imeController = TextEditingController();
  TextEditingController _prezimeController = TextEditingController();
  // DateTime? _selectedDate;
  KorisnikResponse? result;

  Future<void> _fetchKorisnik() async {
    var korisnikProvider = context.read<KorisnikProvider>();
    var response = await korisnikProvider.getLoggedUser();
    setState(() {
      result = response;
      _usernameController.text = response.username ?? "";
      _imeController.text = response.ime ?? "";
      _prezimeController.text = response.prezime ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchKorisnik();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                child: Text(
                  "Uredi profil",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 250,
                child: TextFormField(
                  controller: _imeController,
                  decoration: InputDecoration(labelText: 'Ime'),
                ),
              ),
              Container(
                width: 250,
                child: TextFormField(
                  controller: _prezimeController,
                  decoration: InputDecoration(labelText: 'Prezime'),
                ),
              ),
              Container(
                width: 250,
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
              ),
              SizedBox(height: 20.0),
              // Container(
              //   child: ElevatedButton(
              //     onPressed: () async {
              //       final _datePickedDate = await showDatePicker(
              //         context: context,
              //         initialDate: DateTime.now(),
              //         firstDate: DateTime(1900),
              //         lastDate: DateTime.now(),
              //       );

              //       if (_datePickedDate != null) {
              //         setState(() {
              //           _selectedDate = DateTime(
              //             _datePickedDate.year,
              //             _datePickedDate.month,
              //             _datePickedDate.day,
              //           );
              //         });
              //       }
              //     },
              //     child: Text(
              //       'Datum rodjenja',
              //       style: TextStyle(
              //         fontFamily: 'Readex Pro',
              //         color: Colors.white,
              //       ),
              //     ),
              //     style: ElevatedButton.styleFrom(
              //       padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
              //       elevation: 3,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //       primary: Theme.of(context).primaryColor,
              //       textStyle: Theme.of(context).textTheme.headline6!.copyWith(
              //             fontFamily: 'Readex Pro',
              //             color: Colors.white,
              //           ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
              //   child: Text(
              //     _selectedDate != null
              //         ? DateFormat('yyyy-MM-dd')
              //             .format(_selectedDate ?? DateTime.now())
              //         : 'Izaberi datum',
              //     style: const TextStyle(
              //       fontFamily: 'Readex Pro',
              //       fontSize: 24,
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: _saveProfile,
                child: const Text('Spasi'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveProfile() async {
    var request = UrediKorisnikaRequest(
        korisnikId: Authorization.id ?? 0,
        username: _usernameController.text,
        ime: _imeController.text,
        prezime: _prezimeController.text);
    var korisnikProvider = context.read<KorisnikProvider>();
    var response = await korisnikProvider.urediKorisnika(request);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _imeController.dispose();
    _prezimeController.dispose();
    super.dispose();
  }
}
