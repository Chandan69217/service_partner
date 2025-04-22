import 'dart:convert';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:service_partner/models/district_list.dart';
import 'package:service_partner/models/state_list.dart';
import 'package:service_partner/utilities/cust_colors.dart';
import 'package:service_partner/utilities/get_address_from_api/get_address.dart';
import 'package:service_partner/widgets/cust_loader.dart';
import '../../models/city_list.dart';
import '../../utilities/api_urls.dart';
import '../../utilities/handle_https_response.dart';
import '../../widgets/cust_dropdown.dart';
import '../../widgets/cust_snack_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';




class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _otpControllers = List.generate(6, (_) => TextEditingController());
  String? _selectedGroup;
  String? _selectedState;
  String? _selectedDistrict;
  String? _selectedCity;
  bool _passwordVisibility = false;
  bool _confirmPasswordVisibility = false;
  DistrictList _districtList = DistrictList.fromJson({});
  CityList _cityList = CityList.fromJson({});
  final _formKey = GlobalKey<FormState>();
  bool otpSent = false;
  bool _isLoading = false;
  bool isLoadingDistricts = false;
  bool isLoadingCities = false;
  final List<String> groupNames = [
    "User",
    "Customer",
    "Influencer",
    "Channel Partner"
  ];

  @override
  void initState() {
    super.initState();
  }

  void _getDistrictList(String stateName)async{
    isLoadingDistricts = true;
    _districtList = await GetAddress().getDistrictList(context, stateName);
    setState(() {
    });
  }

  void _getCityList(String distrName)async{
    isLoadingCities = true;
    _cityList = await GetAddress().getCityList(context, distrName);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("User Registration",
            style: TextStyle(fontSize: screenWidth * 0.05)),
        backgroundColor: CustColors.nile_blue,
        foregroundColor: CustColors.white,
        titleSpacing: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: FutureBuilder(
            future: GetAddress().getStateList(context),
            builder: (context,snapshot) {
              if(snapshot.hasData){
                return SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.03),
                        // Full Name Field (firstname)
                        CustomFormTextField(
                          controller: _nameController,
                          label: 'Full Name',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                  
                        CustomFormTextField(
                          controller: _mobileController,
                          label: 'Mobile Number',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your mobile number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: screenWidth * 0.02,),
                        Text('Select type of account'),
                        SizedBox(height: screenWidth * 0.02,),
                        // GroupTypeSelector(
                        //   onSelected: (value){
                        //     _selectedGroup = value;
                        //   },
                        // ),
                        CustDropdown<String>(
                          hintText: 'Select Group',
                          items: groupNames,
                          excludeSelected: false,
                          onChanged: (value) {
                            if(value != null){
                              setState((){
                                _selectedGroup = value;
                              });
                            }
                          },
                        ),
                        SizedBox(
                          height: screenWidth * 0.02,
                        ),
                        // State Field
                        Text('Address', style: TextStyle(height: 2)),
                  
                        StatefulBuilder(
                          builder: (context,refresh) => GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: screenWidth < 375 ? 3 :3.8,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              // CustDropdown<StateList>.search(
                              //   validator: (value) {
                              //     if (value == null) {
                              //       return 'Please select your state';
                              //     } else {
                              //       return null;
                              //     }
                              //   },
                              //   hintText: 'Select State',
                              //   items: _stateList,
                              //   excludeSelected: false,
                              //   onChanged: (value) {
                              //     log('changing value to: $value');
                              //   },
                              // ),
                              //
                              // CustDropdown<StateList>.search(
                              //   validator: (value) {
                              //     if (value == null) {
                              //       return 'Please select your district';
                              //     } else {
                              //       return null;
                              //     }
                              //   },
                              //   hintText: 'Select district',
                              //   items: _stateList,
                              //   excludeSelected: false,
                              //   onChanged: (value) {
                              //     log('changing value to: $value');
                              //   },
                              // ),
                              // CustDropdown<StateList>.search(
                              //   validator: (value) {
                              //     if (value == null) {
                              //       return 'Please select your city';
                              //     } else {
                              //       return null;
                              //     }
                              //   },
                              //   hintText: 'Select city',
                              //   items: _stateList,
                              //   excludeSelected: false,
                              //   onChanged: (value) {
                              //     log('changing value to: $value');
                              //   },
                              // )

                              CustDropdown<StateList>(
                                hintText: 'Select State',
                                items: snapshot.data!,
                                excludeSelected: false,
                                onChanged: (value) {
                                  if(value != null){
                                    refresh((){
                                      isLoadingDistricts = false;
                                      isLoadingCities = false;
                                      _selectedState = value.stat;
                                      _selectedDistrict = null;
                                      _selectedCity = null;
                                      _districtList = DistrictList.fromJson({});
                                      if(_selectedState != null)
                                        _getDistrictList(_selectedState!);
                                    });
                                  }
                                },
                              ),
                              Visibility(
                                visible: _selectedState != null && isLoadingDistricts,
                                child: CustDropdown<String>(
                                  hintText: 'Select District',
                                  value: _selectedDistrict,
                                  items: _districtList.distr,
                                  excludeSelected: false,
                                  onChanged: (value) {
                                    if(value != null){
                                      refresh((){
                                        isLoadingCities = false;
                                        _selectedDistrict = value;
                                        _selectedCity = null;
                                        _cityList = CityList.fromJson({});
                                        if(_selectedDistrict != null)
                                          _getCityList(_selectedDistrict!);
                                      });
                                    }
                                  },
                                ),
                              ),
                              Visibility(
                                visible: _selectedDistrict != null && isLoadingCities,
                                child: CustDropdown<String>(
                                  hintText: 'Select City',
                                  items: _cityList.city,
                                  value: _selectedCity,
                                  excludeSelected: false,
                                  onChanged: (value) {
                                    if(value != null){
                                      refresh((){
                                        _selectedCity = value;
                                      });
                                    }
                                  },
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenWidth * 0.02,
                        ),
                        // Password Field
                        CustomFormTextField(
                          controller: _passwordController,
                          obscureText: !_passwordVisibility,
                          label: 'Password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordVisibility = !_passwordVisibility;
                                });
                              },
                              icon: Icon(_passwordVisibility
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        // Confirm Password Field
                        CustomFormTextField(
                          controller: _confirmPasswordController,
                          obscureText: !_confirmPasswordVisibility,
                          label: 'Confirm Password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _confirmPasswordVisibility =
                                  !_confirmPasswordVisibility;
                                });
                              },
                              icon: Icon(_confirmPasswordVisibility
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: screenWidth * 0.1,
                        ),
                        // Submit Button
                        _isLoading ? CustLoader():CustomElevatedButton(
                          text: 'Register',
                          onPressed: ()async {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            if(_selectedGroup == null){
                              showSnackBar(context: context, title: 'Please Select Account Type', message: '',contentType: ContentType.warning);
                              return;
                            }
                            if(_selectedState == null){
                              showSnackBar(context: context, title: 'Empty', message: 'Please Select State ',contentType: ContentType.warning);
                              return;
                            }
                            if(_selectedDistrict == null){
                              showSnackBar(context: context, title: 'Empty', message: 'Please Select District',contentType: ContentType.warning);
                              return;
                            }
                            if(_selectedCity == null){
                              showSnackBar(context: context, title: 'Empty', message: 'Please Select City',contentType: ContentType.warning);
                              return;
                            }
                            _register();
                          },
                        ),
                        SizedBox(
                          height: screenWidth * 0.02,
                        ),
                      ],
                    ),
                  ),
                );
              }else{
                return Center(child: CustLoader(color: CustColors.nile_blue,));
              }
            }
        ),
      ),
    );
  }

  _register() async {
    if (_formKey.currentState!.validate()) {
      final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();
      if (!(connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.ethernet))) {
        showSnackBar(
            context: context,
            title: 'No Internet',
            message: 'Your are not connected to any internet provider');
        return;
      }
      setState(() {
        _isLoading = true;
      });

      try {
        var uri = Uri.https(Urls.base_url,Urls.register);

        var body = json.encode({
          'firstname': _nameController.text,
          'contactno': _mobileController.text,
          'group_name': _selectedGroup,
          'state': _selectedState,
          'district': _selectedDistrict,
          'city': _selectedCity,
          'password': _passwordController.text,
        });

        var response = await post(uri, body: body, headers: {
          'Content-Type': 'application/json',
        });

        // Check the response status code and handle accordingly

        if (response.statusCode == 201) {
          var rawData = json.decode(response.body);
          showSnackBar(
            context: context,
            title: 'Registration Completed !!',
            message: "Thank you for Registering !!",
            contentType: ContentType.success,
          );
          Navigator.pop(context);
        } else if (response.statusCode == 200) {
          var rawData = json.decode(response.body);
          showSnackBar(
            context: context,
            title: 'Success',
            message: "Operation completed successfully.",
            contentType: ContentType.success,
          );
        } else if (response.statusCode == 400) {
          var rawData = json.decode(response.body);
          String errorMessage = rawData['message'] ?? "Bad Request. Please check your input.";
          showSnackBar(
            context: context,
            title: 'Error',
            message: errorMessage,
            contentType: ContentType.failure,
          );
        } else if (response.statusCode == 401) {
          showSnackBar(
            context: context,
            title: 'Unauthorized',
            message: "You are not authorized to perform this action.",
            contentType: ContentType.failure,
          );
        } else if (response.statusCode == 403) {
          showSnackBar(
            context: context,
            title: 'Forbidden',
            message: "Access is forbidden. You might not have the required permissions.",
            contentType: ContentType.failure,
          );
        } else if (response.statusCode == 404) {
          showSnackBar(
            context: context,
            title: 'Not Found',
            message: "Requested resource not found.",
            contentType: ContentType.failure,
          );
        } else if (response.statusCode >= 500 && response.statusCode < 600) {
          showSnackBar(
            context: context,
            title: 'Server Error',
            message: "An error occurred on the server. Please try again later.",
            contentType: ContentType.failure,
          );
        } else {
          showSnackBar(
            context: context,
            title: 'Error',
            message: "An unexpected error occurred. Status code: ${response.statusCode}",
            contentType: ContentType.failure,
          );
        }
      } catch (exception, trace) {
        print('Exception: $exception, Trace: $trace');
        showSnackBar(
            context: context,
            title: 'Opps!',
            message: 'Network or server error, please check your connection.');
      }
      setState(() {
        _isLoading = false;
      });
    }
  }


}

class GroupTypeSelector extends StatefulWidget {
  final Function(String groupType)? onSelected;
  GroupTypeSelector({this.onSelected});
  @override
  _GroupTypeSelectorState createState() => _GroupTypeSelectorState();
}

class _GroupTypeSelectorState extends State<GroupTypeSelector> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      if (widget.onSelected != null) {
        widget.onSelected!(selectedGroup);
      }
    });
  }

  final List<String> groupNames = [
    "User",
    "Customer",
    "Influencer",
    "Channel Partner"
  ];

  String selectedGroup = "Retailer";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Wrap(
      spacing: 8.0,
      children: groupNames.map((group) {
        return ChoiceChip(
          label: Text(
            group,
            style: TextStyle(fontSize: screenWidth * 0.04,fontWeight: FontWeight.normal),
          ),
          selected: selectedGroup == group,
          selectedColor: CustColors.nile_blue,
          checkmarkColor: Colors.white,
          labelPadding: EdgeInsets.zero,
          backgroundColor: Colors.grey[200],
          labelStyle: TextStyle(
            color: selectedGroup == group ? Colors.white : Colors.black,
          ),
          onSelected: (bool selected) {
            setState(() {
              selectedGroup = group;
            });
          },
        );
      }).toList(),
    );
  }
}







class DropDownAlertExample extends StatefulWidget {
  @override
  _DropDownAlertExampleState createState() => _DropDownAlertExampleState();
}

class _DropDownAlertExampleState extends State<DropDownAlertExample> {
  String? selectedValue;

  final List<String> groupNames = [
    "User",
    "Customer",
    "Influencer",
    "Channel Partner"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drop-down in Alert")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container to display selected value
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                selectedValue ?? "No selection yet",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                showDropDownDialog(context);
              },
              child: Text("Select Group"),
            ),
          ],
        ),
      ),
    );
  }


  void showDropDownDialog(BuildContext context) {
    String? tempSelectedValue = selectedValue; // Store temporary value
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select a Group"),
          content: StatefulBuilder(
            builder: (context, setState) {
              return DropdownButton<String>(
                value: tempSelectedValue,
                hint: Text("Choose an option"),
                isExpanded: true,
                items: groupNames.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    tempSelectedValue = newValue;
                  });
                },
              );
            },
          ),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                if (tempSelectedValue != null) {
                  setState(() {
                    selectedValue = tempSelectedValue; // Update main UI
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }
}