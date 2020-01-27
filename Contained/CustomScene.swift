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
    
    // Add and center child, initializing animation sequence
    override func sceneDidLoad() {
        super.sceneDidLoad()
        addChild(crab)
                
        Settings.shared.happy ? crab.loadTextures(named: "HappyCrab", forKey: SKSpriteNode.textureKey) : crab.loadTextures(named: "WaitingCrab", forKey: SKSpriteNode.textureKey)
        crab.position = Settings.shared.position ?? CGPoint(x: frame.midX, y: frame.midY)
    }
    
   
    
    // Move to touch
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Fetch a touch or leave
        guard !touches.isEmpty, let touch = touches.first else { return }
        
        // Retrieve position
        let position = touch.location(in: self)
        Settings.shared.position = position
        
        // Create move action
        let actionDuration = 1.0
        let moveAction = SKAction.move(to: position, duration: actionDuration)
        
        let rollAction = SKAction.rotate(byAngle: CGFloat.pi * 2, duration: actionDuration)
        let fadeAction = SKAction.fadeAlpha(by: 1.5, duration: 1.5)
        let falloffAction = SKAction.falloff(by: 10.0, duration: 1.0)
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
            print("SHOULD FADE")
            crab.run(fadeAction)
        }
        if Settings.shared.shouldFall {
            crab.run(falloffAction)
        }
    }
}
