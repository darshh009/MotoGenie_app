import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FAQScreen(),
    );
  }
}

class FAQScreen extends StatelessWidget {
  final List<Map<String, String>> faqList = [
    {
      "question": "What’s included in premium?",
      "answer": "Premium includes 24/7 support, priority service, and exclusive discounts."
    },
    {
      "question": "Can I cancel anytime?",
      "answer": "Yes, you can cancel anytime from your account settings without any extra charges."
    },
    {
      "question": "Is doorstep service available?",
      "answer": "Yes, doorstep service is available in select cities."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAQs")),
      body: ListView.builder(
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.blue.shade500,
                  width: 1,
                )
              ),
              child: Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(faqList[index]["question"]!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  minTileHeight: 30,
                  clipBehavior: Clip.none,
                  tilePadding: EdgeInsets.zero,
                  backgroundColor: Colors.grey.shade100,




                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(faqList[index]["answer"]!, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
