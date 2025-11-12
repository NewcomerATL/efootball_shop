import 'package:flutter/material.dart';
import 'package:efootball_shop/screens/menu.dart';
import 'package:efootball_shop/screens/productlist_form.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  // Menentukan warna tombol sesuai nama item
  Color _getBackgroundColor() {
    switch (item.name) {
      case "All Products":
        return Colors.blue;
      case "My Products":
        return Colors.green;
      case "Create Product":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _getBackgroundColor(),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content:
                    Text("Kamu telah menekan tombol ${item.name}!"),
              ),
            );

          
          if (item.name == "Create Product") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductFormPage()),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const SizedBox(height: 4),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}