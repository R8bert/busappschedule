import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RouteCard extends StatefulWidget {
  final DocumentReference route;
  const RouteCard({
    Key? key,
    required this.route,
  }) : super(key: key);

  @override
  State<RouteCard> createState() => _RouteCardState();
}

class _RouteCardState extends State<RouteCard> {
  DocumentSnapshot? routeData;

  final List<int> times = [];
  List at = [];
  List<DocumentSnapshot> stops = [];
  String busname = '';
  bool isActive = false;
  Future<bool> _fetch(DocumentSnapshot data) async {
    if (routeData != null) {
      return true;
    }
    routeData = data;
    for (var i = 0; i < routeData!["times"].length; i++) {
      times.add(routeData!["times"][i]);
      stops.add(await routeData!["stops"][i].get());
    }
    at = routeData!['at'];

    busname = (await FirebaseFirestore.instance
            .collection("buses")
            .where("routes", arrayContains: routeData!.reference)
            .get())
        .docs[0]
        .data()['name'];
    isActive = routeData!['is_active'];
    return true;
  }

  String toTime(int time) {
    final hour = time ~/ 60;
    final minute = time % 60;
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: StreamBuilder<DocumentSnapshot>(
          stream: widget.route.snapshots(),
          builder: (context, datashot) {
            return datashot.hasData
                ? FutureBuilder<bool>(
                    future: _fetch(datashot.data!),
                    builder: (context, snapshot) {
                      // print(snapshot.error);
                      if (snapshot.hasData) {
                        return Stack(
                          children: [
                            Card(
                              elevation: 5,
                              color: Color.fromRGBO(102, 102, 255, 0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ExpansionTile(
                                tilePadding: const EdgeInsets.all(15),
                                collapsedIconColor: Colors.yellow,
                                iconColor: Colors.white,
                                textColor: Colors.white,
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            busname,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6!
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                        isActive
                                            ? const Chip(
                                                label: Text(
                                                  "Active",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                backgroundColor: Colors.green,
                                              )
                                            : const SizedBox(),
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.white,
                                    ),
                                    Row(
                                      children: [
                                        Text(toTime(times.first),
                                            style: const TextStyle(
                                                color: Colors.yellow,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(width: 20),
                                        Text(stops.first['name'],
                                            style: const TextStyle(
                                                color: Colors.white)),
                                      ],
                                    ),
                                    Row(
                                      children: const [
                                        SizedBox(
                                          width: 60,
                                          height: 45,
                                        ),
                                        Icon(
                                          Icons.arrow_downward,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(toTime(times.last),
                                            style: const TextStyle(
                                                color: Colors.yellow,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(width: 20),
                                        Text(stops.last['name'],
                                            style: const TextStyle(
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ],
                                ),
                                childrenPadding: const EdgeInsets.all(20),
                                children: generateStops,
                              ),
                            ),
                          ],
                        );
                      }
                      return const LoadingPlaceHolder();
                    })
                : const SizedBox(height: 10, width: 10);
          }),
    );
  }

  List<Widget> get generateStops {
    return [
      for (var i = 0; i < stops.length; i++)
        Column(
          children: [
            Row(
              children: [
                Text(
                  toTime(times[i]),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.circle,
                    color: () {
                      if (at[0] == i) {
                        if (at.length == 1) {
                          return Colors.lightGreen;
                        } else {
                          return Colors.white;
                        }
                      } else if (at[0] > i) {
                        return Colors.white;
                      } else {
                        return Colors.yellow;
                      }
                    }(),
                    size: 9,
                  ),
                ),
                Text(
                  stops[i]['name'],
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            i == times.length - 1
                ? const SizedBox()
                : Row(
                    children: [
                      const SizedBox(width: 48),
                      SizedBox(
                        width: 2,
                        height: 20,
                        child: Container(
                          color: () {
                            if (at[0] == i) {
                              if (at.length == 2) {
                                return Colors.lightGreen;
                              } else {
                                return Colors.yellow;
                              }
                            } else if (at[0] > i) {
                              return Colors.white;
                            } else {
                              return Colors.yellow;
                            }
                          }(),
                        ),
                      ),
                    ],
                  )
          ],
        )
    ];
  }
}

class LoadingPlaceHolder extends StatelessWidget {
  const LoadingPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          height: 120,
          width: 10,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(10)),
        ),
        baseColor: Colors.white,
        highlightColor: Colors.grey.shade200);
  }
}
