//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by Ondřej Man on 14.08.2023.
//

import Foundation

final class PlacesObservableObject: ObservableObject {
    @Published var places: [Place] = []
    
    private let dataService: DataService = DataService.shared
    
    func fetchPlaces() {
        dataService.fetchData { result in
            switch result {
            case .success(let places):
                self.places = places.places
            case .failure(let error):
                print(error)
            }
        }
    }
}

