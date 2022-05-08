// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:topify/controllers/playlistcontroller.dart';
// import 'package:topify/controllers/profilecontroller.dart';
// import 'package:topify/controllers/toptrackscontroller.dart';
// import 'package:topify/assets/colors.dart';

// class HomePage extends StatelessWidget {
//   final ProfileController profileController =
//       Get.put(ProfileController());
//   final TopTracksController topTracksController =
//       Get.put(TopTracksController());
//   final PlaylistController playlistController =
//       Get.put(PlaylistController());

//   Future refresh() async {
//     topTracksController.onClose();
//     profileController.onClose();
//     playlistController.onClose();
//     topTracksController.onInit();
//     profileController.onInit();
//     playlistController.onInit();
//     await Future.delayed(Duration(seconds: 2));
//     while (topTracksController.isLoading.value ||
//         profileController.isLoading.value ||
//         playlistController.isLoading.value) {
//       await Future.delayed(Duration(seconds: 2));
//     }
//   }

//   String getImage() {
//     try {
//       if (profileController.profile.value.images!.elementAt(0).url != null) {
//       return profileController.profile.value.images!.elementAt(0).url!;
//     } else {
//       return "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngfind.com%2Fmpng%2FTRJxwTh_default-profile-picture-transparent-hd-png-download%2F&psig=AOvVaw32yuIzvzRiIqvQe_rrjej5&ust=1651843954136000&source=images&cd=vfe&ved=2ahUKEwib65OyvMj3AhX6XWwGHVzqBsEQjRx6BAgAEAs";
//     }
//     } catch (e) {
//       print(e.toString());
//       return "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngfind.com%2Fmpng%2FTRJxwTh_default-profile-picture-transparent-hd-png-download%2F&psig=AOvVaw32yuIzvzRiIqvQe_rrjej5&ust=1651843954136000&source=images&cd=vfe&ved=2ahUKEwib65OyvMj3AhX6XWwGHVzqBsEQjRx6BAgAEAs";
//     }
//   }

//   String getArtist(int index) {
//     String name = "";
//     for (int i = 0;
//         i <
//             topTracksController.tracks.value.items!
//                 .elementAt(index)
//                 .artists!
//                 .length;
//         i++) {
//       if (topTracksController.tracks.value.items!
//                   .elementAt(index)
//                   .artists!
//                   .length -
//               1 !=
//           i) {
//         name += topTracksController.tracks.value.items!
//                 .elementAt(index)
//                 .artists!
//                 .elementAt(i)
//                 .name! +
//             ", ";
//       } else {
//         name += topTracksController.tracks.value.items!
//             .elementAt(index)
//             .artists!
//             .elementAt(i)
//             .name!;
//       }
//     }
//     return name;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (topTracksController.isLoading.value ||
//           profileController.isLoading.value ||
//           playlistController.isLoading.value) {
//         return Center(child: CircularProgressIndicator());
//       } else {
//         return Center(
//           child: RefreshIndicator(
//             onRefresh: refresh,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: ListView(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 20),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(25))),
//                           height: MediaQuery.of(context).size.height * 0.4,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               CircleAvatar(
//                                 radius: 70,
//                                 backgroundImage: NetworkImage(getImage()),
//                               ),
//                               Text(
//                                 profileController.profile.value.displayName!,
//                                 style: TextStyle(
//                                     color: armyGreen,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 28),
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Text(
//                                         profileController
//                                             .profile.value.country!,
//                                         style: TextStyle(
//                                             color: armyGreen, fontSize: 22),
//                                       ),
//                                       Text("country")
//                                     ],
//                                   ),
//                                   Column(
//                                     children: [
//                                       Text(
//                                         profileController
//                                             .profile.value.followers!.total!
//                                             .toString(),
//                                         style: TextStyle(
//                                             color: armyGreen, fontSize: 22),
//                                       ),
//                                       Text("followers")
//                                     ],
//                                   ),
//                                   Column(
//                                     children: [
//                                       Text(
//                                         playlistController
//                                             .Playlist.value.items!.length
//                                             .toString(),
//                                         style: TextStyle(
//                                             color: armyGreen, fontSize: 22),
//                                       ),
//                                       Text("Playlist")
//                                     ],
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: 50,
//                         width: 500,
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 10),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Your Favourite Songs',
//                                 style: TextStyle(
//                                     color: pastelBrown,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18),
//                                 textAlign: TextAlign.left,
//                               ),
//                               SizedBox(
//                                 width: 7,
//                               ),
//                               Icon(
//                                 Icons.star,
//                                 color: pastelBrown,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: MediaQuery.of(context).size.height * 0.35,
//                         child: ListView.separated(
//                             physics: NeverScrollableScrollPhysics(),
//                             itemBuilder: (BuildContext, index) => Container(
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       Container(
//                                         width: 60,
//                                         height: 60,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(20),
//                                             image: DecorationImage(
//                                                 image: NetworkImage(
//                                                     topTracksController
//                                                         .tracks.value.items!
//                                                         .elementAt(index)
//                                                         .album!
//                                                         .images!
//                                                         .elementAt(0)
//                                                         .url!))),
//                                       ),
//                                       SizedBox(
//                                         width: 30,
//                                       ),
//                                       Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             topTracksController
//                                                 .tracks.value.items!
//                                                 .elementAt(index)
//                                                 .name!,
//                                             style: TextStyle(color: armyGreen),
//                                           ),
//                                           Container(
//                                             child: Text(
//                                               getArtist(index),
//                                               softWrap: true,
//                                               textAlign: TextAlign.justify,
//                                               style: TextStyle(
//                                                   color: Colors.black),
//                                             ),
//                                           )
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                   height: 80,
//                                   decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       borderRadius: BorderRadius.circular(20)),
//                                 ),
//                             separatorBuilder: (BuildContext, index) => SizedBox(
//                                   height: 13,
//                                 ),
//                             itemCount: 3),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       }
//     });
//   }
// }
