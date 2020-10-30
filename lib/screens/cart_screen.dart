import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCartItem(Order order) {
    return Container(
      padding: EdgeInsets.all(20.0),
      height: 170.0,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage(
                        order.food.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          order.food.name,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10),
                        Text(
                          order.restaurant.name,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              width: 0.8,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Text(
                                order.quantity.toString(),
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 20),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Text(
              '\$${order.quantity * order.food.price}',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0.0;
    currentUser.cart.forEach(
        (Order order) => totalPrice += order.quantity * order.food.price);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart (${currentUser.cart.length})'),
      ),
      body: ListView.separated(
        itemCount: currentUser.cart.length + 1,
        itemBuilder: (BuildContext context, index) {
          if (index < currentUser.cart.length) {
            Order order = currentUser.cart[index];
            return _buildCartItem(order);
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Estimate Delivery Time :',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '25 min',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Cost :',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.green[700],
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 80.0),
                ],
              ),
            );
          }
        },
        separatorBuilder: (BuildContext context, index) {
          return Divider(
            height: 1.0,
            color: Colors.grey,
          );
        },
      ),
      bottomSheet: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Center(
          child: FlatButton(
            onPressed: () {},
            child: Text(
              'CHECKOUT',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
