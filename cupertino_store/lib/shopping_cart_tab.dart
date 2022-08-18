import 'package:flutter/cupertino.dart';

class ProductListTab extends StatefulWidget {
  const ProductListTab({Key? key}) : super(key: key);

  @override
  State<ProductListTab> createState() => _ProductListTabState();
}

class _ProductListTabState extends State<ProductListTab> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          largeTitle: Text('Shopping Cart'),
        )
      ],
    );
  }
}
