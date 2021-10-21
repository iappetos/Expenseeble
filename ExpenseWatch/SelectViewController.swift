//
//  SelectViewController.swift
//  ExpenseWatch
//
//  Created by planB on 4/6/18.
//  Copyright © 2018 Ioannis. All rights reserved.
//

import UIKit
import MessageUI
import SwiftKeychainWrapper

class SelectViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate, MFMailComposeViewControllerDelegate, UITabBarDelegate {
   
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myIcons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? IconCollectionViewCell
        
        cell?.myIcon.image = myIconImages[indexPath.item]
        
        return cell!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        print(indexPath.item)
        if segmentForCategoryToChange.selectedSegmentIndex == 0{
            imageAselected.image = myIconImages[indexPath.row]
        } else if segmentForCategoryToChange.selectedSegmentIndex == 1 {
            imageBselected.image = myIconImages[indexPath.row]
        } else {
            imageCselected.image = myIconImages[indexPath.row]
        }
        
    }
    
    
    
    
    @IBAction func buttonToContact(_ sender: Any) {
    }
    
    @IBAction func buttonToUpgrade(_ sender: Any) {
    }
    
    @IBAction func buttonToRate(_ sender: Any) {
    }
    
    
    @IBOutlet weak var myTabBar: UITabBar!
    
    
    @IBOutlet weak var textFieldA: UITextField!
    @IBOutlet weak var textFieldB: UITextField!
    @IBOutlet weak var textFieldC: UITextField!
    
    
    
    
    
    
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var segmentForCategoryToChange: UISegmentedControl!
    @IBOutlet weak var buttonForLanguage: UIButton!
    
    
    
 
    
    
    @IBOutlet weak var selectCategoryTitle: UILabel!
    @IBOutlet weak var selectIcon: UILabel!
    
    var cat1: String = LocalizedString.category1.localized
    var cat2: String = LocalizedString.category2.localized
    var cat3: String = LocalizedString.category3.localized
    var cat4: String = LocalizedString.category4.localized
    var cat5: String = LocalizedString.category5.localized
    var cat6: String = LocalizedString.category6.localized
    var cat7: String = LocalizedString.category7.localized
    var cat8: String = LocalizedString.category8.localized
    var cat9: String = LocalizedString.category9.localized
    var cat10: String = LocalizedString.category10.localized
    var cat11: String = LocalizedString.category11.localized
    var cat12: String = LocalizedString.category12.localized
    var cat13: String = LocalizedString.category13.localized
    var cat14: String = LocalizedString.category14.localized
    
    
    
  
    let myLanguages = ["Ελληνικά", "English", "Espanol", "Francais", "Deutch", "Italiano","Pусский", "中文"]
    let appleLanguages = ["el", "en", "es", "fr", "de", "it", "ru","zh-Hans"]
   
    var myDatabase =
        [
        ["Survive","Me","Personal","Family","Home","Business","Good","Bad","Ugly","Grow","Glow","Entertainment","Education"],
        ["Survive","Me","Personal","Family","Home","Business","Good","Bad","Ugly","Grow","Glow","Entertainment","Education"],
        ["Survive","Me","Personal","Family","Home","Business","Good","Bad","Ugly","Grow","Glow","Entertainment","Education"]
        ]
    
    
    
    
    
    
    
    
    var paidVersionIsOn: Bool = false
   
    var selectedLanguage: String?
    var selectedLang: String?
    
   // UserDefaults.standard.value(forKey: "AppleLanguages")//: String?
    

    
    
    var selectedCategoryForA: String?
    var selectedCategoryForB: String?
    var selectedCategoryForC: String?
    
    
    
    @IBOutlet weak var imageAselected: UIImageView!
    @IBOutlet weak var imageBselected: UIImageView!
    @IBOutlet weak var imageCselected: UIImageView!
    
    
   
    
    
    
    /*
    let myIcons = ["Personal",
                   "Home",
                   "Business",
                   "small-diamond",
                   "backpacker-hiking",
                   "balloon", "openbook",
                   "car",
                   "charger",
                   "cog",
                   "coin",
                   "fashion",
                   "house",
                   "notebook",
                   "tie",
                   "tools",
                   "washing-machine"]*/
    
    let myIcons = [ImagesOfCategories.icon1,
                   ImagesOfCategories.icon2,
                   ImagesOfCategories.icon3,
                   ImagesOfCategories.icon4,
                   ImagesOfCategories.icon5,
                   ImagesOfCategories.icon6,
                   ImagesOfCategories.icon7,
                   ImagesOfCategories.icon8,
                   ImagesOfCategories.icon9,
                   ImagesOfCategories.icon10,
                   ImagesOfCategories.icon11,
                   ImagesOfCategories.icon12,
                   ImagesOfCategories.icon13,
                   ImagesOfCategories.icon14,
                   ImagesOfCategories.icon15,
                   ImagesOfCategories.icon16,
                   ImagesOfCategories.icon17,
                   ImagesOfCategories.icon18,
                   ImagesOfCategories.icon19,
                   ImagesOfCategories.icon20,
                   ImagesOfCategories.icon21,
                   ImagesOfCategories.icon22,
                   ImagesOfCategories.icon23,
                   ImagesOfCategories.icon24,
                   ImagesOfCategories.icon25,
                   ImagesOfCategories.icon26,
                   ImagesOfCategories.icon27,
                   ImagesOfCategories.icon28,
                   ImagesOfCategories.icon29,
                   ImagesOfCategories.icon30,
                   ImagesOfCategories.icon31,
                   ImagesOfCategories.icon32,
                   ImagesOfCategories.icon33,
                   ImagesOfCategories.icon34,
                   ImagesOfCategories.icon35,
                   ImagesOfCategories.icon36,
                   ImagesOfCategories.icon37,
                   ImagesOfCategories.icon38,
                   ImagesOfCategories.icon39,
                   ImagesOfCategories.icon40,
                   ImagesOfCategories.icon41,
                   ImagesOfCategories.icon42,
                   ImagesOfCategories.icon43,
                   ImagesOfCategories.icon44,
                   ImagesOfCategories.icon45,
                   ImagesOfCategories.icon46,
                   ImagesOfCategories.icon47,
                   ImagesOfCategories.icon48,
                   ImagesOfCategories.icon49,
                   ImagesOfCategories.icon50,
                   ImagesOfCategories.icon51,
                   ImagesOfCategories.icon52,
                   ImagesOfCategories.icon53,
                   ImagesOfCategories.icon54,
                   ImagesOfCategories.icon55,
                   ImagesOfCategories.icon56,
                   ImagesOfCategories.icon57,
                   ImagesOfCategories.icon58,
                   ImagesOfCategories.icon59,
                   ImagesOfCategories.icon60,
                   ImagesOfCategories.icon61,
                   ImagesOfCategories.icon62] as [Any]
    
    
    
   /*
    let myIconImages: [UIImage] = [
    
        UIImage(named: "Personal")!,
        UIImage(named: "Home")!,
        UIImage(named: "Business")!,
        UIImage(named: "small-diamond")!,
        UIImage(named: "backpacker-hiking")!,
        UIImage(named: "balloon")!,
        UIImage(named: "openbook")!,
        UIImage(named: "car")!,
        UIImage(named: "charger")!,
        UIImage(named: "cog")!,
        UIImage(named: "coin")!,
        UIImage(named: "fashion")!,
        UIImage(named: "house")!,
        UIImage(named: "notebook")!,
        UIImage(named: "tie")!,
        UIImage(named: "tools")!,
        UIImage(named: "washing-machine")!
        
    ]
    */
    let myIconImages: [UIImage] = [
        
        UIImage(named: ImagesOfCategories.icon1.rawValue)!,
        UIImage(named: ImagesOfCategories.icon2.rawValue)!,
        UIImage(named: ImagesOfCategories.icon3.rawValue)!,
        UIImage(named: ImagesOfCategories.icon4.rawValue)!,
        UIImage(named: ImagesOfCategories.icon5.rawValue)!,
        UIImage(named: ImagesOfCategories.icon6.rawValue)!,
        UIImage(named: ImagesOfCategories.icon7.rawValue)!,
        UIImage(named: ImagesOfCategories.icon8.rawValue)!,
        UIImage(named: ImagesOfCategories.icon9.rawValue)!,
        UIImage(named: ImagesOfCategories.icon10.rawValue)!,
        UIImage(named: ImagesOfCategories.icon11.rawValue)!,
        UIImage(named: ImagesOfCategories.icon12.rawValue)!,
        UIImage(named: ImagesOfCategories.icon13.rawValue)!,
        UIImage(named: ImagesOfCategories.icon14.rawValue)!,
        UIImage(named: ImagesOfCategories.icon15.rawValue)!,
        UIImage(named: ImagesOfCategories.icon16.rawValue)!,
        UIImage(named: ImagesOfCategories.icon17.rawValue)!,
        UIImage(named: ImagesOfCategories.icon18.rawValue)!,
        UIImage(named: ImagesOfCategories.icon19.rawValue)!,
        UIImage(named: ImagesOfCategories.icon20.rawValue)!,
        UIImage(named: ImagesOfCategories.icon21.rawValue)!,
        UIImage(named: ImagesOfCategories.icon22.rawValue)!,
        UIImage(named: ImagesOfCategories.icon23.rawValue)!,
        UIImage(named: ImagesOfCategories.icon24.rawValue)!,
        UIImage(named: ImagesOfCategories.icon25.rawValue)!,
        UIImage(named: ImagesOfCategories.icon26.rawValue)!,
        UIImage(named: ImagesOfCategories.icon27.rawValue)!,
        UIImage(named: ImagesOfCategories.icon28.rawValue)!,
        UIImage(named: ImagesOfCategories.icon29.rawValue)!,
        UIImage(named: ImagesOfCategories.icon30.rawValue)!,
        UIImage(named: ImagesOfCategories.icon31.rawValue)!,
        UIImage(named: ImagesOfCategories.icon32.rawValue)!,
        UIImage(named: ImagesOfCategories.icon33.rawValue)!,
        UIImage(named: ImagesOfCategories.icon34.rawValue)!,
        UIImage(named: ImagesOfCategories.icon35.rawValue)!,
        UIImage(named: ImagesOfCategories.icon36.rawValue)!,
        UIImage(named: ImagesOfCategories.icon37.rawValue)!,
        UIImage(named: ImagesOfCategories.icon38.rawValue)!,
        UIImage(named: ImagesOfCategories.icon39.rawValue)!,
        UIImage(named: ImagesOfCategories.icon40.rawValue)!,
        UIImage(named: ImagesOfCategories.icon41.rawValue)!,
        UIImage(named: ImagesOfCategories.icon42.rawValue)!,
        UIImage(named: ImagesOfCategories.icon43.rawValue)!,
        UIImage(named: ImagesOfCategories.icon44.rawValue)!,
        UIImage(named: ImagesOfCategories.icon45.rawValue)!,
        UIImage(named: ImagesOfCategories.icon46.rawValue)!,
        UIImage(named: ImagesOfCategories.icon47.rawValue)!,
        UIImage(named: ImagesOfCategories.icon48.rawValue)!,
        UIImage(named: ImagesOfCategories.icon49.rawValue)!,
        UIImage(named: ImagesOfCategories.icon50.rawValue)!,
        UIImage(named: ImagesOfCategories.icon51.rawValue)!,
        UIImage(named: ImagesOfCategories.icon52.rawValue)!,
        UIImage(named: ImagesOfCategories.icon53.rawValue)!,
        UIImage(named: ImagesOfCategories.icon54.rawValue)!,
        UIImage(named: ImagesOfCategories.icon55.rawValue)!,
        UIImage(named: ImagesOfCategories.icon56.rawValue)!,
        UIImage(named: ImagesOfCategories.icon57.rawValue)!,
        UIImage(named: ImagesOfCategories.icon58.rawValue)!,
        UIImage(named: ImagesOfCategories.icon59.rawValue)!,
        UIImage(named: ImagesOfCategories.icon60.rawValue)!,
        UIImage(named: ImagesOfCategories.icon61.rawValue)!,
        UIImage(named: ImagesOfCategories.icon62.rawValue)!]
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: - Action Starts
    
    
    
    @IBAction func visitIcons8(_ sender: Any) {
        if let url = NSURL(string:"https://icons8.com") {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    
    
    
    let myModel = UIDevice.current.modelName
    
    
    func positionContentInSegmentForEveryDifferentScreen(){
        let widthOfIOSDevice = UIScreen.main.bounds.size.width
        let heightOfIOSDevice = UIScreen.main.bounds.size.height
        let lengthOfSegmentControl = Int(widthOfIOSDevice - 30)
       
        //iPhone
        if widthOfIOSDevice == 375 && heightOfIOSDevice == 812 {
            print("iPhone 11 Pro, iPhone XS, iPhone X & iPhone 12 mini")
            positionImagesAndTextsInSegment(length: lengthOfSegmentControl, yImage: 81, yText: 140)
        } else if widthOfIOSDevice == 414 && heightOfIOSDevice == 736 {
            print("iPhone 8 Plus & iPhone 7 Plus")
            positionImagesAndTextsInSegment(length: lengthOfSegmentControl, yImage: 81, yText: 140)
        } else if widthOfIOSDevice == 414 && heightOfIOSDevice == 896 {
            print("iPhone 11 Pro Max, iPhone XS Max &&@2x iPhone 11, iPhone XR")
            positionImagesAndTextsInSegment(length: lengthOfSegmentControl, yImage: 81, yText: 140)
        } else if widthOfIOSDevice == 375 && heightOfIOSDevice == 667 {
            print("iPhone 8, 6s Plus, 6 Plus, 7, 6s, 6, iPhone SE 2nd 14.4")
            positionImagesAndTextsInSegment(length: lengthOfSegmentControl, yImage: 81, yText: 140)
        } else if widthOfIOSDevice == 320 && heightOfIOSDevice == 568 {
            print("iPOD 7th- iPhone SE")
            positionImagesAndTextsInSegment(length: lengthOfSegmentControl, yImage: 81, yText: 140)
        } else if widthOfIOSDevice == 390 && heightOfIOSDevice == 844 {
            print("iPhone 12, 12 Pro")
            positionImagesAndTextsInSegment(length: lengthOfSegmentControl, yImage: 81, yText: 140)
        } else if widthOfIOSDevice == 428 && heightOfIOSDevice == 926 {
            print("iPhone 12 Pro Max")
            positionImagesAndTextsInSegment(length: lengthOfSegmentControl, yImage: 81, yText: 140)
        //iPad
        } else if widthOfIOSDevice == 1024 && heightOfIOSDevice == 1366 {
           print("iPad Pro 12.9-inch 1st && (2nd generation)")
           positionImagesAndTextsInSegment(length: lengthOfSegmentControl - 310, yImage: 81, yText: 140)
        } else if widthOfIOSDevice == 834 && heightOfIOSDevice == 1112 {
            print("iPad Pro 10.5-inch")
            positionImagesAndTextsInSegment(length: lengthOfSegmentControl - 310, yImage: 81, yText: 140)
        } else if widthOfIOSDevice == 768 && heightOfIOSDevice == 1024 {
            print("iPad Pro 9.7-inch & iPad Air 2 & i Pad Mini 4")
            positionImagesAndTextsInSegment(length: lengthOfSegmentControl - 70, yImage: 81, yText: 140)
        } else if widthOfIOSDevice == 834 && heightOfIOSDevice == 1194 {
            print("iPad Pro 4th 11-inch")
            positionImagesAndTextsInSegment(length: lengthOfSegmentControl - 130, yImage: 81, yText: 140)
        } else if widthOfIOSDevice == 810 && heightOfIOSDevice == 1080 {
            print("iPad 8th")
            positionImagesAndTextsInSegment(length: lengthOfSegmentControl - 110, yImage: 81, yText: 140)
        } else  {
            print("what is this???? Probably iPadAir 4th")
            positionImagesAndTextsInSegment(length: lengthOfSegmentControl - 120, yImage: 81, yText: 140)
        }
        
        
        
        
        
    }//Specific
    
    
    func positionImagesAndTextsInSegment(length: Int, yImage:Int, yText:Int){
        let lengthOfOneSegment = length/3
        let halfSegment = lengthOfOneSegment/2
        
        imageAselected.frame = CGRect(x: 15 + halfSegment - 45/2, y:yImage, width: 45, height: 45)
        imageCselected.frame = CGRect(x: 15 + length - halfSegment - 45/2, y: yImage, width: 45, height: 45)
        
        textFieldA.frame = CGRect(x: 15 + halfSegment - 45, y: yText, width: 90, height: 30)
        textFieldC.frame = CGRect(x: 15 + length - halfSegment - 45, y: yText, width: 90, height: 30)
    }//end
    
    
    func setLanguageAccordingToButtonTitle(){
        print("I am tryng to change language")
         let previousLanguage = UserDefaults.standard.object(forKey: "AppleLanguages") as? String
        print("the lnaguage I use is \(String(describing: previousLanguage))")
        
         if self.selectedLanguage == "English" {
           
         UserDefaults.standard.set([self.appleLanguages[1]], forKey: "AppleLanguages")
        
            
            
         } else if self.selectedLanguage == "Ελληνικά" {
            
            
         UserDefaults.standard.set([self.appleLanguages[0]], forKey: "AppleLanguages")
         
           
         } else if self.selectedLanguage == "Francais" {
        
            UserDefaults.standard.set([self.appleLanguages[3]], forKey: "AppleLanguages")
            
            
            
         } else if self.selectedLanguage == "Espanol" {
            
            UserDefaults.standard.set([self.appleLanguages[2]], forKey: "AppleLanguages")
           
           
         }  else if self.selectedLanguage == "Deutch" {
            
            UserDefaults.standard.set([self.appleLanguages[4]], forKey: "AppleLanguages")
            
            
         } else if self.selectedLanguage == "Italiano" {
            
            UserDefaults.standard.set([self.appleLanguages[5]], forKey: "AppleLanguages")
            
            
        } else if self.selectedLanguage == "Pусский" {
            
            UserDefaults.standard.set([self.appleLanguages[6]], forKey: "AppleLanguages")
        
        } else if self.selectedLanguage == "中文" {
            
            UserDefaults.standard.set([self.appleLanguages[7]], forKey: "AppleLanguages")
        }
        
        
        
        let loadedLanguage = UserDefaults.standard.object(forKey: "AppleLanguages") as? String
        print("the lnaguage after I use is \(String(describing: loadedLanguage))")
    }
    
    
    
    func languageChanged(strLan:String){
        //self.selectCategoryTitle.text = "1key".localizableString(local: strLan)
        self.navigationItem.backBarButtonItem?.title = LocalizedString.cancelSelections.localized
        
    }
    
    /*
    func changeLanguageAccordingly(languageSrtingOfApple:String) -> String {
        let path = Bundle.main.path(forResource: languageSrtingOfApple, ofType: "lproj")
        let bundle = Bundle(path: path!)
        let translatedString = bundle?.localizedString(forKey: "key", value: nil, table: nil)
        return translatedString!
        
        /*
         var language = "en"
         let path = Bundle.main.path(forResource: language, ofType: "lproj")
         let bundle = Bundle(path: path!)
         let string = bundle?.localizedString(forKey: "key", value: nil, table: nil)
 */
        
        
        
    }*/
    
    
    
    
    func setButtonTitleWithLoadedLanguage(){
        
        //create a tulpe Array with [(el, Ελληνικά), (eν, English), (fr, Fransaise),...]
        let arrayTuppleLanguage = Array(zip(appleLanguages, myLanguages))
        
        //get the loaded language, the one your app is currently using
        
        
        
        // UserDefaults.standard.set("el", forKey: "AppleLanguages")
        
        
        
       // UserDefaults.standard.synchronize()
        //let loadedLanguage  = NSLocale.preferredLanguages[0]
        //let loadedLanguage = UserDefaults.standard.string(forKey: "i18n_language")
        
         //let loadedLanguage = UserDefaults.standard.string(forKey: "AppleLanguages") ?? "en"
        
        let loadedLanguage = Bundle.main.preferredLocalizations.first
        
        let languageInUse = UserDefaults.standard.object(forKey: "AppleLanguages") as? String
        
       
        print("the  string prefered loaded lnaguage i18n is \(String(describing: loadedLanguage))")
        print("the lnaguage I use is \(String(describing: languageInUse))")
        
        //find the match of loadedLanguages 2letters "el" with the readable title myLanguages
        for language in arrayTuppleLanguage  {
            if loadedLanguage == language.0 {
                self.selectedLanguage = language.1
            }
        }
        
        print("the selected language is \(String(describing:  self.selectedLanguage))")
        //...and put that readable item on the button title
        
        self.buttonForLanguage.setTitle(self.selectedLanguage, for: .normal)
       //self.buttonForLanguage.setTitle("Ελληνικά", for: .normal)
        
        //let loadedLanguage = UserDefaults.standard.value(forKey: "AppleLanguages")
        
    }
    
    
    func getTheAppleLangOfChosenLanguage(){
        
        //create a tulpe Array with [(el, Ελληνικά), (eν, English), (fr, Fransaise),...]
        let arrayTuppleLanguage = Array(zip(appleLanguages, myLanguages))
        
        
        //get the language chosen from button
        let chosenLanguageInButton = self.buttonForLanguage.titleLabel?.text
      
        
        //find the match of loadedLanguages 2letters "el" with the readable title myLanguages
        for language in arrayTuppleLanguage  {
            if chosenLanguageInButton == language.1 {
                self.selectedLang = language.0
            }
        }
        
        print("the lang selected is \(String(describing:  self.selectedLang))")
       
        
    }
    
    
    
    
    
    func getStringsAndLocalizeThem(){
        self.navigationItem.title = LocalizedString.selectTitle.localized
        self.navigationItem.backBarButtonItem?.title = LocalizedString.cancelSelections.localized
        self.navigationItem.rightBarButtonItem?.title = LocalizedString.saveSelections.localized
        self.navigationItem.leftBarButtonItem?.title = LocalizedString.cancelSelections.localized
        self.selectCategoryTitle.text = LocalizedString.selectCategoryTitle.localized
        self.selectIcon.text = "  " + LocalizedString.selectIcon.localized
        self.myTabBar.items?[0].title = LocalizedString.contactUs.localized
        self.myTabBar.items?[1].title = LocalizedString.upgrade.localized
        self.myTabBar.items?[2].title = LocalizedString.rateThisApp.localized
      
        let myDatabaseLocalized =
            [
                [cat1, cat2, cat3, cat4, cat5, cat6, cat7, cat8, cat9, cat10, cat11, cat12, cat13, cat14],
                [cat1, cat2, cat3, cat4, cat5, cat6, cat7, cat8, cat9, cat10, cat11, cat12, cat13, cat14],
                [cat1, cat2, cat3, cat4, cat5, cat6, cat7, cat8, cat9, cat10, cat11, cat12, cat13, cat14]
        ]
        
        
        self.myDatabase = myDatabaseLocalized
        
    }//Func
    
    
    
    
    
    
    
    func loadFreeOrPaid(){
        let isPaid = KeychainWrapper.standard.bool(forKey: myProductList.appPro) ?? false
        if isPaid {
                   self.paidVersionIsOn = true
               }
    }//Func
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadFreeOrPaid()
        
        
        self.navigationItem.rightBarButtonItem?.title = LocalizedString.saveSelections.localized
        self.navigationItem.leftBarButtonItem?.title = LocalizedString.cancelSelections.localized
        self.navigationItem.title = LocalizedString.selectTitle.localized
        
        getStringsAndLocalizeThem()
        self.myTabBar.delegate = self
        
        
        myPickerView.delegate = self
        myPickerView.dataSource = self
        
        
        
        //for the vary first loading
        self.imageAselected.image = UIImage(named: ImagesOfCategories.icon4.rawValue)
        self.imageBselected.image = UIImage(named: ImagesOfCategories.icon2.rawValue)
        self.imageCselected.image = UIImage(named: ImagesOfCategories.icon25.rawValue)
        
        myPickerView.selectRow(0, inComponent: 0, animated: true)
        myPickerView.selectRow(3, inComponent: 1, animated: true)
        myPickerView.selectRow(10, inComponent: 2, animated: true)
        
        
       
        
        //here is the problem
        setButtonTitleWithLoadedLanguage()
      
        positionContentInSegmentForEveryDifferentScreen()
       
        
        
        
        
        
        
        //userDefautls----------
        if let categoryA = UserDefaults.standard.value(forKey: "categoryA") as? String {
            textFieldA.text = categoryA
        }
        
        if let categoryB = UserDefaults.standard.value(forKey: "categoryB") as? String {
            textFieldB.text = categoryB
        }
        
        if let categoryC = UserDefaults.standard.value(forKey: "categoryC") as? String {
            textFieldC.text = categoryC
        }
        
        //userDefautls---------------BUTTONS-----------------------------
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
            
            let picture = UIImage(data: imageData as Data)
            imageAselected.image = picture
           
        }
        
        if let imageBData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
            
            let pictureB = UIImage(data: imageBData as Data)
           imageBselected.image = pictureB
        }
        
        if let imageCData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
            
            let pictureC = UIImage(data: imageCData as Data)
            imageCselected.image = pictureC
        }
    
    
        //for keyboard hiding==============
        self.textFieldA.delegate = self
        self.textFieldB.delegate = self
        self.textFieldC.delegate = self
        //=================================
        
      
     
        // Do any additional setup after loading the view.
    }
    
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        //in order tabBarIcons to be located correctly
        myTabBar.invalidateIntrinsicContentSize()
    }
    
    
    
    
    
    
    
    
    
    
    //hiding the keyboard=========================================================
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        textFieldA.resignFirstResponder()
        textFieldB.resignFirstResponder()
        textFieldC.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    
   
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range:NSRange,
                   replacementString string: String) -> Bool {
        return textField.text!.count < 14 || string == ""
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    //DatePickerProtocol----------------------------------------
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return myDatabase.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myDatabase[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myDatabase[component][row]
    }
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        print (component)
        print (row)
        
        switch (component) {
        case 0:
            selectedCategoryForA = myDatabase[component][row]
            textFieldA.text = selectedCategoryForA
                  print("You have selected for A the \(String(describing: selectedCategoryForA))")
          
            
           // UserDefaults.standard.set(textFieldA.text!, forKey: "categoryA" )
            
            
        case 1:
            selectedCategoryForB = myDatabase[component][row]
            textFieldB.text = selectedCategoryForB
            print("You have selected for B the \(String(describing: selectedCategoryForB))")
            
           // UserDefaults.standard.set(textFieldB.text!, forKey: "categoryB" )
            
            
        case 2:
            selectedCategoryForC = myDatabase[component][row]
            textFieldC.text = selectedCategoryForC
            print("You have selected for C the \(String(describing: selectedCategoryForC))")
            
           // UserDefaults.standard.set(textFieldC.text!, forKey: "categoryC" )
            
        default:
            break
        }
        
        
        
    }
    
    
    /*
    override func viewWillAppear(_ animated: Bool) {
         super.viewDidLoad()
        myTabBar.invalidateIntrinsicContentSize()
        myTabBar.superview?.setNeedsLayout()
        myTabBar.superview?.layoutSubviews()
    }
   */
    
 
    
    
  
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation

    
    @IBAction func cancelAndCloseSettings(_ sender: Any) {
    self.performSegue(withIdentifier: "unwindToStart", sender: self)
    }
    
   

    
    
    

    @IBAction func saveNewSettings(_ sender: Any) {
        
        
         UserDefaults.standard.set(textFieldA.text!, forKey: "categoryA" )
         UserDefaults.standard.set(textFieldB.text!, forKey: "categoryB" )
         UserDefaults.standard.set(textFieldC.text!, forKey: "categoryC" )
        
        
        let imageData = imageAselected.image!.pngData()
        UserDefaults.standard.set(imageData, forKey: "iconSelectedForA")
        
        let imageBData = imageBselected.image!.pngData()
        UserDefaults.standard.set(imageBData, forKey: "iconSelectedForB")
        
        let imageCData = imageCselected.image!.pngData()
        UserDefaults.standard.set(imageCData, forKey: "iconSelectedForC")
        
        
        
        
        
        /*
        UserDefaults.standard.set(imageAselected.image, forKey: "imageA")
        UserDefaults.standard.set(imageAselected.image, forKey: "imageB")
        UserDefaults.standard.set(imageAselected.image, forKey: "imageC")
        */
        self.performSegue(withIdentifier: "unwindToStart", sender: self)
        
    }
    
    
    
    
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0 {
            
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["info@iappetos.com"])
                mail.setSubject("Comments on Expenseeble")
                mail.setMessageBody("<p>Test</p>", isHTML: true)
                present(mail, animated: true)
            } else {
                print("Mail services are not available")
            }
            
        } else if item.tag == 1 {
            
            if paidVersionIsOn {
                showAlertOfAlreadyPaid()
            } else {
                showKiosk()
            }
            
           
            
            
        } else {
            if let url = NSURL(string:"itms-apps://itunes.apple.com/app/idYOUR_APP_ID") {
                UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
            }
        }
    }//Func
    
    
    func showKiosk(){
            let myKiosk = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpCounter") as! KioskViewController
        //Hey "myKiosk"(Boss) you have a variable called "extrasDelegate"which is your "intern" and I(self) want to be your "Intern"(legatos)
        
        //PROTOCOLS---------------------------------
       // myKiosk.extrasDelegate = self
       // myKiosk.unlimitedDelegate = self
        
            self.addChild(myKiosk)
            myKiosk.view.frame = self.view.frame
            self.view.addSubview(myKiosk.view)
            myKiosk.didMove(toParent: self)
    }
    
    
    func showAlertOfAlreadyPaid() {
        let alreadyPaidAlert = UIAlertController(title: "iappetos",
                                              message: LocalizedString.iappetosThanks.localized,
                                              preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                     style: UIAlertAction.Style.default,
                                     handler: nil)
        
        alreadyPaidAlert.addAction(okAction)
        
        self.present(alreadyPaidAlert, animated:true, completion: nil)
        
    }
    
    
    
    
    
    
    
    func showAlertOfPro() {
        
        var advantagesOfUpgrade = [String]()
            advantagesOfUpgrade.append(LocalizedString.upgradeAdvantage0.localized)
            advantagesOfUpgrade.append("")
            advantagesOfUpgrade.append(LocalizedString.upgradeAdvantage1.localized)
             advantagesOfUpgrade.append("")
            advantagesOfUpgrade.append(LocalizedString.upgradeAdvantage2.localized)
            advantagesOfUpgrade.append("")
            advantagesOfUpgrade.append(LocalizedString.costOfUpgrading.localized)
       
        let upgradeAlert = UIAlertController(title: LocalizedString.upgradeAlert.localized,
                                                 message: advantagesOfUpgrade.joined(separator: "\n"),
                                                 preferredStyle: UIAlertController.Style.alert)
        
        let noThanksAction = UIAlertAction(title: LocalizedString.noThanksAction.localized,
                                           style: UIAlertAction.Style.default,
                                     handler: nil)
        
        let upgradeAction = UIAlertAction(title: LocalizedString.upgradeAction.localized,
                                          style: UIAlertAction.Style.default,
                                     handler: {(action) -> Void in
                                        //action here
                                        if let url = NSURL(string:"itms-apps://itunes.apple.com/app/idYOUR_APP_ID") {
                                            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                                        }
                                        //action here
        })
        
        
        
        upgradeAlert.addAction(upgradeAction)
        upgradeAlert.addAction(noThanksAction)
        
        self.present(upgradeAlert, animated:true, completion: nil)
    }
    
    
    
    
    
    
    
    /*
    @IBAction func sendUsEMail(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["ikaragogos@gmail.com"])
            mail.setSubject("Comments about ABCost App")
            mail.setMessageBody("<p>Test</p>", isHTML: true)
            present(mail, animated: true)
        } else {
            print("Mail services are not available")
        }
    }
    
    */
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    
    /*
    
    @IBAction func rateThisApp(_ sender: Any) {
        if let url = NSURL(string:"itms-apps://itunes.apple.com/app/idYOUR_APP_ID") {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    
    */
    
    
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "languageSelection" {
            
            let aNiceDestination = segue.destination as! LanguageViewController
            
            aNiceDestination.pickedLanguage = buttonForLanguage.titleLabel?.text
            
        } else {
            let homeDestination = segue.destination as! ViewController
            
            getTheAppleLangOfChosenLanguage()
            homeDestination.languageUsedComingBackFromSettings = self.selectedLang
        }
        
       
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
 @IBAction func unwindToSettings(segue: UIStoryboardSegue) {
   
    self.buttonForLanguage.setTitle(self.selectedLanguage, for: .normal)
    setLanguageAccordingToButtonTitle()
   
    
    }
    
    
    
    
    
    
    
    
//The FINAL PARENTHESIS
}




extension String {
    func localizableString(local:String) -> String {
        let path = Bundle.main.path(forResource: local, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle:bundle!, value: "",   comment: "")
    }
}



enum ImagesOfCategories: String {
   // case icon1 = "about"
    case icon1 = "icons8-basket-100"
    case icon2 = "icons8-books-emoji-100"
    case icon3 = "icons8-basketball-100"
    case icon4 = "icons8-fork-and-knife-with-plate-100"
    case icon5 = "icons8-beach-with-umbrella-100"
    case icon6 = "icons8-anchor-100"
    case icon7 = "icons8-automobile-100"
    case icon8 = "icons8-droplet-100"
    case icon9 = "icons8-compass-100"
    case icon10 = "icons8-bicycle-100"
    case icon11 = "icons8-check-box-with-check-100"
    case icon12 = "icons8-medical-symbol-100"
    case icon13 = "icons8-money-bag-100"
    case icon14 = "icons8-orange-square-100"
    case icon15 = "icons8-trumpet-100"
    case icon16 = "icons8-necktie-100"
    case icon17 = "icons8-oil-drum-100"
    case icon18 = "icons8-cigarette-100"
    case icon19 = "icons8-clincking-glasses-100"
    case icon20 = "icons8-clinking-beer-mugs-100"
    case icon21 = "icons8-coat-100"
    case icon22 = "icons8-cross-mark-100"
    case icon23 = "icons8-fire-100"
    case icon24 = "icons8-fuel-pump-100"
    case icon25 = "icons8-gem-stone-100"
    case icon26 = "icons8-green-apple-100"
    case icon27 = "icons8-hole-100"
    case icon28 = "icons8-hot-beverage-100"
    case icon29 = "icons8-hotel-100"
    case icon30 = "icons8-house-100"
    case icon31 = "icons8-lipstick-100"
    case icon32 = "icons8-motorcycle-100"
    case icon33 = "icons8-open-book-emoji-100"
    case icon34 = "icons8-orange-circle-100"
    case icon35 = "icons8-parachute-100"
    case icon36 = "icons8-pile-of-poo-100"
    case icon37 = "icons8-purse-100"
    case icon38 = "icons8-question-mark-100"
    case icon39 = "icons8-red-circle-100"
    case icon40 = "icons8-red-triangle-pointed-up-100"
    case icon41 = "icons8-shopping-cart-100"
    case icon42 = "icons8-sos-button-100"
    case icon43 = "icons8-stethoscope-100"
    case icon44 = "icons8-wastebasket-100"
    case icon45 = "icons8-wrench-100"
    case icon46 = "icons8-blue-circle-100"
    case icon47 = "icons8-blue-square-100"
    case icon48 = "icons8-bell-100"
    case icon49 = "icons8-hollow-red-circle-100"
    case icon50 = "icons8-cherries-100"
    case icon51 = "icons8-red-apple-100"
    case icon52 = "icons8-glass-of-milk-100"
    case icon53 = "icons8-wine-glass-100"
    case icon54 = "icons8-womans-hat-100"
    case icon55 = "icons8-fleur-de-lis-100"
    case icon56 = "icons8-amphora-100"
    case icon57 = "icons8-baguette-bread-100"
    case icon58 = "icons8-bottle-with-popping-cork-100"
    case icon59 = "icons8-carrot-100"
    case icon60 = "icons8-chocolate-bar-emoji-100"
    case icon61 = "icons8-chopsticks-100"
    case icon62 = "icons8-hamburger-100"
    
    
    
    
    
}





//CollectionView------------------------------------
/*
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 return myIcons.count
 }
 
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? IconCollectionViewCell
 
 cell?.myIcon.image = myIcons[indexPath.item]
 
 
 }
 
 
 func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
 print(indexPath.item)
 }
 */












/*
 selectedCategoryForA = categoriesOfExpenses[0][row]
 selectedCategoryForB = categoriesOfExpenses[row]
 // selectedCategoryForC = categoriesOfExpenses[row]
 
 if segmentForCategoryToChange.selectedSegmentIndex == 0 {
 textFieldA.text = selectedCategoryForA
 } else if segmentForCategoryToChange.selectedSegmentIndex == 1 {
 textFieldB.text = selectedCategoryForA
 } else {
 textFieldC.text = selectedCategoryForA
 }*/

/*
func setLanguageAccordingToButtonTitle(){
    print("I am tryng to change language")
    if self.selectedLanguage == "English" {
        // languageChanged(strLan: "en")
        // self.labelQSelectedLanguage.text = "1key".localizableString(local: "en")
        // UserDefaults.standard.set(["en"], forKey: "AppleLanguages")
        var language = "en"
        let path = Bundle.main.path(forResource: language, ofType: "lproj")
        let bundle = Bundle(path: path!)
        let string = bundle?.localizedString(forKey: "key", value: nil, table: nil)
        
        
        
        UserDefaults.standard.set(self.appleLanguages[1], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    } else if self.selectedLanguage == "Ελληνικά" {
        
        //languageChanged(strLan: "el")
        //self.labelQSelectedLanguage.text = "1key".localizableString(local: "el")
        UserDefaults.standard.set(self.appleLanguages[0], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    } else if self.selectedLanguage == "Francais" {
        
        
        UserDefaults.standard.set(self.appleLanguages[3], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
}

func languageChanged(strLan:String){
    self.labelQSelectedLanguage.text = "1key".localizableString(local: strLan)
    
}
*/



/*
 @IBAction func setSpanishAsDefaultLanguage(_ sender: Any) {
 
 let pLoadedLanguage =  UserDefaults.standard.object(forKey: "AppleLanguages") as? String
 print("The language I hadLoaded is \(String(describing: pLoadedLanguage))")
 
 DispatchQueue.main.async {
 UserDefaults.standard.set(["es"], forKey: "AppleLanguages")
 }
 
 
 
 // UserDefaults.standard.set(["es"], forKey: "AppleLanguages")
 languageChanged(strLan: "es")
 let aLoadedLanguage = UserDefaults.standard.object(forKey: "AppleLanguages") as? String
 print("I chosen Spanish but this is \(String(describing: aLoadedLanguage))")
 }
 
 
 @IBAction func setFrenshAsDefaultLanguage(_ sender: Any) {
 
 
 DispatchQueue.main.async {
 UserDefaults.standard.set(["fr"], forKey: "AppleLanguages")
 }
 languageChanged(strLan: "fr")
 
 
 DispatchQueue.main.async {
 let loadedLanguage = UserDefaults.standard.object(forKey: "AppleLanguages") as? String
 print("I chosen Frensh but this is \(String(describing: loadedLanguage))")
 }
 //let loadedLanguage = UserDefaults.standard.object(forKey: "AppleLanguages") as? String
 
 // print("I chosen Frensh but this is \(String(describing: loadedLanguage))")
 
 }
 
 */

