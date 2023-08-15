//
//  Environment.swift
//  DevAcademy
//
//  Created by Ondřej Man on 14.08.2023.
//

import Foundation
import SwiftUI

private struct Environment: ViewModifier {
    let objects: ObservableObjects
    let coordinator: Coordinator

    func body(content: Content) -> some View {
        content
            .environmentObject(objects.places)
            .environmentObject(coordinator)
    }
}

extension View {
    func inject(objects: ObservableObjects, coordinator: Coordinator) -> some View {
        modifier(Environment(objects: objects, coordinator: coordinator))
    }

    func injectPreviewsEnvironment() -> some View {
        modifier(Environment(objects: .mock, coordinator: Coordinator()))
    }
}
