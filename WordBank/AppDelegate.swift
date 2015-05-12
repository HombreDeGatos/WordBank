//
//  AppDelegate.swift
//  WordBank
//
//  Created by Jared Katzman on 5/11/15.
//  Copyright (c) 2015 deGatos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // Ask for User Permission to receive notifications
//        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Sound|UIUserNotificationType.Badge|UIUserNotificationType.Alert, categories: nil))
        
        self.setupNoficationSettings(application)
//        self.scheduleLocalNotification(application)
        
        return true
    }
    
    func setupNoficationSettings(application: UIApplication) {
        // Check if Notifications Settings have been set
        let notificationSettings: UIUserNotificationSettings! = application.currentUserNotificationSettings()
        
        if notificationSettings.types == UIUserNotificationType.None {
        
        
        // Specify the notification types.
        var notificationTypes: UIUserNotificationType = UIUserNotificationType.Alert | UIUserNotificationType.Sound
        
        // Specify the Notification actions
        var justInformAction = UIMutableUserNotificationAction()
        justInformAction.identifier = "justInform"
        justInformAction.title = "I know it"
        justInformAction.activationMode = UIUserNotificationActivationMode.Background
        
        var showDictionaryAction = UIMutableUserNotificationAction()
        showDictionaryAction.identifier = "showDict"
        showDictionaryAction.title = "Define"
        showDictionaryAction.activationMode = UIUserNotificationActivationMode.Foreground
        
        var ignoreAction = UIMutableUserNotificationAction()
        ignoreAction.identifier = "ignore"
        ignoreAction.title = "Ignore"
        ignoreAction.activationMode = UIUserNotificationActivationMode.Foreground
        
        // Group Actions
        let actionArray = NSArray(objects: justInformAction, showDictionaryAction, ignoreAction)
        let actionArrayMinimal = NSArray(objects: showDictionaryAction, ignoreAction)
        
        // Specify Action Categories
        var wordReminderCategory = UIMutableUserNotificationCategory()
        wordReminderCategory.identifier = "wordReminderCategory"
        wordReminderCategory.setActions(actionArray, forContext: UIUserNotificationActionContext.Default)
        wordReminderCategory.setActions(actionArrayMinimal, forContext: UIUserNotificationActionContext.Minimal)
        
        // Registering Notification Settings
        let categoriesforSettings = NSSet(object: wordReminderCategory)
        let newNotificationSettings = UIUserNotificationSettings(forTypes: notificationTypes, categories: categoriesforSettings)
        
        application.registerUserNotificationSettings(newNotificationSettings)
        
        }
    }
    
    func scheduleLocalNotification(application : UIApplication) {
        var localNotification = UILocalNotification()
        localNotification.fireDate = NSDate(timeIntervalSinceNow: NSTimeInterval(5.0))
        localNotification.alertBody = "Remember that word?"
        localNotification.alertAction = "View List"
        localNotification.category = "wordReminderCategory"
        
        application.scheduleLocalNotification(localNotification)
    }
    
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        
        println(notificationSettings.types.rawValue)
        self.scheduleLocalNotification(UIApplication.sharedApplication())
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        println("Received Notification:")
        println(notification.alertBody)
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
        if identifier == "showDict" {
            NSNotificationCenter.defaultCenter().postNotificationName("showDefinition", object: nil)
        }
        else if identifier == "ignore" {
            // Do nothing
        }
        
        completionHandler()
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

