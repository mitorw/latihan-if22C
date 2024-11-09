import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/mahasiswa/views/mahasiswa_update_view.dart';

import '../controllers/mahasiswa_controller.dart';

class MahasiswaView extends GetView<MahasiswaController> {
  void Showoption(id) async {
    var result = await Get.dialog(SimpleDialog(
      children: [
        ListTile(
          onTap: () {
            Get.back();
            Get.to(
              MahasiswaUpdateView(),
              arguments: id,
            );
          },
          title: Text("update"),
        ),
        ListTile(
          onTap: () {},
          title: Text("delete"),
        ),
        ListTile(
          onTap: () {
            Get.back();
          },
          title: Text("close"),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object?>>(
        stream: Get.put(MahasiswaController().StreamData()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data?.docs ?? [];
            return listAllDocs.length > 0
                ? ListView.builder(
                    itemCount: listAllDocs.length,
                    itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                            backgroundColor: Colors.white60,
                          ),
                          title: Text(
                              "${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}"),
                          subtitle: Text(
                            "${(listAllDocs[index].data() as Map<String, dynamic>)["npm"]}",
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                Showoption(listAllDocs[index].id);
                              },
                              icon: Icon(Icons.add_circle_outline)),
                        ))
                : Center(
                    child: Text("data kosong"),
                  );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
