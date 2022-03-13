import 'package:aims/core/models/captured_data.dart';
import 'package:aims/ui/screens/data_sceens/submitted_data/submitted_data_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SubmittedData extends StatefulWidget {
  const SubmittedData({Key? key}) : super(key: key);

  @override
  _SubmittedDataState createState() => _SubmittedDataState();
}

class _SubmittedDataState extends State<SubmittedData> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<SubmittedDataViewModel>.reactive(
      onModelReady: (h) {
        h.getSubmitedData();
      },
      viewModelBuilder: () => SubmittedDataViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Submitted Data'),
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
                              physics: BouncingScrollPhysics(),
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
