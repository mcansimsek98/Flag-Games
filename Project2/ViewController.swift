//
//  ViewController.swift
//  Project2
//
//  Created by Mehmet Can Şimşek on 8.06.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var label = UILabel()
    var label2 = UILabel()
    var askedQustion = 10
        
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        //Button etrafındaki çerçeve için ayarlama
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        

        askQustion()
        addLabel()
        
        
        
    }
    
    func addLabel() {
        if let navigtionBar = self.navigationController?.navigationBar {
           let firstFrame = CGRect(x: 10, y: 0, width: navigtionBar.frame.width / 2 , height: navigtionBar.frame.height )
           let secondFrame = CGRect(x: 280, y: 10, width: navigtionBar.frame.width  , height: navigtionBar.frame.height / 2 )
           label = UILabel(frame: firstFrame)
           label.text = "Score: \(score)"
           label2 = UILabel(frame: secondFrame)
           label2.text = "Question: \(askedQustion)"
           navigtionBar.addSubview(label)
            navigtionBar.addSubview(label2)
       }
    }

    func askQustion(action: UIAlertAction! = nil ) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title : String
        
        
        if sender.tag == correctAnswer {
            title = "Correct. That's the flag of \(countries[sender.tag].uppercased())"
            score += 1
        }else {
            title = "Wrong! That's the flag of \(countries[sender.tag].uppercased())"
            score -= 1

            
        }
        label.text = "Score:  \(score)"
        
        if askedQustion == 1 {
            let finalAlert = UIAlertController(title: "Game Over!", message: "Your score is \(score)", preferredStyle: UIAlertController.Style.alert)
            finalAlert .addAction(UIAlertAction(title: "Start New Game!", style: UIAlertAction.Style.default, handler: startNewGame))
            present(finalAlert, animated: true)
        }else {
            let ac1 = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: UIAlertController.Style.alert)
            ac1.addAction(UIAlertAction(title: "Contiune", style: UIAlertAction.Style.default, handler: askQustion))
            present(ac1, animated: true)
        }
        askedQustion -= 1
        label2.text = "Question: \(askedQustion)"
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: UIAlertController.Style.alert)
        ac.addAction(UIAlertAction(title: "Contiune", style: UIAlertAction.Style.default, handler: askQustion))
        present(ac, animated: true)
        
        
        
    }
    
    func startNewGame(action : UIAlertAction){
        score = 0
        askedQustion = 10
        label.text = "Score : \(score) "
        label2.text = "Question: \(askedQustion)"
        
        askQustion()
    }
    
    
}

