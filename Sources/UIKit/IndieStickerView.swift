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
    
    var stickerIcon: UIImageView = UIImageView()
    var titleLabel: UILabel = UILabel()
    var purchasePhysicalButton: UIButton = UIButton()
    var purchaseDigitalButton: UIButton = UIButton()
    var subtitleLabel: UILabel = UILabel()
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
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        setupTitleLabel()
        setupSubtitleLabel()
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
        titleLabel.frame = CGRect(x: 20, y: 176, width: frame.size.width - 40, height: 200)
        addSubview(titleLabel)
        layoutIfNeeded()
    }
    
    func setupSubtitleLabel() {
        subtitleLabel.text = IndieIconPreviewGenerator.isLargerScreen ? NSLocalizedString("All proceeds will be split 50/50 between the World Health Organization's COVID-19 Solidarity Response Fund and the Equal Justice Initiative for combatting racial and economic injustice.", comment: "Indie Sticker Pack: Promo Subtitle Text, iPad") : NSLocalizedString("All proceeds will be split 50/50 between the WHO's COVID-19 Solidarity Response Fund and the Equal Justice Initiative.", comment: "Indie Sticker Pack: Promo Subtitle Text, iPhone")
        subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        subtitleLabel.textColor = .white
        titleLabel.frame = CGRect(x: 20, y: 396, width: frame.size.width - 40, height: 100)
        addSubview(subtitleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stickerIcon.layoutIfNeeded()
    }

}
