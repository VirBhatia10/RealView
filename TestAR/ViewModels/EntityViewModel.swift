//
//  EntityViewModel.swift
//  EntityViewModel
//
//

import Foundation
import RealityKit
import ARKit
import FocusEntity

class EntityViewModel: NSObject, ARSessionDelegate, ObservableObject {
    
    var customARView = ARView(frame: .infinite)
    private var currAnchor: AnchorEntity = AnchorEntity(plane: .horizontal)
    private var focusEntity: FocusEntity!
    private var currObject = ObjectModel (
        model: Entity(),
        entity: ModelEntity()
    )
    
    func loadARView() {
        customARView.session.delegate = self
    }
    
    func destroyFocusEntity() {
        focusEntity.destroy()
    }
    
    func modelPicker(modelName: String, entityName: String) {
        currObject.model = try! Entity.load(named: modelName)
        currObject.entity = currObject.model.findEntity(named: entityName) as! ModelEntity
        print("Works")
    }
    
    func materialPicker(entityMaterial: Material) {
        print("materialpicker button pressed")
        focusEntity = FocusEntity(on: customARView, style: .classic(color: .purple))

        currObject.entity.model?.materials[0] = entityMaterial
    }
    
    func createObject() {
        focusEntity.destroy()

        let parentEntity = ModelEntity()
        parentEntity.addChild(currObject.model)
        let entityBounds = currObject.model.visualBounds(relativeTo: parentEntity)
        parentEntity.collision = CollisionComponent(shapes: [ShapeResource.generateBox(size: entityBounds.extents).offsetBy(translation: entityBounds.center)])
        
        currAnchor.addChild(parentEntity)
        currAnchor.transform = focusEntity.transform

        customARView.scene.anchors.append(currAnchor)
        customARView.installGestures([.rotation, .scale, .translation], for: parentEntity)

        currAnchor = AnchorEntity(plane: .horizontal)
    }

}

    









