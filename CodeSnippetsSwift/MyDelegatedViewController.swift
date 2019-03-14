//
//  MyDelegatedViewController.swift
//  CodeSnippetsSwift
//
//  Created by Paulo Silva on 11/04/2018.
//  Copyright © 2018 Paulo Silva. All rights reserved.
//

import UIKit

//MARK: step 1 Add Protocol here
protocol MyDelegatedViewControllerDelegate: class {
    func changeBackgroundColor(_ color: UIColor?)
}

class MyDelegatedViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    //MARK: step 2 Create a delegate property here, don't forget to make it weak!
    weak var delegate: MyDelegatedViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        firstView.backgroundColor = .cyan
        firstView.layer.borderColor = UIColor.white.cgColor
        firstView.layer.borderWidth = 2.0
        firstView.layer.cornerRadius = firstView.frame.width / 2
        firstView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        secondView.backgroundColor = .brown
        secondView.layer.borderColor = UIColor.white.cgColor
        secondView.layer.borderWidth = 2.0
        secondView.layer.cornerRadius = secondView.frame.width / 2
        secondView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        
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

    @IBAction func dismissView(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    func handleTap(_ tapGesture: UITapGestureRecognizer) {
        
        view.backgroundColor = tapGesture.view?.backgroundColor
        
        //MARK: step 3 Add the delegate method call here
        delegate?.changeBackgroundColor(tapGesture.view?.backgroundColor)
        
    }
    
}
