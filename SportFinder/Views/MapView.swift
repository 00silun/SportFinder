
//
//  MapView.swift
//  Setting_template
//
//  Created by Sondre Lyngstad on 03/02/2024.
//

import Foundation
import SwiftUI
import MapKit



struct MapView: View {
    @State private var isInSettingsView: Bool?
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 58.969976, longitude: 5.733107),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    @State private var trackingMode = MapUserTrackingMode.follow

    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $trackingMode)
                    .navigationTitle("Map")
                    .navigationBarHidden(true)
                    .ignoresSafeArea()

                VStack {
                    Spacer()
                }

                VStack {
                    Spacer()
                    NavigationLink("Settings", destination: SettingsView())
                        .buttonStyle(customButtonStyle())
                        .padding()
                        
                }
            }
        }
    }
}



struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let userAuth = UserAuth() // Create a mock UserAuth object
        return MapView()
            .environmentObject(userAuth) // Provide the mock UserAuth object
    }
}

