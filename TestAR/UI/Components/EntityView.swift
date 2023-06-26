//
//  EntityView.swift
//  TestAR
//
//  Created by Avataar on 20/06/23.
//

import Foundation
import RealityKit
import FocusEntity

struct EntityView: Identifiable {
    var id = UUID()
    var customARView: ARView
    var currModel: ModelEntity
    var currAnchor: AnchorEntity
    var focusEntity: FocusEntity
    
    
}
