//
//  MergeSortViewController.swift
//  Sorting Algs
//
//  Created by Ahmet Mohammed on 8/14/19.
//  Copyright © 2019 Ahmet. All rights reserved.
//
// 2 9 18 7 22 3 5 15
import UIKit

class MergeSortViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
   
    

    @IBOutlet weak var textView: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func sortBtn(_ sender: UIButton) {
        let strings = textView.text
        steps = []
        let arrayIntegers3 = strings?.components(separatedBy: " ").compactMap { Int($0) }
        mergeSort(arrayIntegers3 ?? [1])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return steps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = steps[indexPath.row]
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        textView.delegate = self

    }
    
    var steps = [String]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
    func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
        
        
        guard array.count > 1 else { return array }
        let middleIndex = array.count / 2
        let leftSide =  Array(array[0..<middleIndex])
        let rightSide = Array(array[middleIndex..<array.count])
        steps.append("\(leftSide) \(rightSide)")

        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        steps.append("\(merge(leftPile: leftArray, rightPile: rightArray))")

        return merge(leftPile: leftArray, rightPile: rightArray)
    }
    
    func merge<T: Comparable>(leftPile: [T], rightPile: [T]) -> [T] {
        var leftIndex = 0
        var rightIndex = 0
        var orderedPile = [T]()
        
        if orderedPile.capacity < leftPile.count + rightPile.count {
            
            orderedPile.reserveCapacity(leftPile.count + rightPile.count)
        }
        
        
        while true {
            guard leftIndex < leftPile.endIndex else {
                orderedPile.append(contentsOf: rightPile[rightIndex..<rightPile.endIndex])
                break
            }
            guard rightIndex < rightPile.endIndex else {
                orderedPile.append(contentsOf: leftPile[leftIndex..<leftPile.endIndex])
                
                break
            }
            
            if leftPile[leftIndex] < rightPile[rightIndex] {
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
            } else {
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
                
            }

        }
        return orderedPile
    }
    


}

func textField(_ textView: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    
    let allowedChars = CharacterSet(charactersIn: "1234567890 ")
    let characterSet = CharacterSet(charactersIn: string)
    return allowedChars.isSuperset(of: characterSet)
}

@IBDesignable class sortBtns: UIButton
{
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }
}

extension StringProtocol  {
    var arrayIntegers3: [Int] {
        
        return compactMap{ $0.wholeNumberValue }
    }
}

extension LosslessStringConvertible {
    var strings3: String { return String(self) }
}

extension Numeric where Self: LosslessStringConvertible {
    var arrayIntegers3: [Int] { return strings3.arrayIntegers3 }
}
