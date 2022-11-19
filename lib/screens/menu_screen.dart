import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo/models/tasks_data.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onTapFunction(String type) {
      Provider.of<TaskData>(context, listen: false).setType(type);
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(89, 69, 69, 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("M",
                      style: TextStyle(
                          color: Color.fromRGBO(89, 69, 69, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Mohammad',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Icon(
                  Icons.search,
                  color: Colors.white54,
                  size: 30,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.notifications,
                  color: Colors.white54,
                  size: 30,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today_sharp,
                color: Color.fromRGBO(89, 69, 69, 1)),
            title: const Text('Today'),
            onTap: () => {onTapFunction("Today"), Navigator.pop(context)},
          ),
          ListTile(
            leading:
                const Icon(Icons.inbox, color: Color.fromRGBO(89, 69, 69, 1)),
            title: const Text('Inbox'),
            onTap: () => {onTapFunction("Inbox"), Navigator.pop(context)},
          ),
          ListTile(
            leading: const Icon(Icons.waving_hand,
                color: Color.fromRGBO(89, 69, 69, 1)),
            title: const Text('Welcome'),
            onTap: () => {onTapFunction("Welcome"), Navigator.pop(context)},
          ),
          ListTile(
            leading:
                const Icon(Icons.work, color: Color.fromRGBO(89, 69, 69, 1)),
            title: const Text('Work'),
            onTap: () => {onTapFunction("Work"), Navigator.pop(context)},
          ),
          ListTile(
            leading:
                const Icon(Icons.home, color: Color.fromRGBO(89, 69, 69, 1)),
            title: const Text('Personal'),
            onTap: () => {onTapFunction("Personal"), Navigator.pop(context)},
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart_checkout,
                color: Color.fromRGBO(89, 69, 69, 1)),
            title: const Text('Shopping'),
            onTap: () => {onTapFunction("Shopping"), Navigator.pop(context)},
          ),
          ListTile(
            leading: const Icon(Icons.ac_unit_sharp,
                color: Color.fromRGBO(89, 69, 69, 1)),
            title: const Text('WishList'),
            onTap: () => {onTapFunction("WishList"), Navigator.pop(context)},
          ),
          ListTile(
            leading:
                const Icon(Icons.home, color: Color.fromRGBO(89, 69, 69, 1)),
            title: const Text('Birthday'),
            onTap: () => {onTapFunction("Birthday"), Navigator.pop(context)},
          ),
        ],
      ),
    );
  }
}
