//
//  PlacesRow.swift
//  DevAcademy
//
//  Created by Ondřej Man on 25.07.2023.
//

import SwiftUI

struct PlaceDetail: View {
    let feature: Feature
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            AsyncImage(url: feature.properties.obrId1) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 4)
            } placeholder: {
                ProgressView()
            }
            .frame(maxHeight: 200)
            
            Text(feature.properties.nazev)
                .font(.title)
                .fontWeight(.semibold)
            
            Text(feature.properties.druh.rawValue)
                .foregroundColor(.secondary)
                .font(.subheadline)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Detail Místa")
    }
}


struct PlacesRow: View {
    let feature: Feature
    
    var body: some View {
        NavigationLink(destination: PlaceDetail(feature: feature)) {
            HStack {
                HStack {
                    
                    AsyncImage(url: feature.properties.obrId1) {
                        image in
                        image
                            .resizable()
                            .frame(width: 60, height: 60)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(radius: 4)
                    } placeholder : {
                        ProgressView()
                    }
                    VStack(alignment : .leading) {
                        Text(feature.properties.nazev)
                            .font(.title)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                        Text(feature.properties.druh.rawValue)
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                    }
                }
            }
        }
        
    }
}

struct PlacesRow_Previews: PreviewProvider {
    static var previews: some View {
        PlacesRow(feature: Features.mock.features[0])
    }
}
