//
//  CardRotationSceneViewController.swift
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

protocol CardRotationSceneDisplayLogic: class
{
    func animateCardRotation(viewModel: CardRotationScene.ViewModel)
}

class CardRotationSceneViewController: UIViewController, CardRotationSceneDisplayLogic
{
    var interactor: CardRotationSceneBusinessLogic?
    var router: (NSObjectProtocol & CardRotationSceneRoutingLogic & CardRotationSceneDataPassing)?
    
    var currentAngle: Float = 0.0

    // MARK: Outlets
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var leftRotateButton: UIButton!
    @IBOutlet weak var rightRotateButton: UIButton!

    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = CardRotationSceneInteractor()
        let presenter = CardRotationScenePresenter()
        let router = CardRotationSceneRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set perspective for the rotation
        self.cardImageView.layer.transform.m34 = 0.0
    }
    
    // MARK: Actions
    
    @IBAction func rotateLeft(_ sender: Any) {
        rotateCard(inDirection: .left)
    }
    
    @IBAction func rotateRight(_ sender: Any) {
        rotateCard(inDirection: .right)
    }
    
    // MARK: Rotate Card
    
    func rotateCard(inDirection direction: CardRotationScene.RotationDirection) {
        let request = CardRotationScene.Request(rotationAngle: CRConstants.cardRotationAngle, duration: CRConstants.animationDuration)
        interactor?.rotateCard(request: request, direction: direction)
    }
    
    func animateCardRotation(viewModel: CardRotationScene.ViewModel) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        rotateAnimation.fromValue = viewModel.fromValue
        rotateAnimation.toValue = viewModel.toValue
        rotateAnimation.duration = viewModel.duration
        rotateAnimation.repeatCount = 0
        
        DispatchQueue.main.async {
            self.cardImageView.layer.add(rotateAnimation, forKey: nil)
            self.cardImageView.layer.transform = CATransform3DRotate(self.cardImageView.layer.transform, CGFloat(viewModel.rotatedByValue), 0.0, 1.0, 0.0)
        }
    }
}