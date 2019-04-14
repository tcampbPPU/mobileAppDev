//
//  GameScene.swift
//  JumpGame
//
//  Created by Tanner Campbell on 4/3/19.
//  Copyright © 2019 Tanner Campbell. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player : SKSpriteNode?
    var gameTimer : Timer?
    var bombTimer : Timer?
    var ground :  SKSpriteNode?
    var ceiling :  SKSpriteNode?
    var scoreLabel :  SKLabelNode?
    var finalScoreLabel :  SKLabelNode?
    var yourScoreLabel :  SKLabelNode?
    // var playBtn : SKLabelNode?
    
    
    let playerCategory : UInt32 = 0x1 << 1
    let coinCategory : UInt32 = 0x1 << 2
    let bombCategory : UInt32 = 0x1 << 3
    let groundAndCeilingCategory : UInt32 = 0x1 << 4
    
    var score = 0
    
    override func didMove(to view: SKView) {
        
        // collision
        physicsWorld.contactDelegate = self
        
        player = childNode(withName: "player") as? SKSpriteNode
        player?.physicsBody?.categoryBitMask = playerCategory
        player?.physicsBody?.contactTestBitMask = coinCategory | bombCategory
        // player?.physicsBody?.contactTestBitMask = groundAndCeilingCategory
        player?.physicsBody?.collisionBitMask = groundAndCeilingCategory
        var playerRun : [SKTexture] = []
        for number in 1...5 {
            playerRun.append(SKTexture(imageNamed: "a\(number)"))
        }
        
        player?.run(SKAction.repeatForever(SKAction.animate(with: playerRun, timePerFrame: 0.12)))
        
        
        
        
        /*
         ground = childNode(withName: "ground") as? SKSpriteNode
         ground?.physicsBody?.contactTestBitMask = groundAndCeilingCategory
         ground?.physicsBody?.collisionBitMask = playerCategory
        
         ceiling = childNode(withName: "ceiling") as? SKSpriteNode
         ceiling?.physicsBody?.contactTestBitMask = groundAndCeilingCategory
         ceiling?.physicsBody?.collisionBitMask = playerCategory
        */
        
        
        scoreLabel = childNode(withName: "score") as? SKLabelNode
        
        // init game
        startTimer()
        genGround()
    
        
    }
    
    func genGround() {
        let sizingGround = SKSpriteNode(imageNamed: "ground")
        let numberOfGround = Int(size.width / sizingGround.size.width) + 1
        for number in 0...numberOfGround {
            let ground = SKSpriteNode(imageNamed: "ground")
            ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
            ground.physicsBody?.categoryBitMask = groundAndCeilingCategory
            ground.physicsBody?.collisionBitMask = playerCategory
            ground.physicsBody?.affectedByGravity = false
            ground.physicsBody?.isDynamic = false
            addChild(ground)
            
            let groundX = -size.width / 2 + ground.size.width / 2 + ground.size.width * CGFloat(number)
            ground.position = CGPoint(x: groundX, y: -size.height / 2 + ground.size.height / 2 - 18)
            let speed = 100.0
            let firstMoveLeft = SKAction.moveBy(x: -ground.size.width - ground.size.width * CGFloat(number), y: 0, duration: TimeInterval(ground.size.width + ground.size.width * CGFloat(number)) / speed)
            
            let resetGround = SKAction.moveBy(x: size.width + ground.size.width, y: 0, duration: 0)
            
            let groundFullMove = SKAction.moveBy(x: -size.width + ground.size.width, y: 0, duration: TimeInterval(size.width + ground.size.width) / speed)
            let grondMoveForver = SKAction.repeatForever(SKAction.sequence([groundFullMove, resetGround]))
            
            
            ground.run(SKAction.sequence([firstMoveLeft, resetGround, grondMoveForver]))
        }
    }
    
    func startTimer() {
        // Coin Timer
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.genCoin()
            //self.genExplosion()
        })
       
        // Bomb Timer
        bombTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { (timer) in
            self.genExplosion()
        })
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        if scene?.isPaused == false {
            // moves player
            player?.physicsBody?.applyForce(CGVector(dx:0, dy: 20000));
        }
        
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            let theNodes = nodes(at: location)
            
            for node in theNodes {
                if node.name == "play" {
                    // Restart Game
                    score = 0
                    node.removeFromParent()
                    finalScoreLabel?.removeFromParent()
                    yourScoreLabel?.removeFromParent()
                    scene?.isPaused = false
                    scoreLabel?.text = "Score: \(score)"
                    startTimer()
                    
                }
            }
        }
    }
    
    func genCoin() {
        let coin = SKSpriteNode(imageNamed: "dollar")
        coin.physicsBody = SKPhysicsBody(rectangleOf: coin.size)
        coin.physicsBody?.affectedByGravity = false
        coin.physicsBody?.categoryBitMask = coinCategory
        coin.physicsBody?.contactTestBitMask = playerCategory
        coin.physicsBody?.collisionBitMask = 0
        addChild(coin)
        
        let sizingGround = SKSpriteNode(imageNamed: "ground")
        
        // setting height strucutre
         let maxY = size.height / 2 - coin.size.height / 2
         let minY = -size.height / 2 + coin.size.height / 2 + sizingGround.size.height
         let range = maxY - minY
         let coinY = maxY - CGFloat(arc4random_uniform(UInt32(range)))
        
        
        // setup vars and handle directions
         coin.position = CGPoint(x: size.width / 2 + coin.size.width / 2, y: coinY)
        
        // set direction of coin and speed
        let moveLeft = SKAction.moveBy(x: -size.width - coin.size.width, y: 0, duration: 4)
        coin.run(SKAction.sequence([moveLeft, SKAction.removeFromParent()]))
    }
    
    func genExplosion() {
        let bomb = SKSpriteNode(imageNamed: "bomb")
        bomb.physicsBody = SKPhysicsBody(rectangleOf: bomb.size)
        bomb.physicsBody?.affectedByGravity = false
        bomb.physicsBody?.categoryBitMask = bombCategory
        bomb.physicsBody?.contactTestBitMask = playerCategory
        bomb.physicsBody?.collisionBitMask = 0
        addChild(bomb)
        
        
        let sizingGround = SKSpriteNode(imageNamed: "ground")
        // setting height strucutre
        let maxY = size.height / 2 - bomb.size.height / 2
        let minY = -size.height / 2 + bomb.size.height / 2 + sizingGround.size.height
        let range = maxY - minY
        let bombY = maxY - CGFloat(arc4random_uniform(UInt32(range)))
        
        // setup vars and handle directions
        bomb.position = CGPoint(x: size.width / 2 + bomb.size.width / 2, y: bombY)
        
        // set direction of bomb and speed
        let moveLeft = SKAction.moveBy(x: -size.width - bomb.size.width, y: 0, duration: 4)
        bomb.run(SKAction.sequence([moveLeft, SKAction.removeFromParent()]))
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.categoryBitMask == coinCategory {
            contact.bodyA.node?.removeFromParent()
            score += 1
            scoreLabel?.text = "Score: \(score)"
            
        }
        if contact.bodyB.categoryBitMask == coinCategory {
            contact.bodyB.node?.removeFromParent()
            score += 1
            scoreLabel?.text = "Score: \(score)"
            
        }
        
        if contact.bodyA.categoryBitMask == bombCategory {
            contact.bodyA.node?.removeFromParent()
            gameOver()
            
        }
        
        if contact.bodyB.categoryBitMask == bombCategory {
            contact.bodyB.node?.removeFromParent()
            gameOver()
            
        }
    }
    
    func gameOver() {
        scene?.isPaused = true
        gameTimer?.invalidate()
        bombTimer?.invalidate()
        
        yourScoreLabel = SKLabelNode(text: "Your Score: ")
        yourScoreLabel?.position = CGPoint(x: 0, y: 200)
        yourScoreLabel?.fontSize = 100
        yourScoreLabel?.zPosition = 1
        if yourScoreLabel != nil {
            addChild(yourScoreLabel!)
        }
        
        finalScoreLabel = SKLabelNode(text: "\(score)")
        finalScoreLabel?.position = CGPoint(x: 0, y: 0)
        finalScoreLabel?.fontSize = 200
        finalScoreLabel?.zPosition = 1
        if finalScoreLabel != nil {
            addChild(finalScoreLabel!)
        }
        
        let playBtn = SKSpriteNode(imageNamed: "play")
        playBtn.position = CGPoint(x: 0, y: -200)
        playBtn.name = "play"
        playBtn.zPosition = 1
        addChild(playBtn)
    }
}
