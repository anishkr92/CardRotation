//
//  CardRotationSceneWorker.swift
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

class CardRotationSceneWorker
{
    func getSavedCardAngle() -> Float
    {
        return 0.0
    }
    
    func getRotationValues(from currentCardAngle: Float, forRequest request: CardRotationScene.Request, towards direction: CardRotationScene.RotationDirection) -> CardRotationScene.Response {
        let toAngle = getRotationAngle(fromAngle: currentCardAngle, rotatedBy: request.rotationAngle, direction: direction)
        let fromValue = currentCardAngle * CRConstants.radianFactor
        let toValue = toAngle * CRConstants.radianFactor
        let rotatedBy = request.rotationAngle * CRConstants.radianFactor
        
        let response = CardRotationScene.Response(fromAngle: currentCardAngle, toAngle: toAngle, rotationAngle: request.rotationAngle, fromValue: fromValue, toValue: toValue, rotatedByValue: rotatedBy, duration: request.duration)
        return response
    }
    
    private func getRotationAngle(fromAngle: Float, rotatedBy: Float, direction: CardRotationScene.RotationDirection) -> Float {
        switch direction {
        case .left:
            return fromAngle - rotatedBy
        case .right:
            return fromAngle + rotatedBy
        }
    }
}