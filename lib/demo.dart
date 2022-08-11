import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter_hyper_ui/shared/widget/slider/slider.dart';

class FlutterHyperUiKitDemoView extends StatelessWidget {
  const FlutterHyperUiKitDemoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              ExSearchField(
                id: "search",
                label: "Search",
                hintText: "Search",
                onSubmitted: (text) {},
              ),
              Container(
                height: 40.0,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100.0,
                      width: 100.0,
                      margin: const EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[900 - (index * 100)],
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            16.0,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Category ${index + 1}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ExTextField(
                id: "email",
                label: "Email",
              ),
              ExImagePicker(
                id: "photo",
                label: "Photo",
              ),
              ExLocationPicker(
                id: "location",
                label: "Address",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
