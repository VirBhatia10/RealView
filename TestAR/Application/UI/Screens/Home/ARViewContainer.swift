//
//  ARViewContainer.swift
//  ARViewContainer
//
//

import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    @Binding var entity: EntityViewModel
    
    func makeUIView(context: Context) -> ARView {
        return entity.loadARView()
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}
