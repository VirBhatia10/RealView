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
    var currAnchor: AnchorEntity = AnchorEntity(plane: .horizontal)
    var focusEntity: FocusEntity!
    
    var currObject = ObjectModel(
        model: Entity(),
        entity: ModelEntity(),
        appearance: SimpleMaterial()
    )
    
    
    func modelPicker(modelName: String, entityName: String) {
        focusEntity = FocusEntity(on: customARView, style: .classic(color: .purple))
        
        if !customARView.scene.anchors.isEmpty {
            customARView.scene.anchors.remove(currAnchor)
        }
        
        currObject.model = try! Entity.load(named: modelName)
        currObject.entity = currObject.model.findEntity(named: entityName) as! ModelEntity
        
        materialPicker(entityMaterial: SimpleMaterial(color: .cyan, isMetallic: false))
        
    }
    
    func materialPicker(entityMaterial: Material) {
        
        currObject.entity.model?.materials[0] = entityMaterial
        
    }
    
    func createObject(){
        focusEntity.destroy()
        currAnchor.transform = focusEntity.transform
        
        let parentEntity = ModelEntity()
        parentEntity.addChild(currObject.model)
        
        let entityBounds = currObject.model.visualBounds(relativeTo: parentEntity)
        parentEntity.collision = CollisionComponent(shapes: [ShapeResource.generateBox(size: entityBounds.extents).offsetBy(translation: entityBounds.center)])
        
        currAnchor.addChild(parentEntity)
        
        customARView.scene.anchors.append(currAnchor)
        customARView.installGestures([.rotation, .scale, .translation], for: parentEntity)

        currAnchor = AnchorEntity(plane: .horizontal)
    }
    
    

    
}

    









