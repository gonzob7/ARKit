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
    
    @IBOutlet weak var addCircleBtn: UIButton!
    
    @IBOutlet weak var resetBtn: UIButton!
    
    
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        
        self.addCircleBtn.layer.cornerRadius = 40
        self.resetBtn.layer.cornerRadius = 40
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        let node = SCNNode()
        
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.1/2)
        node.geometry?.firstMaterial?.specular.contents = UIColor.white
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.white
        let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        let z = randomNumbers(firstNum: -0.3, secondNum: 0.3)

        node.position = SCNVector3(x, y, z)

        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        self.restartSession()
    }
    
    func restartSession(){
        
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
     func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    

}

