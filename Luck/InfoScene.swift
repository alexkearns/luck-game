//
//  InfoScene.swift
//  Luck
//
//  Created by Alex Kearns on 13/07/2016.
//  Copyright © 2016 Alex Kearns. All rights reserved.
//

import UIKit
import SpriteKit

class InfoScene: SKScene {
    
    var textView = UITextView()
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor.init(red: 0.10, green: 0.10, blue: 0.10, alpha: 1.0)
        
        let button = SKSpriteNode(imageNamed: "HomeButton")
        button.size = CGSize(width: 35.0, height: 35.0)
        button.position = CGPoint(x: 15,y: self.frame.height-40)
        button.name = "Return"
        button.zPosition = 1
        button.anchorPoint = CGPoint(x: 0.0, y: 0.5)
        
        self.addChild(button)
        
        delay(0.3){
            let textFrame = CGRect(x: 0.0, y: 115.0, width: self.frame.width, height: self.frame.height-115.0)
            self.textView = UITextView(frame: textFrame)
            self.textView.textContainerInset = UIEdgeInsetsMake(0, 40, 40, 40)
            self.textView.isEditable = false
            self.textView.isSelectable = false
            self.textView.text = "Luck designed and developed by Alex Kearns and James Beavis\n\n" +
                "Four Leaf Clover icon designed by Freepik and distributed by Flaticon\n\n" +
                "© Copyright Alex Kearns and James Beavis 2016. All Rights Reserved"
            self.textView.font = UIFont(name: "AvenirNext-Regular", size: 17)
            self.textView.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.textView.backgroundColor = UIColor(white: 1, alpha: 0)
            self.view?.addSubview(self.textView)
        }
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNode = self.atPoint(location)
            if let name = touchedNode.name {
                if name == "Return" {
                    let transition = SKTransition.push(with: .down, duration: 0.3)
                    
                    let nextScene = HomeScene(size: self.scene!.size)
                    nextScene.scaleMode = SKSceneScaleMode.aspectFill
                    self.textView.removeFromSuperview()
                    
                    self.scene!.view!.presentScene(nextScene, transition: transition)
                }
            }
        }
    }

    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
}
