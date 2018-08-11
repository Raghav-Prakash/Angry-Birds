//
//  GameScene.swift
//  Angry Birds
//
//  Created by Raghav Prakash on 8/9/18.
//  Copyright © 2018 Raghav Prakash. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
	
	let gameCamera = SKCameraNode()
	
	//MARK: - When game scene gets loaded
    override func didMove(to view: SKView) {
		addCameraNode()
    }
	
	//MARK: - Add camera node to bottom-left of view
	func addCameraNode() {
		guard let view = view else {return}
		gameCamera.position = CGPoint(x: view.bounds.size.width/2, y: view.bounds.size.height/2) // bottom-left of view
		
		self.addChild(gameCamera)
	}
}
