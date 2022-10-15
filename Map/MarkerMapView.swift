//
//  MarkerMapView.swift
//  Map
//
//  Created by Ryo on 2022/10/16.
//

import SwiftUI
import MapKit

struct IdentifiablePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
    }
}

struct MarkerMapView: View {
    
    let place = [IdentifiablePlace(lat: 37.334900, long: -122.009020),
                 IdentifiablePlace(lat: 37.33089, long: -122.00746)]
    
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
            showsUserLocation: true,
            //マーカの指定
            annotationItems: place)
        { place in
            MapAnnotation(coordinate: place.location) {
                Image(systemName: "tortoise.fill")
                    .foregroundColor(Color(UIColor.systemBackground))
                    .padding()
                    .background(Color.orange.cornerRadius(10))
            }
        }
    }
}

struct MarkerMapView_Previews: PreviewProvider {
    static var previews: some View {
        MarkerMapView()
    }
}
