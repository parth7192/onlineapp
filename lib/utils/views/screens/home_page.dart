import 'package:flutter/material.dart';
import '../../product_utils.dart';
import '../../route_utils.dart';
import '../components/catagory_view.dart';
import 'my_profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cat = "All";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.person),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const my_profile(),
              ),
            );
          },
        ),
        title: const Center(child: Text("MarketPlace")),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                MyRoutes.cartPage,
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  DropdownButton(
                      value: cat,
                      disabledHint: const Text("Select"),
                      hint: const Text("All"),
                      items: [
                        const DropdownMenuItem(
                          value: "All",
                          child: Text(
                            "All",
                            style: (TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                            )),
                          ),
                        ),
                        ...allCategories
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e.replaceFirst(
                                    e[0],
                                    e[0].toUpperCase(),
                                  ),
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 20),
                                ),
                              ),
                            )
                            .toList()
                      ],
                      onChanged: (val) {
                        setState(() {
                          cat = val ?? "All";
                        });
                      }),
                  Visibility(
                    visible: cat != "All",
                    child: ActionChip(
                      onPressed: () {
                        setState(() {
                          cat = "All";
                        });
                      },
                      tooltip: "Clear the Filter",
                      avatar: const Icon(Icons.clear),
                      label: const Text("clear"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              ...allCategories
                  .map(
                    (e) => (cat == 'All')
                        ? categoryView(
                            context: context,
                            size: size,
                            category: e,
                          )
                        : (cat == e)
                            ? categoryView(
                                context: context,
                                size: size,
                                category: e,
                              )
                            : Container(),
                  )
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}
