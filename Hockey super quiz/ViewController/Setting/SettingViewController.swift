//
//  SettingViewController.swift
//  Hockey super quiz
//
//  Created by Bhavik Darji on 09/08/22.
//

import UIKit
import AVKit

class SettingViewController: UIViewController {

    // MARK: - Refference outlet and variables
    @IBOutlet weak var btnSoundon: UIButton!
    @IBOutlet weak var btnSoundoff: UIButton!
    @IBOutlet weak var lblSetting: UILabel!
    @IBOutlet weak var lblSound: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblScreenlight: UILabel!
    @IBOutlet weak var btnUk: UIButton!
    @IBOutlet weak var btnRussia: UIButton!

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        if Sound_Play{
            self.btn_SoundOnClick(self)
        }else{
            self.btn_SoundOffClick(self)
        }
    }
    
    // MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.ChangeLanguage()
    }

    func ChangeLanguage()
    {
        self.lblSetting.text = NSLocalizedString("Settings", comment: "")
        self.lblSound.text = NSLocalizedString("Sound", comment: "")
        self.lblLanguage.text = NSLocalizedString("Language", comment: "")
        self.lblScreenlight.text = NSLocalizedString("Screen light", comment: "")
    }
}


// MARK: - IBAction's
extension SettingViewController
{
    @IBAction func btn_BackClick(_ sender: Any)
    {
        playSound()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_SoundOnClick(_ sender: Any)
    {
        playSound()
        self.btnSoundon.backgroundColor = UIColor(red: 46/255, green: 57/255, blue: 79/255, alpha: 1)
        self.btnSoundoff.backgroundColor = UIColor(red: 227/255, green: 232/255, blue: 238/255, alpha: 1)
        self.btnSoundon.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.btnSoundoff.tintColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        Constants.kUserDefaults.setValue(true, forKey: "Sound_Play")
        Constants.kUserDefaults.synchronize()
    }
    
    @IBAction func btn_SoundOffClick(_ sender: Any)
    {
        playSound()
        self.btnSoundoff.backgroundColor = UIColor(red: 46/255, green: 57/255, blue: 79/255, alpha: 1)
        self.btnSoundon.backgroundColor = UIColor(red: 227/255, green: 232/255, blue: 238/255, alpha: 1)
        self.btnSoundoff.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.btnSoundon.tintColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        Constants.kUserDefaults.setValue(false, forKey: "Sound_Play")
        Constants.kUserDefaults.synchronize()
    }
    
    @IBAction func btn_UkClick(_ sender: Any)
    {
        self.btnUk.isEnabled = false
        self.btnRussia.isEnabled = true
        playSound()
        LanguageManager.shared.setLanguage(language: .en)
        LanguageManager.shared.defaultLanguage = .en
        self.view.layoutIfNeeded()
        Constants.kUserDefaults.set("en", forKey: "AppleLanguage")
        Constants.kUserDefaults.synchronize()
        self.ChangeLanguage()
    }
    
    @IBAction func btn_RussiaClick(_ sender: Any)
    {
        self.btnUk.isEnabled = true
        self.btnRussia.isEnabled = false
        playSound()
        LanguageManager.shared.setLanguage(language: .ru)
        LanguageManager.shared.defaultLanguage = .ru
        self.view.layoutIfNeeded()
        Constants.kUserDefaults.set("ru", forKey: "AppleLanguage")
        Constants.kUserDefaults.synchronize()
        self.ChangeLanguage()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider)
    {
        let currentValue = CGFloat(sender.value)
        UIScreen.main.brightness = CGFloat(currentValue)
    }
}
