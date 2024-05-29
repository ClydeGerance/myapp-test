import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delegation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DelegationPage(),
    );
  }
}

class DelegationPage extends StatefulWidget {
  @override
  _DelegationPageState createState() => _DelegationPageState();
}

class _DelegationPageState extends State<DelegationPage> {
  String? selectedSalesperson;
  String? selectedCountry;
  String? selectedState;
  String? selectedBusinessModel;
  String? selectedBusinessCategory;

  String? previousCountry;
  String? previousState;
  String? previousBusinessModel;
  String? previousBusinessCategory;

  // Sample salesperson details
  final Map<String, Map<String, String>> salespersonDetails = {
    'Salesperson 1': {
      'country': 'Country 1',
      'state': 'State 1',
      'businessModel': 'Model 1',
      'businessCategory': 'Category 1',
    },
    'Salesperson 2': {
      'country': 'Country 2',
      'state': 'State 2',
      'businessModel': 'Model 2',
      'businessCategory': 'Category 2',
    },
    'Salesperson 3': {
      'country': 'Country 3',
      'state': 'State 3',
      'businessModel': 'Model 3',
      'businessCategory': 'Category 3',
    },
  };

  void updateDetails(String? salesperson) {
    if (salesperson != null && salespersonDetails.containsKey(salesperson)) {
      setState(() {
        selectedCountry = salespersonDetails[salesperson]!['country'];
        selectedState = salespersonDetails[salesperson]!['state'];
        selectedBusinessModel = salespersonDetails[salesperson]!['businessModel'];
        selectedBusinessCategory = salespersonDetails[salesperson]!['businessCategory'];

        previousCountry = selectedCountry;
        previousState = selectedState;
        previousBusinessModel = selectedBusinessModel;
        previousBusinessCategory = selectedBusinessCategory;
      });
    } else {
      setState(() {
        selectedCountry = null;
        selectedState = null;
        selectedBusinessModel = null;
        selectedBusinessCategory = null;
      });
    }
  }

  void resetDetails() {
    setState(() {
      selectedCountry = previousCountry;
      selectedState = previousState;
      selectedBusinessModel = previousBusinessModel;
      selectedBusinessCategory = previousBusinessCategory;
    });
  }

  void applyChanges() {
    if (selectedSalesperson != null) {
      setState(() {
        salespersonDetails[selectedSalesperson!] = {
          'country': selectedCountry!,
          'state': selectedState!,
          'businessModel': selectedBusinessModel!,
          'businessCategory': selectedBusinessCategory!,
        };

        previousCountry = selectedCountry;
        previousState = selectedState;
        previousBusinessModel = selectedBusinessModel;
        previousBusinessCategory = selectedBusinessCategory;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Delegation',
          style: TextStyle(fontWeight: FontWeight.bold), // Make the text bold
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Salesperson',
                  border: OutlineInputBorder(),
                ),
                items: salespersonDetails.keys.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedSalesperson = newValue;
                  });
                  updateDetails(newValue);
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Country',
                        border: OutlineInputBorder(),
                      ),
                      items: ['Country 1', 'Country 2', 'Country 3']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: selectedCountry,
                      onChanged: (newValue) {
                        setState(() {
                          selectedCountry = newValue;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'State',
                        border: OutlineInputBorder(),
                      ),
                      items: ['State 1', 'State 2', 'State 3']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: selectedState,
                      onChanged: (newValue) {
                        setState(() {
                          selectedState = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Business Model',
                        border: OutlineInputBorder(),
                      ),
                      items: ['Model 1', 'Model 2', 'Model 3']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: selectedBusinessModel,
                      onChanged: (newValue) {
                        setState(() {
                          selectedBusinessModel = newValue;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Business Category',
                        border: OutlineInputBorder(),
                      ),
                      items: ['Category 1', 'Category 2', 'Category 3']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: selectedBusinessCategory,
                      onChanged: (newValue) {
                        setState(() {
                          selectedBusinessCategory = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      resetDetails();
                    },
                    child: Text('Reset'),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      applyChanges();
                    },
                    child: Text('Apply'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
