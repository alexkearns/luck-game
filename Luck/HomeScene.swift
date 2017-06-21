//
//  GameScene.swift
//  Luck
//
//  Created by Alex Kearns on 06/06/2016.
//  Copyright © 2016 Alex Kearns. All rights reserved.
//

import SpriteKit
import UIKit
import GameKit

class HomeScene: SKScene {
    
    let key = "highScore"
    let defaults = UserDefaults.standard
    var facebook = UIButton()
    var twitter = UIButton()
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = SKColor.init(red: 0.10, green: 0.10, blue: 0.10, alpha: 1.0)
        
        let frameWidth = self.frame.width
        let frameHeight = self.frame.height
        
        let stripe = SKSpriteNode(imageNamed: "Stripe")
        stripe.size = CGSize(width: frameWidth, height: frameHeight)
        stripe.position = CGPoint(x: 0.0, y: 0.0)
        stripe.zPosition = 0
        stripe.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        
        let logo = SKSpriteNode(imageNamed: "Luck")
        let logoWidth = frameWidth * 0.9
        let logoHeight = logoWidth * 0.365625
        let logoPosX = frameWidth/2
        let logoPosY = frameHeight - (frameHeight * 0.05)
        logo.position = CGPoint(x: logoPosX,y: logoPosY)
        logo.size = CGSize(width: logoWidth, height: logoHeight)
        logo.zPosition = 1
        logo.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        
        let warning = SKSpriteNode(imageNamed: "Warning")
        let warningWidth = frameWidth / 2.2
        let warningHeight = warningWidth * 0.3125
        warning.size=CGSize(width: warningWidth, height: warningHeight)
        warning.zPosition = 1
        warning.anchorPoint = CGPoint(x: 1.0, y: 1.0)
        let warningX = frameWidth * 0.95
        let warningY = logoPosY - (logoHeight*1.4)
        warning.position = CGPoint(x: warningX, y: warningY)
        
        let warningTitle = SKSpriteNode(imageNamed: "WarningStrap")
        let warningStrapHeight = warningWidth * 0.15625
        warningTitle.zPosition = 1
        warningTitle.size = CGSize(width: warningWidth, height: warningStrapHeight)
        warningTitle.anchorPoint = CGPoint(x: 1.0, y: 0.0)
        warningTitle.position = CGPoint(x: warningX, y: warningY)
        
        let button = SKSpriteNode(imageNamed: "Start game")
        let buttonWidth = frameWidth * 0.6
        let buttonHeight = buttonWidth * 0.375
        let buttonY = (self.frame.height/5)
        button.position = CGPoint(x: self.frame.width/2, y: buttonY)
        button.size = CGSize(width: buttonWidth, height: buttonHeight)
        button.zPosition = 1
        button.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        button.name = "Proceed"
        
        var score = defaults.string(forKey: key)
        if score == nil{
            score = String(0)
        }
        else{
            score = defaults.string(forKey: key)
        }
        let highScore = SKLabelNode(text: score)
        highScore.zPosition = 10
        let highScoreX: CGFloat = ceil(frameWidth/20)
        let highScoreY: CGFloat = ceil((frameHeight/2))
        highScore.position = CGPoint(x: highScoreX, y: highScoreY)
        highScore.horizontalAlignmentMode = .left
        highScore.verticalAlignmentMode = .bottom
        highScore.fontColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        highScore.fontSize = 70
        highScore.fontName = "Avenir Next Bold"
        highScore.zPosition = 1
        let highScoreLabel = SKLabelNode(text: "HIGH SCORE")
        highScoreLabel.zPosition = 10
        highScoreLabel.position = CGPoint(x: highScoreX, y: highScoreY-10)
        highScoreLabel.fontSize = 22
        highScoreLabel.fontColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        highScoreLabel.fontName = "Avenir Next Medium"
        highScoreLabel.horizontalAlignmentMode = .left
        highScoreLabel.verticalAlignmentMode = .top
        highScoreLabel.zPosition = 1
        
        let info = SKSpriteNode(imageNamed: "InfoButton")
        info.size = CGSize(width: 50.0, height: 50.0)
        info.position = CGPoint(x: (frameWidth/2)-65.0, y: buttonY - 30)
        info.anchorPoint = CGPoint(x: 1.0, y: 1.0)
        info.name = "Info"
        info.zPosition = 1
        
        let leaderboard = SKSpriteNode(imageNamed: "LeaderboardButton")
        leaderboard.size = CGSize(width: 50.0, height: 50.0)
        leaderboard.position = CGPoint(x: (frameWidth/2)-5, y: buttonY - 30)
        leaderboard.anchorPoint = CGPoint(x: 1.0, y: 1.0)
        leaderboard.name = "Leaderboard"
        leaderboard.zPosition = 1
        
        let twitterBtn = SKSpriteNode(imageNamed: "Twitter")
        twitterBtn.anchorPoint = CGPoint(x: 0.0, y: 1.0)
        twitterBtn.size = CGSize(width: 50.0, height: 50.0)
        twitterBtn.position = CGPoint(x: (frameWidth/2)+5, y: buttonY - 30)
        twitterBtn.name = "Twitter"
        twitterBtn.zPosition = 1
        
        let facebookBtn = SKSpriteNode(imageNamed: "Facebook")
        facebookBtn.anchorPoint = CGPoint(x: 0.0, y: 1.0)
        facebookBtn.size = CGSize(width: 50.0, height: 50.0)
        facebookBtn.position = CGPoint(x: (frameWidth/2)+65, y: buttonY - 30)
        facebookBtn.name = "Facebook"
        facebookBtn.zPosition = 1
        
        self.addChild(stripe)
        self.addChild(logo)
        self.addChild(warning)
        self.addChild(warningTitle)
        self.addChild(highScore)
        self.addChild(highScoreLabel)
        self.addChild(button)
        self.addChild(info)
        self.addChild(leaderboard)
        self.addChild(twitterBtn)
        self.addChild(facebookBtn)
        
        let warningToColor = SKAction.colorize(with: UIColor(red: 0.8471, green: 0.1216, blue: 0.1529, alpha: 1.0), colorBlendFactor: 1.0, duration: 0.3)
        let warningToWhite = SKAction.colorize(with: UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), colorBlendFactor: 1.0, duration: 0.3)
        let warningSequence = SKAction.sequence([warningToColor, warningToWhite])
        let warningRepeat = SKAction.repeatForever(warningSequence)
        
        let logoGrow = SKAction.scale(by: 1.03, duration: 0.3)
        let logoShrink = logoGrow.reversed()
        let sequence = SKAction.sequence([logoGrow, logoShrink])
        let endlessSequence = SKAction.repeatForever(sequence)
        
        button.run(endlessSequence)
        warningTitle.run(warningRepeat)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let location = touch.location(in: self)
            let touchedNode = self.atPoint(location)
            if let name = touchedNode.name {
                if name == "Proceed" {
                    
                    let transition = SKTransition.fade(with: UIColor(red: 0.10, green: 0.10, blue: 0.10, alpha: 1.0), duration: 0.3)
                    
                    let nextScene = AYFLScene(size: self.scene!.size)
                    nextScene.scaleMode = SKSceneScaleMode.aspectFill
                    
                    self.scene!.view!.presentScene(nextScene, transition: transition)

                }
                else if name == "Info" {
                    
                    let transition = SKTransition.push(with: .up, duration: 0.3)
                    
                    let nextScene = InfoScene(size: self.scene!.size)
                    nextScene.scaleMode = SKSceneScaleMode.aspectFill
                    
                    self.scene!.view!.presentScene(nextScene, transition: transition)

                    
                }
                else if name == "Leaderboard" {
                    
                    if GKLocalPlayer.localPlayer().isAuthenticated {
                        
                        let controller = self.view?.window?.rootViewController as! GameViewController
                        controller.saveHighScore(defaults.integer(forKey: key))
                        //print("High score saved to GC of " + String(defaults.integerForKey(key)))
                        
                    }
                    
                    let controller = self.view?.window?.rootViewController as! GameViewController
                    controller.showLeaderboard()
                    
                }
                else if name == "Twitter" {
                    
                    let url = URL(string: "http://www.twitter.com/LuckApp_")
                    UIApplication.shared.openURL(url!)
                    
                }
                else if name == "Facebook" {
                    
                    let url = URL(string: "http://www.facebook.com/LuckAGameOfFortune")
                    UIApplication.shared.openURL(url!)
                    
                }
            }
        }
    }
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
}
