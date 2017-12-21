//
//  ViewController.swift
//  liverpool
//
//  Created by Erick Cienfuegos on 12/20/17.
//  Copyright © 2017 Erick Cienfuegos. All rights reserved.
//

import UIKit
import Alamofire
import Lottie

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSLog("Hi")
        let animationView = LOTAnimationView(name: "E.json")
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        self.view.addSubview(animationView)
        animationView.play{ (finished) in
            // Do Something
        }
        
        /*let animationView = LOTAnimationView(name: "E.json") {
            animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            animationView.center = self.view.center
            animationView.contentMode = .scaleAspectFill
            
            view.addSubview(animationView)
            
            animationView.play()
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

