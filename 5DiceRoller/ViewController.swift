//
//  ViewController.swift
//  Yahtzee!
//
//  Created by Blake Branvold on 9/14/18.
//  Copyright © 2018 90304593. All rights reserved.
//
//  Have fun!

import UIKit
import AudioToolbox
import AVFoundation

class ViewController: UIViewController {
    var Die1Toggle = true;
    var Die2Toggle = true;
    var Die3Toggle = true;
    var Die4Toggle = true;
    var Die5Toggle = true;
    var DieButtonRadius = 15;
    var music: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.becomeFirstResponder() //shaking detection
        Die1.layer.cornerRadius = CGFloat(DieButtonRadius)
        Die2.layer.cornerRadius = CGFloat(DieButtonRadius)
        Die3.layer.cornerRadius = CGFloat(DieButtonRadius)
        Die4.layer.cornerRadius = CGFloat(DieButtonRadius)
        Die5.layer.cornerRadius = CGFloat(DieButtonRadius)
        
        playMusic()

    }
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var Die1: UIButton!
    
    @IBOutlet weak var Die2: UIButton!
    
    @IBOutlet weak var Die3: UIButton!
    
    @IBOutlet weak var Die4: UIButton!
    
    @IBOutlet weak var Die5: UIButton!
    
    @IBOutlet weak var WinnerLabel: UILabel!
    
    @IBAction func RollPressed(_ sender: Any) {
    }
    
    func ImageSetter(i: Int){
        
        setDieRand(sender: Die1)
        setDieRand(sender: Die2)
        setDieRand(sender: Die3)
        setDieRand(sender: Die4)
        setDieRand(sender: Die5)
    
    }
    @IBAction func Die1Pressed(_ sender: Any) {
       
            Die1.setImage(DiceToggler(sender: Die1), for: UIControl.State.normal)
    }
    @IBAction func Die2Pressed(_ sender: Any) {
    
            Die2.setImage(DiceToggler(sender: Die2), for: UIControl.State.normal)
    }
    @IBAction func Die3Pressed(_ sender: Any) {
        
            Die3.setImage(DiceToggler(sender: Die3), for: UIControl.State.normal)
    }
    @IBAction func Die4Pressed(_ sender: Any) {

            Die4.setImage(DiceToggler(sender: Die4), for: UIControl.State.normal)
    }
    @IBAction func Die5Pressed(_ sender: Any) {
     
            Die5.setImage(DiceToggler(sender: Die5), for: UIControl.State.normal)
    }
    
    func playMusic() {
        if let musicURL = Bundle.main.url(forResource: "Song", withExtension: "mp3") {
            if let audioPlayer = try? AVAudioPlayer(contentsOf: musicURL) {
                music = audioPlayer
                music.numberOfLoops = -1
                music.play()
            }
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            for i in 0...4{
                
                ImageSetter(i: i);
                if Die1.currentImage?.isEqual(Die2.currentImage) ?? true &&
                    Die1.currentImage?.isEqual(Die3.currentImage) ?? true &&
                    Die1.currentImage?.isEqual(Die4.currentImage) ?? true &&
                    Die1.currentImage?.isEqual(Die5.currentImage) ?? true {
                    WinnerLabel.text = ("Winner!")
                }
                else if Die1.currentImage!.isEqual(Die2.currentImage) ||
                    Die1.currentImage!.isEqual(Die3.currentImage) ||
                    Die1.currentImage!.isEqual(Die4.currentImage) ||
                    Die1.currentImage!.isEqual(Die5.currentImage) ||
                    Die2.currentImage!.isEqual(Die3.currentImage) ||
                    Die2.currentImage!.isEqual(Die4.currentImage) ||
                    Die2.currentImage!.isEqual(Die5.currentImage) ||
                    Die3.currentImage!.isEqual(Die4.currentImage) ||
                    Die3.currentImage!.isEqual(Die5.currentImage) ||
                    Die4.currentImage!.isEqual(Die5.currentImage){
                    WinnerLabel.text = ("At least 1 pair")
                    
                }
                else{
                    WinnerLabel.text = ("nothing :(")
                }
            }
        }
    }
    
    func DiceToggler(sender : UIButton) -> UIImage {
        
        if ((sender.currentImage?.isEqual(UIImage.init(imageLiteralResourceName: "Dice1G")))!) {
                return UIImage.init(imageLiteralResourceName: "Dice1")
            }
        else if (sender.currentImage?.isEqual(UIImage.init(imageLiteralResourceName: "Dice2G")) ?? false){
                return UIImage.init(imageLiteralResourceName: "Dice2")
                
            }
            else if (sender.currentImage?.isEqual(UIImage.init(imageLiteralResourceName: "Dice3G")) ?? false){
                return UIImage.init(imageLiteralResourceName: "Dice3")
                
            }
            else if (sender.currentImage?.isEqual(UIImage.init(imageLiteralResourceName: "Dice4G")) ?? false){
                return UIImage.init(imageLiteralResourceName: "Dice4")
                
            }
            else if (sender.currentImage?.isEqual(UIImage.init(imageLiteralResourceName: "Dice5G")) ?? false){
                return UIImage.init(imageLiteralResourceName: "Dice5")
            }
            else if (sender.currentImage?.isEqual(UIImage.init(imageLiteralResourceName: "Dice6G")) ?? false){
                return UIImage.init(imageLiteralResourceName: "Dice6")
        }
        
        else if (sender.currentImage?.isEqual(UIImage.init(imageLiteralResourceName: "Dice1")) ?? false){
            return UIImage.init(imageLiteralResourceName: "Dice1G")
        }
        else if (sender.currentImage?.isEqual(UIImage.init(imageLiteralResourceName: "Dice2")) ?? false){
            return UIImage.init(imageLiteralResourceName: "Dice2G")
            
        }
        else if (sender.currentImage?.isEqual(UIImage.init(imageLiteralResourceName: "Dice3")) ?? false){
            return UIImage.init(imageLiteralResourceName: "Dice3G")
            
        }
        else if (sender.currentImage?.isEqual(UIImage.init(imageLiteralResourceName: "Dice4")) ?? false){
            return UIImage.init(imageLiteralResourceName: "Dice4G")
            
        }
        else if (sender.currentImage?.isEqual(UIImage.init(imageLiteralResourceName: "Dice5")) ?? false){
            return UIImage.init(imageLiteralResourceName: "Dice5G")
        }
        else if (sender.currentImage?.isEqual(UIImage.init(imageLiteralResourceName: "Dice6")) ?? false){
            return UIImage.init(imageLiteralResourceName: "Dice6G")
        }
       return UIImage.init(imageLiteralResourceName: "icon livin")
    }
    
    func setDieRand(sender : UIButton){
        let rand1 = Int(arc4random_uniform(6))
        if (sender.currentImage?.isEqual(UIImage.init(imageLiteralResourceName: "Dice1")) ?? true || sender.currentImage?.isEqual(UIImage.init(imageLiteralResourceName: "Dice2")) ?? true || sender.currentImage?.isEqual(UIImage.init(imageLiteralResourceName: "Dice3")) ?? true || sender.currentImage?.isEqual(UIImage.init(imageLiteralResourceName: "Dice4")) ?? true || sender.currentImage?.isEqual(UIImage.init(imageLiteralResourceName: "Dice5")) ?? true || sender.currentImage?.isEqual(UIImage.init(imageLiteralResourceName: "Dice6")) ?? true){
            sender.setImage( UIImage(named:"Dice" +
                String(rand1+1)), for: UIControl.State.normal)
        }
    }
}
