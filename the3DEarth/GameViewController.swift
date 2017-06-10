//
//  GameViewController.swift
//  the3DEarth
//
//  Created by 覃子轩 on 2017/6/10.
//  Copyright © 2017年 覃子轩. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    fileprivate var senceView:SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 加载场景类到SCNView中
        let gSCN = GlobeScene()
        self.senceView = self.view as! SCNView
        self.senceView.scene = gSCN
        self.senceView.allowsCameraControl = true
        self.senceView.showsStatistics = true
        self.senceView.backgroundColor = UIColor.lightGray
        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
