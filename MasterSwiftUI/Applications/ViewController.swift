//
//  ViewController.swift
//  MasterSwiftUI
//
//  Created by Omid Shojaeian Zanjani on 11/10/23.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var titleText: UILabel!
    var changingBackground:Bool = false
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initial index and colors array
            var index = 0
            let colors: [UIColor] = [.red, .green, .blue, .yellow]  // Add more colors if needed

            // Create a function to animate background color changes
            func animateBackgroundColorChange() {
                UIView.animate(withDuration: 0.5, delay: 0, options: [.allowUserInteraction]) {
                    self.view.backgroundColor = colors[index]
                } completion: { isDone in
                    if index < colors.count - 1 {
                        index += 1
                    } else {
                        index = 0
                    }
                    animateBackgroundColorChange()  // Start the animation again
                }
            }
            
            // Start the initial animation
            animateBackgroundColorChange()
    }

    @IBAction func printingOnchange(_ sender: UISwitch) {
        
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
