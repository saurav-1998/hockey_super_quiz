//
//  QuizViewController.swift
//  Hockey super quiz
//
//  Created by Bhavik Darji on 08/08/22.
//

import UIKit

class QuizViewController: UIViewController {

    // MARK: - Refference outlet and variables
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblQuestionCount: UILabel!
    @IBOutlet weak var tablviewOpts: UITableView!
    @IBOutlet weak var tablviewOptsHeight: NSLayoutConstraint!
    var ArrayQueAns = [Any]()
    var result = 0
    var quesCount = 0

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.General()
    }
}

// MARK: - Function's
extension QuizViewController
{
    func General()
    {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.ArrayQueAns = ArrayQuestionsAnswers
        self.ArrayQueAns.shuffle()
        self.tablviewOpts.rowHeight = 100
        self.tablviewOpts.estimatedRowHeight = 100
    }
}


//MARK:- Tableview Method
extension QuizViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let DictQue = ArrayQueAns[quesCount] as! [String:Any]
        let arrOpts = DictQue["Opts"] as! [String]
        return arrOpts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tablviewOpts.dequeueReusableCell(withIdentifier: "AnsCell", for: indexPath) as!
        AnsCell
        let DictQue = ArrayQueAns[quesCount] as! [String:Any]
        let arrOpts = DictQue["Opts"] as! [String]
        self.tablviewOpts.isUserInteractionEnabled = true
        cell.lblAns.text = NSLocalizedString(arrOpts[indexPath.row], comment: "")
        cell.viewBg.backgroundColor = UIColor(red: 227/255, green: 232/255, blue: 238/255, alpha: 1)
        cell.lblAns.textColor = UIColor(red: 47/255, green: 58/255, blue: 80/255, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0)
        {
            self.tablviewOptsHeight.constant = self.tablviewOpts.contentSize.height
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = tablviewOpts.cellForRow(at: indexPath) as! AnsCell
        cell.viewBg.backgroundColor = UIColor(red: 94/255, green: 218/255, blue: 74/255, alpha: 1)
        cell.lblAns.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        let DictQue = ArrayQueAns[quesCount] as! [String:Any]
        let ans = "\(DictQue["Ans"] ?? "")"
        if (indexPath.row) == Int(ans) ?? 0
        {
            self.result += 1
        }
        
        self.tablviewOpts.isUserInteractionEnabled = false

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0)
        {
            self.quesCount += 1
            if self.quesCount >= self.ArrayQueAns.count
            {
                let nextvc = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
                nextvc.score = self.result
                self.navigationController?.pushViewController(nextvc, animated: true)
                return
            }
            self.lblQuestionCount.text = "\(self.quesCount + 1)/18"
            self.lblQuestion.text = NSLocalizedString("\(DictQue["Que"] ?? "")", comment: "")
            self.tablviewOpts.reloadData()
        }
    }
}

//MARK:- AnsCell

class AnsCell: UITableViewCell
{
    @IBOutlet var lblAns: UILabel!
    @IBOutlet var viewBg: UIView!
}
