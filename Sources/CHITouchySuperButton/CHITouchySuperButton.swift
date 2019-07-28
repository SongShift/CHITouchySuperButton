//
//  CHITouchySuperButton.swift
//  SongShift
//
//  Created by Ben Rosen on 2/20/18.
//  Copyright © 2019 SongShift. All rights reserved.
//

import UIKit

// the contents of a TouchBlock must be UIView animatable properties
// refer to https://developer.apple.com/documentation/uikit/uiview under "Animations" subheading
typealias TouchBlock = (_ sender: CHITouchySuperButton?) -> ()

class CHITouchySuperButton: UIButton {
    var hapticFeedbackEnabled = true
    let hapticFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)

    var propertyAnimators: [UIViewPropertyAnimator] = []
    
    var buttonPressed: TouchBlock?
    var buttonReleased: TouchBlock?
    
    required init() {
        super.init(style: .custom)
        
        addTarget(self, action: #selector(buttonTouchDown(_:)), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(buttonTouchUp(_:)), for: [.touchCancel, .touchDragExit])
        addTarget(self, action: #selector(buttonTouchTriggered(_:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // if the current animations are being interrupted, clear them out by calling this function
    func clearAnimators() {
        for animator in propertyAnimators {
            animator.pauseAnimation()
            animator.stopAnimation(true)
        }
        propertyAnimators.removeAll()
    }
    
    
    @objc func buttonTouchDown(_ sender: CHITouchySuperButton) {
        clearAnimators()
        
        hapticFeedbackGenerator.prepare()
        
        let pressDownAnimator = UIViewPropertyAnimator(duration: 0.20, curve: .easeIn) { [weak self] in
            self?.buttonPressed?(self)
        }
        pressDownAnimator.startAnimation()
        propertyAnimators.append(pressDownAnimator)
    }
    
    @objc func buttonTouchUp(_ sender: CHITouchySuperButton) {
        clearAnimators()
        
        let releaseAnimator = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut) { [weak self] in
            self?.buttonPressed?(self)
        }
        releaseAnimator.startAnimation()
        propertyAnimators.append(releaseAnimator)
    }
    
    @objc func buttonTouchTriggered(_ sender: CHITouchySuperButton) {
        if hapticFeedbackEnabled {
            hapticFeedbackGenerator.impactOccurred()
        }
        
        for animator in propertyAnimators {
            if animator.state == .active {
                // if the animation is active, let it finish and then have it pop back to unopened state after it fully expands.
                // this is like a normal tap, with no sort of weird holding down
                animator.pauseAnimation()
                animator.continueAnimation(withTimingParameters: nil, durationFactor: 0.25)
                animator.addCompletion { [weak self] in
                    self?.buttonTouchUp(self)
                }
            } else {
                // otherwise, if it's inactive, just animate it back. nothing else
                buttonTouchUp(self)
            }
        }
        
        propertyAnimators.removeAll()
    }
}
