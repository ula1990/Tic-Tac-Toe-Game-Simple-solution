//
//  ViewController.swift
//  HelloWorld
//
//  Created by Ulad Daratsiuk-Demchuk on 7/9/17.
//  Copyright © 2017 Ulad Daratsiuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 //Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0 ]
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[1,4,7],[2,5,8],[0,4,8],[2,4,6],[0,3,6]]
    var gameIsActive = true
    
    @IBOutlet weak var Label: UILabel!
    @IBAction func action(_ sender: AnyObject) {
        
        if(gameState[sender.tag-1] == 0 && gameIsActive == true ){
            
            gameState[sender.tag-1] = activePlayer
   
        if (activePlayer == 1){
            
            sender.setImage(UIImage(named: "cross.png"), for: UIControlState())
            activePlayer = 2
    
    }else{
    sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
            activePlayer = 1
            
            
            }
            }
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                
                if gameState[combination[0]] == 1
                {
                    Label.text = "X WON!"
                }
                else
                {
                    Label.text = "O WON!"
                }
                
                playAgainButton.isHidden = false
                Label.isHidden = false
            }
        }

        gameIsActive = false
        
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false
        {
            Label.text = "IT WAS A DRAW"
            Label.isHidden = false
            playAgainButton.isHidden = false
        }
         }

  @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgin(_ sender: AnyObject)
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        Label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}









