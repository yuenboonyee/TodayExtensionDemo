//
//  ButtonGridViewController.swift
//  TodayExtensionDemo
//
//  Created by Serene IT on 1/03/2015.
//  Copyright (c) 2015 Serene IT. All rights reserved.
//

import UIKit

class ButtonGridViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        /*
        //Register for the notification.
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        //Register a notification handler.
        [notificationCenter addObserver:self
        selector:@selector(myNotificationHandler:)
        name:NOTIFICATION_NAME
        object:self];
        */
        var notificationCenter: NSNotificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserverForName("ButtonGridViewControllerRefreshNotification", object: nil, queue: NSOperationQueue.mainQueue()) { (notification:NSNotification!) -> Void in
            self.updateButtonState()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        var notificationCenter: NSNotificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.postNotificationName("ButtonGridViewControllerRefreshNotification", object: self)
    }
    override func viewWillDisappear(animated: Bool) {
        var notificationCenter: NSNotificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    
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
                button.alpha = 0.1
            }else{
                button.alpha = 1.0
            }
        }
        
    }
    
    /*!
    @abstract Event handler for the 3x3 grid of buttons. The buttons must be tagged 1 to 9.
    */
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
    }}
