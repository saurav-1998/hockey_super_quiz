//
//  MenuViewController.swift
//  Hockey super quiz
//
//  Created by Bhavik Darji on 08/08/22.
//

import UIKit
import AVFAudio
import AVKit
import AVFoundation

class MenuViewController: UIViewController {

    // MARK: - Refference outlet and variables
    @IBOutlet weak var imgviewLock: UIImageView!
    @IBOutlet weak var btnQuiz: UIButton!
    @IBOutlet weak var btnAnswers: UIButton!

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

extension MenuViewController
{
    @IBAction func btn_QuizClick(_ sender: Any)
    {
        playSound()
        let nextvc = self.storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as! QuizViewController
        self.navigationController?.pushViewController(nextvc, animated: true)
    }
    
    @IBAction func btn_AnswersClick(_ sender: Any)
    {
        playSound()
        if Is_ShowAnswer
        {
            let nextvc = self.storyboard?.instantiateViewController(withIdentifier: "AnswerViewController") as! AnswerViewController
            self.navigationController?.pushViewController(nextvc, animated: true)
        }
        else
        {
            self.view .makeToast(NSLocalizedString("Please play quiz atleast once.", comment: ""), duration: 1.5, position: CSToastPositionCenter)
        }
    }
    
    @IBAction func btn_ShopClick(_ sender: Any)
    {
        playSound()
        let nextvc = self.storyboard?.instantiateViewController(withIdentifier: "ShopViewController") as! ShopViewController
        self.navigationController?.pushViewController(nextvc, animated: true)
    }
    
    @IBAction func btn_SettingClick(_ sender: Any)
    {
        playSound()
        let nextvc = self.storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
        self.navigationController?.pushViewController(nextvc, animated: true)
    }
}

// MARK: - Function's

extension MenuViewController
{
    func General()
    {
        self.ChangeLanguage()
        if Is_ShowAnswer
        {
            self.imgviewLock.isHidden = true
            self.btnAnswers.alpha = 1.0
        }
    }
    
    func ChangeLanguage()
    {
        self.btnQuiz.setTitle(NSLocalizedString("Quiz", comment: ""), for: .normal)
        self.btnAnswers.setTitle(NSLocalizedString("Answers", comment: ""), for: .normal)
    }
}

