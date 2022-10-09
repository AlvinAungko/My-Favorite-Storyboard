//
//  NewsDetailViewController.swift
//  StoryboardPracticeForOneMoreTime
//
//  Created by Alvin  on 09/10/2022.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    @IBOutlet weak var contentView:UIView!

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        roundTheUpperCorners()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
  
    
    @IBAction func onTabBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension NewsDetailViewController
{
    private func roundTheUpperCorners()
    {
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 35
        self.contentView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
    }
}
