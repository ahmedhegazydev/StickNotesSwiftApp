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
import Toast_Swift

class ViewController: UIViewController{
    
    
    @IBOutlet weak var ivScreenShot: UIImageView!
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
        guard let image = self.view.takeScreenShot1() else { return}
        //self.ivScreenShot.image = image//done
        let currentTime = CACurrentMediaTime();
        print("\(currentTime)")
        //If you want only the decimal part (often used when syncing animations),
        let currentTimeDecimalPart = CACurrentMediaTime().truncatingRemainder(dividingBy: 1)
        print("\(currentTimeDecimalPart)")
        //saveImageToAlbum(fileName: "\(currentTime)", uiImage: image)
        //saveImageToAlbum(fileName: "Ahmed", uiImage: image)
        
        //UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        let imageSaver = ImageSaver()
        imageSaver.writeToPhoneAlbum(image: image)
        
    }
    
    fileprivate func saveImageToAlbum(fileName name: String, uiImage image: UIImage){
        
        // get the documents directory url
        //select any directory u want to save the image
        let documentsDirectory = FileManager.default.urls(for: //.documentDirectory
            //.picturesDirectory
            //.trashDirectory
            //.musicDirectory
            .downloadsDirectory
            , in: .userDomainMask).first!
        // choose a name for your image
        let fileName = name + ".jpg"
        // create the destination file url to save your image
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        // get your UIImage jpeg data representation and check if the destination file url already exists
        if let data = image.jpegData(compressionQuality:  1.0),
          !FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                // writes the image data to disk
                try data.write(to: fileURL)
                print("file saved")
                //self.view.makeToast("File saved")
                
            } catch {
                print("error saving file:", error)
                //self.view.makeToast("Error saving file \(error)")
                
            }
        }
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

extension UIView{
    
   func takeScreenShot1() -> UIImage? {
        //Create the UIImage
        UIGraphicsBeginImageContext(self.frame.size)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if image != nil {
            return image!
        }
        
        return UIImage()
    
    }
    
    func takeScreenShot2() -> UIImage {
        
        //begin
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        // draw view in that context.
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        // get iamge
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if image != nil {
            return image!
        }
        
        return UIImage()
        
    }
    
}
