//
//  GlobeScene.swift
//  the3DEarth
//
//  Created by 覃子轩 on 2017/6/10.
//  Copyright © 2017年 覃子轩. All rights reserved.
//

import SceneKit

class GlobeScene: SCNScene {
    
    fileprivate var cameraSCN:SCNCamera!
    fileprivate var cameraNode:SCNNode!
    fileprivate var lightNode:SCNNode!
    fileprivate var globeNode:SCNNode!
    
    override init() {
        super.init()
        
        // 初始化摄像机
        self.cameraSCN = SCNCamera.init()
        self.cameraSCN.zNear = 0.01
        
        // 初始化摄像机节点
        self.cameraNode = SCNNode.init()
        self.cameraNode.position = SCNVector3Make(0.0, 0.0, 1.5)
        self.cameraNode.camera = self.cameraSCN
        // 摄像头的模糊半径
        self.cameraSCN.focalBlurRadius = 0
        
        // 初始化灯光
        let light = SCNLight.init()
        light.type = .ambient
        light.color = UIColor.white
        // 初始化灯光节点
        self.lightNode = SCNNode.init()
        self.lightNode.light = light
        
        // 初始化旋转地球
        self.globeNode = SCNNode.init()
        // 初始化球体
        let sp = SCNSphere.init()
        // 给球体贴上贴图
        sp.firstMaterial?.diffuse.contents = UIImage.init(named: "earth_land_day.jpg")
        let modelNode = SCNNode.init(geometry: sp)
        self.globeNode.addChildNode(modelNode)
        
        self.rootNode.addChildNode(self.cameraNode)
        self.rootNode.addChildNode(self.lightNode)
        self.rootNode.addChildNode(self.globeNode)
    
        // 给3D地球一个运动动画
        self.globeNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 5)))
        self.globeNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 2, y: 0, z: 0, duration: 5)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
