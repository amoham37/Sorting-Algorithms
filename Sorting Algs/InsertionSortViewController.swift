//
//  InsertionSortViewController.swift
//  Sorting Algs
//
//  Created by Ahmet Mohammed on 8/10/19.
//  Copyright © 2019 Ahmet. All rights reserved.
//

import UIKit

class InsertionSortViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
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
    
    
    
    
    @IBAction func sortBtn(_ sender: UIButton) {
        let strings2 = textView.text
        
        steps = []
        
        let arrayIntegers2 = strings2?.components(separatedBy: " ").compactMap { Int($0) }
    
        insertionSort(arrayIntegers2 ?? [1])
    }
    
    
    @IBOutlet weak var textView: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
   
    func textField(_ textView: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
      
        let allowedChars = CharacterSet(charactersIn: "1234567890 ")
        let characterSet = CharacterSet(charactersIn: string)
        return allowedChars.isSuperset(of: characterSet)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        textView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func insertionSort<T: Comparable>(_ array: [T]) -> [T] {
        guard array.count > 1 else { return array }
        
        var a = array
        for x in 1..<a.count {
            var y = x
            let temp = a[y]
            while y > 0 && temp < a[y - 1] {
                a[y] = a[y - 1]
                y -= 1
            }
            a[y] = temp
            steps.append("\(a)")
            print(a)

        }
        return a
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
}


@IBDesignable class sortBtn: UIButton
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
    var arrayIntegers2: [Int] {
        
        return compactMap{ $0.wholeNumberValue }
    }
}

extension LosslessStringConvertible {
    var strings2: String { return String(self) }
}

extension Numeric where Self: LosslessStringConvertible {
    var arrayIntegers2: [Int] { return strings2.arrayIntegers2 }
}
