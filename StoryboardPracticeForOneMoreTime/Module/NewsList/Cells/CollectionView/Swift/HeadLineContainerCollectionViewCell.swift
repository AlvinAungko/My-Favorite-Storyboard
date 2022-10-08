//
//  HeadLineContainerCollectionViewCell.swift
//  StoryboardPracticeForOneMoreTime
//
//  Created by Aung Ko Ko on 08/10/2022.
//

import UIKit

protocol OnTapCell {
    func onTapContent()
}

class HeadLineContainerCollectionViewCell: UICollectionViewCell {
    
    public var delegate:OnTapCell?
    
    @IBOutlet weak var headLinesNewCollectionView:UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.headLinesNewCollectionView.showsHorizontalScrollIndicator = false
        registerCells()
        setDataSourceAndDelegate()
        // Initialization code
    }
    
}

extension HeadLineContainerCollectionViewCell
{
    private func setDataSourceAndDelegate()
    {
        self.headLinesNewCollectionView.dataSource = self
        self.headLinesNewCollectionView.delegate = self
    }
    
    private func registerCells()
    {
        self.headLinesNewCollectionView.registerCells(HeadLinesNewCollectionViewCell.identifier)
       
    }
}

extension HeadLineContainerCollectionViewCell: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeadLinesNewCollectionViewCell.identifier, for: indexPath) as? HeadLinesNewCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
}

extension HeadLineContainerCollectionViewCell:UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width/1.2
        let height = width/2
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.onTapContent()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
