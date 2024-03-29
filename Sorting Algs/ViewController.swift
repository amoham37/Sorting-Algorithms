//
//  ViewController.swift
//  Sorting Algs
//
//  Created by Ahmet Mohammed on 8/6/19.
//  Copyright © 2019 Ahmet. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return steps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = steps[indexPath.row]
        
        return cell
    }
    
    var steps = [String]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    @IBOutlet weak var userArr: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func sortBtn(_ sender: UIButton) {
        
        let strings = userArr.text
        
        steps = []
    
        let arrayIntegers = strings?.components(separatedBy: " ").compactMap { Int($0) }
        
        bubbleSort(arrayIntegers ?? [1], <)
    
    }
    
    func textField(_ textView: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        let allowedChars = CharacterSet(charactersIn: "1234567890 ")
        let characterSet = CharacterSet(charactersIn: string)
        return allowedChars.isSuperset(of: characterSet)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        userArr.delegate = self 
    }
    
    
    
   public func bubbleSort<T> (_ arrays: [T], _ comparison: (T,T) -> Bool) -> [T]  {
        var array = arrays
    
        for i in 0..<array.count {
            for j in 1..<array.count-i {
                if comparison(array[j], array[j-1]) {
                    let tmp = array[j-1]
                    array[j-1] = array[j]
                    array[j] = tmp
                    steps.append("\(array)")
//                    print(array) // prints the array after each iteration to the console
                   
                }
            }
        }
        return array
    }
    
    public func bubbleSort<T> (_ elements: [T]) -> [T] where T: Comparable {
        return bubbleSort(elements, <)
    }
}

func userArr(_ textView: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    
    let allowedChars = CharacterSet(charactersIn: "1234567890 ")
    let characterSet = CharacterSet(charactersIn: string)
    return allowedChars.isSuperset(of: characterSet)
}


@IBDesignable class srtBtn: UIButton
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
    var arrayIntegers: [Int] {
        
        return compactMap{ $0.wholeNumberValue }
    }
}

extension LosslessStringConvertible {
    var strings: String { return String(self) }
}

extension Numeric where Self: LosslessStringConvertible {
    var arrayIntegers: [Int] { return strings.arrayIntegers }
}
