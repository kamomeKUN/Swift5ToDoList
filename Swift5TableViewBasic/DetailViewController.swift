//
//  DetailViewController.swift
//  Swift5TableViewBasic
//
//  Created by kamomeKUN on 2020/02/15.
// Copyright ©︎ 2020 kamomeKUN. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var todoString = String()
    @IBOutlet weak var todoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoLabel.text = todoString
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
        
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
