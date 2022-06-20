//
//  HomeViewController.swift
//  covidApp
//
//  Created by PAULO ALMEIDA on 06/06/2022.
//

import UIKit
import AVKit

class HomeViewController: UIViewController {

    
    @IBOutlet var signupButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var informationButton: UIButton!
    
    var videoPlayer: AVPlayer? 
    var videoPlayerLayer: AVPlayerLayer?
    
    override func viewWillAppear(_ animated: Bool) {
        setUpVideo()
    }
    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signupTapped(_ sender: Any) {
        let registerView = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        navigationController?.pushViewController(registerView, animated: true)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        let loginView = LoginViewController(nibName: "LoginViewController", bundle: nil)
        navigationController?.pushViewController(loginView, animated: true)
    }
    
    @IBAction func informationTapped(_ sender: Any) {
        let informationView = InformationViewController(nibName: "InformationViewController", bundle: nil)
        navigationController?.pushViewController(informationView, animated: true)
    }
    
    func setUpVideo(){
        
        let bundlePath = Bundle.main.path(forResource: "covid", ofType: "mp4")
        
        guard bundlePath != nil else{
         
            return
        }
        
        let url = URL(fileURLWithPath: bundlePath!)
        
        
        let item = AVPlayerItem(url: url)
        
        videoPlayer = AVPlayer(playerItem: item)
        
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        videoPlayerLayer?.frame = CGRect(x:-self.view.frame.size.width*0.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)

        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        videoPlayer?.isMuted = true
        videoPlayer?.playImmediately(atRate: 1)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
