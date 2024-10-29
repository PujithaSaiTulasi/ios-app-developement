//
//  ShowProfileViewController.swift
//  WA3_Muddhu_8710
//
//  Created by Pujitha Sai Tulasi Muddhu on 9/25/24.
//

import UIKit

class ShowProfileViewController: UIViewController {

    let showProfileScreen = ShowProfileView()
    var imagePhoneType: UIImageView!
    
    override func loadView() {
       view = showProfileScreen
    }
    
    var receivedProfile: ViewController.ProfilePackage = ViewController.ProfilePackage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let unwrappedName = receivedProfile.name{
            if !unwrappedName.isEmpty {
                showProfileScreen.labelName.text = "Name: \(unwrappedName)"
            }
        }
        
        if let unwrappedEmail = receivedProfile.email {
            if !unwrappedEmail.isEmpty {
                showProfileScreen.labelEmail.text = "Email: \(unwrappedEmail)"
            }
        }
        
        if let unwrappedPhone = receivedProfile.phone {
            if !unwrappedPhone.isEmpty {
                showProfileScreen.labelPhone.text = "Phone: \(unwrappedPhone) (\(receivedProfile.phoneType ?? "N/A"))"
            }
        }
        
        if let unwrappedAddress = receivedProfile.address {
            if !unwrappedAddress.isEmpty {
                showProfileScreen.labelAddress.text = "Address: \(unwrappedAddress)"
            }
        }

        if let unwrappedCityState = receivedProfile.cityState {
            if !unwrappedCityState.isEmpty {
                showProfileScreen.labelCityState.text = "\(unwrappedCityState)"
            }
        }
        
        if let unwrappedZip = receivedProfile.zip {
            if !unwrappedZip.isEmpty {
                showProfileScreen.labelZip.text = "ZIP: \(unwrappedZip)"
            }
        }
        
        if let phoneType = receivedProfile.phoneType {
            switch phoneType {
            case "Cell":
                showProfileScreen.imageViewPhoneType.image = UIImage(named: "cell")
            case "Work":
                showProfileScreen.imageViewPhoneType.image = UIImage(named: "work")
            case "Home":
                showProfileScreen.imageViewPhoneType.image = UIImage(named: "home")
            default:
                showProfileScreen.imageViewPhoneType.image = nil
            }
        } else {
            showProfileScreen.imageViewPhoneType.image = nil
        }
    }
}
