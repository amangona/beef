//
//  ViewController.swift
//  beef
//
//  Created by abe on 6/1/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import UIKit
import SwiftUI
import ComposableArchitecture

class HostController: UIHostingController<ContentView> {
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        let contentView = ContentView(
            store: Store(
            initialState: AppState(),
            reducer: appReducer,
            environment: AppEnvironment())
        )
        super.init(coder: aDecoder, rootView: contentView)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        print("view loaded")

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("the view will appear..")
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
