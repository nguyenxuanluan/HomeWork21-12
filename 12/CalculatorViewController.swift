//
//  CalculatorViewController.swift
//  12
//
//  Created by LuanNX on 12/23/16.
//  Copyright © 2016 LuanNX. All rights reserved.
//

import UIKit
enum error1: Error{
    case invalid
}
class CalculatorViewController: UIViewController {


    @IBOutlet var button: [UIButton]!
    @IBOutlet weak var output: UITextField!
    var flag:Bool = true
    var checkError = false
    let operArr = ["*","-","/","+","%"]
    let numArr = ["0","1","2","3","4","5","6","7","8","9"]
    @IBOutlet weak var buttonAlter: UIButton!
    @IBOutlet weak var buttonResult: UIButton!
    @IBOutlet weak var buttonAC: UIButton!
    @IBOutlet weak var buttonDel: UIButton!
    @IBAction func touchButtonDel(_ sender: Any) {
        guard var out = output.text else {
            return
        }
        output.text = "\(out.utf8.dropLast())"
    
    }
    @IBAction func touchButtonAlter(_ sender: Any) {
        guard let out = output.text else {
            return
        }
        let doub = NumberFormatter().number(from: out) as! Double
        
        if out != "\(0)" {
            output.text = "\(-doub)"
        }
    }
    @IBAction func touchButtonAC(_ sender: Any) {
        output.text = ""
    }
    func check(output: String) throws -> String {
        let arr = output.characters.split(separator: " ")
        print(arr.endIndex)
        if arr.endIndex == 1 && operArr.contains(String(arr[arr.endIndex-1])) {
            throw error1.invalid
        } else {
        for i in 0...arr.endIndex-2 {
            if ( operArr.contains(String(arr[i])) &&  operArr.contains(String(arr[i+1]))){
                throw error1.invalid
            }
        }
        }
        return output
        
    }
    @IBAction func touchButtonResult(_ sender: Any) {
        var out = output.text
        var result:Double = 0
        if (out?.isEmpty)! {
            return
        } else {
            if (!((out?.contains("%")))! || out != "%" ){
               
        
                do {
                    out = try check(output: out!)
                    let exp = NSExpression(format: out!)
                    result =  exp.expressionValue(with: nil, context: nil) as!Double
                } catch error1.invalid {
                    output.text = "Math Error"
                    checkError = true
                    return
                } catch {
                }
                
                if result.isInfinite || result.isNaN {
                    output.text = "Math Error"
                    checkError = true
                    return
                }

            } else {
                let nums:[String]=out!.components(separatedBy: "%")
                let divisor = nums[0].toDouble()
                let dividend =  nums[1].toDouble()
                print(divisor)
                print(dividend)
                let div = Int(divisor/dividend)
                print(div)
                result = divisor - dividend * Double(div)
            }
        output.text = "\(result)"
        flag = false
        }
    }
    

    @IBAction func touch(_ sender: UIButton) {
        guard var out = output.text else {
            return
        }
        if checkError == true {
            output.text = sender.currentTitle!
            checkError = false
        } else {
        for i in button{
            if i == sender {
                    guard let next = i.currentTitle else {
                    return
                    }
                    if (  !(operArr.contains(next)) && flag == false){
                        
                        out = next
                    } else {
                        if numArr.contains(next){
                            out = out + " \(next.toDouble())"
                        }
                        else {
                           out = out + " \(next)" 
                        }
                 
                    }
                    output.text = "\(out)"
                    flag = true
                    break
                    }
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
