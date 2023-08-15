//
//  IdentifiableCoordinate.swift
//  DevAcademy
//
//  Created by Ondřej Man on 14.08.2023.
//

import Foundation
import MapKit

struct IdentifiableCoordinate: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D

    init(_ coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
