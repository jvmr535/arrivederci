import 'package:arrivederci/shared/models/travel_itinerary_detail_model.dart';
import 'package:arrivederci/shared/themes/app_footer.dart';
import 'package:arrivederci/shared/widgets/travel_itinerary/travel_itinerary_widget.dart';
import 'package:flutter/material.dart';

class MyTravelItineraries extends StatefulWidget {
  const MyTravelItineraries({Key? key}) : super(key: key);

  @override
  _MyTravelItinerariesState createState() => _MyTravelItinerariesState();
}

class _MyTravelItinerariesState extends State<MyTravelItineraries> {
  List travelIntinerariesData() {
    TravelItinerary ti1 = TravelItinerary(
        name: "Viagem para a França",
        photo:
            "Aap_uEDlXIPdOwkCyPVJ4U5cVtEZd0vc75dXiVsg31dhe8Ge7rTat4BtufHmS8G5ZFOQODxsqbV--YvMHywMQ40aFbnLBwONgyCstS-8Y5fnqTFmB9H57MPJpQsSWlfeCYOIxb-415lRNarUAMNpDNFl_lu0uwIt-JIitJ7APFUq5SP_AZFD",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        places: []);
    TravelItinerary ti2 = TravelItinerary(
        name: "Viagem para a Italia",
        photo:
            "Aap_uEA9yON3uHS1Yh3w3N9W24mxkzyXkug3Jbl_1MvHbMbIm0DmA6D-LnNjRBXKDtYeE8HJ6cG0dXsr2-3-ZJayVtmJpz63wp8tzXTsgLTpT9LecWQJ4cJrLXpH9DwNNQ51PLc-uzAaQRqp_wBBH2K9VTfwLDJ5Vb6h8jfCRZuO5nhVhHkh",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        places: []);

    List data = [ti1, ti2];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final travelItinerary = travelIntinerariesData();

    return Scaffold(
      appBar: AppBar(
        title: Text("Meus roteiros"),
      ),
      body: ListView.builder(
        itemCount: travelItinerary.length,
        itemBuilder: (context, index) {
          return Container(
            height: 500,
            child: TravelItineraryCard(
              travelItinerary: travelItinerary[index],
            ),
          );
        },
      ),
      bottomNavigationBar: AppFooter(),
    );
  }
}
