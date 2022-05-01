import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topify/assets/colors.dart';
import 'package:topify/controllers/toptrackscontroller.dart';
import 'package:topify/views/widgets/homepage.dart';

class TopTracks extends StatelessWidget {
  String getArtist(int index) {
    String name = "";
    for (int i = 0;
        i <
            HomePage.topTracksController.tracks.value.items!
                .elementAt(index)
                .artists!
                .length;
        i++) {
      if (HomePage.topTracksController.tracks.value.items!
                  .elementAt(index)
                  .artists!
                  .length -
              1 !=
          i) {
        name += HomePage.topTracksController.tracks.value.items!
                .elementAt(index)
                .artists!
                .elementAt(i)
                .name! +
            ", ";
      } else {
        name += HomePage.topTracksController.tracks.value.items!
            .elementAt(index)
            .artists!
            .elementAt(i)
            .name!;
      }
    }
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: HomePage.topTracksController.isLoading.value
            ? CircularProgressIndicator()
            : RefreshIndicator(
                onRefresh: () async {
                  HomePage.topTracksController.onClose();
                  HomePage.topTracksController.onInit();
                  await Future.delayed(Duration(seconds: 2));
                  while (HomePage.topTracksController.isLoading.value) {
                    await Future.delayed(Duration(seconds: 1));
                  }
                },
                child: CustomScrollView(
                  controller: ScrollController(),
                  slivers: [
                    const SliverAppBar(
                      floating: true,
                      pinned: true,
                      snap: false,
                      expandedHeight: 160,
                      automaticallyImplyLeading: false,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                          'Your Top Tracks',
                          style: TextStyle(fontSize: 22),
                        ),
                        expandedTitleScale: 1.4,
                        collapseMode: CollapseMode.parallax,
                        centerTitle: true,
                        background: Image(
                          image: AssetImage('lib/assets/images/5.gif'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    LiveSliverList.options(
                        options: options,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                          Animation<double> animation,
                        ) =>
                            // For example wrap with fade transition
                            FadeTransition(
                              opacity: Tween<double>(
                                begin: 0,
                                end: 1,
                              ).animate(animation),
                              // And slide transition
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: Offset(0, -0.1),
                                  end: Offset.zero,
                                ).animate(animation),
                                // Paste you Widget
                                child: Column(
                                  children: [
                                    SizedBox(height: 20,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text((index+1).toString(), style: TextStyle(fontSize: 20),),
                                                SizedBox(width: 20,),
                                                Container(
                                                  width: 60,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(20),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              HomePage.topTracksController
                                                                  .tracks.value.items!
                                                                  .elementAt(index)
                                                                  .album!
                                                                  .images!
                                                                  .elementAt(0)
                                                                  .url!))),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          HomePage.topTracksController
                                                              .tracks.value.items!
                                                              .elementAt(index)
                                                              .name!,
                                                              softWrap: true,
                                                              textAlign: TextAlign.justify,
                                                          style:
                                                              TextStyle(color: armyGreen),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          getArtist(index),
                                                          softWrap: false,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.justify,
                                                          style: TextStyle(
                                                              color: Colors.black),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 20,)
                                              ],
                                            ),
                                            height: 80,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        itemCount: HomePage.topTracksController.tracks.value.items!.length,
                        controller: ScrollController())
                  ],
                ),
              ),
      ),
    );
  }

  final options = LiveOptions(
    // Start animation after (default zero)
    delay: Duration(milliseconds: 100),
    // Show each item through (default 250)
    showItemInterval: Duration(milliseconds: 150),

    // Animation duration (default 250)
    showItemDuration: Duration(milliseconds: 200),

    // Animations starts at 0.05 visible
    // item fraction in sight (default 0.025)
    visibleFraction: 0.025,

    // Repeat the animation of the appearance
    // when scrolling in the opposite direction (default false)
    // To get the effect as in a showcase for ListView, set true
    reAnimateOnVisibility: true,
  );
}
