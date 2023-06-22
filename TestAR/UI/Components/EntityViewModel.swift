//
//  EntityViewModel.swift
//  TestAR
//
//  Created by Avataar on 20/06/23.
//

import Foundation
import SwiftUI
import RealityKit
import FocusEntity

class EntityVM: ObservableObject {
    
    var customARView = ARView(frame: .infinite)
    var currModel: ModelEntity = try!
        ModelEntity.loadModel(named: "toy_biplane_idle.usdz")
    var currAnchor: AnchorEntity = AnchorEntity(plane: .horizontal)
    var focusEntity: FocusEntity!
    
    func confirmObject(){
        
        focusEntity.destroy()
        
//        var focusEntityLocation =
        currAnchor.transform = focusEntity.transform
        currModel.generateCollisionShapes(recursive: true)
        currAnchor.addChild(currModel)
        customARView.scene.anchors.append(currAnchor)
        customARView.installGestures([.rotation, .scale, .translation], for: currModel)
        
        currAnchor = AnchorEntity(plane: .horizontal)
    }
    
    func modelChanger(modelCode: String) {

        focusEntity = FocusEntity(on: customARView, style: .classic(color: .purple))

        if !customARView.scene.anchors.isEmpty {
            currAnchor.removeChild(currModel)
            customARView.scene.anchors.remove(currAnchor)
        }
        
        if modelCode == "chair" {
            currModel = try!
            ModelEntity.loadModel(named: "chair_swan")
            
        }
        else if modelCode == "gramophone" {
            currModel = try!
                ModelEntity.loadModel(named: "gramophone.usdz")
        }
        else {
            currModel = try!
                ModelEntity.loadModel(named: "toy_biplane_idle.usdz")
        }
    }

}









