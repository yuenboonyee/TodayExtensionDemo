//
//  ViewController.swift
//  TodayExtensionDemo
//
//  Created by Serene IT on 28/02/2015.
//  Copyright (c) 2015 Serene IT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.updateButtonState()
    }

    /*!
    @abstract Updates the button between toggled/untoggled based on the user defaults.
*/
    func updateButtonState(){
        var originalValue:Bool?
        var sharedDefaults = NSUserDefaults(suiteName: "group.com.sereneit.TodayExtensionDemoSharingDefaults")
        for tag in 1...9{
            originalValue = sharedDefaults?.boolForKey(String(tag))
            var button:UIButton = self.view.viewWithTag(tag) as! UIButton
            if((originalValue == true)){
                button.alpha = 0.2
            }else{
                button.alpha = 1.0
            }
        }
        
    }
    
    @IBAction func handleButtonPress(sender: UIButton) {
        /*
        NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.sereneit.TodayExtensionDemoSharingDefaults"];
        [sharedDefaults setInteger:[self.textField.text integerValue] forKey:@"MyNumberKey"];
        [sharedDefaults synchronize];   // (!!) This is crucial.
        */
        var sharedDefaults = NSUserDefaults(suiteName: "group.com.sereneit.TodayExtensionDemoSharingDefaults")
        var originalValue:Bool? = sharedDefaults?.boolForKey(String(sender.tag))
//        if((originalValue != nil || originalValue == false)){
        if((originalValue == false)){
            sharedDefaults?.setBool(true, forKey: String(sender.tag))
        }else{
            sharedDefaults?.setBool(false, forKey: String(sender.tag))
        }
        sharedDefaults?.synchronize()
        self.updateButtonState()
    }
}

