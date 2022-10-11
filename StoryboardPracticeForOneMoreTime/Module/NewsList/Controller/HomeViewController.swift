//
//  ViewController.swift
//  StoryboardPracticeForOneMoreTime
//
//  Created by Aung Ko Ko on 08/10/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var dummyNewsPackage = [DummyNews(name: "All news",isSelected: true),DummyNews(name: "Business",isSelected: false),DummyNews(name: "Magazine",isSelected: false),DummyNews(name: "World News",isSelected: false)]
    
    @IBOutlet weak var segmentCollectionView:UICollectionView!
    @IBOutlet weak var contentCollectionView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        self.contentCollectionView.showsVerticalScrollIndicator = false
        registerCells()
        setDataSourceAndDelegate()
        
        // Do any additional setup after loading the view.
    }
    
    
    
}

extension HomeViewController {
    
    private func registerCells()
    {
        self.contentCollectionView.registerCells(HeadLineContainerCollectionViewCell.identifier)
        self.contentCollectionView.registerCells(RecentNewsCollectionViewCell.identifier)
//        self.segmentCollectionView.registerCells(SelectorCollectionViewCell.identifier)
        self.contentCollectionView.register(SectionHeaderForNews.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderForNews.identifierForReusableView)
    }
    
    private func setDataSourceAndDelegate()
    {
        self.contentCollectionView.dataSource = self
        self.contentCollectionView.delegate = self
        
        self.segmentCollectionView.dataSource = self
        self.segmentCollectionView.delegate = self
    }
}

extension HomeViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch collectionView {
        case self.segmentCollectionView:
            return 1
        case self.contentCollectionView:
            return 2
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.segmentCollectionView:
            return 4
        case self.contentCollectionView:
            switch section
            {
            case 0: return 1
            case 1: return 5
            default: return 0
            }
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.segmentCollectionView:
            guard let cell = self.segmentCollectionView.dequeueReusableCell(withReuseIdentifier: SelectorCollectionViewCell.identifier, for: indexPath) as? SelectorCollectionViewCell else {
                return UICollectionViewCell()
                
            }
            cell.setTab(news: self.dummyNewsPackage[indexPath.row])
            cell.delegate = self
            return cell
        case self.contentCollectionView:
            let section = indexPath.section
            if section == 0
            {
                guard let cell = self.contentCollectionView.dequeueReusableCell(withReuseIdentifier: HeadLineContainerCollectionViewCell.identifier, for: indexPath) as? HeadLineContainerCollectionViewCell else {
                    return UICollectionViewCell()
                }
                cell.delegate = self
                return cell
            } else {
                guard let cell = self.contentCollectionView.dequeueReusableCell(withReuseIdentifier:RecentNewsCollectionViewCell.identifier, for: indexPath) as? RecentNewsCollectionViewCell else {
                    return UICollectionViewCell()
                }
                cell.onTabRecentNews = {
                    self.onTapContent()
                }
                return cell
            }
            
        default:
            let cell = UICollectionViewCell()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        if collectionView == self.contentCollectionView {
            if indexPath.section == 1 {
                guard let view = self.contentCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderForNews.identifierForReusableView, for: indexPath) as? SectionHeaderForNews else {
                    debugPrint("Doesn't conform")
                    return UICollectionReusableView()
                }
                debugPrint("This is the header")
                return view
            } else {
                debugPrint("No header")
                return UICollectionReusableView()
            }
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if collectionView == self.contentCollectionView {
            if section == 1 {
                return CGSize(width: collectionView.frame.width, height: 40)
            } else {
                return CGSize(width: 0, height: 0)
            }
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
    
}

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case self.segmentCollectionView:
            let dummyNewsPackageItemCount:CGFloat = CGFloat(self.dummyNewsPackage.count)
            let width = segmentCollectionView.bounds.width/dummyNewsPackageItemCount
            let height:CGFloat = 39
            return CGSize(width: width, height: height)
        case self.contentCollectionView:
            switch indexPath.section
            {
            case 0:
                let width = self.contentCollectionView.bounds.width
                let height = width/2
                return CGSize(width: width, height: height)
            case 1:
                let width = self.contentCollectionView.bounds.width
                let height = width/2
                return CGSize(width: width, height: height)
            default:
                return CGSize(width: 0, height: 0)
            }
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
        case self.segmentCollectionView:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        case self.contentCollectionView:
            switch section {
            case 0: return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            case 1: return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            default: return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }
        default:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case self.segmentCollectionView:
            return 5
        case self.contentCollectionView:
            switch section
            {
            case 0: return 0
            case 1: return 10
            default: return 0
            }
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.segmentCollectionView {
            
        } else {
            debugPrint("")
        }
    }
}

extension HomeViewController:OntapSelectorView{
    
    func onTapSelector(tabedNews: String) {
        self.dummyNewsPackage.forEach {
            if tabedNews == $0.name ?? ""
            {
                $0.isSelected = true
            } else {
                $0.isSelected = false
            }
        }
        self.segmentCollectionView.reloadData()
        debugPrint("\(tabedNews)")
    }
    
}

extension HomeViewController:OnTapCell{
    func onTapContent() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "NewsDetailViewController") as? NewsDetailViewController else {
            return
        }
        //        hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


