//
//  CardRotationSceneRouter.swift
//  CardRotation
//
//  Created by Anish Kumar on 05/12/19.
//  Copyright (c) 2019 Anish Kumar. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol CardRotationSceneRoutingLogic
{
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol CardRotationSceneDataPassing
{
    var dataStore: CardRotationSceneDataStore? { get }
}

class CardRotationSceneRouter: NSObject, CardRotationSceneRoutingLogic, CardRotationSceneDataPassing
{
    weak var viewController: CardRotationSceneViewController?
    var dataStore: CardRotationSceneDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: CardRotationSceneViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: CardRotationSceneDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}