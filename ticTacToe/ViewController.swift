//
//  ViewController.swift
//  ticTacToe
//
//  Created by Syimyk on 9/25/20.
//  Copyright © 2020 Syimyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  var activePlayer = 1 // "X"
  var gameState = [0,0,0,0,0,0,0,0,0]
  var gameIsActive = true
  let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    
    var xsScore = 0
    var osScore = 0
    var tieScore = 0
    
    @IBOutlet weak var xScore: UILabel!
    @IBOutlet weak var oScore: UILabel!
    @IBOutlet weak var drawScore: UILabel!
    
    
    @IBOutlet weak var turnLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if gameState[sender.tag-1] == 0 && gameIsActive == true{
        gameState[sender.tag-1] = activePlayer
        if activePlayer == 1{
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(UIColor.yellow, for: .normal)
            activePlayer = 2
            turnLabel.textColor = UIColor.systemTeal
            turnLabel.text = "O Turn"
        }else{
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(UIColor.systemTeal, for: .normal)
            activePlayer = 1
            turnLabel.textColor = UIColor.yellow
            turnLabel.text = "X Turn"
        }
    }
        
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                gameIsActive = false
                if gameState[combination[0]] == 1{
                    turnLabel.textColor = .yellow
                    turnLabel.text = "X HAS WON!"
                    xsScore += 1
                    xScore.text = "\(xsScore)"
                }else{
                    turnLabel.textColor = .systemTeal
                    turnLabel.text = "O HAS WON!"
                    osScore += 1
                    oScore.text = "\(osScore)"
                }
            }
        }
        
        gameIsActive = false
        
        for i in gameState{
            if i == 0{
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false{
            tieScore += 1
            turnLabel.textColor = .white
            turnLabel.text = "DRAW!"
            drawScore.text = "\(tieScore)"
        }
}
    
    @IBAction func playAgain(_ sender: UIBarButtonItem) {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        turnLabel.textColor = .yellow
        turnLabel.text = "X Turn"
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setTitle("", for: .normal)
        }
    }
    
}

