import 'package:aims/core/models/captured_data.dart';
import 'package:aims/ui/screens/data_sceens/rejected_data/rejected_data_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RejectedData extends StatefulWidget {
  const RejectedData({Key? key}) : super(key: key);

  @override
  _RejectedDataState createState() => _RejectedDataState();
}

class _RejectedDataState extends State<RejectedData> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<RejectedDataViewModel>.reactive(
      onModelReady: (h) {
        h.getRejectedData();
      },
      viewModelBuilder: () => RejectedDataViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Rejected Data'),
          centerTitle: true,
        ),
        body: model.busy
            ? Center(child: CircularProgressIndicator())
            : model.dataList.isEmpty
                ? Center(child: Text('No data'))
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Data Count : ${model.dataList.length}",
                                style: TextStyle(fontSize: 15.0)),
                          ),
                          Container(
                            height: size.height * 0.8,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: model.dataList.length,
                              itemBuilder: (context, index) {
                                CapturedData cd = model.dataList[index];

                                return GestureDetector(
                                  onTap: () {
                                    // model.navigateToEdit(cd, context);
                                  },
                                  child: Container(
                                      width: size.width,
                                      height: size.height * 0.2,
                                      child: Card(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  "Name : ${cd.product ?? ''}",
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                            ),
                                            Expanded(
                                                child: Text(
                                                    "Barcode : ${cd.barcode ?? ""}",
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500))),
                                          ],
                                        ),
                                      ))),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
