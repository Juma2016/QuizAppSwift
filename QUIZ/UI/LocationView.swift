//
//  LocationView.swift
//  QUIZ
//
//  Created by Mario Shenouda on 24.03.26.
//

import SwiftUI
import MapKit

struct LocationView: View {
    @StateObject private var locationManager = LocationManager()

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 47.0707, longitude: 15.4395),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        VStack(spacing: 20) {
            Text("My Location")
                .font(.largeTitle)
                .fontWeight(.bold)

            Map(coordinateRegion: $region)
                .frame(height: 350)
                .cornerRadius(20)
                .padding(.horizontal)

            if let location = locationManager.userLocation {
                Text("Latitude: \(location.latitude)")
                Text("Longitude: \(location.longitude)")
            } else {
                Text("Location not available yet")
                    .foregroundColor(.gray)
            }

            Button("Get Current Location") {
                locationManager.requestPermission()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(15)
            .padding(.horizontal)
        }
        .padding()
        .onReceive(locationManager.$userLocation) { location in
            guard let location else { return }
            region.center = location
        }
        .onDisappear {
            locationManager.stopUpdatingLocation()
        }
    }
}
