//
//  ViewController.swift
//  StickyNotsIosApp
//
//  Created by Ahmed Hegazy on 3/5/20.
//  Copyright © 2020 Ahmed Hegazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    //@IBOutlet var labelYourStickyNote: UILabel!
    //var labelYourStickyNote: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        debugPrint("viewDidLoad")
        //setOnClicks()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        debugPrint("viewDidAppear")
        
        addingTheCenterLabel()
    }
    
    
    func addingTheCenterLabel(){
        
        //init
        let labelYourStickyNote: UILabel = UILabel.init()
        
        
        //Setting attributes to the label
        //resizing the height
        //        self.labelYourStickyNote.frame = CGRect(x: self.view.frame.width / 2, y: self.view.frame.width / 2, width: self.view.frame.width, height: CGFloat(50))
        labelYourStickyNote.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
        
        
        //To center a UILabel just add this row
        //centering the label
        labelYourStickyNote.center = self.view.center
        
        
        //Setting the text
        labelYourStickyNote.text = "Your Sticky Note"
        
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
        
        
        
        
    }
    
    
    
    
    
}

