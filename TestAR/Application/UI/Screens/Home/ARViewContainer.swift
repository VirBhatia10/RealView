//
//  ARViewContainer.swift
//  ARViewContainer
//
//

import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    var entity: EntityViewModel
    
    func makeUIView(context: Context) -> ARView {
        entity.loadARView()
        return entity.customARView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}
