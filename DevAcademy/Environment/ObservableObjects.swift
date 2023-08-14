//
//  ObservableObjects.swift
//  DevAcademy
//
//  Created by Ondřej Man on 14.08.2023.
//

import Foundation



// MARK: - ObservableObjects

final class ObservableObjects {
    let places: PlacesObservableObject
    
    init(
        places: PlacesObservableObject
    ) {
        self.places = places
    }
}

// MARK: - ObservableObjects + Extension

extension ObservableObjects {
    convenience init(services: Services) {
        let places = PlacesObservableObject()
        
        self.init(
            places: places
        )
    }
}

// MARK: - Mocks

extension ObservableObjects {
    static let mock: ObservableObjects = ObservableObjects(services: .mock)
}
