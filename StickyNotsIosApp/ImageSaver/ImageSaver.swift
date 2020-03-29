//
//  ImageSaver.swift
//  StickyNotsIosApp
//
//  Created by A on 3/28/20.
//  Copyright © 2020 Ahmed Hegazy. All rights reserved.
//

import UIKit

class ImageSaver: NSObject{
    
    func writeToPhoneAlbum(image: UIImage){
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer){
        print("Save finished")
    }
    
}
