//
//  AYFLScene.swift
//  Luck
//
//  Created by Alex Kearns on 12/07/2016.
//  Copyright © 2016 Alex Kearns. All rights reserved.
//

import UIKit
import SpriteKit

class AYFLScene: SKScene {
    
    override func didMove(to view: SKView){
        
        self.backgroundColor = SKColor.init(red: 0.10, green: 0.10, blue: 0.10, alpha: 1.0)
        
        let frameWidth = self.frame.width
        let frameHeight = self.frame.height
        
        let clover = SKSpriteNode(imageNamed: "CloverBlk")
        let cloverWidth = self.frame.width*0.7
        let cloverHeight = cloverWidth * 1.22666
        clover.size = CGSize(width: cloverWidth, height: cloverHeight)
        clover.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        clover.position = CGPoint(x: 0.0, y: 0.0)
        clover.zPosition = 0
        self.addChild(clover)
        
        let ayfl = SKSpriteNode(imageNamed: "AreYouFeelingLucky")
        let ayflHeight = (frameWidth * 0.80) * 0.346875
        ayfl.size = CGSize(width: frameWidth * 0.80, height: ayflHeight)
        ayfl.position = CGPoint(x: frameWidth/2, y: (frameHeight+50)/2)
        ayfl.alpha = 0
        ayfl.zPosition = 1
        self.addChild(ayfl)
        
        let fadeIn = SKAction.fadeIn(withDuration: 1)
        let fadeOut = SKAction.fadeOut(withDuration: 1)
        
        delay(0.5){
          ayfl.run(fadeIn)
        }
        delay(2){
            ayfl.run(fadeOut)
        }
        delay(3){
            let transition = SKTransition.crossFade(withDuration: 1)
            let nextScene = GameScene(size: self.scene!.size)
            nextScene.scaleMode = SKSceneScaleMode.aspectFill
            
            self.scene!.view!.presentScene(nextScene, transition: transition)
        }
        
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }

}
