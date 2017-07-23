//
//  LPPopularCell.swift
//  LanguagePlatform
//
//  Created by roki on 2017/3/31.
//  Copyright © 2017年 CoderHann. All rights reserved.
//

import UIKit

class LPPopularCell: LPLobbyBaseCell, UITableViewDelegate, UITableViewDataSource {
    
//    weak var posterImageView: UIImageView?
//    weak var videoTitle:
    
    weak var tableView: UITableView?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        self.addSubview(tableView)
        self.tableView = tableView
        
        
    }
    
    
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        NSLog("did clicked!");
        
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // MARK:
    override func layoutSubviews() {
         super.layoutSubviews()
        
    }
}
