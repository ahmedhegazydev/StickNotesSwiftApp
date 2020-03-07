//
//  ViewController.swift
//  StickyNotsIosApp
//
//  Created by Ahmed Hegazy on 3/5/20.
//  Copyright © 2020 Ahmed Hegazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var labelYourStickyNote: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        debugPrint("viewDidLoad")
        //setOnClicks()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        debugPrint("viewDidAppear")
        accessingTheLabelYourStickyNotes()
        setOnClicks()
    }
    
    func accessingTheLabelYourStickyNotes(){
    
        
        
        //resizing the height
//        self.labelYourStickyNote.frame = CGRect(x: self.view.frame.width / 2, y: self.view.frame.width / 2, width: self.view.frame.width, height: CGFloat(50))
        self.labelYourStickyNote.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
       
        
        //To center a UILabel just add this row
        //centering the label
        self.labelYourStickyNote.center = self.view.center
        
       
        //setting backgroundcolor
        self.labelYourStickyNote.backgroundColor = .white
        
        
        //
        
    }
    
    func setOnClicks(){
        let tap =  UITapGestureRecognizer(target: self, action: #selector(onHandleTapOnStickyNoteClicked(sender:)))
self.labelYourStickyNote.addGestureRecognizer(tap)
        
    }
    
    @objc func onHandleTapOnStickyNoteClicked(sender: UITapGestureRecognizer){
        guard sender.view != nil else { return}
        debugPrint("cicked onHandleTaponStickyNoteLabel")
        
        
        
    }

    
    
    

}

