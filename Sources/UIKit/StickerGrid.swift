//
//  StickerGrid.swift
//  Indie App Pack
//
//  Created by Sam Spencer on 6/18/20.
//  Copyright © 2020 Sam Spencer. All rights reserved.
//

import UIKit

enum DiffableStickerRow {
    case main
}

class StickerItem: UICollectionViewCell {
    
    var sticker: UIImageView
    
    override init(frame: CGRect) {
        sticker = UIImageView(frame: frame)
        sticker.contentMode = .scaleAspectFill
        sticker.layer.cornerRadius = frame.width * 0.22
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        sticker = UIImageView()
        sticker.contentMode = .scaleAspectFill
        super.init(coder: coder)
        sticker.layer.cornerRadius = frame.width * 0.22
    }
    
    convenience init(frame: CGRect, image: UIImage) {
        self.init(frame: frame)
        sticker.image = image
    }
    
}

@available(iOS 13.0, macCatalyst 13.0, *)
class StickerGrid: UIView {
    
    var rowOne = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var rowTwo = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var rowThree = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var rowFour = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    lazy var rowOneData: DataSource = makeDataSource(for: rowOne)
    lazy var rowTwoData: DataSource = makeDataSource(for: rowTwo)
    lazy var rowThreeData: DataSource = makeDataSource(for: rowThree)
    lazy var rowFourData: DataSource = makeDataSource(for: rowFour)
    
    let chunkedIcons = IndieIconPreviewGenerator.allIcons().chunked(into: 28)
    
    typealias DataSource = UICollectionViewDiffableDataSource<DiffableStickerRow, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<DiffableStickerRow, String>
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGrid()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGrid()
    }
    
    func setupGrid() {
        rowOne.frame = CGRect(x: 0, y: 0, width: frame.width, height: (frame.height / 4) - 5)
        rowOne.dataSource = rowOneData
        rowOne.backgroundColor = .clear
        addSubview(rowOne)
        NSLayoutConstraint.activate([
            rowOne.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            rowOne.trailingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            rowOne.topAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.topAnchor, constant: 0)
        ])
        layoutIfNeeded()
        
        rowTwo.frame = CGRect(x: 0, y: (frame.height / 4) + 5, width: frame.width, height: (frame.height / 4) - 5)
        rowTwo.dataSource = rowTwoData
        rowTwo.backgroundColor = .clear
        addSubview(rowTwo)
        NSLayoutConstraint.activate([
            rowTwo.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            rowTwo.trailingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            rowTwo.topAnchor.constraint(greaterThanOrEqualTo: rowOne.topAnchor, constant: 5)
        ])
        layoutIfNeeded()
        
        rowThree.frame = CGRect(x: 0, y: ((frame.height / 4) + 5) * 2, width: frame.width, height: (frame.height / 4) - 5)
        rowThree.dataSource = rowThreeData
        rowThree.backgroundColor = .clear
        addSubview(rowThree)
        NSLayoutConstraint.activate([
            rowThree.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            rowThree.trailingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            rowThree.topAnchor.constraint(greaterThanOrEqualTo: rowTwo.topAnchor, constant: 5)
        ])
        layoutIfNeeded()
        
        rowFour.frame = CGRect(x: 0, y: ((frame.height / 4) + 5) * 3, width: frame.width, height: (frame.height / 4) - 5)
        rowFour.dataSource = rowFourData
        rowFour.backgroundColor = .clear
        addSubview(rowFour)
        NSLayoutConstraint.activate([
            rowFour.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            rowFour.trailingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            rowFour.topAnchor.constraint(greaterThanOrEqualTo: rowThree.topAnchor, constant: 5),
            rowFour.bottomAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        layoutIfNeeded()
        
        applySnapshot(to: rowOneData)
        applySnapshot(to: rowTwoData)
        applySnapshot(to: rowThreeData)
        applySnapshot(to: rowFourData)
    }
    
    func makeDataSource(for collection: UICollectionView) -> DataSource {
        let dataSource = DataSource(collectionView: collection, cellProvider: { (collectionView, indexPath, imageName) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "stickerCell", for: indexPath) as? StickerItem
            cell?.sticker.image = UIImage(named: imageName)
            return cell
        })
        return dataSource
    }
    
    func applySnapshot(to collectionData: DataSource, animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        if collectionData == rowOne {
            snapshot.appendItems(chunkedIcons[0])
        } else if collectionData == rowTwo {
            snapshot.appendItems(chunkedIcons[1])
        } else if collectionData == rowThree {
            snapshot.appendItems(chunkedIcons[2])
        } else if collectionData == rowFour {
            snapshot.appendItems(chunkedIcons[3])
        }
        collectionData.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
    override func layoutSubviews() {
        setupGrid()
    }
    
}
