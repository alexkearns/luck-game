//
//  GameViewController.swift
//  Luck
//
//  Created by Alex Kearns on 06/06/2016.
//  Copyright (c) 2016 BeeKay Applications. All rights reserved.
//

import UIKit
import SpriteKit
import GameKit

class GameViewController: UIViewController, GKGameCenterControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authenticateLocalPlayer()
        
        let scene = HomeScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    
    }
    
    // Game Center Methods
    
    func authenticateLocalPlayer(){
        
        let localPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {(viewController, error) -> Void in
            
            if (viewController != nil) {
                self.present(viewController!, animated: true, completion: nil)
            }
                
            else {
            }
        }
        
    }
    
    func saveHighScore(_ score:Int) {

        if GKLocalPlayer.localPlayer().isAuthenticated {
            
            let scoreReporter = GKScore(leaderboardIdentifier: "luck.overall")
            
            scoreReporter.value = Int64(score)
            
            let scoreArray: [GKScore] = [scoreReporter]
        
            GKScore.report(scoreArray, withCompletionHandler: {(error : NSError?) -> Void in
                if error != nil {
                    print("error")
                }
            } as? (Error?) -> Void)
            
        }
        
    }

    func showLeaderboard() {
        let vc = self.view?.window?.rootViewController
        let gc = GKGameCenterViewController()
        gc.gameCenterDelegate = self
        vc?.present(gc, animated: true, completion: nil)
    }

    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController)
    {
        gameCenterViewController.dismiss(animated: true, completion: nil)
        
    }
    
    // Miscellanous methods
    
    override var shouldAutorotate : Bool {
        return false
    }

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
}
