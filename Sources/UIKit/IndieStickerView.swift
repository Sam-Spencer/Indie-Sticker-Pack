//
//  IndieStickerView.swift
//  Indie App Pack
//
//  Created by Sam Spencer on 6/18/20.
//  Copyright © 2020 Sam Spencer. All rights reserved.
//

import UIKit

@available(iOS 13.0, macCatalyst 13.0, *)
@IBDesignable class IndieStickerView: UIView {
    
    var stickerGrid: StickerGrid = StickerGrid()
    var stickerIcon: UIImageView = UIImageView()
    var titleLabel: UILabel = UILabel()
    var purchasePhysicalButton: UIButton = UIButton()
    var purchaseDigitalButton: UIButton = UIButton()
    var FAQbutton: UIButton = UIButton()
    var supportButton: UIButton = UIButton()
    var privacyButton: UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    func initialSetup() {
        setupGrid()
        setupStickerIcon()
        setupTitleLabel()
    }
    
    func setupGrid() {
        stickerGrid.frame = CGRect(x: 0, y: 20, width: frame.width, height: frame.height - 40)
        
        let dimmingView = UIView(frame: stickerGrid.frame)
        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        addSubview(stickerGrid)
        addSubview(dimmingView)
        NSLayoutConstraint.activate([
            stickerGrid.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            stickerGrid.trailingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            stickerGrid.topAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            stickerGrid.bottomAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: 20),
            dimmingView.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            dimmingView.trailingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            dimmingView.topAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            dimmingView.bottomAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: 20)
        ])
        layoutIfNeeded()
    }
    
    func setupStickerIcon() {
        stickerIcon.contentMode = .scaleAspectFit
        stickerIcon.image = UIImage(named: "StickerPackIcon")!
        stickerIcon.frame = CGRect(x: 20, y: 50, width: 76, height: 76)
        addSubview(stickerIcon)
        NSLayoutConstraint.activate([
            stickerIcon.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stickerIcon.topAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
        layoutIfNeeded()
    }
    
    func setupTitleLabel() {
        titleLabel.text = NSLocalizedString("Get a limited-time sticker pack from your favorite indie iOS apps.\n\nGive back to our global community.", comment: "Indie Sticker Pack: Promo Title Text")
        titleLabel.font = UIFont.systemFont(ofSize: (IndieIconPreviewGenerator.isLargerScreen ? 56 : 36), weight: .heavy)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.frame = CGRect(x: 20, y: 176, width: frame.size.width - 40, height: 200)
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            stickerIcon.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stickerIcon.topAnchor.constraint(greaterThanOrEqualTo: stickerIcon.bottomAnchor, constant: 30)
        ])
        layoutIfNeeded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        initialSetup()
    }

}
