//
//  MovieWallViewController.swift
//  QuickChat
//
//  Created by Swift on 4/19/17.
//  Copyright © 2017 Mexonis. All rights reserved.
//

import UIKit

class MovieWallViewController: UIViewController {
    // MARK: Properties
    let barHeight: CGFloat = 50
    @IBOutlet var movieMenuBar: UIView!
    
    override var inputAccessoryView: UIView?
        {
        get {
            self.movieMenuBar.frame.size.height = self.barHeight
            self.movieMenuBar.clipsToBounds = true
            return self.movieMenuBar
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    

   
}
