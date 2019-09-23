//
//  Extension.swift
//  Portal575
//
//  Created by Siddharth Kataria on 2019-09-22.
//  Copyright © 2019 Siddharth Kataria. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

var width: CGFloat = 0.02
var height: CGFloat = 1
var length: CGFloat = 1

var doorLength: CGFloat = 0.3

func createPortal(isDoor: Bool) -> SCNNode {
    let node = SCNNode()
    
    //Adding space
    let blackSpace = SCNBox(width: width, height: height, length: isDoor ? doorLength : length, chamferRadius: 0)
    let blackSpaceNode = SCNNode(geometry: blackSpace)
    blackSpaceNode.renderingOrder = 200 //All objects within this space will have this renderingOrder value
    
    node.addChildNode(blackSpaceNode)
    
    //Adding Masked Space
    let maskedSpace = SCNBox(width: width, height: height, length: isDoor ? doorLength : length, chamferRadius: 0)
    maskedSpace.firstMaterial?.diffuse.contents = UIColor.white
    maskedSpace.firstMaterial?.transparency = 0.00001
    
    let maskedSpaceNode = SCNNode(geometry: maskedSpace)
    maskedSpaceNode.renderingOrder = 100
    maskedSpaceNode.position = SCNVector3.init(width, 0, 0)
    
    node.addChildNode(maskedSpaceNode)
     
    return node
}

//Creating extended function to convert rad to deg and deg to rad

extension FloatingPoint {
    var d2R : Self {
        return self * .pi / 180
    }
    var r2D : Self {
        return self * 180 / .pi
    }
}
