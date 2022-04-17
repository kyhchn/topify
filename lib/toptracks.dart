import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topify/controllers/toptrackscontroller.dart';

class TopTracks extends StatelessWidget {
  final TopTracksController topTracksController =
      Get.put(TopTracksController());
  String getArtist(int index) {
    String name = "";
    for (int i = 0;
        i <
            topTracksController.tracks.value.items!
                .elementAt(index)
                .artists!
                .length;
        i++) {
      if (topTracksController.tracks.value.items!
                  .elementAt(index)
                  .artists!
                  .length -
              1 !=
          i) {
        name += topTracksController.tracks.value.items!
                .elementAt(index)
                .artists!
                .elementAt(i)
                .name! +
            ", ";
      } else {
        name += topTracksController.tracks.value.items!
            .elementAt(index)
            .artists!
            .elementAt(i)
            .name!;
      }
    }
    return name;
  }

  Future refresh() async {
    topTracksController.onDelete;
    topTracksController.onInit();
    await Future.delayed(Duration(seconds: 2));
    while (topTracksController.isLoading.value) {
      await Future.delayed(Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Obx(() {
          if (topTracksController.isLoading.value) {
            return CircularProgressIndicator();
          } else {
            return RefreshIndicator(
              onRefresh: refresh,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200,
                      width: 100,
                      child: Row(
                        children: [
                          Image(
                              image: NetworkImage(topTracksController
                                  .tracks.value.items!
                                  .elementAt(index)
                                  .album!
                                  .images!
                                  .elementAt(0)
                                  .url!)),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2 - 50,
                                child: Text(
                                  "Title: " +
                                      topTracksController.tracks.value.items!
                                          .elementAt(index)
                                          .name!,
                                  softWrap: true,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2 - 50,
                                  child: Text(
                                    "Artist: " + getArtist(index),
                                    softWrap: true,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: topTracksController.tracks.value.limit),
            );
          }
        }),
      ),
    );
  }
}
