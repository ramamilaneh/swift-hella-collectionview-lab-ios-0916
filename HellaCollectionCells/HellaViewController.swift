//
//  ViewController.swift
//  HellaCollectionCells
//
//  Created by Flatiron School on 10/6/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class HellaViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var numbers = [Int]()
    func createFibonacciNumbers() -> [Int] {
        var array = [0,1]
        for i in 0...90 {
            array.append(array[i]+array[i+1])
        }
        return array
    }
    override func viewDidLoad() {
    // Do any additional setup after loading the view, typically from a nib.
        self.numbers = createFibonacciNumbers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hellaCell", for: indexPath)
        if self.numbers.contains(indexPath.item) {
           cell.backgroundColor = UIColor.purple
        }else{
            cell.backgroundColor = UIColor.yellow
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let destination = segue.destination as! HellaDetailViewController
            let indexPaths = self.collectionView!.indexPathsForSelectedItems!
            let indexPath = indexPaths[0] as NSIndexPath
            destination.numberText = String(indexPath.row)
            
            if numbers.contains(indexPath.row) {
                destination.view.backgroundColor = UIColor.purple
            }else{
                destination.view.backgroundColor = UIColor.yellow
            }
            
        }
    }
    
}

