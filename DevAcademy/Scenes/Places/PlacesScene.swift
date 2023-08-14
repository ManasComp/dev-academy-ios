//
//  PlacesScene.swift
//  DevAcademy
//
//  Created by Ondřej Man on 25.07.2023.
//

import SwiftUI
import ActivityIndicatorView

struct PlacesScene: View {
    @State var features: [Feature] = []
    @State var showFavourites = false;
    
    var body: some View {
        NavigationStack {
            Group {
                if !features.isEmpty {
                    List(features, id : \.properties.ogcFid) {
                        feature in
                        PlacesRow(feature: feature)
                            .onTapGesture {
                                onFeatureTapped(feature: feature)
                            }
                    }
                    .animation(.default, value: features)
                    .listStyle(.plain)
                }
                else {
                    ActivityIndicatorView(isVisible: .constant(true),
                    type: .growingCircle)
                }
            }
            .navigationTitle("Kultůr Mapa")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button.init {
                        showFavourites = true
                    } label: {
                        Image(systemName: "heart.fill")
                    }
                }
            }
        }

        .onAppear(perform: fetch)
        .sheet(isPresented: $showFavourites) {
            Text("Zatím tady nic není")
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
    }
    
    
    
    func fetch()
    {
        DataService.shared.fetchdata{result in
            switch result {
            case.success(let features):
                self.features = features.features
            case.failure(let error):
                print(error)
            }
        }
    }
    
    func onFeatureTapped(feature: Feature)
    {
        features.removeAll (where:  {
            $0.properties.ogcFid == feature.properties.ogcFid
        })
    }
}


struct PlacesScene_Previews: PreviewProvider {
    static var previews: some View {
        PlacesScene()
    }
}
