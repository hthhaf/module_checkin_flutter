import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_check_in_app/state/providers/auth_provider.dart';
import 'package:flutter_check_in_app/state/services/local/shared_preferences.dart';
import 'package:flutter_check_in_app/state/services/local/shared_references_key.dart';
import 'package:flutter_check_in_app/ulitites/colors.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:provider/provider.dart';

import '../../../../../state/providers/seat_provider.dart';
import '../../../../../state/services/apis/retrieve_pnr_api.dart';
import '../../info/info_screen.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  State<SearchForm> createState() => _SearchForm();
}

class _SearchForm extends State<SearchForm> {
  var _formKey = GlobalKey<FormState>();
  bool _getDataFailed = false;
  final _formData = <String, dynamic>{
    "confirmationNumber": '',
    "lastname": '',
  };

  Future<void> _getPnr(BuildContext context) async {
    ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog.style(
      progressWidget: const CircularProgressIndicator(),
    );

    try {
      progressDialog.show();
      context.read<AuthProvider>().auth;
      await RetrievePnrApi.retrievePNR(
        confirmationNumber: _formData['confirmationNumber'].trim(),
        lastname: _formData['lastname'].trim(),
      );

      final pnr = await SharedRServices().getString(SharedPnr.pnr);
      final decodedPnr = json.decode(pnr);

      final logicalFlight = decodedPnr['airlines'][0]['logicalFlight'][0];

      final physicalFlights = logicalFlight['physicalFlights'][0];

      final customers = physicalFlights['customers'][0];
      progressDialog.hide();
      if (decodedPnr['confirmationNumber'] != null) {
        // ignore: use_build_context_synchronously

        String lastname = customers['airlinePersons'][0]['lastName'];
        String inputLastname = _formData['lastname'].trim().toUpperCase();
        if (lastname == inputLastname) {
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const InfoScreen();
              },
            ),
          );
        } else {
          setState(() {
            _getDataFailed = true;
          });
        }
      } else {
        setState(() {
          _getDataFailed = true;
        });
      }
    } catch (error) {
      setState(() {
        _getDataFailed = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      margin: const EdgeInsets.fromLTRB(20, 2, 20, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "    Mã đặt chỗ",
              style: TextStyle(
                  height: 2, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            pnrField(),
            const SizedBox(height: 8),
            const Text(
              "    Họ",
              style: TextStyle(
                  height: 2, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            lastnameField(),
            if (_getDataFailed)
              Container(
                padding: const EdgeInsets.all(12),
                child: const Text(
                  'Không tìm thấy PNR',
                  style: TextStyle(
                    color: red,
                  ),
                ),
              ),
            const SizedBox(height: 30),
            btn(),
          ],
        ),
      ),
    );
  }

  Container pnrField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: bg,
          filled: true,
          hintText: "",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: priBlue.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Nhập mã đặt chỗ';
          }
          return null;
        },
        onTap: () {
          setState(() {
            _getDataFailed = false;
          });
        },
        onSaved: (value) {
          _formData['confirmationNumber'] = value!;
        },
      ),
    );
  }

  Container lastnameField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: bg,
          filled: true,
          hintText: "",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: priBlue.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Nhập họ của bạn';
          }
          return null;
        },
        onTap: () {
          setState(() {
            _getDataFailed = false;
          });
        },
        onSaved: (value) {
          _formData['lastname'] = value!;
        },
      ),
    );
  }

  Align btn() {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            _getPnr(context);
            Provider.of<SeatProvider>(context, listen: false).reset();
          }
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
            backgroundColor: yellow,
            shape: const StadiumBorder()),
        child: const Text(
          "TÌM KIẾM",
          style: TextStyle(
              color: textBlue, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
