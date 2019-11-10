//
//  UIViewController+extensions.swift
//  TesteARanha
//
//  Created by Vinícius Binder on 10/11/19.
//  Copyright © 2019 Wonder Woman. All rights reserved.
//

import Foundation
import WatchConnectivity
import UIKit

extension UIViewController: WCSessionDelegate {
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    public func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    public func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    public func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        for key in message.keys {
            if let heartRate = message[key] {
                print("Received: \(heartRate)")
            } else {
                print("Did not receive heart rate =[")
            }
        }
    }
    
    public func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        DispatchQueue.main.async {
            if let value = userInfo["Start Value"] as? Double {
                print("Start Value ", value)
            }
            if let value = userInfo["Pike Value"] as? Double {
                print("Pike Value ", value)
            }
            if let value = userInfo["End Value"] as? Double {
                print("End Value ", value)
            }
        }
    }
}
