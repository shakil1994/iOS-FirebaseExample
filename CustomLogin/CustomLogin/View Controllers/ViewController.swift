//
//  ViewController.swift
//  CustomLogin
//
//  Created by Md Kamrul Hasan on 17/3/20.
//  Copyright © 2020 Md Kamrul Hasan. All rights reserved.
//

import UIKit
import AVKit /*Video Play*/

class ViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    /*For video*/
    var videoPlayer: AVPlayer?
    var videoPlayerLayer: AVPlayerLayer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUpElements()
    }
    
    /*Video play*/
    override func viewWillAppear(_ animated: Bool) {
        /*Set up video in the background*/
        setUpVideo()
    }
    
    func setUpElements() {
        
        /*Style the elements*/
        Utilities.styleFieldButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
        
    }
    
    func setUpVideo() {
        /*Get the path to the resource in the bundle*/
        let bundlePath = Bundle.main.path(forResource: "video", ofType: "mp4")
        
        guard bundlePath != nil else {
            return
        }
        
        /*Create a URL from it*/
        let url = URL(fileURLWithPath: bundlePath!)
        
        /*Create the video player item*/
        let item = AVPlayerItem(url: url)
        
        /*Create the player*/
        videoPlayer = AVPlayer(playerItem: item)
        
        /*Create the layer*/
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer)
        
        /*Adjust the size and frame*/
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width * 1.5, y: 0, width: self.view.frame.size.width * 4, height: self.view.frame.size.height)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        /*Add it to the view and play it*/
        videoPlayer?.playImmediately(atRate: 0.3)
    }

}

