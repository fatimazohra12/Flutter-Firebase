import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
        title: Text(
          'Liste des Produits',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              FirebaseFirestore.instance.collection('produits').add({
                'marque': "Adidas",
                'designation': "Superstar",
                'categorie': 'chaussures',
                'prix': 70,
                'quantite': 200,
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Implement delete functionality here
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

          return GridView.builder(
            padding: EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 2 / 3,
            ),
            itemCount: produits.length,
            itemBuilder: (context, index) => ProduitCard(
              produit: produits[index],
            ),
          );
        },
      ),
    );
  }
}

class ProduitCard extends StatelessWidget {
  const ProduitCard({Key? key, required this.produit}) : super(key: key);

  final Produit produit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              produit.designation,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.0),
            Text(
              produit.marque,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              '${produit.prix} €',
              style: TextStyle(
                color: Colors.teal,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
