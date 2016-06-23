//
//  ViewController.swift
//  AlisaWeather
//
//  Created by BK on 3/20/16.
//  Copyright © 2016 Lisha Ge. All rights reserved.
//

import UIKit
import INTULocationManager
import Alamofire
import SVProgressHUD

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.loadWeatherData()
    }

    func loadWeatherData() {
        SVProgressHUD.showWithStatus("正在使出吃奶的劲儿加载...")
        INTULocationManager.sharedInstance().requestLocationWithDesiredAccuracy(.City, timeout: 15.0, delayUntilAuthorized: true) { (location: CLLocation!, achievedAccuracy: INTULocationAccuracy, status: INTULocationStatus) -> Void in
            if status == .Success {
                let coordinate = location.coordinate
                Alamofire.request(.GET, "http://api.openweathermap.org/data/2.5/weather", parameters: ["lat": coordinate.latitude, "lon": coordinate.longitude, "appid": "8c06d74fc20247e00c14f21ce32ccfe2"])
                    .responseJSON(completionHandler: { (response) -> Void in
                        if response.result.isSuccess {
                            if let responseDict = response.result.value! as? NSDictionary {
                                
                            }
                        }
                        SVProgressHUD.dismiss()
                    })
            } else {
                SVProgressHUD.showErrorWithStatus("不好意思，Alisa去揍BK了")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

