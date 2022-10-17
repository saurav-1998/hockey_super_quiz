//
//  SceneDelegate.swift
//  Hockey super quiz
//
//  Created by Bhavik Darji on 08/08/22.
//

import AVKit

struct Constants {
    
    static let kUserDefaults                    = UserDefaults.standard
    static let kSharedAppDelegate               = (UIApplication.shared.delegate as? AppDelegate)
    static let kDateToday                       = Date()
    static let APPNAME                          = "Hockey super quiz"
    static let DeviceType                       = "ios"
    static let screenSize: CGRect               = UIScreen.main.bounds
}

func playSound()
{
    if Sound_Play
    {
        var filePath: String?
        filePath = Bundle.main.path(forResource: "sound", ofType: "mp3")
        let fileURL = URL(fileURLWithPath: filePath!)
        var soundID:SystemSoundID = 0
        AudioServicesCreateSystemSoundID(fileURL as CFURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
}

public var Is_ShowAnswer: Bool
{
    if !NullCheck.isKeyPresentInUserDefaults(key: "Is_ShowAnswer")
    {
        return false
    }
    return UserDefaults.standard.object(forKey: "Is_ShowAnswer") as! Bool
}

public var Sound_Play: Bool
{
    if !NullCheck.isKeyPresentInUserDefaults(key: "Sound_Play")
    {
        return true
    }
    return UserDefaults.standard.object(forKey: "Sound_Play") as! Bool
}

public var Is_Add_Purchase: Bool
{
    if !NullCheck.isKeyPresentInUserDefaults(key: "Is_Add_Purchase")
    {
        return false
    }
    return UserDefaults.standard.object(forKey: "Is_Add_Purchase") as! Bool
}

public var Is_Info_Purchase: Bool
{
    if !NullCheck.isKeyPresentInUserDefaults(key: "Is_Info_Purchase")
    {
        return false
    }
    return UserDefaults.standard.object(forKey: "Is_Info_Purchase") as! Bool
}

public var AppleLanguage: String
{
    if !NullCheck.isKeyPresentInUserDefaults(key: "AppleLanguage")
    {
        return "en"
    }
    return UserDefaults.standard.object(forKey: "AppleLanguage") as! String
}

public class NullCheck
{
    class func checkNullNil(_ string: String) -> Bool {
        let str = string as? NSString
        if str == NSNull() || string.count == 0 || string == nil || (string == "(null)") || (string == "<null>") || "\(String(describing: str))".trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).count == 0 || (string == "0.000000")
        {
            return false
        }
        else
        {
            return true
        }
    }

    class func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }

    class func isValidEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}

public var ArrayQuestionsAnswers: [Any] //question array for (quiz and answer screen)
{
    var Array = [Any]()
    var Dict1: [String:Any]
    Dict1 = ["Que" : "What is dribbling?",
             "Ans": 0, //option array index start from 0
             "Opts": ["Short strokes with the stick on the puck","Kick on own goal","Kick on opponent's goal"]]
    
    var Dict2: [String:Any]
    Dict2 = ["Que" : "What is a dodge?",
             "Ans": 2,
             "Opts": ["A power play","Puck kick","Deceptive short move"]]

    var Dict3: [String:Any]
    Dict3 = ["Que" : "What does a hockey player wear to protect his hands?",
             "Ans": 1,
             "Opts": ["Rings","Gloves","Mittens"]]
    
    var Dict4: [String:Any]
    Dict4 = ["Que" : "Duration of the game in hockey?",
             "Ans": 2,
             "Opts": ["Round","Time","Period"]]
    
    var Dict5: [String:Any]
    Dict5 = ["Que" : "What is skate blade protection called?",
             "Ans": 0,
             "Opts": ["Sheaths","Shields","Tips"]]
    
    var Dict6: [String:Any]
    Dict6 = ["Que" : "Why do you need a washer?",
             "Ans": 2,
             "Opts": ["To kick it?","For beauty","To score goals with it"]]
    
    var Dict7: [String:Any]
    Dict7 = ["Que" : "A hockey match consists of...",
             "Ans": 1,
             "Opts": ["2 periods","3 periods","4 periods"]]
    
    var Dict8: [String:Any]
    Dict8 = ["Que" : "The net time duration of one period is:",
             "Ans": 0,
             "Opts": ["20 minutes","30 minutes","45 minutes"]]
    
    var Dict9: [String:Any]
    Dict9 = ["Que" : "What is a hockey player's clothing called?",
             "Ans": 1,
             "Opts": ["Equipment","Outfit","Overalls"]]
    
    var Dict10: [String:Any]
    Dict10 = ["Que" : "What is a penalty shot in hockey called?",
              "Ans": 1,
              "Opts": ["Gambit","Bullitt","Yulit"]]
    
    // Four question options
    var Dict11: [String:Any]
    Dict11 = ["Que" : "At which rink was the first hockey game played?",
              "Ans": 1,
              "Opts": ["\"Commonwealth Stadium\"","\"Victoria\"","\"Rogers Center\"","\"Percival Molson\""]]
    
    var Dict12: [String:Any]
    Dict12 = ["Que" : "Which country's team is the reigning world hockey champion?",
              "Ans": 1,
              "Opts": ["Russia","Finland","Japan","Canada"]]
    
    var Dict13: [String:Any]
    Dict13 = ["Que" : "In which city was the Amateur Hockey Association founded?",
              "Ans": 3,
              "Opts": ["Calgary","Toronto","Ottawa","Montreal"]]
    
    var Dict14: [String:Any]
    Dict14 = ["Que" : "Which hockey trophy is awarded annually to the winner of the National Hockey League playoffs?",
              "Ans": 3,
              "Opts": ["Continental Cup","Gagarin Cup","Stanley Cup","Golden helmet"]]
    
    var Dict15: [String:Any]
    Dict15 = ["Que" : "How many players from one team can be on the field at one time during a game?",
              "Ans": 3,
              "Opts": ["4","5","7","6"]]
    
    var Dict16: [String:Any]
    Dict16 = ["Que" : "When is a penalty shot awarded in ice hockey?",
              "Ans": 0,
              "Opts": ["All of the above","A player intentionally moved the goal to hinder an opponent","A penalized player entered the court to interfere with a goal","A player intentionally threw his stick at the puck to prevent a goal"]]
    
    var Dict17: [String:Any]
    Dict17 = ["Que" : "Which country is the birthplace of modern ice hockey?",
              "Ans": 2,
              "Opts": ["Brazil","Argentina","Canada","Croatia"]]
    
    var Dict18: [String:Any]
    Dict18 = ["Que" : "In what year was the shootout legalized?",
              "Ans": 3,
              "Opts": ["1928","1922","1940","1934"]]

    Array.append(Dict1)
    Array.append(Dict2)
    Array.append(Dict3)
    Array.append(Dict4)
    Array.append(Dict5)
    Array.append(Dict6)
    Array.append(Dict7)
    Array.append(Dict8)
    Array.append(Dict9)
    Array.append(Dict10)
    Array.append(Dict11)
    Array.append(Dict12)
    Array.append(Dict13)
    Array.append(Dict14)
    Array.append(Dict15)
    Array.append(Dict16)
    Array.append(Dict17)
    Array.append(Dict18)
    
    return Array
}
