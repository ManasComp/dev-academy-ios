//
//  Coordinator.swift
//  DevAcademy
//
//  Created by Ondřej Man on 14.08.2023.
//

import Foundation
import SwiftUI


final class Coordinator: ObservableObject {

    // MARK: - Places scenes
    var placesScene: some View {
        PlacesView()
    }

    func placeDetailScene(with place: Place) -> some View {
        PlaceDetailView(state: PlaceDetailViewState(place: place))
    }

    // MARK: - Favorites scenes
    
    var favoritesScene: some View {
        Text("Zatím tady nic není")
    }
}
