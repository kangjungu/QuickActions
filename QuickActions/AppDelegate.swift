//
//  AppDelegate.swift
//  QuickActions
//
//  Created by JHJG on 2016. 7. 18..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //코드로 퀵 액션 추가하기(plist 말고)
        
        //퀵 액션 아이템 생성
        let shortcut2 = UIMutableApplicationShortcutItem(
            type: "SearchMusic",
            localizedTitle: "Search",
            localizedSubtitle: "Find a track to play",
            icon: UIApplicationShortcutIcon(type: .Search),
            userInfo: nil)
        
        let shortcut3 = UIMutableApplicationShortcutItem(
            type: "AddMusic",
            localizedTitle: "Add Track",
            localizedSubtitle: "Add track to playlist",
            icon: UIApplicationShortcutIcon(type:.Add),
            userInfo: nil)
        
        //퀵액션 아이템을 배열에 배치하고 애플리케이션 콘텍스트의 shortcutItems 속성을 그 배열에 할당하여 앱에 추가되도록 구성 
        application.shortcutItems = [shortcut2,shortcut3]
        
        //이렇게하면 동적으로 선언된것 삭제 가능
        //application.shortcutItems = []
        return true
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
    
    //퀵 액션 아이템이 선택되면 이 메서드가 호출된다.
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        
        //완료 핸들러를 호출하기전에 제목을 매개변수로 전달하고 notifyuser라는 이름의 메서드를 호출한다.
        switch shortcutItem.type {
        case "PlayMusic":
            notifyUser(shortcutItem.localizedTitle)
        case "PauseMusic":
            notifyUser(shortcutItem.localizedTitle)
        case "SearchMusic":
            notifyUser(shortcutItem.localizedTitle)
        case "AddMusic":
            notifyUser(shortcutItem.localizedTitle)
        default:
            break
        }
        completionHandler(true)
    }
    
    //얼럿 다이얼로그 func
    func notifyUser(message:String){
        
        let alertController = UIAlertController(title: "Quick Action", message: message, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alertController.addAction(okAction)
        
        window?.rootViewController?.presentViewController(alertController, animated: true, completion: nil)
    }


}

