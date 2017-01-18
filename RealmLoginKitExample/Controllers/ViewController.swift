//
//  ViewController.swift
//  RealmLoginKit
//
//  Created by Tim Oliver on 1/16/17.
//  Copyright © 2017 Realm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let segmentedControl = UISegmentedControl(items: ["Light", "Dark"])
    @IBOutlet var realmLogoView: RealmLogoView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        realmLogoView?.logoStrokeWidth = 8.0
        realmLogoView?.tintColor = .white
        
        segmentedControl.frame.size.width = 200
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged), for: .valueChanged)
        navigationItem.titleView = segmentedControl
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        let loginViewController = LoginViewController()
//        present(loginViewController, animated: false, completion: nil)
    }
    
    func segmentedControlChanged() {
        let isDarkMode = segmentedControl.selectedSegmentIndex == 1
        
        view.backgroundColor = UIColor(white: isDarkMode ? 0.1 : 0.92, alpha: 1.0)
        navigationController?.navigationBar.barStyle = isDarkMode ? .blackTranslucent : .default
        view.window?.tintColor = isDarkMode ? UIColor(red:90.0/255.0, green:120.0/255.0, blue:218.0/255.0, alpha:1.0) : nil;
        realmLogoView?.style = isDarkMode ? .monochrome : .colored
    }
}
