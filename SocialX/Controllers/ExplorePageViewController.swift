//
//  ExplorePageViewController.swift
//  SocialX
//
//  Created by Nathan Rowe on 10/22/21.
//  Copyright © 2021 Nathan Rowe. All rights reserved.
//

import Foundation
import Firebase
import MapKit

class ExplorePageViewController: UIViewController {
    
    @IBOutlet weak var UITable: UITableView!
    @IBOutlet weak var UIMap: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UIMap.showsCompass = true
    }
    
    @IBAction func homeButtonPressed(_ sender: Any) {
        Utilities.transitionToHome(view, storyboard!)
    }
    @IBAction func profileButtonPressed(_ sender: Any) {
        Utilities.transitionToProfile(view, storyboard!)
    }
    
}
