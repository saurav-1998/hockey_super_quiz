//
//  AnswerViewController.swift
//  Hockey super quiz
//
//  Created by Bhavik Darji on 09/08/22.
//

import UIKit

class AnswerViewController: UIViewController {

    // MARK: - Refference outlet and variables
    @IBOutlet weak var Tableview: UITableView!
    @IBOutlet weak var lblAnswer: UILabel!
    var Selected_Array = NSMutableArray()

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.lblAnswer.text = NSLocalizedString("Answers", comment: "")
    }
}

// MARK: - IBAction's
extension AnswerViewController
{
    @IBAction func btn_BackClick(_ sender: Any)
    {
        playSound()
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Tableview Delegate
extension AnswerViewController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return ArrayQuestionsAnswers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = Tableview.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath) as! AnswerCell
        let DictQue = ArrayQuestionsAnswers[indexPath.section] as! [String:Any]
        let arrOpts = DictQue["Opts"] as! [String]
        let ansIndex = "\(DictQue["Ans"] ?? "")"
        cell.lblAnswer.text = NSLocalizedString(arrOpts[Int(ansIndex) ?? 0], comment: "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if Selected_Array .contains("\(indexPath.section)")
        {
            return UITableView.automaticDimension
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerCell = Tableview.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderCell
        headerCell.imgviewArrow.transform = CGAffineTransform(rotationAngle: Selected_Array .contains("\(section)") ? CGFloat(Double.pi) : CGFloat(Double.pi*2))

        headerCell.tag = section
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(sectionHeaderWasTouched))
        headerCell.addGestureRecognizer(tapGestureRecognizer)

        let dummyViewHeight: CGFloat = 76
        let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: Tableview.bounds.size.width, height: dummyViewHeight))
        Tableview.tableHeaderView = dummyView
        Tableview.contentInset = UIEdgeInsets(top: -dummyViewHeight, left: 0, bottom: 0, right: 0)
        
        let DictQue = ArrayQuestionsAnswers[section]
        let que = NSLocalizedString("\((DictQue as AnyObject).object(forKey: "Que") ?? "")", comment: "")
        headerCell.lblQuestion.text = que
        headerCell.lblnumber.text = "\(section + 1)"
        return headerCell
    }

    @objc func sectionHeaderWasTouched(_ sender: UITapGestureRecognizer)
    {
        playSound()
        let headerView = sender.view as! HeaderCell
        let section = headerView.tag
        let sectionHeader = Int(section)
        self.Selected_Array .contains("\(sectionHeader)") ? self.Selected_Array .remove("\(sectionHeader)") : self.Selected_Array .add("\(sectionHeader)")
        self.Tableview.reloadData()
    }
}

// MARK: - HeaderCell

class HeaderCell: UITableViewCell
{
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblnumber: UILabel!
    @IBOutlet weak var imgviewArrow: UIImageView!
}

// MARK: - AnswerCell

class AnswerCell: UITableViewCell
{
    @IBOutlet weak var lblAnswer: UILabel!
}
