//
//  ObjectModel.swift
//  TestAR
//
//  Created by Avataar on 26/06/23.
//

import Foundation
import RealityKit

struct ObjectModel: Identifiable {
    var id = UUID()
    var Model: ModelEntity
    var Entity: Entity
    var Appearance: [Material]
}
