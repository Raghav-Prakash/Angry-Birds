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
	
	let gameCamera = GameCamera()
	var panner = UIPanGestureRecognizer() // for panning on screen
	
	//MARK: - When game scene gets loaded
    override func didMove(to view: SKView) {
		addCameraNode()
		setUpPanningGestureRecognizer()
    }
	
	//MARK: - Add camera node to "center" which is the bottom-left of view
	func addCameraNode() {
		guard let view = view else {return}
		gameCamera.position = CGPoint(x: view.bounds.size.width/2, y: view.bounds.size.height/2)
		
		self.addChild(gameCamera)
		self.camera = gameCamera
	}
	
	//MARK: - Add functionality to scroll horizontally and vertically
	func setUpPanningGestureRecognizer() {
		guard let view = view else {return}
		
		// Before adding the panning gesture to our view, define what should happen if we pan on screen
		panner = UIPanGestureRecognizer(target: self, action: #selector(pan))
		
		// Add the panning gesture to our view
		view.addGestureRecognizer(panner)
	}
}

//MARK: - Custom functionality for panning on screen
extension GameScene {
	
	@objc func pan(sender: UIPanGestureRecognizer) {
		guard let view = view else {return}
		
		let translatedCoordinates = sender.translation(in: view)
		// Update gameCamera's position
		gameCamera.position = CGPoint(x: gameCamera.position.x - translatedCoordinates.x, y: gameCamera.position.y + translatedCoordinates.y) // To drag horizontally and scroll vertically
		
		// Reset the translation coordinates back to (0,0) to be re-used the next time the user pans
		sender.setTranslation(CGPoint.zero, in: view)
	}
}
