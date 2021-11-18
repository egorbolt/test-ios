//
//  AppDelegate.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import UIKit
import DataAPILayer

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var dataModel: DataModel?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let api = DataAPI(
            initialURL: "https://raw.githubusercontent.com/popina/test-ios/master/data.json"
        )
        dataModel = DataModel(api: api)
        return true
    }
}
