//
//  PlacesState.swift
//  DevAcademy
//
//  Created by Ondřej Man on 08.08.2023.
//

@State var features: [Feature] = []
@State var showFavourites = false;


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
