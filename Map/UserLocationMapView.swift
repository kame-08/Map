//
//  UserLocationMapView.swift
//  Map
//
//  Created by Ryo on 2022/10/16.
//

import SwiftUI
import MapKit

struct UserLocationMapView: View {
    
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region,
            //Mapの操作の指定
            interactionModes: .zoom,
            //現在地の表示
            showsUserLocation: true,
            //現在地の追従
            userTrackingMode: .constant(MapUserTrackingMode.follow)
        )
        .task(){
            let manager = CLLocationManager()
            manager.requestWhenInUseAuthorization()
        }
    }
}

struct UserLocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        UserLocationMapView()
    }
}
