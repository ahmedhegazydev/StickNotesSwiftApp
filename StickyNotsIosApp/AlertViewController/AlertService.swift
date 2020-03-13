//
//  AlertService.swift
//  StickyNotsIosApp
//
//  Created by Ahmed Hegazy on 3/12/20.
//  Copyright © 2020 Ahmed Hegazy. All rights reserved.
//

import UIKit

class AlertService{
    
    static let shared: AlertService = {
        let instance = AlertService()
        //setup code
        return instance
    }()
    
    func alert() -> AlertViewController{
        let alert = UIStoryboard(name: "Alert", bundle: .main)
            .instantiateViewController(identifier: "AlertViewController") as AlertViewController
        return alert;
    }
    
}
