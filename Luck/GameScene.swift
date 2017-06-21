//
//  GameScene.swift
//  Luck
//
//  Created by Alex Kearns on 06/06/2016.
//  Copyright © 2016 Alex Kearns. All rights reserved.
//

import SpriteKit
import UIKit

class GameScene: SKScene {
    
    var numOfOptions = 0
    var score = 0
    var highScore: Bool = false
    let containerNode = SKNode()
    let key = "highScore"
    let defaults = UserDefaults.standard
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor.init(red: 0.10, green: 0.10, blue: 0.10, alpha: 1.0)
        
        let clover = SKSpriteNode(imageNamed: "CloverBlk")
        let cloverWidth = self.frame.width*0.7
        let cloverHeight = cloverWidth * 1.22666
        clover.size = CGSize(width: cloverWidth, height: cloverHeight)
        clover.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        clover.position = CGPoint(x: 0.0, y: 0.0)
        clover.zPosition = 0
        self.addChild(clover)
        
        let button = SKSpriteNode(imageNamed: "HomeButton")
        button.size = CGSize(width: 35.0, height: 35.0)
        button.position = CGPoint(x: 15,y: self.frame.height-40)
        button.name = "Return"
        button.zPosition = 1
        button.anchorPoint = CGPoint(x: 0.0, y: 0.5)
        
        self.addChild(button)
        
        self.addChild(containerNode)
        
        makeOptions(2)
        makeScore()
    }
    
    func isNewHighScore(_ newScore: Int){

        let currentScore = defaults.integer(forKey: key)
        if(newScore > currentScore){
            let grow = SKAction.scale(by: 1.0, duration: 0.3)
            let shrink = grow.reversed()
            let sequence = SKAction.sequence([grow, shrink])
            let growShrink = SKAction.repeatForever(sequence)
            let label = childNode(withName: "Score Label") as! SKLabelNode
            label.run(growShrink)
            let controller = self.view?.window?.rootViewController as! GameViewController
            controller.saveHighScore(newScore)
            defaults.set(score, forKey: key)
            self.highScore = true
        }
    }
    
    func regenScore(){
        
        let label = childNode(withName: "Score Label") as! SKLabelNode
        label.text = String(score)
        if(self.highScore == true){
            label.fontColor = UIColor(red: 0.9608, green: 0.6706, blue: 0.2078, alpha: 1.0)
        }
        else{
            label.fontColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        if score == 0{
            clearOptions()
            makeOptions(2)
        }
        else if score == 10{
            clearOptions()
            makeOptions(3)
        }
        else if score == 20{
            clearOptions()
            makeOptions(4)
        }
    }
    
    func makeScore(){
        let label = SKLabelNode(fontNamed: "Avenir Next Demi Bold")
        label.fontSize = 70
        label.horizontalAlignmentMode = .right
        label.verticalAlignmentMode = .center
        label.text = String(score)
        label.fontColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
        label.zPosition = 1
        label.name = "Score Label"
        let posY = self.frame.height - 40
        let posX = self.frame.width - 15
        label.position = CGPoint(x: posX, y: posY)
        self.addChild(label)
    }
    
    func adjustLabelFontSizeToFitRect(_ labelNode:SKLabelNode, rect:CGRect) {
        
        let scalingFactor = min(rect.width / labelNode.frame.width, rect.height / labelNode.frame.height)
        labelNode.fontSize *= scalingFactor
        labelNode.position = CGPoint(x: rect.midX, y: rect.midY - labelNode.frame.height / 2.0)
    }
    
    func clearOptions(){
        
        containerNode.enumerateChildNodes(withName: "Option") {
            node, stop in
            node.removeFromParent();
        }
        
    }
    
    func createOption() -> SKSpriteNode{
        
        let frameWidth = self.frame.width
        let optionWidth = (frameWidth/2) * 0.6
        let optionHeight = optionWidth
        
        let sprite = SKSpriteNode(imageNamed: "Option")
        
        sprite.size = CGSize(width: optionWidth, height: optionHeight)
        sprite.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        sprite.zPosition = 2
        sprite.name = "Option"
        
        return sprite
    }
    
    func makeOptions(_ num:Int){
        
        let frameHeight = self.frame.height
        let frameWidth = self.frame.width
        
        let optionWidth = (frameWidth/2) * 0.6
        let optionHeight = optionWidth
        
        let row1 = (frameHeight/2)+20
        let row2 = (frameHeight/2)-(optionHeight)-20
        
        let left = (frameWidth - (optionWidth*2))/3
        let right = (left*2) + optionWidth
        
        if num == 2{
            
            numOfOptions = 2
            
            let verticalCentre = (frameHeight/2)-(optionHeight/2)
            
            let option1 = createOption()
            option1.position = CGPoint(x: left, y: verticalCentre)
            containerNode.addChild(option1)
            
            let option2 = createOption()
            option2.position = CGPoint(x: right, y: verticalCentre)
            containerNode.addChild(option2)
            
        }
        else if num == 3{
            
            numOfOptions = 3
            
            let horizontalCentre = (frameWidth/2) - (optionWidth/2)
            
            let option1 = createOption()
            option1.position = CGPoint(x: left, y: row1)
            containerNode.addChild(option1)
            
            let option2 = createOption()
            option2.position = CGPoint(x: right, y: row1)
            containerNode.addChild(option2)
            
            let option3 = createOption()
            option3.position = CGPoint(x: horizontalCentre, y: row2)
            containerNode.addChild(option3)
            
        }
        else if num == 4{
            
            numOfOptions = 4
            
            let option1 = createOption()
            option1.position = CGPoint(x: left, y: row1)
            containerNode.addChild(option1)
            
            let option2 = createOption()
            option2.position = CGPoint(x: right, y: row1)
            containerNode.addChild(option2)
            
            let option3 = createOption()
            option3.position = CGPoint(x: left, y: row2)
            containerNode.addChild(option3)
            
            let option4 = createOption()
            option4.position = CGPoint(x: right, y: row2)
            containerNode.addChild(option4)
            
        }
    }
    
    func probability() -> Bool{
        let choices = self.numOfOptions
        let random = arc4random_uniform(UInt32(choices))
        if random == 0 {
            return true
        }
        else{
            return false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNode = self.atPoint(location)
            if let name = touchedNode.name {
                if name == "Return" {
                    let transition = SKTransition.fade(withDuration: 0.3)
                    
                    let nextScene = HomeScene(size: self.scene!.size)
                    nextScene.scaleMode = SKSceneScaleMode.aspectFill
                    
                    self.scene!.view!.presentScene(nextScene, transition: transition)
                }
        }
    }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch ends */
        
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNode = self.atPoint(location)
            if let name = touchedNode.name {
                if name == "Option" {
                    
                    let node = touchedNode as! SKSpriteNode
                    
                    let timeDelay = Double(0.4)
                    
                    if probability(){
                        node.texture = SKTexture(imageNamed: "OptionTick")
                        self.delay(timeDelay){
                            self.score += 1
                            self.isNewHighScore(self.score)
                            self.regenScore()
                            node.texture = SKTexture(imageNamed: "Option")
                        }
                    }
                    else{
                        node.texture = SKTexture(imageNamed: "OptionCross")
                        self.delay(timeDelay){
                            let label = self.childNode(withName: "Score Label") as! SKLabelNode
                            label.removeAllActions()
                            self.score = 0
                            self.highScore = false
                            self.regenScore()
                            node.texture = SKTexture(imageNamed: "Option")
                        }
                    
                }
            }
            
        }
    }
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
}
