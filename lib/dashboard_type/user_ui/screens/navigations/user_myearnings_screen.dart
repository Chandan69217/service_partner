import 'package:flutter/material.dart';

class MyEarningsScreen extends StatelessWidget {
  final int earnedPoints;
  final int claimedPoints;

  const MyEarningsScreen({
    Key? key,
    this.earnedPoints = 1200,
    this.claimedPoints = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            /// Points Summary Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blueAccent),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildPointsColumn('Earned Points', earnedPoints, Colors.green),
                  _buildPointsColumn('Claimed', claimedPoints, Colors.red),
                  _buildPointsColumn('Balance', earnedPoints - claimedPoints, Colors.blue),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// Claim Button
            ElevatedButton.icon(
              onPressed: () {
                // Trigger claim flow
              },
              icon: const Icon(Icons.redeem,color: Colors.white,),
              label: const Text('Claim Now'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.3,
                  vertical: 14,
                ),
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Optional: Claim History List
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Replace with your history list length
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.star, color: Colors.orange),
                    title: const Text('Reward Claimed'),
                    subtitle: Text('Date: 2025-04-10'),
                    trailing: Text('-100 pts', style: TextStyle(color: Colors.red.shade400)),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildPointsColumn(String label, int points, Color color) {
    return Column(
      children: [
        Text(
          '$points',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
        ),
      ],
    );
  }
}
