//
//  ViewController.swift
//  TestScrollToTop
//
//  Created by ys on 16/8/24.
//  Copyright © 2016年 jzh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView: UIScrollView = UIScrollView(frame: CGRect(x: 0, y: 100, width: view.frame.size.width, height: view.frame.size.height))
        scrollView.backgroundColor = UIColor.redColor()
        scrollView.contentSize = CGSize(width: view.frame.size.width * 3, height: view.frame.size.height)
        scrollView.pagingEnabled = true
        view.addSubview(scrollView)
        
        let minScrollView: UIScrollView = UIScrollView(frame: CGRect(x: 0, y: 100, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
        minScrollView.backgroundColor = UIColor.yellowColor()
        minScrollView.contentSize = CGSize(width: view.frame.size.width, height: view.frame.size.height * 2)
        scrollView.addSubview(minScrollView)
        
        let tableView: UITableView = UITableView(frame: CGRect(x: scrollView.frame.size.width, y: 100, width: scrollView.frame.size.width, height: scrollView.frame.size.height), style: UITableViewStyle.Plain)
        tableView.backgroundColor = UIColor.cyanColor()
        tableView.dataSource = self
        scrollView.addSubview(tableView)
        
        let collectionLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView: UICollectionView = UICollectionView(frame: CGRect(x: scrollView.frame.size.width * 2, y: 100, width: scrollView.frame.size.width, height: scrollView.frame.size.height), collectionViewLayout: collectionLayout)
        collectionView.backgroundColor = UIColor.greenColor()
        collectionView.dataSource = self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        scrollView.addSubview(collectionView)
        
        // 必须保证当前只有一个scrollsToTop = true，才能使用系统状态栏返回顶部手势
        scrollView.scrollsToTop = false
        tableView.scrollsToTop = false
        minScrollView.scrollsToTop = false
        
        
//        let view: UIView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
//        view.backgroundColor = UIColor.redColor()
//        view.userInteractionEnabled = false
//        self.view.addSubview(view)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellId)
        }
        return cell!
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cellId = "cellId"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.lightTextColor()
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        return CGSize(width: 100, height: 100)
//    }
    
    // UIScrollView阻止此事件的响应
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("我被点击了")
    }


}

