//
//  CustomScene.swift
//  Contained
//
//  Created by Kerby Jean on 1/27/20.
//  Copyright © 2020 Kerby Jean. All rights reserved.
//


import SpriteKit

class CustomScene: SKScene {
    let crab = SKSpriteNode()
    
    /// Add and center child, initializing animation sequence
    override func sceneDidLoad() {
        super.sceneDidLoad()
        addChild(crab)
                
        Settings.shared.happy ? crab.loadTextures(named: "HappyCrab", forKey: SKSpriteNode.textureKey) : crab.loadTextures(named: "WaitingCrab", forKey: SKSpriteNode.textureKey)
        crab.position = Settings.shared.position ?? CGPoint(x: frame.midX, y: frame.midY)
    }

    // Move to touch
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        /// Fetch a touch or leave
        guard !touches.isEmpty, let touch = touches.first else { return }
        
        /// Retrieve position
        let position = touch.location(in: self)
        Settings.shared.position = position
        
        /// Create move action
        let actionDuration = 1.0
        let moveAction = SKAction.move(to: position, duration: actionDuration)
        
        
        /// Create Roll action
        let rollAction = SKAction.rotate(byAngle: CGFloat.pi * 2, duration: actionDuration)
        
        /// Create Fade actions
        let fadeOutAction = SKAction.fadeOut(withDuration: 1.0)
        let fadeInAction = SKAction.fadeIn(withDuration: 1.0)
        
        /// Create zoom actions
        let zoomAction = SKAction.scale(by: 1.3, duration: 0.3)
        let unzoomAction = SKAction.scale(to: 1.0, duration: 0.1)
                
        switch Settings.shared.shouldZoom {
        case false:
            crab.run(moveAction)
        case true:
            let sequenceAction = SKAction.sequence([zoomAction, moveAction, unzoomAction])
            crab.run(sequenceAction)
        }
        
        if Settings.shared.shouldRoll {
            crab.run(rollAction)
        }
        
        if Settings.shared.shouldFade {
            let sequenceAction = SKAction.sequence([fadeOutAction, fadeInAction])
            crab.run(sequenceAction)
        }
    }
}
