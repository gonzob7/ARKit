//
//  ViewController.swift
//  iOSAR
//
//  Created by Gonzalo Birrueta on 3/26/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import UIKit
import ARKit



class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

