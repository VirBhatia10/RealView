//
//  EntityViewModel.swift
//  TestAR
//
//  Created by Avataar on 20/06/23.
//

import Foundation
import RealityKit
import FocusEntity
import RealityUI

class EntityVM: ObservableObject {
    
    var customARView = ARView(frame: .infinite)
    var currModel: Entity?
    var currAnchor: AnchorEntity = AnchorEntity(plane: .horizontal)
    var focusEntity: FocusEntity!
    
//    var currObject = ObjectModel(
//        model: try! ModelEntity.loadModel(named: "chair_swan"),
//        entity: ModelEntity(),
//        appearance: SimpleMaterial()
//    )
    
    
    func modelPicker(modelName: String, entityName: String) {
        focusEntity = FocusEntity(on: customARView, style: .classic(color: .purple))
        
        if !customARView.scene.anchors.isEmpty {
            //            currAnchor.removeChild(currObject!.model)
            customARView.scene.anchors.remove(currAnchor)
        }
        
        currModel = try! Entity.load(named: modelName)
        
        let entity = currModel?.findEntity(named: entityName) as! ModelEntity
        
        entity.model?.materials[0] = SimpleMaterial(color: .blue, isMetallic: false)
        
    }
    
    func confirmObject(){
        focusEntity.destroy()
        currAnchor.transform = focusEntity.transform
        
        let parentEntity = ModelEntity()
        parentEntity.addChild(currModel!)
        
        let entityBounds = currModel?.visualBounds(relativeTo: parentEntity)
        parentEntity.collision = CollisionComponent(shapes: [ShapeResource.generateBox(size: entityBounds!.extents).offsetBy(translation: entityBounds!.center)])
        
        currAnchor.addChild(parentEntity)
        
        customARView.scene.anchors.append(currAnchor)
        customARView.installGestures([.rotation, .scale, .translation], for: parentEntity)

        currAnchor = AnchorEntity(plane: .horizontal)
    }
    
    

    
}

    









