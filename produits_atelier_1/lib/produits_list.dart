import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'produit_box.dart';
// import 'add_produit.dart';
import 'product.dart';

class ProduitsList extends StatefulWidget {
  @override
  _ProduitsListState createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Produits'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              FirebaseFirestore.instance.collection('produits').add({
                'marque': "Adidas",
                'designation': "Superstar",
                'categorie': 'chaussures',
                'prix': 70,
                'photoUrl': "",
                'quantite': 200,
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              //db.collection("produits").doc()
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('produits').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Une erreur est survenue'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Produit> produits = snapshot.data!.docs.map((doc) {
            return Produit.fromFirestore(doc);
          }).toList();

          return ListView.builder(
            itemCount: produits.length,
            itemBuilder: (context, index) => ProduitItem(
              produit: produits[index],
            ),
          );
        },
      ),
    );
  }
}



class ProduitItem extends StatelessWidget {
    ProduitItem({Key? key, required this.produit}) : super(key: key);

    final Produit produit;

    @override
    Widget build(BuildContext context) {
        return ListTile(
            title: Text(produit.designation),
            subtitle: Text(produit.marque),
            trailing: Text('${produit.prix} €'),
        );
    }
}
