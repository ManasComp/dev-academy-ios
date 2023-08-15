//
//  PlacesScenePreview.swift
//  DevAcademy
//
//  Created by Ondřej Man on 08.08.2023.
//

import SwiftUI
struct PlacesScene_Previews: PreviewProvider {
    static var previews: some View {
        PlacesScene()
    }
}

struct PlacesRow_Previews: PreviewProvider {
    static var previews: some View {
        PlacesRow(feature: Features.mock.features[0])
    }
}
