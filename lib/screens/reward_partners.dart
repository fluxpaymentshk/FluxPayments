import 'package:flutter/material.dart';
// import 'package:flux_payments/models/ModelProvider.dart';
import 'package:flux_payments/models/reward_partner.dart';
import 'package:flux_payments/screens/show_reward_screen.dart';

class RewardPartnerScreen extends StatelessWidget {
  // const RewardParternerScreens({Key? key}) : super(key: key);
  final RewardPartner rewardPartner =
      RewardPartner(name: "PartnerName", shortDescription: "");
  // RewardParnter().
  // ModelProvider _modelProvider = new ModelProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reward Parnters"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ShowRewardScreen(
                            listOfRewards: rewardPartner.Rewards,
                          ),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      child: Text("Logo"),
                    ),
                    subtitle: Text(
                      rewardPartner.id ?? "ID of Reward",
                    ),
                    title: Text(rewardPartner.name ?? "PartnerName"),
                    // isThreeLine: true,
                    trailing: Text(rewardPartner.size == null
                        ? "size"
                        : rewardPartner.size.toString()),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
