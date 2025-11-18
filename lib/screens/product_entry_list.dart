import 'package:flutter/material.dart';
import 'package:efootball_shop/models/product_entry.dart';
import 'package:efootball_shop/widgets/left_drawer.dart';
import 'package:efootball_shop/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:efootball_shop/screens/product_detail.dart';

class ProductEntryListPage extends StatefulWidget {
  final bool showMyProducts;

  const ProductEntryListPage({super.key, required this.showMyProducts});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  late bool _showMyProducts;

  @override
  void initState() {
    super.initState();
    _showMyProducts = widget.showMyProducts;
  }

  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    final url = _showMyProducts
        ? "http://127.0.0.1:8000/my-products/"
        : "http://127.0.0.1:8000/all-products/";

    final response = await request.get(url);
    return (response as List)
        .map((item) => ProductEntry.fromJson(item))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChoiceChip(
                label: const Text("All Products"),
                selected: !_showMyProducts,
                onSelected: (value) {
                  setState(() {
                    _showMyProducts = false;
                  });
                },
              ),
              const SizedBox(width: 12),
              ChoiceChip(
                label: const Text("My Products"),
                selected: _showMyProducts,
                onSelected: (value) {
                  setState(() {
                    _showMyProducts = true;
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 10),

          Expanded(
            child: FutureBuilder(
              future: fetchProducts(request),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Column(
                    children: const [
                      SizedBox(height: 20),
                      Text(
                        'There are no products available yet.',
                        style:
                            TextStyle(fontSize: 18, color: Color(0xff59A5D8)),
                      ),
                    ],
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => ProductEntryCard(
                    product: snapshot.data![index],
                    onTap: () {
                      // Navigate to product detail page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            product: snapshot.data![index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
