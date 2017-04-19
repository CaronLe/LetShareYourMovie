//
//  AlertViewController.swift
//  QuickChat
//
//  Created by Swift on 4/13/17.
//  Copyright © 2017 Mexonis. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    class func singleFieldMissedAlert(nameOfField: String) -> UIAlertController
    {
        let nameFieldMissedAlert = UIAlertController(title: "Missing \(nameOfField) SoundTrack", message: "Please enter your course's \(nameOfField)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        nameFieldMissedAlert.addAction(okAction)
        return nameFieldMissedAlert
    }
   
}
