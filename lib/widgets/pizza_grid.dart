import 'package:flutter/material.dart';

class PizzaGrid extends StatefulWidget {
  final String selectedCategory;
  const PizzaGrid({super.key, required this.selectedCategory});

  @override
  State<PizzaGrid> createState() => _PizzaGridState();
}

class _PizzaGridState extends State<PizzaGrid> {
  final List<Map<String, dynamic>> pizzas = [
    {
      'name': 'Margherita',
      'price': 8.99,
      'image': 'assets/images/pizza1.png',
      'preparing_time': '15-20 min',
      'rating': 4.5,
      'category': 'Margherita',
    },
    {
      'name': 'Pepperoni',
      'price': 10.99,
      'image': 'assets/images/pizza2.png',
      'preparing_time': '20-25 min',
      'rating': 4.7,
      'category': 'Pepperoni',
    },
    {
      'name': 'BBQ Chicken',
      'price': 11.99,
      'image': 'assets/images/pizza3.png',
      'preparing_time': '25-30 min',
      'rating': 4.6,
      'category': 'BBQ Chicken',
    },
    {
      'name': 'Veggie',
      'price': 9.99,
      'image': 'assets/images/pizza4.png',
      'preparing_time': '15-20 min',
      'rating': 4.4,
      'category': 'Veggie',
    },
    {
      'name': 'Margherita',
      'price': 8.99,
      'image': 'assets/images/pizza2.png',
      'preparing_time': '15-20 min',
      'rating': 4.5,
      'category': 'Margherita',
    },
    {
      'name': 'Pepperoni',
      'price': 10.99,
      'image': 'assets/images/pizza1.png',
      'preparing_time': '20-25 min',
      'rating': 4.7,
      'category': 'Pepperoni',
    },
    {
      'name': 'BBQ Chicken',
      'price': 11.99,
      'image': 'assets/images/pizza4.png',
      'preparing_time': '25-30 min',
      'rating': 4.6,
      'category': 'BBQ Chicken',
    },
    {
      'name': 'Veggie',
      'price': 9.99,
      'image': 'assets/images/pizza3.png',
      'preparing_time': '15-20 min',
      'rating': 4.4,
      'category': 'Veggie',
    },
    // Add more pizza data as needed
  ];

  late List<bool> cartStatus;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartStatus = List<bool>.filled(pizzas.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final displayedPizzas = widget.selectedCategory == 'All'
        ? pizzas
        : pizzas.where((p) => p['category'] == widget.selectedCategory).toList();
    if (displayedPizzas.isEmpty) {
      return const Expanded(
        child: Center(
          child: Text(
            'No items to display',
            style: TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
        ),
      );
    }
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.builder(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 80.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            childAspectRatio: 0.7,
          ),
          itemCount: displayedPizzas.length,
          itemBuilder: (context, index) {
            final pizza = displayedPizzas[index];
            final originalIndex = pizzas.indexOf(pizza);
            return Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          pizza['name'],
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          '\$${pizza['price'].toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Center(
                        child: Image.asset(
                          pizza['image'],
                          height: 118,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 14.0,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            pizza['preparing_time'],
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 14.0,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 4.0),
                              Text(
                                pizza['rating'].toString(),
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                cartStatus[originalIndex] = !cartStatus[originalIndex];
                              });
                              //snackbar to show pizza added to cart
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(cartStatus[index]
                                      ? '${pizza['name']} added to cart'
                                      : '${pizza['name']} removed from cart'
                                  ),
                                  backgroundColor: cartStatus[originalIndex]
                                      ? Colors.green
                                      : Colors.redAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),                                  behavior: SnackBarBehavior.floating,
                                  margin: const EdgeInsets.all(16.0),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: cartStatus[originalIndex] ? Colors.green : Colors.redAccent,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  cartStatus[originalIndex] ? Icons.check : Icons.add,
                                  size: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
