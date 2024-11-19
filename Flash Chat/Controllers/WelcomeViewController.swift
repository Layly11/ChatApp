//
//  WelcomeViewController.swift
//  Flash Chat 

import UIKit
import GoogleMobileAds

class WelcomeViewController: UIViewController, GADBannerViewDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
                addBannerViewToView(bannerView)
                    bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
                bannerView.rootViewController = self
                    bannerView.load(GADRequest())
                    bannerView.delegate = self
                    
        
        
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = "⚡FlashChat"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false){ (timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
    
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
}
