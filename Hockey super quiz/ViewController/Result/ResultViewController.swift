//
//  ResultViewController.swift
//  Hockey super quiz
//
//  Created by Bhavik Darji on 08/08/22.
//

import UIKit

class ResultViewController: UIViewController {

    // MARK: - Refference outlet and variables

    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnmenu: UIButton!
    var score = Int()

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        self.General()
        
    }
}

// MARK: - IBAction's

extension ResultViewController
{
    @IBAction func btn_MenuClick(_ sender: Any)
    {
        playSound()
        Constants.kUserDefaults.setValue(true, forKey: "Is_ShowAnswer")
        Constants.kSharedAppDelegate?.MenuScreen()
    }
}

// MARK: - Function's

extension ResultViewController
{
    func General()
    {
        self.ChangeLanguage()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.lblScore.text = "\(score)/18"
        if self.score >= 0 && self.score <= 4
        {
            self.lblDescription.text = NSLocalizedString("You don't know anything about hockey", comment: "")
        }
        else if self.score >= 5 && self.score <= 7
        {
            self.lblDescription.text = NSLocalizedString("I think you're lucky to have the right answer", comment: "")
        }
        else if self.score >= 8 && self.score <= 11
        {
            self.lblDescription.text = NSLocalizedString("You've heard something about hockey!", comment: "")
        }
        else if self.score >= 12 && self.score <= 16
        {
            self.lblDescription.text = NSLocalizedString("You know a lot about hockey, but not everything", comment: "")
        }
        else if self.score >= 17 && self.score <= 18
        {
            self.lblDescription.text = NSLocalizedString("Cool! You're very smart!", comment: "")
        }
    }
    
    func ChangeLanguage()
    {
        self.lblScore.text = NSLocalizedString("Result", comment: "")
        self.btnmenu.setTitle(NSLocalizedString("Menu", comment: ""), for: .normal)
    }
}
