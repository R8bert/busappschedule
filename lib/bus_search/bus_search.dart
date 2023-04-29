import 'package:busway/components/route_card.dart';
import 'package:busway/components/wide_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BusSearch extends StatefulWidget {
  const BusSearch({Key? key}) : super(key: key);

  @override
  State<BusSearch> createState() => _BusSearchState();
}

class _BusSearchState extends State<BusSearch> {
  final _fromController = TextEditingController();
  final db = FirebaseFirestore.instance;
  bool _isSearching = false;
  List<DocumentReference> results = [];

  String error = '';
  void _search() async {
    setState(() {
      _isSearching = true;
      error = '';
      results = [];
    });
    if (_fromController.text.isEmpty) {
      setState(() {
        error = 'Te rugam sa introduci o staţie';
        _isSearching = false;
      });
      return;
    }

    final from = await db
        .collection('stops')
        .where("name", isEqualTo: _fromController.text.trim().toLowerCase())
        .get();
    if (from.docs.isEmpty) {
      setState(() {
        _isSearching = false;
        error = 'Statie necunoscuta';
      });
      return;
    }
    final fromRef = from.docs[0].reference;

    final routeResult = await db
        .collection('routes')
        .where('stops', arrayContains: fromRef)
        .get();

    if (routeResult.docs.isEmpty) {
      setState(() {
        _isSearching = false;
        error = 'Nu exista rute';
      });
      return;
    }
    setState(() {
      results = routeResult.docs.map((doc) => doc.reference).toList();
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Text(
                "Căutați autobuze care opresc într-o anumită stație",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _fromController,
              decoration: const InputDecoration(
                  label: Text("Numele staţiei"), border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            _isSearching
                ? Shimmer.fromColors(
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    baseColor: Colors.white,
                    highlightColor: Colors.grey.shade200)
                : WideButton(callback: _search, text: "Găseste rute"),
            Text(
              error,
              style: const TextStyle(color: Colors.red),
            ),
            ListView(
              children: [
                for (var result in results)
                  RouteCard(route: result, key: Key(result.id))
              ],
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
            )
          ],
        ),
      ),
    );
  }
}
