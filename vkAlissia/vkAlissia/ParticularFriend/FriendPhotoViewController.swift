//
//  FriendPhotoViewController.swift
//  vkAlissia
//
//  Created by Роман Колосов on 02.08.2020.
//  Copyright © 2020 Roman N. Kolosov. All rights reserved.
//

import UIKit

class FriendPhotoViewController: UIViewController {
    
    var favoriteImages : [UIImage] = []
    var nameLabel = UILabel()
    var currentIndex: Int = 0
    
    private var currentSign = 0
    private var percent: CGFloat = 0
    private var interactiveAnimator: UIViewPropertyAnimator?
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let backgrounImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        nameLabel.textColor = .black
        nameLabel.font = .preferredFont(forTextStyle: .title1)
        nameLabel.textAlignment = .center
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
       
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 136),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
        ])
        
        layout(imgView: backgrounImageView)
        layout(imgView: imageView)
       
        setImages()
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        imageView.addGestureRecognizer(gesture)
    }
    
    private func layout(imgView: UIImageView) {
        view.addSubview(imgView)
        NSLayoutConstraint.activate([
            imgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imgView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imgView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            imgView.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    private func setImages() {
        let firstImage = favoriteImages[currentIndex]
        var nextIndex = currentIndex + 1
        var backgroundImage: UIImage?
        
        if currentSign > 0 {
            nextIndex = currentIndex - 1
        }
        
        if nextIndex < favoriteImages.count - 1, nextIndex >= 0 {
            backgroundImage = favoriteImages[nextIndex]
        }
        
        imageView.image = firstImage
        backgrounImageView.image = backgroundImage
    }
    
    private func initAnimator() {
        backgrounImageView.alpha = 0.0
        backgrounImageView.transform = .init(scaleX: 0.8, y: 0.8)
        interactiveAnimator?.stopAnimation(true)
        interactiveAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut, animations: {
            let width = CGFloat(self.currentSign) * self.view.frame.width
            let translationTranform = CGAffineTransform(translationX: width, y: 0)
            let angle = CGFloat(self.currentSign) * 0.8
            
            let angleTransform = CGAffineTransform(rotationAngle: angle)
            
            self.imageView.transform = angleTransform.concatenating(translationTranform)
            
            self.backgrounImageView.alpha = 1.0
            self.backgrounImageView.transform = .identity
        })
        
        interactiveAnimator?.startAnimation()
        interactiveAnimator?.pauseAnimation()
    }
    
    private func resetImageView() {
        backgrounImageView.alpha = 0.0
        backgrounImageView.transform = .init(scaleX: 0.8, y: 0.8)
        imageView.transform = .identity
        
        setImages()
        view.layoutIfNeeded()
        currentSign = 0
        interactiveAnimator = nil
    }
    
    @objc private func onPan(_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            let translation = gesture.translation(in: view)
            percent = abs(translation.x) / view.frame.width
            let translationX = Int(translation.x)
            let sign = translationX == 0 ? 1 : translationX / abs(translationX)
            
            if interactiveAnimator == nil || sign != currentSign {
                interactiveAnimator?.stopAnimation(true)
                resetImageView()
                interactiveAnimator = nil
                
                if ( sign > 0 && currentIndex > 0 || ( sign < 0 && currentIndex < favoriteImages.count - 1 ) ) {
                    currentSign = sign
                    setImages()
                    initAnimator()
                }
            }
            
            interactiveAnimator?.fractionComplete = abs(translation.x) / (self.view.frame.width / 2)
            
        case .ended:
            interactiveAnimator?.addCompletion({ (position) in
                self.resetImageView()
            })
            
            if percent < 0.33 {
                interactiveAnimator?.stopAnimation(true)
                UIView.animate(withDuration: 0.3) {
                    self.resetImageView()
                }
            }
            else {
                currentIndex += currentSign * -1
                interactiveAnimator?.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            }
        default:
            break
        }
    }
}
