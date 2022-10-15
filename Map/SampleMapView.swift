//
//  SampleMapView.swift
//  Map
//
//  Created by Ryo on 2022/10/16.
//

import SwiftUI
import MapKit

struct SampleMapView: View {
    
    @State private var region = MKCoordinateRegion()
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State var place: [IdentifiablePlace] = []
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region,
                //現在地の表示
                showsUserLocation: true,
                //現在地の追尾
                userTrackingMode: $userTrackingMode,
                //マーカの指定
                annotationItems: place)
            { place in
                MapMarker(coordinate: place.location,
                          tint: Color.orange)
            }
            .onTapGesture {
                userTrackingMode = .none
            }
            
            if userTrackingMode == .none {
                Button {
                    place += [IdentifiablePlace(lat: region.center.latitude, long: region.center.longitude)]
                } label: {
                    Image(systemName: "mappin.and.ellipse")
                        .font(.largeTitle)
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        userTrackingMode = MapUserTrackingMode.follow
                    } label: {
                        Image(systemName: "location.fill")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .padding(.bottom)
                    .disabled(userTrackingMode == .follow ? true : false)
                }
            }
        }
        .task(){
            let manager = CLLocationManager()
            manager.requestWhenInUseAuthorization()
            userTrackingMode = .follow
        }
    }
}

struct SampleMapView_Previews: PreviewProvider {
    static var previews: some View {
        SampleMapView()
    }
}
