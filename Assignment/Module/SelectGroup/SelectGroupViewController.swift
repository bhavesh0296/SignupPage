//
//  SelectGroupViewController.swift
//  Assignment
//
//  Created by Bhavesh on 06/01/22.
//

import UIKit


class SelectGroupViewController: UIViewController {
    
    @IBOutlet weak var groupCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: SKFloatingTextField!
    @IBOutlet weak var groupSelectedLabel: UILabel!
    
    var listGroup = [(text: "#Tech", isSelected: false),
                     (text: "#Society", isSelected: false),
                     (text: "#Social", isSelected: false),
                     (text: "#Sports", isSelected: false),
                     (text: "#Politics", isSelected: false),
                ]

    override func viewDidLoad() {
        super.viewDidLoad()
        initialViewSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func initialViewSetup() {
        
        // TextField Setup
        searchTextField.keyBoardType = .default
        searchTextField.floatingLabelText = "Search Group"
        searchTextField.placeholder = "Search Group"
        searchTextField.floatingLabelColor =  UIColor(red: 69/255, green: 79/255, blue: 99/255, alpha: 1.0)
        searchTextField.setRoundTFUI()
        searchTextField.activeBorderColor = UIColor.black
        
        // Collecion View Setup
        groupCollectionView.delegate = self
        groupCollectionView.dataSource = self
        groupCollectionView.automaticallyAdjustsScrollIndicatorInsets = false
        let columnLayout = LeftAlignedCollectionViewFlowLayout()
        columnLayout.estimatedItemSize =  UICollectionViewFlowLayout.automaticSize
        groupCollectionView.collectionViewLayout = columnLayout
        
        reloadCollectionView()

    }
    
    fileprivate func reloadCollectionView() {
        DispatchQueue.main.async {
            self.groupCollectionView.reloadData()
            self.groupCollectionView.layoutIfNeeded()
            self.updateSelectedLabel()
        }
    }
    
    fileprivate func updateSelectedLabel() {
        let count = listGroup.reduce(into: 0) { partialResult, item in
            partialResult = partialResult + (item.isSelected ? 1 : 0)
        }
        groupSelectedLabel.text = "\(count) Group is selected"
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func skipClicked(_ sender: UIButton) {
        
    }
    
    @IBAction func selectContinueClicked(_ sender: UIButton) {
        
    }
    
}

extension SelectGroupViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
}

extension SelectGroupViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listGroup.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GroupCollectionViewCell.self), for: indexPath) as! GroupCollectionViewCell
        cell.configure(with: listGroup[indexPath.row].text,
                       isSelected: listGroup[indexPath.row].isSelected, index: indexPath.row)
        cell.tapClosure = { index in
            self.listGroup[indexPath.row].isSelected.toggle()
            self.reloadCollectionView()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
