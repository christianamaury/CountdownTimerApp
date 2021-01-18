//
//  ViewController.swift
//  CountdownTimerApp
//
//  Created by Christian Castro on 1/15/19.
import UIKit

//To access audioPlayer we gotta import the library.., stands for audio & video
import AVFoundation

class ViewController: UIViewController
{
    //Keeping track the amounts seconds the user has selected..
     var seconds = 30
    
    //AudioPlayer variable..
    var audioPlayer = AVAudioPlayer()
    
     var timer = Timer()
    
    //Label Outlet..
    @IBOutlet weak var Label: UILabel!
    
    //So in that way we can change certain properties
    @IBOutlet weak var SliderOutle: UISlider!
    
    //UISlider..
    @IBAction func UISlider(_ sender: UISlider)
    {
        //When the user slides around, we would like to update.., casting to int (from float)
        seconds = Int(sender.value)
        
        //Updating label..
        Label.text = String(seconds) + "Seconds"
    }
    
    //In order to change button properties..
    @IBOutlet weak var startButtonOutlet: UIButton!
    
    @IBOutlet weak var stopButtonOutlet: UIButton!
    
    
    @IBAction func stopButton(_ sender: Any)
    {
        timer.invalidate()
        
        //Default settings..
        seconds = 30
        
        //UISlider back to default settings..
        SliderOutle.setValue(30, animated: true)
        
        //Updating our label..
        Label.text = "30 Seconds"
        
        //Ending the sound..
        audioPlayer.stop()
        
        //startButtonOutlet & UISlider re-appering
        startButtonOutlet.isHidden = false
        SliderOutle.isHidden = false
    }
    
    
    @IBAction func startButton(_ sender: Any)
    {
        //Creating Timer.., everytime timers clicks in 1 seconds, we will like to call a function
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
        
        //When the counts beging, go ahead & hide the slider..
        SliderOutle.isHidden = true
        //Hiding the UIOutlet button as well..
        startButtonOutlet.isHidden = true
    }
    
    //Creating function counter..
    @objc func counter()
    {
        seconds -= 1
        //Updating label..
        Label.text = String(seconds) + "Seconds"
        
        //Check if the seconds are equal to cero..
        if (seconds == 0)
        {
            //Stop the timer from ever firing again/remove it from the loop.
            timer.invalidate()
            
            startButtonOutlet.isHidden = false
            SliderOutle.isHidden = false
            
            //Playing sound..
            audioPlayer.play()
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do
        {
             let audioPath = Bundle.main.path(forResource: "Cataclysmic_Molten_Core_Sting", ofType:".mp3")
            
            //Try to play audio at this path location
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch
        {
            //If doesn't work..
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

