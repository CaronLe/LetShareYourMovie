//
//  AccountInfoManagingVC.swift
//  QuickChat
//
//  Created by Swift on 4/12/17.
//  Copyright © 2017 Mexonis. All rights reserved.
//

import UIKit
import Firebase
class AccountInfoManagingVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    // MARK: Properties
    @IBOutlet weak var profilePicView: RoundedImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: Methods
    func fetchUser()
    {
        if let id = FIRAuth.auth()?.currentUser?.uid
        {
            User.info(forUserID: id, completion: {[weak weakSelf = self] (user) in
                DispatchQueue.main.async {
                    weakSelf?.nameField.text = user.name
                    weakSelf?.emailField.text = user.email
                    weakSelf?.profilePicView.image = user.profilePic
                    weakSelf = nil

                }
                                // TODO: Optimize the field presenting/ show up time
                
            })
        }
    }
    
    // Function for Editing information of an user
    @IBAction func editUserInfo(_ sender: RoundedButton)
    {
        let isFieldEmpty: Bool = true
        switch isFieldEmpty
        {
        case ((nameField.text?.isEmpty)! && (emailField.text?.isEmpty)!):
            present(AlertViewController.singleFieldMissedAlert(nameOfField: "Name and Email"), animated: true, completion: nil)
        case (nameField.text?.isEmpty)!:
             present(AlertViewController.singleFieldMissedAlert(nameOfField: "Name"), animated: true, completion: nil)
        case (emailField.text?.isEmpty)!:
            present(AlertViewController.singleFieldMissedAlert(nameOfField: "Email"), animated: true, completion: nil)
        default:
            User.editUser(withName: nameField.text!, email: emailField.text!, profilePic: profilePicView.image!) { (ifCompleteUploadData) in
               if ifCompleteUploadData == true
                    {
                        self.performSegue(withIdentifier: "alreadyUpdatedAccountInfo", sender: nil)
                }
            }
            
        }
    }
    

    
    // MARK: Action occurs after clicking avatar
    
    @IBAction func openImagePicker(_ sender: UIButton)
    {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let pickedImage = info["UIImagePickerControllerOriginalImage"] as? UIImage else
        {
            print("There is somethingwrong after picking Image")
            return
        }
        profilePicView.image = pickedImage
        dismiss(animated: true, completion: nil)
        print("makechange")
        
    }
    
    // MARK: Click Edit button, action occurs
    
    
}
















