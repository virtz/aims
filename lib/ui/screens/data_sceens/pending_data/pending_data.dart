import 'package:aims/core/models/captured_data.dart';
import 'package:aims/ui/screens/data_sceens/pending_data/pending_data_view_model.dart';
import 'package:aims/ui/widgets/custom_button.dart';
// import 'package:aims/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PendingData extends StatefulWidget {
  final bool isEditied;
  const PendingData({Key? key, this.isEditied = false}) : super(key: key);

  @override
  _PendingDataState createState() => _PendingDataState();
}

class _PendingDataState extends State<PendingData> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<PendingDataViewModel>.reactive(
      onModelReady: (h) {
        h.getCapturedData();
      },
      viewModelBuilder: () => PendingDataViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text('Pending Data'),
            ),
            centerTitle: true,

            actions: [
              IconButton(
                  onPressed: () {
                    model.setIsSearching();
                  },
                  icon: Icon(Icons.search))
            ],
            // actions: [Text('${model.dataList.length}')],
          ),
          body: model.dataList.isEmpty
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
                        ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: model.dataList.length,
                          itemBuilder: (context, index) {
                            CapturedData cd = model.dataList[index];
                            model.getMiscData(cd.product!);
                            return GestureDetector(
                              onTap: () {
                                model.navigateToEdit(cd, context);
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
                                          child: model.misc == null
                                              ? Text('N/A')
                                              : Text(
                                                  "Name : ${model.misc!.productName!.caption ?? ''}",
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                        ),
                                        Expanded(
                                          child: Text(
                                              "Code : ${cd.product ?? ''}",
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w700)),
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
                      ],
                    ),
                  ),
                ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height * 0.12,
              child: Column(
                children: [
                  model.serverLoading
                      ? LinearProgressIndicator()
                      : model.isLoading
                          ? LinearProgressIndicator()
                          : Container(),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton('Submit Data', onPressed: () {
                          // model.setValues(context);
                          model.sortAndSend();
                        }),
                      ),
                      Expanded(
                        child: CustomButton('Save To CSV', onPressed: () {
                          // model.setValues(context);
                          model.saveToCSV();
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
