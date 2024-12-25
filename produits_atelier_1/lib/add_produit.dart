import 'package:flutter/material.dart';

class AddProduit extends StatelessWidget {
  final Function(String) onAdd;

  AddProduit({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return AlertDialog(
      title: Text('Ajouter un Produit'),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: 'Nom du produit'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              onAdd(controller.text);
              Navigator.of(context).pop();
            }
          },
          child: Text('Ajouter'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Annuler'),
        ),
      ],
    );
  }
}
