import 'package:flutter/material.dart';
import 'package:flux_payments/models/Reward.dart';

class ShowRewardScreen extends StatelessWidget {
  const ShowRewardScreen({Key? key, this.listOfRewards}) : super(key: key);
  final List<Reward>? listOfRewards;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Partner's Rewards"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    listOfRewards?[index].name ?? "Name of reward",
                  ),
                  subtitle: Text(listOfRewards?[index].shopID ?? "Shop id "),
                  trailing: Text(listOfRewards?[index].category ?? "Category"),
                ),
              );
            }),
      ),
    );
  }
}
