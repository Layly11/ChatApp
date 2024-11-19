//
//  LoginViewController.swift
//  Flash Chat 

import UIKit
import Firebase
import FirebaseAuth
import GoogleMobileAds

class LoginViewController: UIViewController, GADBannerViewDelegate {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
                addBannerViewToView(bannerView)
                    bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
                bannerView.rootViewController = self
                    bannerView.load(GADRequest())
                    bannerView.delegate = self
        
        emailTextfield.text = "6514110023@mut.ac.th"
        passwordTextfield.text = "123456"
        
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
            bannerView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(bannerView)
            view.addConstraints(
                [NSLayoutConstraint(
                    item: bannerView,
                    attribute: .bottom,
                    relatedBy: .equal,
                    toItem: view.safeAreaLayoutGuide,
                    attribute: .bottom,
                    multiplier: 1,
                    constant: 0
                ),
                 NSLayoutConstraint(
                     item: bannerView,
                     attribute: .centerX,
                     relatedBy: .equal,
                     toItem: view,
                     attribute: .centerX,
                     multiplier: 1,
                     constant: 0
                 )
                ]
            )
        }
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                    let alert = UIAlertController(title: "Error", message: "Username or Password wrong", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    }))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    self.performSegue(withIdentifier: "LoginToChat", sender: self)
                }
            }
        }
    }
}
