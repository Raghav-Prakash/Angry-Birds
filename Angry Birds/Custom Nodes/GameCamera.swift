//
//  GameCamera.swift
//  Angry Birds
//
//  Created by Raghav Prakash on 8/12/18.
//  Copyright © 2018 Raghav Prakash. All rights reserved.
//

import SpriteKit

class GameCamera: SKCameraNode {
	
	//MARK: - Add constraints to a node (in this case the camera node) given the scene and TileMapNode frame
	func addConstraints(with scene: SKScene, and frame: CGRect, to node: SKNode?) {
		
		// Get the scaled size
		let scaledSize = CGSize(width: scene.size.width * xScale, height: scene.size.height * yScale)
		
		// Set up an inset rectangle on our frame for the camera to be inset (constrained)
		let xInset = min(scaledSize.width / 2, frame.size.width / 2)
		let yInset = min(scaledSize.height / 2, frame.size.height / 2)
		let frameInsetRect = frame.insetBy(dx: xInset, dy: yInset)
		
		// From the inset Rectangle, get the x-coordinate range and y-coordinate range
		let xRange = SKRange(lowerLimit: frameInsetRect.minX, upperLimit: frameInsetRect.maxX)
		let yRange = SKRange(lowerLimit: frameInsetRect.minY, upperLimit: frameInsetRect.maxY)
		let frameEdgeConstraint = SKConstraint.positionX(xRange, y: yRange)
		
		// Add the frameEdgeConstraint to the array of constraints in our SKCameraNode
		self.constraints = [frameEdgeConstraint]
	}
}
