//
//  EntityView.swift
//  TestAR
//
//  Created by Avataar on 20/06/23.
//

import Foundation
import RealityKit


struct EntityView: Identifiable {
    var id = UUID()
    var mesh: MeshResource
    var material: SimpleMaterial
    var meshSize: Float
    
    
}
