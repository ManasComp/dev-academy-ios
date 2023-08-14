//
//  MapView.swift
//  DevAcademy
//
//  Created by Ondřej Man on 14.08.2023.
//


import SwiftUI
import MapKit

struct MapView: View {
    let coordinate: CLLocationCoordinate2D

    var body: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [IdentifiableCoordinate(coordinate)]) { location in
            MapMarker(coordinate: location.coordinate, tint: .red)
        }
    }
}
