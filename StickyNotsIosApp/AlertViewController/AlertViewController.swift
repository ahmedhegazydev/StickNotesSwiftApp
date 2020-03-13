//
//  AlertViewController.swift
//  StickyNotsIosApp
//
//  Created by Ahmed Hegazy on 3/12/20.
//  Copyright © 2020 Ahmed Hegazy. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var selectedColor: UIColor = .black//default
    
    var colorsArray : [UIColor] = [
        //.black,
        .red, .blue,
        .gray, .yellow, .brown,
        .cyan, .lightGray, .green,
        .systemOrange, .systemRed, .systemBlue,
        .systemPink, .systemTeal, .systemGray2,
        .systemGray3, .systemGray4, .systemGray5,
        .systemIndigo
    ]
    
    
    fileprivate let colorsCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false;
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.showsHorizontalScrollIndicator = false//hiding
        collectionView.isUserInteractionEnabled =  true
        
        
        
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting the bg color for the main view container
        //self.view.backgroundColor = .darkGray
        self.view.backgroundColor = UIColor.black
        
        
//        exitOnViewClick()
        //addingTheHorizontalColorsTableView()
        addingColorHCollectionView()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        debugPrint("viewDidAppear AlertViewController")
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    func addingColorHCollectionView(){
        
        //Adding the my colorsCollectionView
        self.view.addSubview(self.colorsCollectionView)
        
        //setting the background color
//        self.colorsCollectionView.backgroundColor = UIColor.white
        self.colorsCollectionView.backgroundColor = UIColor.clear//no color
        
        
        let margin = CGFloat(20)
        //Adding some constraints
        self.colorsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin).isActive = true
        self.colorsCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: margin).isActive = true
        self.colorsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin).isActive =  true
        //this is makes collectionview fullscressn
        //        self.colorsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = false
        //so we eill setting height instead
        self.colorsCollectionView.heightAnchor.constraint(equalTo: colorsCollectionView.widthAnchor
            , multiplier: 0.3).isActive = true
        
        
        
        colorsCollectionView.delegate = self
        colorsCollectionView.dataSource = self
        
        
        
    }
    
    func exitOnViewClick(){
        let gestRecog = UITapGestureRecognizer(target: self, action: #selector(handleOnViewClick(sender:)))
        self.view.addGestureRecognizer(gestRecog)
    }
    
    @objc func handleOnViewClick(sender: UITapGestureRecognizer){
        debugPrint("On View clicked")
        dismiss(animated: true) {}
        
        
    }
    
    func addingTheHorizontalColorsTableView(){
        debugPrint("addingTheHorizontalColorsTableView")
        
        //let colorsHTableView = UITableView.init()
        let colorsHTableView = UITableView()
        colorsHTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
        
        colorsHTableView.backgroundColor = .clear//no color = transparent
        //        colorsHTableView.backgroundColor = .white
        
        colorsHTableView.delegate = self
        colorsHTableView.dataSource = self
        self.view.addSubview(colorsHTableView)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension AlertViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let divideBy = CGFloat(5);
        return CGSize(width: collectionView.frame.width / divideBy, height: collectionView.frame.width / divideBy)
        //return CGSize(width: 50, height: 50)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 20
        return self.colorsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let pos = indexPath.row;
        let selectedClr = colorsArray[pos]
        //debugPrint("selected \(pos)")
        
        
        //Appending the default firstly -> The Black to last of array
        self.colorsArray.append(self.selectedColor)
        
        
        //setting the color to the main view
        self.view.backgroundColor = selectedClr
        //Passing to the global selected color
        self.selectedColor = selectedClr
        
        
//        if let cell = collectionView.cellForItem(at: indexPath) {
//            //for hiding the selected cell
////            cell.isHidden = true;
//        }
        
        //remove the selected color
        self.colorsArray.remove(at: pos)
        
        
        //for resfreshing the cv
        collectionView.reloadData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        
        
        //cell.backgroundColor = .red
        cell.backgroundColor = self.colorsArray[indexPath.row]
        
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true;
        
        
        cell.isUserInteractionEnabled = true
//        let gestRecog = UITapGestureRecognizer()
//        gestRecog.addTarget(self, action: #selector(handleOnCellSelected(sender:)))
//        cell.addGestureRecognizer(gestRecog)
        
        //return UICollectionViewCell()
        return cell
    }
    
    
    @objc func handleOnCellSelected(sender: UITapGestureRecognizer?){
        debugPrint("clicking")
        
    }
    
    
}
