//
//  ViewController.swift
//  M-Vote
//
//  Created by Lascar Paul on 05/05/2019.
//  Copyright © 2019 Lascar Paul. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginPressed(_ sender: Any) {
        
        let context:LAContext = LAContext()
        
        let scannerVC:ScannerViewController = ScannerViewController()
        
        
       // scannerVC.view.backgroundColor = UIColor.red;


        
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            
            
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Login with Biometrics", reply: { (wasCorrect, error) in
                
                if wasCorrect {
                    print("Correct")
                    
                    DispatchQueue.main.async {
                       
                        self.present(scannerVC, animated: true, completion: nil)
                        
                    }
                    
                    
                }
                
                else {
                    print("Incorrect")
                }
                
                
            } )
            
        }
        
        else {
            
            //biometrics not supported
            
            
        }
    }
    
}

