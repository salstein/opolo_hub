import 'package:flutter/material.dart';

import '../../models/update_model.dart';
import 'update_view.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: updates.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UpdateView(images: updates[index].images)),
                  );
                },
                leading: CircleAvatar(
                    backgroundImage: AssetImage(updates[index].images.last)),
                title: Text(updates[index].name),
                trailing: Text(
                    "${updates[index].lastUpdate.hour} : ${updates[index].lastUpdate.minute}"),
              );
            }));
  }
}
