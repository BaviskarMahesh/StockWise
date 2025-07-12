import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stockwise/features/AddItemScreen.dart';
import 'package:stockwise/features/CustomerScreen.dart';
import 'package:stockwise/features/InvoiceScreen.dart';
import 'package:stockwise/features/SaleOrder.dart';
import 'package:stockwise/features/purchaseOrder.dart';

class Itemscreen extends StatefulWidget {
  const Itemscreen({super.key});

  @override
  State<Itemscreen> createState() => _ItemscreenState();
}

class _ItemscreenState extends State<Itemscreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final List<_ListItem> items = [
      _ListItem("Customer", Icons.people, const Customerscreen()),
      _ListItem("Item", Icons.inventory_2, const Additemscreen()),
      _ListItem("Sales Order", Icons.shopping_cart_checkout, const Saleorder()),
      _ListItem("Purchase Order", Icons.receipt_long, const Purchaseorder()),
      _ListItem("Invoice", Icons.receipt, const Invoicescreen()),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xffF2F1FE),
        appBar: AppBar(
          automaticallyImplyLeading: false,  
          title: Text(
            "Items",
            style: TextStyle(fontFamily: 'Font1',
            color: Colors.white,
            fontSize:  height*0.022,),
          ),
          backgroundColor: const Color(0xff7871F8),
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.02),
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (_, __) => SizedBox(height: height * 0.015),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => items[index].screen),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.02,
                      horizontal: width * 0.04,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffF2F1FE),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(items[index].icon, color: const Color(0xff7871F8), size: height * 0.035),
                        SizedBox(width: width * 0.04),
                        Text(
                          items[index].title,
                          style: TextStyle(
                            fontSize: height * 0.022,
                            fontFamily: 'Font1',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ListItem {
  final String title;
  final IconData icon;
  final Widget screen;

  _ListItem(this.title, this.icon, this.screen);
}
