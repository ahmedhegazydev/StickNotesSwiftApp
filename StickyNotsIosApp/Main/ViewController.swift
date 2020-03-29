//
//  ViewController.swift
//  StickyNotsIosApp
//
//  Created by Ahmed Hegazy on 3/5/20.
//  Copyright © 2020 Ahmed Hegazy. All rights reserved.
//

import UIKit
import SwiftySound
import AVFoundation


class ViewController: UIViewController{
    
    
    var textFromAlertVController: String = ""
    let userDefaults: UserDefaults = UserDefaults.standard
    
    //@IBOutlet var labelYourStickyNote: UILabel!
    var labelYourStickyNote: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        debugPrint("viewDidLoad")
        
        
        
        //setOnClicks()
        addDoubleTapGestRecognizerToMainView()
        
        //setting the bg color for the main view container
               //self.view.backgroundColor = .darkGray
               self.view.backgroundColor = UIColor.black
               
               
               addingTheCenterLabel()
        
    }
    
    func setTheAlertTxtIntoMainTxt(){
        let txtFromUserDefaults = userDefaults.string(forKey: Constants.USER_NOTES)
        if txtFromUserDefaults != nil && !txtFromUserDefaults!.isEmpty{
            //contains saved string
            self.labelYourStickyNote?.text = txtFromUserDefaults
        }else{
            labelYourStickyNote.text = "Your Sticky Note"
        }
        
//        if !textFromAlertVController.isEmpty{
//         self.labelYourStickyNote.text = textFromAlertVController
//        }
        
    }
    
    func addDoubleTapGestRecognizerToMainView(){
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(self.onHandleDoubleTapForMainView(sender: )))
        doubleTap.numberOfTapsRequired = 2//double
        self.view.addGestureRecognizer(doubleTap)
    }
    
    @objc func onHandleDoubleTapForMainView(sender: UITapGestureRecognizer? = nil){
        
        debugPrint("2 taps")
        
        //play system sound
        //1108    photoShutter.caf    CameraShutter
        let soundId: SystemSoundID = 1108
        AudioServicesPlaySystemSound(soundId)
        
        //take screen
        
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        debugPrint("viewDidAppear")
        
        
        //setting the text from the user defaults
         //into the main vc textview
         //to the center label
        setTheAlertTxtIntoMainTxt()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        debugPrint("viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        debugPrint("viewWillDisappear")
        
    }
    func addingTheCenterLabel(){
        
        //init
        //self.labelYourStickyNote: UILabel = UILabel.init()
        self.labelYourStickyNote = UILabel()
        
        
        //Setting attributes to the label
        //resizing the height
        //        self.labelYourStickyNote.frame = CGRect(x: self.view.frame.width / 2, y: self.view.frame.width / 2, width: self.view.frame.width, height: CGFloat(50))
        labelYourStickyNote.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
        
        
        //To center a UILabel just add this row
        //centering the label
        labelYourStickyNote.center = self.view.center
        
        
        //Setting the text
//        labelYourStickyNote.text = "Your Sticky Note"
        
        //Setting the text alignment
        labelYourStickyNote.textAlignment =  .center
        
        //Setting text color
        labelYourStickyNote.textColor = .white
        
        
        //setting backgroundcolor
        labelYourStickyNote.backgroundColor = .clear//no color
        

        //Font
        //settting text size
        //        self.labelYourStickyNote.font = UIFont.systemFont(ofSize: 30)
        //        self.labelYourStickyNote.font = UIFont(name: "Didot", size: 30)
        //        self.labelYourStickyNote.font = UIFont(name: "Optima", size: 30)
        labelYourStickyNote.font = UIFont(name: "Futura", size: 30)
        
        
        
        //Clicking
        //for enabling tap gesture
        labelYourStickyNote.isUserInteractionEnabled = true;
        //this will work after enabling isUserInteractionEnabled
        let tap =  UITapGestureRecognizer(target: self, action: #selector(onHandleTapOnStickyNoteClicked(sender:)))
        labelYourStickyNote.addGestureRecognizer(tap)
        
        
        
        //Adding the view
        self.view.addSubview(labelYourStickyNote)
    }
    
    @objc func onHandleTapOnStickyNoteClicked(sender: UITapGestureRecognizer){
        guard sender.view != nil else { return}
        
        
        debugPrint("cicked onHandleTaponStickyNoteLabel")
        
        //showing the alertviewcontroller
        //above the main view controller
        showingDialogAboveMainViewController()
    }
    
    func showingDialogAboveMainViewController(){
        
        let alertViewController: AlertViewController = AlertService.shared.alert()
        self.present(alertViewController, animated: true) {
            //take some time, as after presenting
//            //self.playWavSound()
//            self.playSystemSound()
        }
        //immediately
        debugPrint("showing the alert viewcontroller above main vc")
        //self.playWavSound()
        self.playSystemSound()
    }
    
    func playSystemSound(){
        //from 1000 to 4095

        //https://github.com/TUNER88/iOSSystemSoundsLibrary
        let systemSoundId: SystemSoundID = 1016//tweet sound
        AudioServicesPlaySystemSound(systemSoundId)
    }
    
    func playWavSound(){
        Sound.category = .ambient
        Sound.play(file: "sound.wav")
        //Sound.play(file: "dog", fileExtension: "wav", numberOfLoops: 2)
//        Sound.play(url: fileURL)
    }
    
}

extension ViewController: HandleNotesDelegate{
    func onFetchTextFromAlertCv(_ notes: String) {
           
       }
}

