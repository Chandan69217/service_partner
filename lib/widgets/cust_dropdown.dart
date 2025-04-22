// import 'package:animated_custom_dropdown/custom_dropdown.dart';
// import 'package:flutter/material.dart';
//
//
// class CustDropdown<T> extends StatelessWidget {
//
//   final String hintText;
//   final List<T> items;
//   final bool excludeSelected;
//   final ValueChanged<T?>? onChanged;
//   final String? Function(T?)? validator;
//
//   const CustDropdown.search({
//     Key? key,
//     required this.hintText,
//     required this.items,
//     required this.excludeSelected,
//     this.validator,
//     this.onChanged,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     return   CustomDropdown<T>.search(
//       decoration: CustomDropdownDecoration(
//           closedBorderRadius: BorderRadius.circular(screenWidth * 0.013),
//           closedErrorBorderRadius: BorderRadius.circular(screenWidth * 0.013),
//           closedBorder: Border.all(),
//           headerStyle: TextStyle(
//               fontSize: screenWidth * 0.04,
//               fontWeight: FontWeight.normal
//           ),
//           errorStyle: TextStyle(
//               fontSize: screenWidth * 0.03,
//               fontWeight: FontWeight.normal
//           ),
//           hintStyle: TextStyle(
//               fontSize: screenWidth * 0.04,
//               fontWeight: FontWeight.normal,
//               color: Colors.grey
//           ),
//           listItemStyle:  TextStyle(
//               fontSize: screenWidth * 0.04,
//               fontWeight: FontWeight.normal
//           ),
//           searchFieldDecoration: SearchFieldDecoration(
//               hintStyle: TextStyle(
//                   fontSize: screenWidth * 0.04,
//                   fontWeight: FontWeight.normal,
//                   color: Colors.grey
//               ),
//               contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.3),
//               textStyle: TextStyle(
//                   fontSize: screenWidth * 0.04,
//                   fontWeight: FontWeight.normal
//               )
//           ),
//           closedFillColor: Colors.transparent
//       ),
//       closedHeaderPadding: EdgeInsets.symmetric(
//           horizontal: screenWidth * 0.028,vertical: screenWidth * 0.035),
//       validator: validator,
//       hintText: hintText,
//       items: items,
//       excludeSelected: false,
//       onChanged: onChanged,
//     );
//   }
// }
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class CustDropdown<T> extends StatefulWidget {
  final String hintText;
  final List<T> items;
  final bool excludeSelected;
  final ValueChanged<T?>? onChanged;
  final T? value;
  final String? Function(T?)? validator;

  const CustDropdown({
    Key? key,
    required this.hintText,
    required this.items,
    required this.excludeSelected,
    this.validator,
    this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  _CustDropdownState<T> createState() => _CustDropdownState<T>();
}

class _CustDropdownState<T> extends State<CustDropdown<T>> {
  T? selectedValue;
  final OverlayPortalController controller = OverlayPortalController();

  @override
  void initState() {
    super.initState();

  }

  void _openDropdown() async {
    T? result = await showDialog<T>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        double screenWidth = MediaQuery.of(context).size.width;
        return Dialog(
          insetPadding: EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          child: Center(
            child: SizedBox(
              width: screenWidth * 0.9,
              child: CustomDropdown<T>.search(
                overlayController: controller,
                canCloseOutsideBounds: false,
                decoration: CustomDropdownDecoration(
                  closedBorderRadius: BorderRadius.circular(screenWidth * 0.04),
                  closedErrorBorderRadius: BorderRadius.circular(screenWidth * 0.013),
                  expandedBorderRadius: BorderRadius.circular(screenWidth * 0.04),
                  closedBorder: Border(),
                  headerStyle: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.normal,
                  ),
                  errorStyle: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.normal,
                  ),
                  hintStyle: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                  listItemStyle: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.normal,
                  ),
                  searchFieldDecoration: SearchFieldDecoration(
                    hintStyle: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.3),
                    textStyle: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  closedFillColor: Colors.white,
                ),
                closedHeaderPadding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.028,
                  vertical: screenWidth * 0.035,
                ),
                validator: widget.validator,
                hintText: widget.hintText,
                items: widget.items,
                excludeSelected: widget.excludeSelected,
                onChanged: (value) {
                  Navigator.of(context).pop(value);
                },
              ),
            ),
          ),
        );
      },
    );

    if (result != null) {
      setState(() {
        selectedValue = result;
      });
      if (widget.onChanged != null) {
        widget.onChanged!(result);
      }
    }
  }

  String _getDisplayText() {
    final current = widget.value ?? selectedValue;
    return current != null ? current.toString() : widget.hintText;
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        _openDropdown();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.show();
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02,vertical: screenWidth * 0.025),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(screenWidth * 0.013),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  _getDisplayText(),
                    style: TextStyle(fontSize: screenWidth * 0.04,height: 1),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Icon(Icons.keyboard_arrow_down_rounded,size: screenWidth * 0.06,),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant CustDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      setState(() {
        selectedValue = widget.value;
      });
    }
  }


}


