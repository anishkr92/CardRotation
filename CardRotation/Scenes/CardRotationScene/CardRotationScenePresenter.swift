//
//  CardRotationScenePresenter.swift
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

protocol CardRotationScenePresentationLogic
{
    func presentCardRotation(response: CardRotationScene.Response)
}

class CardRotationScenePresenter: CardRotationScenePresentationLogic
{
    weak var viewController: CardRotationSceneDisplayLogic?
    
    // MARK: Present Card Rotation
    
    /// Present the card rotation to the view controller
    /// - Parameter response: The response data containing all details for the rotation
    func presentCardRotation(response: CardRotationScene.Response)
    {
        let viewModel = CardRotationScene.ViewModel(frontSideToValue: response.frontSide.toValue, backSideToValue: response.backSide.toValue, duration: response.duration)
        viewController?.animateCardRotation(viewModel: viewModel)
    }
}
