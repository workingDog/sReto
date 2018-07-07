//
//  BrowserRouter.swift
//  sRetoIOS
//
//  Created by ringo on 15/6/18.
//  Copyright © 2018 LS1 TUM. All rights reserved.
//

import Foundation

/**
 * A BrowserRouter is a DefaultRouter but without the Advertising function
 */
class BrowserRouter: DefaultRouter {

    override func start() {
        self.browser.startBrowsing()
    }
    
    override func stop() {
        self.browser.stopBrowsing()
    }
    
    override func addModule(_ module: Module) {
        let newModule = ManagedModule(module: module, dispatchQueue: self.dispatchQueue)
        self.browser.addBrowser(newModule.browser)
        self.modules.append(newModule)
    }
    
    override func removeModule(_ module: Module) {
        let removedModules = self.modules.filter { $0.module === module }
        for removedModule in removedModules {
            self.browser.removeBrowser(removedModule.browser)
        }
        self.modules = self.modules.filter { $0.module !== module }
    }
 
}
