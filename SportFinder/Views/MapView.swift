
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

    var body: some View {
        NavigationView {
            ZStack {
                Map(coordinateRegion: .constant(MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: 58.969976, longitude: 5.733107), // Center on Stavanger
                    span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))), showsUserLocation: true, userTrackingMode: .constant(.follow))
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    NavigationLink(destination: SettingsView() ){
                        Text("Settings")
                    }
                    .buttonStyle(customButtonStyle())
                    .padding()
                }
                .animation(.spring())
            }
            .navigationBarItems(leading: backButton)
            .onAppear {
                // Hide the back button when entering the map view
                self.isInSettingsView = false
            }
        }
    }

    private var backButton: some View {
        Button(action: {
            self.isInSettingsView = false
        }) {
            Image(systemName: "chevron.left")
                .imageScale(.large)
                .padding()
        }
        .foregroundColor(.primary)
        //.opacity(isInSettingsView ?? false ? 1.0 : 0.0)
        .animation(.default)
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
