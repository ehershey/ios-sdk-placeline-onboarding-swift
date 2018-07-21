//
//  ViewController.swift
//  ios-sdk-placeline-onboarding
//
//  Created by Atul Manwar on 17/05/18.
//  Copyright © 2018 www.hypertrack.com. All rights reserved.
//

import UIKit
import HyperTrack

class ViewController: UIViewController {
    fileprivate var contentView: HTMapContainer!
    fileprivate var placelineUseCase: HTPlaceLineUseCase?
    
    var NAME = "Ernie"
    var MOBILE_NUMBER = "646-722-0190"
    var UNIQUE_ID = "Ernie2018072000"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView = HTMapContainer(frame: .zero)
        view.addSubview(contentView)
        contentView.edges()
        //If you already have a HTUser you can directly call `enablePlacelineUseCase()`
        if let _ = HyperTrack.getUserId() {
            enablePlacelineUseCase()
        } else {
            HyperTrack.getOrCreateUser(name: NAME, phone: MOBILE_NUMBER, uniqueId: UNIQUE_ID) { [weak self] (user, error) in
                if let _ = user {
                   self?.enablePlacelineUseCase()
                } else {
                    //Handle error
                }
            }

        }
    }

    func enablePlacelineUseCase() {
        placelineUseCase = HTPlaceLineUseCase(mapDelegate: contentView)
        placelineUseCase?.delegate = self
        contentView.setBottomViewWithUseCase(placelineUseCase!)
        placelineUseCase?.update()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        placelineUseCase?.update()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: HTBaseUseCaseDelegate {
    func showLoader(_ show: Bool) {
        //Show loader
    }
}
