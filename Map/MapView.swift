//
//  MapView.swift
//  Map
//
//  Created by Ryo on 2022/10/16.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(
        //Mapの中心の緯度経度
        center: CLLocationCoordinate2D(latitude: 37.334900,
                                       longitude: -122.009020),
        //緯度の表示領域(m)
        latitudinalMeters: 750,
        //経度の表示領域(m)
        longitudinalMeters: 750
    )
    
    var body: some View {
        Map(coordinateRegion: $region,
            //Mapの操作の指定
            interactionModes: .pan,
            //現在地の表示
            showsUserLocation: false
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
