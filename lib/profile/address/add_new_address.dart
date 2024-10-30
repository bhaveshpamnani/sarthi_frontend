import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/widgets/appbar/appbar.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/device/device_utility.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({super.key});

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

const List<String> country = <String>['India', 'Two', 'Three', 'Four'];
const List<String> state = <String>['Gujarat', 'Two', 'Three', 'Four'];

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  String countryDropdownValue = country.first;
  String stateDropdownValue = country.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SAppBar(
        title: Text('Add New Address'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            SSizes.defaultSpace,
          ),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(
                  height: SSizes.spaceBtwInputField,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: 'Phone',
                  ),
                ),
                const SizedBox(
                  height: SSizes.spaceBtwInputField,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: 'Flat,House no.,Company,Apartment',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: SSizes.spaceBtwInputField,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: 'Street,Area,Sector,Village',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: SSizes.spaceBtwInputField,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: 'City',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: SSizes.spaceBtwInputField,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: 'PinCode',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: SSizes.spaceBtwInputField,
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownMenu<String>(
                        width: SDeviceUtils.getScreenWidth(context)/2-32,
                        initialSelection: state.first,
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            stateDropdownValue = value!;
                          });
                        },
                        dropdownMenuEntries:
                        state.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                    ),
                    const SizedBox(
                      width: SSizes.spaceBtwInputField,
                    ),
                    Expanded(
                      child: DropdownMenu<String>(
                        width: SDeviceUtils.getScreenWidth(context)/2-32,
                        initialSelection: country.first,
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            countryDropdownValue = value!;
                          });
                        },
                        dropdownMenuEntries:
                            country.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: SSizes.spaceBtwInputField,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Save')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
