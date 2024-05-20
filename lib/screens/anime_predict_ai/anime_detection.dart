import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../constants/constant.dart';
import '../home/user_home_page.dart';

class AnemiaPredictionForm extends StatefulWidget {
  const AnemiaPredictionForm({super.key});

  @override
  _AnemiaPredictionFormState createState() => _AnemiaPredictionFormState();
}

class _AnemiaPredictionFormState extends State<AnemiaPredictionForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  String? _selectedGender;



  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _formData['Gender'] = _selectedGender!;

      debugPrint("Form Data: $_formData");

      try {
        final response = await http.post(
          Uri.parse('http://10.0.2.2:5000/predict'),
          headers: {"Content-Type": "application/json"},
          body: json.encode(_formData),
        );

        debugPrint("Response Status Code: ${response.statusCode}");
        debugPrint("Response Body: ${response.body}");

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          debugPrint("Response Data: $responseData");
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Prediction Result'),
              content: Text(responseData['message'] ?? 'No result found'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Okay'),
                  onPressed: () {
                                Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomePage(),), (route) => false);
                  },
                ),
              ],
            ),
          );
        } else {
          _showErrorDialog('Server error: ${response.statusCode}');
          final responseData = json.decode(response.body);
          debugPrint('Server error: ${responseData['error']}');
        }
      } catch (error) {
        _showErrorDialog('An error occurred: $error');
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  void _showInfoDialog(String feature,String description ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Information about $feature'),
        content: Text(description),
        actions: <Widget>[
          TextButton(
            child: const Text('Okay'),
            onPressed: () {
             Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anemia Prediction Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Gender'),
                value: _selectedGender,
                items: const [
                  DropdownMenuItem(
                    value: '1',
                    child: Text('Male'),
                  ),
                  DropdownMenuItem(
                    value: '0',
                    child: Text('Female'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a gender';
                  }
                  return null;
                },
              ),
              ...inputFeatures.map((feature) {
                return Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: feature,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.info_outline), 
                            onPressed: () => _showInfoDialog(feature,feature == "Hemoglobin"? "This is the percentage of blood volume that is occupied by red blood cells. It is a measure of the oxygen-carrying capacity of blood. ": feature == "MCH"? "Mean corpuscular hemoglobin (MCH) is the average amount of hemoglobin in a red blood cell." : feature == "MCHC"? "Mean corpuscular hemoglobin concentration (MCHC) is the average concentration of hemoglobin in a given volume of red blood cells." : "Mean corpuscular volume (MCV) is the average volume of a red blood cell.",
                          ),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter $feature';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _formData[feature] = value!;
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
