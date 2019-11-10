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
        print(type(of: self))
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
            var values = [0.0, 0.0, 0.0, 0.0]
            
            if let value = userInfo["Start Value"] as? Double {
                values[0] = value
            }
            if let value = userInfo["Pike Value"] as? Double {
                values[1] = value
            }
            if let value = userInfo["End Value"] as? Double {
                values[2] = value
            }
            if let value = userInfo["Time"] as? Double {
                values[3] = value
            }
            
            switch type(of: self) {
            case is Nivel1ViewController.Type:
                Model.shared.progresso["Nível 1"] = values
                break
            case is Nivel2ViewController.Type:
                Model.shared.progresso["Nível 2"] = values
                break
            case is Nivel3ViewController.Type:
                Model.shared.progresso["Nível 3"] = values
                break
            case is Nivel4ViewController.Type:
                Model.shared.progresso["Nível 4"] = values
                break
            default:
                break
            }
            
            print(Model.shared.progresso)
        }
    }
}
