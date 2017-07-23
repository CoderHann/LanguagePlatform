//
//  LPLobbyController.swift
//  LanguagePlatform
//
//  Created by roki on 2017/3/22.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

import UIKit

class LPLobbyController: LPBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: LifeCycle
    
    weak var collectionView: UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    self.drawUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func drawUI() {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        layout.itemSize = self.view.frame.size
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        let collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(LPLobbyModuleCell.self, forCellWithReuseIdentifier: "LPLobbyModuleCellID")
        collectionView.register(LPPopularCell.self, forCellWithReuseIdentifier: "LPPopularCellID")
        self.view.addSubview(collectionView)
        self.collectionView = collectionView
        
//        collectionView.snp.makeConstraints
        
        
    }
    
    // MARK: UICollectionViewDelegate
    
    
    
    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: UICollectionViewCell? = nil;
        if indexPath.row == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LPPopularCellID", for: indexPath)
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LPLobbyModuleCellID", for: indexPath)
        }
        
        cell?.backgroundColor = UIColor.red;
    
        return cell!
    }

}
