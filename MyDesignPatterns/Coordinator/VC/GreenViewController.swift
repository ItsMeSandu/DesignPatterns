//
//  GreenViewController.swift
//  MyDesignPatterns
//
//  Created by Alexandru Petrescu on 24.02.19.
//  Copyright © 2019 Alexandru Petrescu. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {
    weak var coordinator: GreenCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .green
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
