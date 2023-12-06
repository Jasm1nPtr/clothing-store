import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../routes/app_pages.dart';
import '../../../widget/navbar.dart';
import '../controllers/database_helper.dart';
import '../controllers/shoppingcart_models.dart';
import 'add_shopping_cart.dart';

class ShoppingCartView extends StatefulWidget {
  @override
  _ShoppingCartViewState createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  List<ShoppingCartModels> data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Metode untuk mengisi daftar belanja dari database menggunakan DatabaseHelper
  _loadData() async {
    try {
      List<ShoppingCartModels> shoppingCart =
          await DatabaseHelper.instance.getShoppingCart();

      setState(() {
        data = shoppingCart;
      });
    } catch (e) {
      print("Error loading data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Get.toNamed(Routes.HOMEPAGE);
          },
        ),
        title: Text(
          'Shopping Cart',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () async {
              bool? result = await Get.to<bool>(() => const AddItems());

              if (result == true) {
                _loadData();
              }
            },
          ),
        ],
      ),
      body: data.isEmpty
          ? Center(
              child: Text('There are no items checked out yet'),
            )
          : Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(data[index].title),
                      subtitle: Text(data[index].price),
                      leading: Checkbox(
                        value: data[index].isCheckOut,
                        onChanged: (value) async {
                          setState(() {
                            data[index].isCheckOut = value!;
                          });

                          DatabaseHelper.instance
                              .updateShoppingCart(data[index]);
                        },
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              removeItem(index);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _updateReview(data[index]);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          // Panggil fungsi untuk proses checkout di sini
                        },
                        child: Text('Checkout'),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Total:'),
                          Text('${calculateTotal()}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
      bottomNavigationBar: Navbar(currentIndex: 2),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  // Metode untuk menghapus item dari daftar belanja dan database.
  void removeItem(int index) async {
    DatabaseHelper.instance.deleteShoppingCart(data[index].id);

    setState(() {
      data.removeAt(index);
    });
  }

  // Metode untuk menghitung total harga item yang sudah dicheckout
  String calculateTotal() {
    double total = 0;
    for (var item in data) {
      if (item.isCheckOut) {
        total += double.parse(item.price);
      }
    }
    final currencyFormatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 3);
    return currencyFormatter.format(total);
  }

  // Metode untuk mengupdate \
  void _updateReview(ShoppingCartModels update) async {
    TextEditingController titleController = TextEditingController();
    TextEditingController priceController = TextEditingController();

    titleController.text = update.title;
    priceController.text = update.price;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Item'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: titleController,
                  onChanged: (value) {
                    
                  },
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: priceController,
                  onChanged: (value) {
                    
                  },
                  decoration: InputDecoration(labelText: 'Price'),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final String title = titleController.text;
                final String price = priceController.text;

                // Update data shopping cart
                ShoppingCartModels updatedItem = ShoppingCartModels(
                  title: title,
                  price: price,
                  isCheckOut: update.isCheckOut,
                  id: update.id,
                  userId: update.userId,
                );

                DatabaseHelper.instance.updateShoppingCart(updatedItem);

                setState(() {
                  data[data.indexOf(update)] = updatedItem;
                });

                Navigator.of(context).pop(); 
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
