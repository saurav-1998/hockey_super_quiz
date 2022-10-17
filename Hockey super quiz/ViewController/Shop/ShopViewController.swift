//
//  ShopViewController.swift
//  Hockey super quiz
//
//  Created by Bhavik Darji on 08/08/22.
//

import UIKit

class ShopViewController: UIViewController {

    // MARK: - Refference outlet and variables
    @IBOutlet weak var lblAdd: UILabel!
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var lblShop: UILabel!
    @IBOutlet weak var btnRestore: UIButton!

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool)
    {
        self.General()
    }
}

// MARK: - IBAction's
extension ShopViewController
{
    @IBAction func btn_BackClick(_ sender: Any)
    {
        playSound()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_AdClick(_ sender: Any)
    {
        playSound()
        if Is_ShowAnswer
        {
            Constants.kUserDefaults.setValue(true, forKey: "Is_Add_Purchase")
            self.General()
        }
        else
        {
            self.view .makeToast(NSLocalizedString("Please play quiz atleast once.", comment: ""), duration: 1.5, position: CSToastPositionCenter)
        }
    }
    
    @IBAction func btn_InfoClick(_ sender: Any)
    {
        playSound()
        if Is_ShowAnswer
        {
            Constants.kUserDefaults.setValue(true, forKey: "Is_Info_Purchase")
            self.General()
        }
        else
        {
            self.view .makeToast(NSLocalizedString("Please play quiz atleast once.", comment: ""), duration: 1.5, position: CSToastPositionCenter)
        }
    }
    
    @IBAction func btn_RestoreClick(_ sender: Any)
    {
        playSound()
        self.General()
    }
}

// MARK: - Function's
extension ShopViewController
{
    func General()
    {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.btnRestore.setTitle(NSLocalizedString("Restore", comment: ""), for: .normal)

        self.lblShop.text = NSLocalizedString("Shop", comment: "")
        self.lblAdd.text! = NSLocalizedString("0.0", comment: "")
        self.lblInfo.text! = NSLocalizedString("0.0", comment: "")
        if Is_Add_Purchase
        {
            self.lblAdd.text! = NSLocalizedString("Bought", comment: "")
        }
        if Is_Info_Purchase
        {
            self.lblInfo.text! = NSLocalizedString("Bought", comment: "")
        }
    }
}
