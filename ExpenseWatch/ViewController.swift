//
//  ViewController.swift
//  ExpenseWatch
//
//  Created by planB on 2/5/17.
//  Copyright © 2017 Ioannis. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications
import SwiftKeychainWrapper




//Global Variables
let appDelegate = UIApplication.shared.delegate as? AppDelegate




class ViewController: UIViewController, UITextFieldDelegate {
    
    
    
    
    
    var coredExpensesArray = [ExpenseCore]()
    
    var paidVersionIsOn: Bool = false
    
    var oneCost: OneExpense?
    var nextID: ExpenseID?
    var times: Int = 1
    var sizeOfFixedCost: Double?
    var languageUsedBeforeEnteringSettings: String?
    var languageUsedComingBackFromSettings: String?
    
    //Alarm Effort
    var tableOfMonthExpences = [ExpenseCore]()
 // var tableOfMonthExpences = [OneExpense]()
    var monthsFirstDay = Date()
   
    
    var presentDay = Date()
    var sumOfMonthsExpensesToDate: Double = 0.00
    var storedSalary: Double = 0.00
    var modeCondition: Bool = true
    var expensesToSalaryPerCentToday: Double = 0.00
    var remainingMoneyToSalaryPerCent: Double = 0.00
    var missingMoneyToSalaryPerCent: Double = 0.00
    var flagForEigtyPerCent: Bool = true
    var flagForHumdredPerCent: Bool = true
    var remainingSalary: Double = 0.00
    
    
    var buttonDaysRollingTracker: Int = 0
    var buttonWeeksRollingTracker: Int = 0
    var buttonMonthsRollingTracker: Int = 0
    
    
    
 
    
    
    
    
    
    /*
    //labelsOftheBar
    @IBOutlet weak var labelZero: UILabel!
    @IBOutlet weak var labelQuarter: UILabel!
    @IBOutlet weak var labelHalf: UILabel!
    @IBOutlet weak var labelThreeQuarters: UILabel!
    @IBOutlet weak var labelFullPerCent: UILabel!
    */
    
    //Effort to simplify the adjustment to iphone sizes
    
    //iphoneSE, 5s
    var xSalaryBariPhoneSE: Int = 60
    var ySalaryBariPhoneSE: Int = 382
    var xlabelSpentPerCentSE: Int = 15
    var ylabelSpentPerCentSE: Int = 380
    var heightSalaryBariPhoneSE: Int = 16
    var xSphareSE: Int = 298
    var ySphareSE: Int = 390
    var radiusSphareSE: Float = 8
    var radiusErasingSE: Int = 10
    var xMultiplierSE: Float = 2.45
    
    //iphone 6, 6s, 7, 8
    var xSalaryBariPhone6: Int = 60
    var ySalaryBariPhone6: Int = 430
    var xlabelSpentPerCent6: Int = 15
    var ylabelSpentPerCent6: Int = 430
    var xSphare6: Int = 350
    var ySphare6: Int = 440
    var radiusSphare6: Float = 10
    var radiusErasing6: Int = 15
    var xMultiplier6: Float = 3
    
    
    //iphone 6plus, 6splus, 7plus, 8plus
    var xSalaryBariPhonePlus: Int = 60
    var ySalaryBariPhonePlus: Int = 470
    var xlabelSpentPerCentPlus: Int = 15
    var ylabelSpentPerCentPlus: Int = 470
    var xSpharePlus: Int = 390
    var ySpharePlus: Int = 480
    var radiusSpharePlus: Float = 10
    var radiusErasingPlus: Int = 15
    var xMultiplierPlus: Float = 3.4
    
    
    
    
    
    //iphoneX, Xs
    var xSalaryBariPhoneX: Int = 60
    var ySalaryBariPhoneX: Int = 500
    var xlabelSpentPerCentX: Int = 15
    var ylabelSpentPerCentX: Int = 500
    var xSphareX: Int = 350
    var ySphareX: Int = 510
    var radiusSphareX: Float = 10
    var radiusErasingX: Int = 17
    var xMultiplierX: Float = 3
    
    //iphoneXR, XS max
    
    var xSalaryBariPhoneXR: Int = 60
    var ySalaryBariPhoneXR: Int = 550
    var xlabelSpentPerCentXR: Int = 15
    var ylabelSpentPerCentXR: Int = 550
    var xSphareXR: Int = 390
    var ySphareXR: Int = 560
    var radiusSphareXR: Float = 10
    var radiusErasingXR: Int = 17
    var xMultiplierXR: Float = 3.4
    
    
    //iphone12 & 12 Pro,
    
    var xSalaryBariPhone12: Int = 60
    var ySalaryBariPhone12: Int = 520
    var xlabelSpentPerCent12: Int = 15
    var ylabelSpentPerCent12: Int = 520
    var xSphare12: Int = 370
    var ySphare12: Int = 530
    var radiusSphare12: Float = 10
    var radiusErasing12: Int = 17
    var xMultiplier12: Float = 3.2
    
    //iphone12ProMax
    var xSalaryBariPhone12ProMax: Int = 60
    var ySalaryBariPhone12ProMax: Int = 560
    var xlabelSpentPerCent12ProMax: Int = 15
    var ylabelSpentPerCent12ProMax: Int = 560
    var xSphare12ProMax: Int = 400
    var ySphare12ProMax: Int = 570
    var radiusSphare12ProMax: Float = 10
    var radiusErasing12ProMax: Int = 17
    var xMultiplier12ProMax: Float = 3.5
    
    
    
    //IPADS
    
    //ipad  mini---------
    var xSalaryBariPadmini: Int = 60
    var ySalaryBariPadmini: Int = 360
    var xlabelSpentPerCentiPadmini: Int = 15
    var ylabelSpentPerCentiPadmini: Int = 360
    var xSphareiPadmini: Int = 350
    var ySphareiPadmini: Int = 370
    var radiusSphareiPadmini: Float = 10
    var radiusErasingiPadmini: Int = 17
    
    
    
    //ipad---------
    var xSalaryBariPad: Int = 60
    var ySalaryBariPad: Int = 650
    var xlabelSpentPerCentiPad: Int = 15
    var ylabelSpentPerCentiPad: Int = 650
    var xSphareiPad: Int = 350
    var ySphareiPad: Int = 660
    var radiusSphareiPad: Float = 10
    var radiusErasingiPad: Int = 17
    
   
    //ipad Pro---------
    var xSalaryBariPadPro: Int = 60
    var ySalaryBariPadPro: Int = 700
    var xlabelSpentPerCentiPadPro: Int = 15
    var ylabelSpentPerCentiPadPro: Int = 700
    var xSphareiPadPro: Int = 350
    var ySphareiPadPro: Int = 710
    var radiusSphareiPadPro: Float = 10
    var radiusErasingiPadPro: Int = 17
    
    
    
    //ipad Pro12---------
    var xSalaryBariPadPro12: Int = 60
    var ySalaryBariPadPro12: Int = 850
    var xlabelSpentPerCentiPadPro12: Int = 15
    var ylabelSpentPerCentiPadPro12: Int = 850
    var xSphareiPadPro12: Int = 350
    var ySphareiPadPro12: Int = 860
    var radiusSphareiPadPro12: Float = 10
    var radiusErasingiPadPro12: Int = 17
    
    
    //Simplifying Localization
    var stringAttentionAlert: String = "AttentionAlert"
    var stringOk: String = "Ok"
    var stringButtonDays: String = "buttonForPeriodForDays"
    var stringOneDay: String =  "buttonForPeriodForOneDay"
    var stringButtonWeeks: String = "buttonForPeriodForWeeks"
    var stringOneWeek: String =   "buttonForPeriodForOneWeek"
    var stringButtonMonths: String = "buttonForPeriodForMonths"
    var stringOneMonth: String =  "buttonForPeriodForOneMonth"
    var stringButtonYears: String = "buttonForPeriodForYears"
    var stringOneYear: String =  "buttonForPeriodForOneYear"
    var stringOfDate: String = "dd/MM/yyyy, HH:mm"
    
    
    
    
  
    
    
    
    
    
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cashOrCardSwitch: UISwitch!
   // @IBOutlet weak var cashOrCardLabel: UILabel!
    @IBOutlet weak var kindOfCostSegment: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveOneExpense: UIButton!
    
    
    @IBOutlet weak var segmentForRepeated: UISegmentedControl!
  //  @IBOutlet weak var labelDaysToYears: UILabel!
    @IBOutlet weak var textFieldTimes: UITextField!
    @IBOutlet weak var labelForEveryPeriod: UILabel!
    @IBOutlet weak var buttonForPeriod: UIButton!
    
    
    @IBOutlet weak var labelForSpentPerCentIfInSalary: UILabel!
    
    
    //Segment Wired Outlets---------------------------------->
    
    @IBOutlet weak var buttonWater: UIButton!
    @IBOutlet weak var buttonBook: UIButton!
    @IBOutlet weak var buttonDiamond: UIButton!
    
    
    @IBOutlet weak var labelWater: UILabel!
    @IBOutlet weak var labelBook: UILabel!
    @IBOutlet weak var labelDiamond: UILabel!
    
    
    
    
     //Segment Wired Outlets----------------------------------<
    
    
    
    
    
    
   //last Entry Outlets--------------------------------
    
    
    @IBOutlet weak var labelOfOverallCost: UILabel!
    @IBOutlet weak var labelOfEnteredTitle: UILabel!
    @IBOutlet weak var enteredNameLabel: UILabel!
    @IBOutlet weak var enteredDateLabel: UILabel!
    @IBOutlet weak var enteredSizeLabel: UILabel!
    @IBOutlet weak var enteredImageLabel: UIImageView!
    
    //images================================
    @IBOutlet weak var surviveImage: UIImageView!
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var businessImage: UIImageView!
    
    
    
    
    
    //MARK: Actions for the Segment
    
    //Segment Wired ACTIONS---------------------------------->
    
    
    @IBAction func arrangeTheLabelsOfTheButtons(_ sender: Any) {
        let chosenSegment = self.kindOfCostSegment.selectedSegmentIndex
        if #available(iOS 13.0, *) {
            
            if chosenSegment == 0 {
                self.labelWater.textColor = UIColor.brown
                self.labelBook.textColor = UIColor.blue
                self.labelDiamond.textColor = UIColor.blue
                
            } else if chosenSegment == 1 {
                self.labelWater.textColor = UIColor.blue
                self.labelBook.textColor = UIColor.brown
                self.labelDiamond.textColor = UIColor.blue
                
            } else {
                self.labelWater.textColor = UIColor.blue
                self.labelBook.textColor = UIColor.blue
                self.labelDiamond.textColor = UIColor.brown
            }
            
            
            
        } else {
            
            if chosenSegment == 0 {
                self.labelWater.textColor = UIColor.white
                self.labelBook.textColor = UIColor.blue
                self.labelDiamond.textColor = UIColor.blue
                
            } else if chosenSegment == 1 {
                self.labelWater.textColor = UIColor.blue
                self.labelBook.textColor = UIColor.white
                self.labelDiamond.textColor = UIColor.blue
                
            } else {
                self.labelWater.textColor = UIColor.blue
                self.labelBook.textColor = UIColor.blue
                self.labelDiamond.textColor = UIColor.white
            }
        }
        

    }
    
    
    
    @IBAction func WaterPressedForSegment(_ sender: Any) {
       
        self.kindOfCostSegment.selectedSegmentIndex = 0
        
        
        
        if #available(iOS 13.0, *) {
            
            self.labelWater.textColor = UIColor.brown
            self.labelBook.textColor = UIColor.blue
            self.labelDiamond.textColor = UIColor.blue
            
        } else {
            self.labelWater.textColor = UIColor.white
            self.labelBook.textColor = UIColor.blue
            self.labelDiamond.textColor = UIColor.blue
        }
        
       
        
    }
    
    
    @IBAction func bookPressedForSegment(_ sender: Any) {
        self.kindOfCostSegment.selectedSegmentIndex = 1
        
        if #available(iOS 13.0, *) {
            self.labelWater.textColor = UIColor.blue
            self.labelBook.textColor = UIColor.brown
            self.labelDiamond.textColor = UIColor.blue
        } else {
            self.labelWater.textColor = UIColor.blue
            self.labelBook.textColor = UIColor.white
            self.labelDiamond.textColor = UIColor.blue
            
        }
        
        
        
        
     
        
        
    }
    
    
    @IBAction func diamondPressedForsegment(_ sender: Any) {
        
        self.kindOfCostSegment.selectedSegmentIndex = 2
        
        if #available(iOS 13.0, *) {
            self.labelWater.textColor = UIColor.blue
            self.labelBook.textColor = UIColor.blue
            self.labelDiamond.textColor = UIColor.brown
        } else {
            self.labelWater.textColor = UIColor.blue
            self.labelBook.textColor = UIColor.blue
            self.labelDiamond.textColor = UIColor.white
        }
        
        
    }
    
    
    func arrangeTimesLineToBeInvisible(){
        //self.labelDaysToYears.text = ""
        self.labelForEveryPeriod.text = ""
        self.textFieldTimes.backgroundColor = UIColor.clear
        self.textFieldTimes.textColor = UIColor.clear
        self.textFieldTimes.isEnabled = false
        self.nameTextField.placeholder = LocalizedString.noteOptional.localized
        
        //Below are the oldFashioned crul ways to localize*****************
       // self.nameTextField.placeholder = "Note(Optional)".localized() // NSLocalizedString("Note(Optional)", comment: "Note is Optional")
        //self.buttonForPeriod.isHidden = true
        self.buttonForPeriod.setTitle("", for:.normal)
        
      
        
    }
    
    
    
    func chooseDurationWithButton(){
        if segmentForRepeated.selectedSegmentIndex == 0 {
         // self.buttonForPeriod.isHidden = true
        } else if segmentForRepeated.selectedSegmentIndex == 1 {
            
            self.buttonForPeriod.setTitle(LocalizedString.buttonDays.localized, for: .normal)
            self.buttonForPeriod.isHidden = false
            
        } else if segmentForRepeated.selectedSegmentIndex == 2 {
            
            self.buttonForPeriod.setTitle(LocalizedString.buttonWeeks.localized, for: .normal)
            self.buttonForPeriod.isHidden = false
            
        } else if segmentForRepeated.selectedSegmentIndex == 3 {
            
            self.buttonForPeriod.setTitle(LocalizedString.buttonMonths.localized, for: .normal)
            self.buttonForPeriod.isHidden = false
            
        } else if segmentForRepeated.selectedSegmentIndex == 4 {
            
            self.buttonForPeriod.setTitle(LocalizedString.buttonYears.localized, for: .normal)
            self.buttonForPeriod.isHidden = false
            
        }
    }
    
    
    
    @IBAction func changeButtonTitle(_ sender: Any) {
        
        //EVERY DAY
        if segmentForRepeated.selectedSegmentIndex == 1 {
            
            if self.languageUsedBeforeEnteringSettings == "en" {
                print("we use english so Days is days")
            } else {
                 print("check your code")
            }
            self.buttonForPeriod.setTitle(LocalizedString.buttonDays.localized, for: .normal)
            self.buttonForPeriod.setTitleColor(UIColor.blue, for: .normal)
            
        // if self.buttonForPeriod.titleLabel?.text == "buttonForPeriodForDays".localized() {
            if buttonDaysRollingTracker == 0 {
                
                   self.buttonForPeriod.setTitle(LocalizedString.buttonWeeks.localized, for: .normal)
                    buttonDaysRollingTracker = 1
                
        // } else if self.buttonForPeriod.titleLabel?.text == "buttonForPeriodForWeeks".localized() {
                
              } else if buttonDaysRollingTracker == 1 {
                
                
                    self.buttonForPeriod.setTitle(LocalizedString.buttonMonths.localized, for: .normal)
                    buttonDaysRollingTracker = 2
                
         } else if buttonDaysRollingTracker == 2 {
                
                
                   self.buttonForPeriod.setTitle(LocalizedString.buttonYears.localized, for: .normal)
                  buttonDaysRollingTracker = 3
                
                
        // } else if self.buttonForPeriod.titleLabel?.text == "buttonForPeriodForYears".localized() {
                
            } else if buttonDaysRollingTracker == 3 {
                
                
                
                    self.buttonForPeriod.setTitle(LocalizedString.buttonDays.localized, for: .normal)
                buttonDaysRollingTracker = 0
        }
            
    
        //end if segment = 1
            
            //EVERY WEEK
        } else if segmentForRepeated.selectedSegmentIndex == 2 {
            
            self.buttonForPeriod.setTitle(LocalizedString.buttonWeeks.localized, for: .normal)
            self.buttonForPeriod.setTitleColor(UIColor.blue, for: .normal)
            
           // if self.buttonForPeriod.titleLabel?.text == "Weeks" {
                 if buttonWeeksRollingTracker == 0 {
                
                self.buttonForPeriod.setTitle(LocalizedString.buttonMonths.localized, for: .normal)
                 buttonWeeksRollingTracker = 1
                    
           // } else if self.buttonForPeriod.titleLabel?.text == "Months" {
                    
                } else if buttonWeeksRollingTracker == 1 {
                    
                    
                self.buttonForPeriod.setTitle(LocalizedString.buttonYears.localized, for: .normal)
                 buttonWeeksRollingTracker = 2
                    
           // } else if self.buttonForPeriod.titleLabel?.text == "Years" {
                   } else if buttonWeeksRollingTracker == 2 {
                    
                self.buttonForPeriod.setTitle(LocalizedString.buttonWeeks.localized, for: .normal)
                   buttonWeeksRollingTracker = 0
                    
            }
            
      //end if segment = 2
        } else if segmentForRepeated.selectedSegmentIndex == 3 {
            
             self.buttonForPeriod.setTitle(LocalizedString.buttonMonths.localized, for: .normal)
             self.buttonForPeriod.setTitleColor(UIColor.blue, for: .normal)
            
          // if self.buttonForPeriod.titleLabel?.text == "Months" {
             if buttonMonthsRollingTracker == 0 {
            
                self.buttonForPeriod.setTitle(LocalizedString.buttonYears.localized, for: .normal)
                buttonMonthsRollingTracker = 1
                
            //} else if self.buttonForPeriod.titleLabel?.text == "Years" {
                
             } else if buttonMonthsRollingTracker == 1 {
                
                
                self.buttonForPeriod.setTitle(LocalizedString.buttonMonths.localized, for: .normal)
                buttonMonthsRollingTracker = 0
                
            }
            
            //end if segment = 3
        } else if segmentForRepeated.selectedSegmentIndex == 4 {
            
          self.buttonForPeriod.setTitle(LocalizedString.buttonYears.localized, for: .normal)
          self.buttonForPeriod.setTitleColor(UIColor.brown, for: .normal)
       
            
            
            //end if segment = 4
        }
        
        
        
        
        
    //end Function
    }
    
    
    
    /*
    
    func useSwitchToChangeButtonForPeriod(){
       let chosenPeriod = self.segmentForRepeated.selectedSegmentIndex
        
        switch chosenPeriod {
       /* case 0:
            self.labelDaysToYears.text = ""
            self.labelForEveryPeriod.text = ""
            self.textFieldTimes.backgroundColor = UIColor.clear
            self.textFieldTimes.textColor = UIColor.clear
            self.textFieldTimes.isEnabled = false
            self.nameTextField.placeholder = "Note (Optional)"
            self.buttonForPeriod.titleLabel?.text = ""*/
        case 1:
            self.labelDaysToYears.text = "Days"
            self.buttonForPeriod.titleLabel?.text = "Days"
            self.labelForEveryPeriod.text = "every Day for"
            
            
            self.textFieldTimes.backgroundColor = UIColor.white
            self.textFieldTimes.textColor = UIColor.black
            self.textFieldTimes.isEnabled = true
            
            self.nameTextField.placeholder = "Note"
        case 2:
            self.labelDaysToYears.text = "Weeks"
            self.buttonForPeriod.titleLabel?.text = "Weeks"
            self.labelForEveryPeriod.text = "every Week for"
            self.textFieldTimes.backgroundColor = UIColor.white
            self.textFieldTimes.textColor = UIColor.black
            self.textFieldTimes.isEnabled = true
            
            self.nameTextField.placeholder = "Note"
        case 3:
            self.labelDaysToYears.text = "Months"
            self.buttonForPeriod.titleLabel?.text = "Months"
            self.labelForEveryPeriod.text = "every Month for"
            
            self.textFieldTimes.backgroundColor = UIColor.white
            self.textFieldTimes.textColor = UIColor.black
            self.textFieldTimes.isEnabled = true
            
            self.nameTextField.placeholder = "Note"
        case 4:
            self.labelDaysToYears.text = "Years"
            self.buttonForPeriod.titleLabel?.text = "Years"
            self.labelForEveryPeriod.text = "every Year for"
            
            self.textFieldTimes.backgroundColor = UIColor.white
            self.textFieldTimes.textColor = UIColor.black
            self.textFieldTimes.isEnabled = true
            
            self.nameTextField.placeholder = "Note"
        default:
            self.labelDaysToYears.text = ""
            self.labelForEveryPeriod.text = ""
            self.textFieldTimes.backgroundColor = UIColor.clear
            self.textFieldTimes.textColor = UIColor.clear
            self.textFieldTimes.isEnabled = false
            self.nameTextField.placeholder = "Note (Optional)"
            self.buttonForPeriod.titleLabel?.text = ""
        }
    }
    
    
    */
    
    
    
    
    
    
    
    
    @IBAction func changeTimesLabelToDaysWeeksYears(_ sender: Any) {
        
        
        if segmentForRepeated.selectedSegmentIndex == 0 {
           //arrangeTimesLineToBeInvisible()
           // self.labelDaysToYears.text = ""
            self.labelForEveryPeriod.text = ""
            self.textFieldTimes.backgroundColor = UIColor.clear
            self.textFieldTimes.textColor = UIColor.clear
            self.textFieldTimes.isEnabled = false
            self.nameTextField.placeholder = LocalizedString.noteOptional.localized
            self.buttonForPeriod.setTitle("", for: .normal)
            //self.nameTextField.textColor = UIColor.lightGray
            
        } else if segmentForRepeated.selectedSegmentIndex == 1 {
           // self.labelDaysToYears.text = "Days"
            self.buttonForPeriod.setTitle(LocalizedString.buttonDays.localized, for: .normal)
            self.buttonForPeriod.isEnabled = true
            self.buttonForPeriod.setTitleColor(UIColor.blue, for: .normal)
            self.labelForEveryPeriod.text = LocalizedString.everyDayFor.localized
            
            self.textFieldTimes.backgroundColor = UIColor.white
            self.textFieldTimes.textColor = UIColor.black
            self.textFieldTimes.isEnabled = true
            
            self.nameTextField.placeholder = LocalizedString.noteForRepeated.localized
            // self.nameTextField.textColor = UIColor.gray
            
            
          //  self.nameTextField.textColor = UIColor.gray
        } else if segmentForRepeated.selectedSegmentIndex == 2 {
            //self.labelDaysToYears.text = "Weeks"
            self.buttonForPeriod.setTitle(LocalizedString.buttonWeeks.localized, for: .normal)
            self.buttonForPeriod.isEnabled = true
            self.buttonForPeriod.setTitleColor(UIColor.blue, for: .normal)
            
            self.labelForEveryPeriod.text = LocalizedString.everyWeekFor.localized
            self.textFieldTimes.backgroundColor = UIColor.white
            self.textFieldTimes.textColor = UIColor.black
            self.textFieldTimes.isEnabled = true
            
            self.nameTextField.placeholder = LocalizedString.noteForRepeated.localized
           // self.nameTextField.textColor = UIColor.gray
           
          
           
            
           // self.nameTextField.textColor = UIColor.gray
        } else if segmentForRepeated.selectedSegmentIndex == 3 {
            //self.labelDaysToYears.text = "Months"
           self.buttonForPeriod.setTitle(LocalizedString.buttonMonths.localized, for: .normal)
            self.buttonForPeriod.isEnabled = true
             self.buttonForPeriod.setTitleColor(UIColor.blue, for: .normal)
            
            self.labelForEveryPeriod.text = LocalizedString.everyMonthFor.localized
            
            self.textFieldTimes.backgroundColor = UIColor.white
            self.textFieldTimes.textColor = UIColor.black
            self.textFieldTimes.isEnabled = true
            
            self.nameTextField.placeholder = LocalizedString.noteForRepeated.localized
           // self.nameTextField.textColor = UIColor.gray
           
           
           
           
        } else {
           // self.labelDaysToYears.text = "Years"
            self.buttonForPeriod.setTitle(LocalizedString.buttonYears.localized, for: .normal)
            self.buttonForPeriod.isEnabled = false
            self.buttonForPeriod.setTitleColor(UIColor.brown, for: .normal)
            
            self.labelForEveryPeriod.text = LocalizedString.everyYearFor.localized
            
            self.textFieldTimes.backgroundColor = UIColor.white
            self.textFieldTimes.textColor = UIColor.black
            self.textFieldTimes.isEnabled = true
            
            self.nameTextField.placeholder = LocalizedString.noteForRepeated.localized
    
            
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func positionTheButtons() {
        
        let  widthOfIOSDevice = UIScreen.main.bounds.size.width
        let  heightOfIOSDevice = UIScreen.main.bounds.size.height
        
        
        let lengthOfSegmentControl = widthOfIOSDevice - 30
        let lengthOfOneSegment = lengthOfSegmentControl/3
        let halfSegment = lengthOfOneSegment/2
        
        
         //Only iphoneX is different-------------------------------------------------------------
         
         
         if widthOfIOSDevice < 350 && heightOfIOSDevice < 800{
         //small iphone
         print("the device has width \(widthOfIOSDevice) so its smaller than 350")
            
            buttonWater.frame = CGRect(x: 15 + halfSegment - 45/2, y:81, width: 45, height: 45)
            labelWater.frame = CGRect(x: 15 + halfSegment - 50, y: 126, width: 100, height: 17)
            
            buttonDiamond.frame = CGRect(x: 15 + lengthOfSegmentControl - halfSegment - 45/2, y: 81, width: 45, height: 45)
            labelDiamond.frame = CGRect(x: 15 + lengthOfSegmentControl - halfSegment - 50, y: 126, width: 100, height: 17)
            
            
         
         } else if widthOfIOSDevice > 350 && widthOfIOSDevice < 700 && heightOfIOSDevice < 800 {
         //iphone
         print("the device has width \(widthOfIOSDevice) so its bigger than 350 but its not an ipad")
            
            buttonWater.frame = CGRect(x: 15 + halfSegment - 45/2, y:81, width: 45, height: 45)
            labelWater.frame = CGRect(x: 15 + halfSegment - 50, y: 126, width: 100, height: 17)
            
            buttonDiamond.frame = CGRect(x: 15 + lengthOfSegmentControl - halfSegment - 45/2, y: 81, width: 45, height: 45)
            labelDiamond.frame = CGRect(x: 15 + lengthOfSegmentControl - halfSegment - 50, y: 126, width: 100, height: 17)
            
            
           //The only different------------------------------------------------------->>>>>>>>>>>>>>>>>>>>
         } else if widthOfIOSDevice > 350 && widthOfIOSDevice < 700 && heightOfIOSDevice > 800 {
         //iphone X
         print("the device has heght \(heightOfIOSDevice) so its bigger than 800 so yoy have an X")
            
            buttonWater.frame = CGRect(x: 15 + halfSegment - 45/2, y:105, width: 45, height: 45)
            labelWater.frame = CGRect(x: 15 + halfSegment - 50, y: 150, width: 100, height: 17)
            
            buttonDiamond.frame = CGRect(x: 15 + lengthOfSegmentControl - halfSegment - 45/2, y: 105, width: 45, height: 45)
            labelDiamond.frame = CGRect(x: 15 + lengthOfSegmentControl - halfSegment - 50, y: 150, width: 100, height: 17)
            
            
            
            
            //The only different-------------------------------------------------------<<<<<<<<<<<<<<<<<
         
         }  else  {
         //ipad
         print("the device has width \(widthOfIOSDevice) so its an ipad")
            buttonWater.frame = CGRect(x: 15 + halfSegment - 45/2, y:81, width: 45, height: 45)
            labelWater.frame = CGRect(x: 15 + halfSegment - 50, y: 126, width: 100, height: 17)
            
            buttonDiamond.frame = CGRect(x: 15 + lengthOfSegmentControl - halfSegment - 45/2, y: 81, width: 45, height: 45)
            labelDiamond.frame = CGRect(x: 15 + lengthOfSegmentControl - halfSegment - 50, y: 126, width: 100, height: 17)
         
         }
       
        
        
        
        
        
        
        
     
        
       // buttonWater.frame.origin = CGPoint(x: 15 + halfSegment - 45/2 + 100, y: 81)
        //buttonDiamond.frame.origin = CGPoint(x: 15 + lengthOfSegmentControl - halfSegment - 45/2, y: 81)
        
        //buttonBook.frame.origin = CGPoint(x: 20, y: 300)
      //  self.view.bringSubview(toFront: kindOfCostSegment)
      //  self.view.sendSubview(toBack: kindOfCostSegment)
    }
    
    
    
    
    
    
    
    
    
     //Segment Wired ACTIONS----------------------------------<
    
    
    
    @IBAction func CashToCardChanging(_ sender: Any) {
        
        if cashOrCardSwitch.isOn  {
           /*
            if (costTextField.text?.isEmpty)! {
                
                self.saveOneExpense.backgroundColor = UIColor.clear
                self.saveOneExpense.isUserInteractionEnabled = false
                self.saveOneExpense.setTitle("Pay", for: .normal)
                self.saveOneExpense.setTitleColor(UIColor.gray, for: .normal)
             } else {*/
            
           self.saveOneExpense.backgroundColor = UIColor.blue
           // self.saveOneExpense.setTitle(NSLocalizedString("ButtonToPayCash", comment: "Button to pay cash"), for: .normal)
            self.saveOneExpense.setTitle(LocalizedString.buttonToPayCash.localized, for: .normal)
            self.saveOneExpense.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            //}
            
            
        } else {
            /*
            if (costTextField.text?.isEmpty)! {
                
                self.saveOneExpense.backgroundColor = UIColor.clear
                self.saveOneExpense.isUserInteractionEnabled = false
                self.saveOneExpense.setTitle("Charge", for: .normal)
                self.saveOneExpense.setTitleColor(UIColor.gray, for: .normal)
            } else {*/
                
                self.saveOneExpense.backgroundColor = UIColor.blue
              // oldFashioned localization
              //  self.saveOneExpense.setTitle(NSLocalizedString("ButtonToCard", comment: "Button to card"), for: .normal)
                self.saveOneExpense.setTitle(LocalizedString.buttonToCard.localized, for: .normal)
            
                self.saveOneExpense.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            //}
            
          
        }
        

        //cashOrCardLabel.text = cashOrCardSwitch.isOn ? "Cash:" : "Card:"
       //  cashOrCardLabel.textColor = cashOrCardSwitch.isOn ?  UIColor.black : UIColor.red
        self.costTextField.textColor = cashOrCardSwitch.isOn ?  UIColor.black : UIColor.red
        self.costTextField.placeholder = cashOrCardSwitch.isOn ? LocalizedString.placeholderCash.localized : LocalizedString.placeholderAmount.localized
        
        self.oneCost?.cash = cashOrCardSwitch.isOn ? true : false
        
       
    }
    
  
    
    
    func getTheStringOfLocaleDate() -> String {
        var stringOfLocaleDate: String
        print("the NSLocale.current.identifier is \(NSLocale.current.identifier) ")
        
       let region = NSLocale.current.identifier.suffix(2)
       
        
        switch region {
        case "US": stringOfLocaleDate = "MM/dd/yyyy, HH:mm"
        case "EU": stringOfLocaleDate = "dd/MM/yyyy, HH:mm"
        case "JP": stringOfLocaleDate = "dd/MM/yyyy, HH:mm"
        default: stringOfLocaleDate = "dd/MM/yyyy, HH:mm"
        }
        return stringOfLocaleDate
    }
    
    func getTheStringOfLocaleDateStart() -> String {
        var stringOfLocaleDate: String
        print("the NSLocale.current.identifier is \(NSLocale.current.identifier) ")
        
     
        
        switch NSLocale.current.identifier {
        case "en_US": stringOfLocaleDate = "MM/dd/yyyy, HH:mm"
        case "en_EU": stringOfLocaleDate = "dd/MM/yyyy, HH:mm"
        case "ja_JP": stringOfLocaleDate = "dd/MM/yyyy, HH:mm"
        default: stringOfLocaleDate = "dd/MM/yyyy, HH:mm"
        }
        return stringOfLocaleDate
    }
    
    
    
    
    
    
    @IBAction func saveOneExpense(_ sender: Any) {
        
        
        if self.paidVersionIsOn {
            saveOneExpenseUsingCoreData {(done) in
                if done {
                    print("one enpense was saved in core data")
                } else {
                    print("not able to save in core data")
                }
            }
            
            //No paid version so we will only let you save one or daily expense
        } else if self.segmentForRepeated.selectedSegmentIndex == 0 || segmentForRepeated.selectedSegmentIndex == 1 {
            saveOneExpenseUsingCoreData {(done) in
                if done {
                    print("one enpense was saved in core data")
                } else {
                    print("not able to save in core data")
                }
            }
            
        
            //No paid version and you want to save weekly and UP. NOT ACCEPTED so just buy the App.
        } else if self.segmentForRepeated.selectedSegmentIndex == 2 || segmentForRepeated.selectedSegmentIndex == 3 || segmentForRepeated.selectedSegmentIndex == 4 {
            
            //showKioskAlert()
            showKiosk()
        }
        
        
        
   //The last and crucial parenthsis of the SAVE function=======================
    }
//The last and crucial parenthsis of the SAVE function=======================
    
    
    func showKioskAlert() {
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
    
    func drawTheIncomeBarOnceYouSavedACost(){
        
        //Everything For the Drawing Of the income Bar===========>>>>>>>>>>>>>>>>>>likeViewDidLoad
        setTheFirstDayOfCurrentAsMonthTheStartingDate()
        setTodayAsTheEndingDate()
        
        
        //ATTENTION We empry the array so that we will not load it twice
        
        tableOfMonthExpences = []
        
        //ATTENTION We empry the array so that we will not load it twice
        
        
       // createListOfExpenses()
        createListOfCoredExpenses()
        
      
        
        self.sumOfMonthsExpensesToDate = 0.0
        sumMonthsExpenses()
        print("The sum is \(sumOfMonthsExpensesToDate)")
        
        //Restarting The Flags
        if sumOfMonthsExpensesToDate == 0 {
            flagForEigtyPerCent = true
            flagForHumdredPerCent = true
        }
        //Restarting The Flags
        
        
        
        
        
        findTheStoredModePropertyUnachiveItAndUseItToPutTheVARToTheCorrectCondition()
        print("The mode is \(modeCondition)")
        
        
        if modeCondition {
           // drawFullSalaryBarForIncomeMode()
            
            
            self.labelForSpentPerCentIfInSalary.text = ""
            drawFullBarNow(colorBar: UIColor.white)
            
            
            
          //  self.navigationItem.title = NSLocalizedString("titleOfMainViewForIncome", comment: "Title of mainview for income")
            self.navigationItem.title = LocalizedString.titleMainViewIncome.localized
            print("Just make title New , Salary Bar white and do nothing")
            
        } else {
            
            
            
            findTheSalaryAndUnarchiveIt()
            print("The stored salary is \(String(storedSalary))")
            
            
            
            //Restarting The Flags>>>>>>>>>>>>
            if sumOfMonthsExpensesToDate < storedSalary * 0.8 {
                flagForEigtyPerCent = true
                flagForHumdredPerCent = true
            }
            //Restarting The Flags<<<<<<<<<<<<<<<
            
            
            //remaining Salary on title>>>>>>>>>>>>>>>>>
            self.remainingSalary = storedSalary - sumOfMonthsExpensesToDate
            let myFormatter = NumberFormatter()
            myFormatter.numberStyle = .currency
            let stringOfRemainingSalaryForTitle = myFormatter.string(from: self.remainingSalary as NSNumber)!
            self.navigationItem.title = stringOfRemainingSalaryForTitle
            
            
            
            
            
            
            
            
            
            //self.navigationItem.title = String(remainingSalary)
            //remaining Salary on title<<<<<<<<<<<<<<<<<<<<<
            
            
            
            calculateTheExpensesToSalaryPerCent()
            print(" We have spent the \(String(describing: expensesToSalaryPerCentToday)) % of the salary ")
            
            
            calculateTheRemaingMoneyToSalaryPerCent()
            print("We are left with the \(String(describing: remainingMoneyToSalaryPerCent)) % of the salary")
            
            let perCentFormatter = NumberFormatter()
            perCentFormatter.maximumFractionDigits = 0
            if storedSalary > sumOfMonthsExpensesToDate {
              self.labelForSpentPerCentIfInSalary.text = perCentFormatter.string(from: NSNumber(value:self.remainingMoneyToSalaryPerCent))! + "%"
            } else {
              self.labelForSpentPerCentIfInSalary.text = perCentFormatter.string(from: NSNumber(value:self.missingMoneyToSalaryPerCent))! + "%"
            }
                
            
            
            
            
            
            
            //drawFullSalaryBarForSalaryMode()
            
            drawFullBarNow(colorBar: UIColor.white)
            
            
            if storedSalary > sumOfMonthsExpensesToDate {
                
                drawRemaingCapitalBar()
                
            } else if storedSalary == sumOfMonthsExpensesToDate{
                
              // drawFullSalaryBarForSalaryMode()
                drawFullBarNow(colorBar: UIColor.white)
                
            } else if sumOfMonthsExpensesToDate > storedSalary && sumOfMonthsExpensesToDate <= 2 * storedSalary {
                
                drawMissingCapitalBar()
                
                
            } else {
                
                
               drawMissingCapitalBar()
               // drawFullMissingCapitalBar()
                
            }
            //Alarm 80%
            if sumOfMonthsExpensesToDate > storedSalary * 0.8  && sumOfMonthsExpensesToDate < storedSalary && flagForEigtyPerCent  {
                let eightyPerCentAlert = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                           message: LocalizedString.spent80ofsalary.localized,
                                                           preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                             style: UIAlertAction.Style.default,
                                             handler: nil)
                
                eightyPerCentAlert.addAction(okAction)
                
                self.present(eightyPerCentAlert, animated:true, completion: nil)
                flagForEigtyPerCent = false
                
                
            }
            
            //Alarm 100%
            
            if sumOfMonthsExpensesToDate > storedSalary && flagForHumdredPerCent  {
                let hundredPerCentAlert = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                            message: LocalizedString.spentAllofsalary.localized,
                                                            preferredStyle: UIAlertController.Style.alert)
                let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                             style: UIAlertAction.Style.default,
                                             handler: nil)
                
                hundredPerCentAlert.addAction(okAction)
                
                self.present(hundredPerCentAlert, animated:true, completion: nil)
                flagForHumdredPerCent = false
                
                
            }
            
            
            
            
            
            
        }
        //Everything For the Drawing Of the income Bar===========>>>>>>>>>>>>>>>>>>likeViewDidLoad
    }
    
    
    
    
    
    func saveDailyExpense(){
        
        let nf = NumberFormatter()
      
        nf.locale = Locale.current
        
        if !(textFieldTimes.text?.isEmpty)! {
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print("app dir: \(documentsPath)")
        let idPath = Bundle.path(forResource: "expenseID", ofType: ".dat", inDirectory: documentsPath)
        let e:ExpenseID = NSKeyedUnarchiver.unarchiveObject(withFile: idPath!) as! ExpenseID
        
        
            if buttonForPeriod.titleLabel?.text == LocalizedString.buttonDays.localized{
                //To avoid overflow we restrict daily costs to 5000
                let wishedTimes = Int(self.textFieldTimes.text!)!
                
                if wishedTimes < 1825 {
                    self.times = Int(self.textFieldTimes.text!)!
                } else {
                    //store only for 5 years
                    self.times = 1825
                    //and show an alert with the fantastic overall cost
                    //let dailyCost = Double(self.costTextField.text!)
                    let fantasticOverall = Double(wishedTimes) * (nf.number(from: self.costTextField.text!) as? Double)!
                    
                    
                    let myOtherFormatter = NumberFormatter()
                    myOtherFormatter.numberStyle = .currency
                    let stringOffantasticOverall = myOtherFormatter.string(from: fantasticOverall as NSNumber)
                    //self.labelOfOverallCost.text = stringOfOverallCost
                    
                     var alertComponets = [String]()
                    alertComponets.append("Overall cost of such a daily expense:")
                    alertComponets.append(stringOffantasticOverall!)
                    alertComponets.append("For memory reasons this expense will be stored for 1825 days, wich is equal to 5 years. So in 5 years a reminder will be send to renew this cost.")
                    
                    let overflowDailyAlert = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                               message: alertComponets.joined(separator: "\n"),
                                                               preferredStyle: UIAlertController.Style.alert)
                    
                    let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                                 style: UIAlertAction.Style.default,
                                                 handler: nil)
                    
                    overflowDailyAlert.addAction(okAction)
                    
                    self.present(overflowDailyAlert, animated:true, completion: nil)
                    
                    
                  /*"The overall cost of such a daily expense is " + stringOffantasticOverall! + " but for memory reasons there will be stored 3650 repetitions, wich is equal to 10 years. So in 10 years a reminder will be send to renew this cost.",*/
                    
                    
                    
                    
                }
                
                
               
                
                
                
                
                
                
                
                
            } else if buttonForPeriod.titleLabel?.text == LocalizedString.buttonWeeks.localized{
                self.times = Int(self.textFieldTimes.text!)! * 7
            } else if buttonForPeriod.titleLabel?.text == LocalizedString.buttonMonths.localized{
                 self.times = Int(self.textFieldTimes.text!)! * 30
            } else if buttonForPeriod.titleLabel?.text == LocalizedString.buttonYears.localized{
            self.times = Int(self.textFieldTimes.text!)! * 365
            }
            
          
            
            
        self.sizeOfFixedCost = Double(self.costTextField.text!)
     
            
        let overallCost = Double(times) * (nf.number(from: self.costTextField.text!) as? Double)!
            
        //currency Format------>
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        let stringOfOverallCost = myFormatter.string(from: overallCost as NSNumber)
        self.labelOfOverallCost.text = stringOfOverallCost
        //currency Format------<
            
            
        self.labelOfEnteredTitle.text = LocalizedString.overAllCost.localized
            
            
            //---------------------------
            
            self.enteredNameLabel.text = self.nameTextField.text
            //self.nameTextField.text = ""
            
            
            
            if self.cashOrCardSwitch.isOn {
                self.enteredSizeLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            } else {
                self.enteredSizeLabel.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
                
            }
            
            //In order to show the entered Cost with the suitable currency---->
            
            let numberEntered = nf.number(from: self.costTextField.text!) as? Double
           // let myFormatter = NumberFormatter()
            myFormatter.numberStyle = .currency
            let stringrOfEnteredFormattedCost = myFormatter.string(from: numberEntered! as NSNumber)
            self.enteredSizeLabel.text = stringrOfEnteredFormattedCost
            
            //In order to show the entered Cost with the suitable currency----<
            
            
            
            
            //self.enteredSizeLabel.text = self.costTextField.text
            //self.costTextField.text = ""
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
            dateFormatter.dateFormat =  stringOfDate.regionize()
            
            var period = "days"
            
            if self.buttonForPeriod.titleLabel?.text == LocalizedString.buttonDays.localized  && self.textFieldTimes.text != "1"{
                period = LocalizedString.buttonDays.localized
            } else if self.buttonForPeriod.titleLabel?.text == LocalizedString.buttonDays.localized && self.textFieldTimes.text == "1" {
                period = LocalizedString.oneDay.localized
            } else if self.buttonForPeriod.titleLabel?.text == LocalizedString.buttonWeeks.localized && self.textFieldTimes.text != "1"{
                period = LocalizedString.buttonWeeks.localized
            } else if self.buttonForPeriod.titleLabel?.text == LocalizedString.buttonWeeks.localized  && self.textFieldTimes.text == "1"{
                period = LocalizedString.oneWeek.localized
            } else if self.buttonForPeriod.titleLabel?.text == LocalizedString.buttonMonths.localized && self.textFieldTimes.text != "1" {
                period = LocalizedString.buttonMonths.localized
            } else if self.buttonForPeriod.titleLabel?.text == LocalizedString.buttonMonths.localized && self.textFieldTimes.text == "1" {
                period = LocalizedString.oneMonth.localized
            } else if self.buttonForPeriod.titleLabel?.text == LocalizedString.buttonYears.localized && self.textFieldTimes.text != "1"{
                period = LocalizedString.buttonYears.localized
            } else if self.buttonForPeriod.titleLabel?.text == LocalizedString.buttonYears.localized  && self.textFieldTimes.text == "1" {
                period = LocalizedString.oneYear.localized
            }
            
            
            
            
            
            // self.enteredDateLabel.text = "Daily for \(String(describing: self.textFieldTimes.text!)) \(period)"//dateFormatter.string(from: self.datePicker.date) //String(describing: self.datePicker.date)
            
            
            // self.enteredDateLabel.text = LocalizedString.dailyfor.localized + " \(String(describing: self.textFieldTimes.text!)) \(period)"
            self.enteredDateLabel.text = LocalizedString.dailyfor.localized + " \(String(describing: self.times)) \(period)"
            
            
            
            if self.kindOfCostSegment.selectedSegmentIndex == 0 {
                self.enteredImageLabel.image = self.buttonWater.image(for: .normal)
            } else if self.kindOfCostSegment.selectedSegmentIndex == 1 {
                self.enteredImageLabel.image = self.buttonBook.image(for: .normal)
            } else {
                self.enteredImageLabel.image = self.buttonDiamond.image(for: .normal)
            }
            
            
            
          //-----------------------------------------
            
            
            
            
            
            //Variables to implicate MULTITHREADING
            let date = self.datePicker.date
            let indexOfCategory = self.kindOfCostSegment.selectedSegmentIndex
            let costInTheField = self.costTextField.text!
            let cashSwitchState = self.cashOrCardSwitch.isOn
            let noteMultiStored = self.nameTextField.text!
            
            
            //once we entered repeated cost to back to once & make timeLineinvisible
            //once the UI did everything it has to go bach to once & make timeLineinvisible....
            self.segmentForRepeated.selectedSegmentIndex = 0
            
            arrangeTimesLineToBeInvisible()
            self.nameTextField.text = ""
            self.costTextField.text = ""
            
            
            //...while in the global background queue we will be storing furiously the repeated costs
           DispatchQueue.global(qos:.background).async {
            
            
                for i in 0...self.times - 1 {
           // let date = self.datePicker.date
            let calendar = Calendar.current
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let components: NSDateComponents = NSDateComponents()
            components.year = year
            components.month = month
            components.day = day + i
            components.hour = 7
            let iDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            // Now use e.nextID and save OneExpense to say 1.dat if e.nextID == 1 and so on.
            let pathToSave = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let fileName = (e.nextID)!.description + ".dat"
            let fullPath = pathToSave + "/" + fileName
                    if indexOfCategory == 0 {
                let oneSavedExpense = OneExpense (size: nf.number(from: costInTheField) as? Double,
                                                  cash: cashSwitchState,
                                                  date: iDate as Date,
                                                  kind: "Acost"/*self.labelWater.text*/,
                                                  note: LocalizedString.dailyNote.localized + " " + noteMultiStored,
                                                  expenseID: e.nextID,
                                                  filePath: fullPath.description)
                NSKeyedArchiver.archiveRootObject(oneSavedExpense ,toFile: fullPath)
             // print("I stored the note \(noteMultiStored) with cost \(costInTheField) paid with \(cashSwitchState) of kind \("Acost") ")
              //  self.enteredNameLabel.text = "Acost"
             //  self.enteredImageLabel.image = self.buttonWater.image(for: .normal)
                    } else if indexOfCategory == 1 {
                let oneSavedExpense = OneExpense (size: nf.number(from: costInTheField) as? Double,
                                                  cash:cashSwitchState,
                                                  date: iDate as Date,
                                                  kind: "Bcost"/*self.labelBook.text*/,
                                                  note: LocalizedString.dailyNote.localized + " " + noteMultiStored,
                                                  expenseID: e.nextID,
                                                  filePath: fullPath.description)
                NSKeyedArchiver.archiveRootObject(oneSavedExpense ,toFile: fullPath)
           // self.enteredNameLabel.text = "Bcost"
           //  self.enteredImageLabel.image = self.buttonBook.image(for: .normal)
            } else {
                let oneSavedExpense = OneExpense (size: nf.number(from: costInTheField) as? Double,
                                                  cash: cashSwitchState,
                                                  date: iDate as Date,
                                                  kind: "Ccost"/*self.labelDiamond.text*/,
                                                  note: LocalizedString.dailyNote.localized + " " + noteMultiStored,
                                                  expenseID: e.nextID,
                                                 filePath: fullPath.description)
                NSKeyedArchiver.archiveRootObject(oneSavedExpense ,toFile: fullPath)
         //  self.enteredNameLabel.text = "Ccost"
          //  self.enteredImageLabel.image = self.buttonDiamond.image(for: .normal)
            }
            e.nextID = e.nextID! + 1
            NSKeyedArchiver.archiveRootObject(e, toFile: idPath!)
          }//LOOP----------------------------------
          }//end Of Dispatch
            
            
        } else {
            let emptyFieldsAlert3 = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                      message: LocalizedString.forRepeatedcostsRepetitions.localized,
                                                      preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                         style: UIAlertAction.Style.default,
                                         handler: nil)
            
            emptyFieldsAlert3.addAction(okAction)
            
            self.present(emptyFieldsAlert3, animated:true, completion: nil)
            
            //self.textFieldTimes.becomeFirstResponder()
            
            
            
            
            
        }
        
        
        
    }
    
    
    
    
    func saveWeeklyExpense(){
        
        let nf = NumberFormatter()
        nf.locale = Locale.current
        
         if !(textFieldTimes.text?.isEmpty)! {
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print("app dir: \(documentsPath)")
        let idPath = Bundle.path(forResource: "expenseID", ofType: ".dat", inDirectory: documentsPath)
        let e:ExpenseID = NSKeyedUnarchiver.unarchiveObject(withFile: idPath!) as! ExpenseID
        
            
            if buttonForPeriod.titleLabel?.text == LocalizedString.buttonWeeks.localized{
                self.times = Int(self.textFieldTimes.text!)!
            } else if buttonForPeriod.titleLabel?.text == LocalizedString.buttonMonths.localized{
                self.times = Int(self.textFieldTimes.text!)! * 30/7
            } else if buttonForPeriod.titleLabel?.text == LocalizedString.buttonYears.localized{
                self.times = Int(self.textFieldTimes.text!)! * 365/7
            }
            
            
            
            
            
        
       // self.times = Int(self.textFieldTimes.text!)!
        let overallCost =  Double(times) * (nf.number(from: self.costTextField.text!) as? Double)!
            
            //currency Format------>
            let myFormatter = NumberFormatter()
            myFormatter.numberStyle = .currency
            let stringOfOverallCost = myFormatter.string(from: overallCost as NSNumber)
            self.labelOfOverallCost.text = stringOfOverallCost
            //currency Format------<
            
            
       // self.labelOfOverallCost.text = String(overallCost)
        self.labelOfEnteredTitle.text = LocalizedString.overAllCost.localized
        
        for i in 0...times - 1 {
            
            let date = self.datePicker.date
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            let day = calendar.component(.day, from: date)
            let hour = calendar.component(.hour, from: date)
            
            print("\(year)")
            print("\(month)")
            print("\(day)")
            print("\(hour)")
            
            
            let components: NSDateComponents = NSDateComponents()
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day + 7*i
            components.hour = 7
            let iDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            
            
            
            
            // Now use e.nextID and save OneExpense to say 1.dat if e.nextID == 1 and so on.
            let pathToSave = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let fileName = (e.nextID)!.description + ".dat"
            let fullPath = pathToSave + "/" + fileName
            
            if kindOfCostSegment.selectedSegmentIndex == 0 {
                let oneSavedExpense = OneExpense (size: nf.number(from: self.costTextField.text!) as? Double,
                                                  cash: self.cashOrCardSwitch.isOn,
                                                  date: iDate as Date,
                                                  kind: "Acost"/*self.labelWater.text*/,
                                                  note: LocalizedString.weeklyNote.localized + " " + self.nameTextField.text!,
                                                  expenseID: e.nextID,
                                                  filePath: fullPath.description)
                NSKeyedArchiver.archiveRootObject(oneSavedExpense ,toFile: fullPath)
                self.enteredNameLabel.text = "Acost"
                self.enteredImageLabel.image = self.buttonWater.image(for: .normal)
                
            } else if kindOfCostSegment.selectedSegmentIndex == 1 {
                let oneSavedExpense = OneExpense (size: nf.number(from: self.costTextField.text!) as? Double,
                                                  cash: self.cashOrCardSwitch.isOn,
                                                  date: iDate as Date,
                                                  kind: "Bcost"/*self.labelBook.text*/,
                                                  note: LocalizedString.weeklyNote.localized + " " + self.nameTextField.text!,
                                                  expenseID: e.nextID,
                                                  filePath: fullPath.description)
                NSKeyedArchiver.archiveRootObject(oneSavedExpense ,toFile: fullPath)
                self.enteredNameLabel.text = "Bcost"
                self.enteredImageLabel.image = self.buttonBook.image(for: .normal)
            } else {
                let oneSavedExpense = OneExpense (size: nf.number(from: self.costTextField.text!) as? Double,
                                                  cash: self.cashOrCardSwitch.isOn,
                                                  date: iDate as Date,
                                                  kind: "Ccost"/*self.labelDiamond.text*/,
                                                  note: LocalizedString.weeklyNote.localized + " " + self.nameTextField.text!,
                                                  expenseID: e.nextID,
                                                  filePath: fullPath.description)
                NSKeyedArchiver.archiveRootObject(oneSavedExpense ,toFile: fullPath)
                self.enteredNameLabel.text = "Ccost"
                self.enteredImageLabel.image = self.buttonDiamond.image(for: .normal)
            }
            
            
            e.nextID = e.nextID! + 1
            NSKeyedArchiver.archiveRootObject(e, toFile: idPath!)
            
            self.enteredNameLabel.text = self.nameTextField.text
            //self.nameTextField.text = ""
            
            
            
            if self.cashOrCardSwitch.isOn {
                enteredSizeLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            } else {
                enteredSizeLabel.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
                
            }
            
            //In order to show the entered Cost with the suitable currency---->
            
            let numberEntered = nf.number(from: self.costTextField.text!) as? Double
            let myFormatter = NumberFormatter()
            myFormatter.numberStyle = .currency
            let stringrOfEnteredFormattedCost = myFormatter.string(from: numberEntered! as NSNumber)
            self.enteredSizeLabel.text = stringrOfEnteredFormattedCost
            
            //In order to show the entered Cost with the suitable currency----<
            
            
            
            //self.enteredSizeLabel.text = self.costTextField.text
            //self.costTextField.text = ""
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
            dateFormatter.dateFormat =  stringOfDate.regionize()
            
            var period = "weeks"
            
            if buttonForPeriod.titleLabel?.text == "buttonForPeriodForDays".localized()  && self.textFieldTimes.text != "1"{
                period = "buttonForPeriodForDays".localized()
            } else if buttonForPeriod.titleLabel?.text == "buttonForPeriodForDays".localized()  && self.textFieldTimes.text == "1" {
                period = "buttonForPeriodForOneDay".localized()
            } else if buttonForPeriod.titleLabel?.text == "buttonForPeriodForWeeks".localized() && self.textFieldTimes.text != "1"{
                period = "buttonForPeriodForWeeks".localized()
            } else if buttonForPeriod.titleLabel?.text == "buttonForPeriodForWeeks".localized() && self.textFieldTimes.text == "1"{
                period = "buttonForPeriodForOneWeek".localized()
            } else if buttonForPeriod.titleLabel?.text == "buttonForPeriodForMonths".localized() && self.textFieldTimes.text != "1" {
                period = "buttonForPeriodForMonths".localized()
            } else if buttonForPeriod.titleLabel?.text == "buttonForPeriodForMonths".localized() && self.textFieldTimes.text == "1" {
                period = "buttonForPeriodForOneMonth".localized()
            } else if buttonForPeriod.titleLabel?.text == "buttonForPeriodForYears".localized() && self.textFieldTimes.text != "1"{
                period = "buttonForPeriodForYears".localized()
            } else if buttonForPeriod.titleLabel?.text == "buttonForPeriodForYears".localized() && self.textFieldTimes.text == "1" {
                period = "buttonForPeriodForOneYear".localized()
            }
            
            
            
            //self.enteredDateLabel.text = "Weekly for \(String(describing: self.textFieldTimes.text!)) \(period)"
            
             self.enteredDateLabel.text = LocalizedString.weeklyfor.localized + "\(String(describing: self.textFieldTimes.text!)) \(period)"
            
            
            if kindOfCostSegment.selectedSegmentIndex == 0 {
                self.enteredImageLabel.image = self.buttonWater.image(for: .normal)
            } else if kindOfCostSegment.selectedSegmentIndex == 1 {
                self.enteredImageLabel.image = self.buttonBook.image(for: .normal)
            } else {
                self.enteredImageLabel.image = self.buttonDiamond.image(for: .normal)
            }
            
            
            
            //LOOP----------------------------------
        }
            //once we entered repeated cost to go back to once
           // self.textFieldTimes.text = "1"
            self.segmentForRepeated.selectedSegmentIndex = 0
           // self.labelDaysToYears.text = "time"
            arrangeTimesLineToBeInvisible()
            self.nameTextField.text = ""
            self.costTextField.text = ""
            //once we entered repeated cost to go back to once
            
         } else {
            let emptyFieldsAlert3 = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                      message: LocalizedString.forRepeatedcostsRepetitions.localized,
                                                      preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                         style: UIAlertAction.Style.default,
                                         handler: nil)
            
            emptyFieldsAlert3.addAction(okAction)
            
            self.present(emptyFieldsAlert3, animated:true, completion: nil)
            
            //self.textFieldTimes.becomeFirstResponder()
            
            
            
            
            
        }
            
            
            
            
            
    }
    
    
    
    func saveMonthlyExpense(){
        
        let nf = NumberFormatter()
        nf.locale = Locale.current
        
         if !(textFieldTimes.text?.isEmpty)! {
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print("app dir: \(documentsPath)")
        let idPath = Bundle.path(forResource: "expenseID", ofType: ".dat", inDirectory: documentsPath)
        let e:ExpenseID = NSKeyedUnarchiver.unarchiveObject(withFile: idPath!) as! ExpenseID
        
            if buttonForPeriod.titleLabel?.text == stringButtonMonths.localized(){
                self.times = Int(self.textFieldTimes.text!)!
            } else if buttonForPeriod.titleLabel?.text == stringButtonYears.localized(){
                self.times = Int(self.textFieldTimes.text!)! * 12
            }
            
        //self.times = Int(self.textFieldTimes.text!)!
        let overallCost =  Double(times) * (nf.number(from: self.costTextField.text!) as? Double)!
            //currency Format------>
            let myFormatter = NumberFormatter()
            myFormatter.numberStyle = .currency
            let stringOfOverallCost = myFormatter.string(from: overallCost as NSNumber)
            self.labelOfOverallCost.text = stringOfOverallCost
            //currency Format------<
            
       // self.labelOfOverallCost.text = String(overallCost)
        self.labelOfEnteredTitle.text = LocalizedString.overAllCost.localized
        
        for i in 0...times - 1 {
            
            let date = self.datePicker.date
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            let day = calendar.component(.day, from: date)
            let hour = calendar.component(.hour, from: date)
            
            print("\(year)")
            print("\(month)")
            print("\(day)")
            print("\(hour)")
            
            
            let components: NSDateComponents = NSDateComponents()
            components.year = year
            components.month = month + i
            components.weekOfYear = week
            components.day = day
            components.hour = 7
            let iDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            
            
            
            
            // Now use e.nextID and save OneExpense to say 1.dat if e.nextID == 1 and so on.
            let pathToSave = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let fileName = (e.nextID)!.description + ".dat"
            let fullPath = pathToSave + "/" + fileName
            
            if kindOfCostSegment.selectedSegmentIndex == 0 {
                let oneSavedExpense = OneExpense (size: nf.number(from: self.costTextField.text!) as? Double,
                                                  cash: self.cashOrCardSwitch.isOn,
                                                  date: iDate as Date,
                                                  kind: "Acost"/*self.labelWater.text*/,
                                                  note: LocalizedString.monthlyNote.localized + " " + self.nameTextField.text!,
                                                  expenseID: e.nextID,
                                                 filePath: fullPath.description)
                NSKeyedArchiver.archiveRootObject(oneSavedExpense ,toFile: fullPath)
                self.enteredNameLabel.text = "Acost"
                self.enteredImageLabel.image = self.buttonWater.image(for: .normal)
                
            } else if kindOfCostSegment.selectedSegmentIndex == 1 {
                let oneSavedExpense = OneExpense (size: nf.number(from: self.costTextField.text!) as? Double,
                                                  cash: self.cashOrCardSwitch.isOn,
                                                  date: iDate as Date,
                                                  kind: "Bcost"/*self.labelBook.text*/,
                                                  note: LocalizedString.monthlyNote.localized + " " + self.nameTextField.text!,
                                                  expenseID: e.nextID,
                                                 filePath: fullPath.description)
                NSKeyedArchiver.archiveRootObject(oneSavedExpense ,toFile: fullPath)
                self.enteredNameLabel.text = "Bcost"
                self.enteredImageLabel.image = self.buttonBook.image(for: .normal)
            } else {
                let oneSavedExpense = OneExpense (size: nf.number(from: self.costTextField.text!) as? Double,
                                                  cash: self.cashOrCardSwitch.isOn,
                                                  date: iDate as Date,
                                                  kind: "Ccost"/*self.labelDiamond.text*/,
                                                  note: LocalizedString.monthlyNote.localized + " " + self.nameTextField.text!,
                                                  expenseID: e.nextID,
                                                  filePath: fullPath.description)
                NSKeyedArchiver.archiveRootObject(oneSavedExpense ,toFile: fullPath)
                self.enteredNameLabel.text = "Ccost"
                self.enteredImageLabel.image = self.buttonDiamond.image(for: .normal)
            }
            
            
            e.nextID = e.nextID! + 1
            NSKeyedArchiver.archiveRootObject(e, toFile: idPath!)
            
            self.enteredNameLabel.text = self.nameTextField.text
            //self.nameTextField.text = ""
            
            
            
            if self.cashOrCardSwitch.isOn {
                enteredSizeLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            } else {
                enteredSizeLabel.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
                
            }
            
            
            //In order to show the entered Cost with the suitable currency---->
            
            let numberEntered = nf.number(from: self.costTextField.text!) as? Double
            let myFormatter = NumberFormatter()
            myFormatter.numberStyle = .currency
            let stringrOfEnteredFormattedCost = myFormatter.string(from: numberEntered! as NSNumber)
            self.enteredSizeLabel.text = stringrOfEnteredFormattedCost
            
            //In order to show the entered Cost with the suitable currency----<
            
            
            //self.enteredSizeLabel.text = self.costTextField.text
            //self.costTextField.text = ""
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
            dateFormatter.dateFormat =  stringOfDate.regionize()
            
            
            var period = "months"
            
            if buttonForPeriod.titleLabel?.text == stringButtonDays.localized()  && self.textFieldTimes.text != "1"{
                period = stringButtonDays.localized()
            } else if buttonForPeriod.titleLabel?.text == stringButtonDays.localized()  && self.textFieldTimes.text == "1" {
                period = stringOneDay.localized()
            } else if buttonForPeriod.titleLabel?.text == stringButtonWeeks.localized() && self.textFieldTimes.text != "1"{
                period = stringButtonWeeks.localized()
            } else if buttonForPeriod.titleLabel?.text == stringButtonWeeks.localized() && self.textFieldTimes.text == "1"{
                period = stringOneWeek.localized()
            } else if buttonForPeriod.titleLabel?.text == stringButtonMonths.localized() && self.textFieldTimes.text != "1" {
                period = stringButtonMonths.localized()
            } else if buttonForPeriod.titleLabel?.text == stringButtonMonths.localized() && self.textFieldTimes.text == "1" {
                period = stringOneMonth.localized()
            } else if buttonForPeriod.titleLabel?.text == stringButtonYears.localized() && self.textFieldTimes.text != "1"{
                period = stringButtonYears.localized()
            } else if buttonForPeriod.titleLabel?.text == stringButtonYears.localized() && self.textFieldTimes.text == "1" {
                period = stringOneYear.localized()
            }
            
            
            
           // self.enteredDateLabel.text = "Monthly for \(String(describing: self.textFieldTimes.text!)) \(period)"//dateFormatter.string(from: self.datePicker.date) //String(describing: self.datePicker.date)
            
            self.enteredDateLabel.text = LocalizedString.monthlyfor.localized + "\(String(describing: self.textFieldTimes.text!)) \(period)"
            
            if kindOfCostSegment.selectedSegmentIndex == 0 {
                self.enteredImageLabel.image = self.buttonWater.image(for: .normal)
            } else if kindOfCostSegment.selectedSegmentIndex == 1 {
                self.enteredImageLabel.image = self.buttonBook.image(for: .normal)
            } else {
                self.enteredImageLabel.image = self.buttonDiamond.image(for: .normal)
            }
            
            
            
            //LOOP----------------------------------
        }
            //once we entered repeated cost to go back to once
           // self.textFieldTimes.text = "1"
            self.segmentForRepeated.selectedSegmentIndex = 0
           // self.labelDaysToYears.text = "time"
            arrangeTimesLineToBeInvisible()
            self.nameTextField.text = ""
            self.costTextField.text = ""
            //once we entered repeated cost to go back to once
         } else {
            let emptyFieldsAlert3 = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                      message: LocalizedString.forRepeatedcostsRepetitions.localized,
                                                      preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                         style: UIAlertAction.Style.default,
                                         handler: nil)
            
            emptyFieldsAlert3.addAction(okAction)
            
            self.present(emptyFieldsAlert3, animated:true, completion: nil)
            
            //self.textFieldTimes.becomeFirstResponder()
            
            
            
            
            
        }
            
            
            
            
            
            
    }
    
    
    
    
    
    func saveYearlyExpense(){
        //For DOT.COMMA issue
        let nf = NumberFormatter()
        nf.locale = Locale.current
        
        
         if !(textFieldTimes.text?.isEmpty)! {
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print("app dir: \(documentsPath)")
        let idPath = Bundle.path(forResource: "expenseID", ofType: ".dat", inDirectory: documentsPath)
        let e:ExpenseID = NSKeyedUnarchiver.unarchiveObject(withFile: idPath!) as! ExpenseID
        
        
        self.times = Int(self.textFieldTimes.text!)!
        let overallCost =  Double(times) * (nf.number(from: self.costTextField.text!) as? Double)!
            //currency Format------>
            let myFormatter = NumberFormatter()
            myFormatter.numberStyle = .currency
            let stringOfOverallCost = myFormatter.string(from: overallCost as NSNumber)
            self.labelOfOverallCost.text = stringOfOverallCost
            //currency Format------<
            
       // self.labelOfOverallCost.text = String(overallCost)
        self.labelOfEnteredTitle.text = LocalizedString.overAllCost.localized
        
        for i in 0...times - 1 {
            
            let date = self.datePicker.date
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            let day = calendar.component(.day, from: date)
            let hour = calendar.component(.hour, from: date)
            
            print("\(year)")
            print("\(month)")
            print("\(day)")
            print("\(hour)")
            
            
            let components: NSDateComponents = NSDateComponents()
            components.year = year + i
            components.month = month
            components.weekOfYear = week
            components.day = day
            components.hour = 7
            let iDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            
            
            
            
            // Now use e.nextID and save OneExpense to say 1.dat if e.nextID == 1 and so on.
            let pathToSave = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let fileName = (e.nextID)!.description + ".dat"
            let fullPath = pathToSave + "/" + fileName
            
            if kindOfCostSegment.selectedSegmentIndex == 0 {
                let oneSavedExpense = OneExpense (size: nf.number(from: self.costTextField.text!) as? Double,
                                                  cash: self.cashOrCardSwitch.isOn,
                                                  date: iDate as Date,
                                                  kind: "Acost"/*self.labelWater.text*/,
                                                  note: LocalizedString.yearlyNote.localized + " " + self.nameTextField.text!,
                                                  expenseID: e.nextID,
                                                  filePath: fullPath.description)
                NSKeyedArchiver.archiveRootObject(oneSavedExpense ,toFile: fullPath)
                self.enteredNameLabel.text = "Acost"
                self.enteredImageLabel.image = self.buttonWater.image(for: .normal)
                
            } else if kindOfCostSegment.selectedSegmentIndex == 1 {
                let oneSavedExpense = OneExpense (size: nf.number(from: self.costTextField.text!) as? Double,
                                                  cash: self.cashOrCardSwitch.isOn,
                                                  date: iDate as Date,
                                                  kind: "Bcost"/*self.labelBook.text*/,
                                                  note: LocalizedString.yearlyNote.localized + " " + self.nameTextField.text!,
                                                  expenseID: e.nextID,
                                                  filePath: fullPath.description)
                NSKeyedArchiver.archiveRootObject(oneSavedExpense ,toFile: fullPath)
                self.enteredNameLabel.text = "Bcost"
                self.enteredImageLabel.image = self.buttonBook.image(for: .normal)
            } else {
                let oneSavedExpense = OneExpense (size: nf.number(from: self.costTextField.text!) as? Double,
                                                  cash: self.cashOrCardSwitch.isOn,
                                                  date: iDate as Date,
                                                  kind: "Ccost"/*self.labelDiamond.text*/,
                                                  note: LocalizedString.yearlyNote.localized + " " + self.nameTextField.text!,
                                                  expenseID: e.nextID,
                                                  filePath: fullPath.description)
                NSKeyedArchiver.archiveRootObject(oneSavedExpense ,toFile: fullPath)
                self.enteredNameLabel.text = "Ccost"
                self.enteredImageLabel.image = self.buttonDiamond.image(for: .normal)
            }
            
            
            e.nextID = e.nextID! + 1
            NSKeyedArchiver.archiveRootObject(e, toFile: idPath!)
            
            self.enteredNameLabel.text = self.nameTextField.text
            //self.nameTextField.text = ""
            
            
            
            if self.cashOrCardSwitch.isOn {
                enteredSizeLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            } else {
                enteredSizeLabel.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
                
            }
            
            
            
            //In order to show the entered Cost with the suitable currency---->
            
            let numberEntered = nf.number(from: self.costTextField.text!) as? Double
            let myFormatter = NumberFormatter()
            myFormatter.numberStyle = .currency
            let stringrOfEnteredFormattedCost = myFormatter.string(from: numberEntered! as NSNumber)
            self.enteredSizeLabel.text = stringrOfEnteredFormattedCost
            
            //In order to show the entered Cost with the suitable currency----<
            
            
            //self.enteredSizeLabel.text = self.costTextField.text
            //self.costTextField.text = ""
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
            dateFormatter.dateFormat =  stringOfDate.regionize()
            
           // self.enteredDateLabel.text = "Yearly for \(String(describing: self.textFieldTimes.text!)) years"//dateFormatter.string(from: self.datePicker.date) //String(describing: self.datePicker.date)
            
            var period = "years"
            
            if buttonForPeriod.titleLabel?.text == LocalizedString.buttonYears.localized && self.textFieldTimes.text != "1"{
                period = LocalizedString.buttonYears.localized
            } else if buttonForPeriod.titleLabel?.text == LocalizedString.buttonYears.localized && self.textFieldTimes.text == "1" {
                period = LocalizedString.oneYear.localized
            }
            
            
            
            self.enteredDateLabel.text = LocalizedString.yearlyfor.localized + "\(String(describing: self.textFieldTimes.text!)) \(period)"
            
            if kindOfCostSegment.selectedSegmentIndex == 0 {
                self.enteredImageLabel.image = self.buttonWater.image(for: .normal)
            } else if kindOfCostSegment.selectedSegmentIndex == 1 {
                self.enteredImageLabel.image = self.buttonBook.image(for: .normal)
            } else {
                self.enteredImageLabel.image = self.buttonDiamond.image(for: .normal)
            }
            
            
            
            //LOOP----------------------------------
        }
            //once we entered repeated cost to go back to once
            //self.textFieldTimes.text = "1"
            self.segmentForRepeated.selectedSegmentIndex = 0
            //self.labelDaysToYears.text = "time"
            arrangeTimesLineToBeInvisible()
            self.nameTextField.text = ""
            self.costTextField.text = ""
            //once we entered repeated cost to go back to once
            
            
         } else {
            let emptyFieldsAlert3 = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                      message: LocalizedString.forRepeatedcostsRepetitions.localized,
                                                      preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                         style: UIAlertAction.Style.default,
                                         handler: nil)
            
            emptyFieldsAlert3.addAction(okAction)
            
            self.present(emptyFieldsAlert3, animated:true, completion: nil)
            
            //self.textFieldTimes.becomeFirstResponder()
            
            
            
            
            
        }
        
    }
    
    
    
    
    
    
    //MARK: TextFields
    
  //hiding the keyboard=========================================================
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        costTextField.resignFirstResponder()
        nameTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //costTextField.resignFirstResponder()
       // nameTextField.resignFirstResponder()
        self.view.endEditing(true)
        
    }
    
    
    
    //decimal input
    /*
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        guard let oldText = textField.text, let r = Range(range, in: oldText) else {
            return true
        }
        
        //If we entering digits to Cost Text Field
       if textField.tag == 0 {
        
        let newText = oldText.replacingCharacters(in: r, with: string)
        let isNumeric = newText.isEmpty || (Double(newText) != nil)
        let numberOfDots = newText.components(separatedBy: ".").count - 1
        
      //  let numberOfCommas = newText.components(separatedBy: ",").count - 1
        
        var numberOfDecimalDigits: Int
        if let dotIndex = newText.index(of: ".") {
            numberOfDecimalDigits = newText.distance(from: dotIndex, to: newText.endIndex) - 1
            // numberOfDecimalDigits = newText.distance(from: commaIndex, to: newText.endIndex) - 1
        } else {
            numberOfDecimalDigits = 0
        }
        
        
        
        
    
     
        
        
        return isNumeric && numberOfDots <= 1 && numberOfDecimalDigits <= 2
            
            
        //but if we enter digits in name
       } else {
           return true
        }
        
        
    }*/
    
    
    /*
    //2
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let dotString = "."
        
    //    if textField.tag == 0 {
            
        if let text = textField.text {
            let isDeleteKey = string.isEmpty
            
            if !isDeleteKey {
                if text.contains(dotString) {
                    if text.components(separatedBy: dotString)[1].count == 2 {
                        
                        return false
                        
                    }
                    
                }
                
            }
        }
            
            
            
            //tag if
    //    } else {
    //        return true
    //    }
        
        
        
    }
    */
    //A really, realley wonderful piece of code that will permit write anything on note textField and will allow only 2 decimals after comma or dot
    //3
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        //comma for Europe and dot for USA
        let dotString = "."
        let commaString = ","
        
        
        
    //if I am writing on on cost TextField
    if textField.tag == 0 {
        
        if let text = textField.text {
            let isDeleteKey = string.isEmpty
            
            //if is not an empty text Field...
            if !isDeleteKey {
                
             //...and it contains a dot...
                if text.contains(dotString){
                    
                    //...stop 2 digits after the dot
                    if text.components(separatedBy: dotString)[1].count == 2 {
                        return false
                        }
                }
                
                //...but if it contains a comma...
                if text.contains(commaString) {
                    
                         //...stop 2 digits after the comma
                        if text.components(separatedBy: commaString)[1].count == 2 {
                            return false
                        }
                }
                    
           } //....but if it is an empty cost text Field do nothing
                
            }//there is no text
        
        
        
       //Not to allow more than one dot or comma
        
        let countdots = (textField.text?.components(separatedBy: ".").count)! - 1
        let countcommas = (textField.text?.components(separatedBy: ",").count)! - 1
        
        if countdots > 0  && string == "." || countcommas > 0 && string == "," {
            return false
        }
        
        
        
        
        
    }//I am not on cost text fieled
        return true
        
        
     //end of wonderful coding
   }
        
        
    
    
    
    
    
    
    
    
    
    
    
    
 //==================================================
    
    //Alarm Effort
    //Months first day (Pay day)
    func setTheFirstDayOfCurrentAsMonthTheStartingDate(){
        let date = Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        print("\(year)")
        print("\(month)")
        print("\(day)")
        
        let components: NSDateComponents = NSDateComponents()
        components.year = year
        components.month = month
        components.day = 1
        let defaultDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
        
        self.monthsFirstDay = defaultDate as Date
        
        
       // print("The starting date is \(defaultDate)")
        
        
    }
    //Today
    func setTodayAsTheEndingDate(){
        let date = Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        print("\(year)")
        print("\(month)")
        print("\(day)")
        
        let components: NSDateComponents = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day + 1
        let defaultDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
        
        self.presentDay = defaultDate as Date
        
      //  print("The ending date is \(defaultDate)")
        
        
    }
    
   
    
    
    
    
    
    //createThe Array with the expenses
    func createListOfExpenses()
    {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let paths:[String] = Bundle.paths(forResourcesOfType: "dat", inDirectory: documentsPath)
        for path in paths{
            
            //print("loading expense \(path)")
            if !path.hasSuffix("expenseID.dat") && !path.hasSuffix("salary.dat") && !path.hasSuffix("mode.dat")  {
                let e:OneExpense = NSKeyedUnarchiver.unarchiveObject(withFile: path) as! OneExpense
                if e.date >= monthsFirstDay && e.date <= presentDay {
                  //  self.tableOfMonthExpences.append(e)
                }
            }
        }
    }
    
    func createListOfCoredExpenses(){
      /*
        fetchData {(done) in
            if done {
                print("data ready to load")
                
            } else {
                print("data not Fetched")
            }
            
        }
    
        if coredExpensesArray.count > 0 {
            for e in coredExpensesArray {
                if (e.date! as Date) >= monthsFirstDay && (e.date! as Date) <= presentDay {
                    self.tableOfMonthExpences.append(e)
                }
            }
        }*/
      
      fetchByDate(from: monthsFirstDay, until: presentDay)
        if coredExpensesArray.count > 0 {
        self.tableOfMonthExpences = self.coredExpensesArray
        }
        
        
        
        
        
        
        
        
        
      
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    //sum the array
    func sumMonthsExpenses(){
        //var total: Double = 0.00
        
        let sum = self.tableOfMonthExpences.reduce(0, {$0 + $1.size})
        self.sumOfMonthsExpensesToDate = sum
        print("sumCore = \(sum)")
        
        /*
        
        for e in self.tableOfMonthExpences  {
           // if let sizeOfEachExpense = e.size{
            if let sizeOfEachExpense = e.size {
                total += sizeOfEachExpense
            }
        }
        self.sumOfMonthsExpensesToDate = total*/
    }
    
    //check the mode
    func findTheStoredModePropertyUnachiveItAndUseItToPutTheVARToTheCorrectCondition(){
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        
        print("app dir: \(documentsPath)")
        if Bundle.path(forResource: "mode", ofType: ".dat", inDirectory: documentsPath) != nil {
        let modePath = Bundle.path(forResource: "mode", ofType: ".dat", inDirectory: documentsPath)
        let modeState = NSKeyedUnarchiver.unarchiveObject(withFile: modePath!) as! IncomeModeObject
        
      //  print("The mode state was unarchived with value \(modeState.mode)")
        
        
        //and now that you found a stored Salary make the theModeInWichTheReportIs whatever the mode is=========
        
        self.modeCondition = modeState.mode
        }
    }
    
    
    
    
    
    //find stored salary if any and put it to our VAR
    func findTheSalaryAndUnarchiveIt(){
        
        //If there is a mode DAT Try to find it, utherwise we will have nil---------------------------------------
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        if Bundle.path(forResource: "mode", ofType: ".dat", inDirectory: documentsPath) != nil {
           findTheStoredModePropertyUnachiveItAndUseItToPutTheVARToTheCorrectCondition()
            
            if modeCondition {
             //   print("We are in income mode so do nothing")
            } else if Bundle.path(forResource: "salary", ofType: ".dat", inDirectory: documentsPath) != nil {
                
                let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
                print("app dir: \(documentsPath)")
                let salaryPath = Bundle.path(forResource: "salary", ofType: ".dat", inDirectory: documentsPath)
                let salaryStored = NSKeyedUnarchiver.unarchiveObject(withFile: salaryPath!) as! SalaryObject
                
               // print("We found the stored salary to be\(String(describing: salaryStored.income)) in \(String(describing: salaryPath))")
                //load our Var with the result=======================
                self.storedSalary = Double(salaryStored.income!)
            }
         }
    }
    
    
    func extractTheSalaryAndCalculatePerCent(){
       
        if modeCondition {
          //  print("lazy as a man can be")
        } else {
            findTheSalaryAndUnarchiveIt()
            
        }
        
    }
    
  
    
    
    func calculateTheExpensesToSalaryPerCent(){
        //calculation for the Alarm
        
        if storedSalary > sumOfMonthsExpensesToDate {
            
        var expencesPerCentOfIncome: Double = 0.00
        expencesPerCentOfIncome = (sumOfMonthsExpensesToDate / storedSalary)*100
        self.expensesToSalaryPerCentToday = expencesPerCentOfIncome
        } else {
            var expencesPerCentOfIncome: Double = 0.00
            expencesPerCentOfIncome = ((sumOfMonthsExpensesToDate - storedSalary) / storedSalary)*100
            self.missingMoneyToSalaryPerCent = expencesPerCentOfIncome
        }
    }
    
    
    func calculateTheRemaingMoneyToSalaryPerCent(){
        //calculation for the Alarm
        
        if storedSalary > sumOfMonthsExpensesToDate {
            var remainingPerCentOfIncome: Double = 0.00
            remainingPerCentOfIncome = ((storedSalary - sumOfMonthsExpensesToDate) / storedSalary)*100
            self.remainingMoneyToSalaryPerCent = remainingPerCentOfIncome
        } else {
            
            var overSpendingPerCent : Double = 0.00
            overSpendingPerCent  = ((sumOfMonthsExpensesToDate - storedSalary) / storedSalary)*100
            self.missingMoneyToSalaryPerCent = overSpendingPerCent
        }
       
    }
    
    
    
    // MARK: - Drawing Functions
    
    
    func drawFullBarNow(colorBar: UIColor) {
        let widthOfIOSDevice = UIScreen.main.bounds.size.width
       let heightOfIOSDevice = UIScreen.main.bounds.size.height
       
       
        //iPhone
        if widthOfIOSDevice == 375 && heightOfIOSDevice == 812 {
            print("iPhone 11 Pro, iPhone XS, iPhone X & iPhone 12 mini")
            
            drawASemiRoundedBar(onX: xSalaryBariPhoneX,
                                onY: ySalaryBariPhoneX,
                                withWidth: Float(100) * xMultiplierX,
                                withHeight: 20,
                                withColor: colorBar)
            
        } else if widthOfIOSDevice == 414 && heightOfIOSDevice == 736 {
            print("iPhone 8 Plus & iPhone 7 Plus")
            
            drawASemiRoundedBar(onX: xSalaryBariPhonePlus,
                                onY: ySalaryBariPhonePlus,
                                withWidth: Float(100) * xMultiplierPlus,
                                withHeight: 20,
                                withColor: colorBar)
            
        } else if widthOfIOSDevice == 414 && heightOfIOSDevice == 896 {
            print("iPhone 11 Pro Max, iPhone XS Max &&@2x iPhone 11, iPhone XR")
           
            drawASemiRoundedBar(onX: xSalaryBariPhoneXR,
                                onY: ySalaryBariPhoneXR,
                                withWidth: Float(100) * xMultiplierXR,
                                withHeight: 20,
                                withColor: colorBar)
            
        } else if widthOfIOSDevice == 375 && heightOfIOSDevice == 667 {
            print("Full Bar in: iPhone 8, 6s Plus, 6 Plus, 7, 6s, 6, iPhone SE 2nd 14.4")
            
            drawASemiRoundedBar(onX: xSalaryBariPhone6,
                                onY: ySalaryBariPhone6,
                                withWidth: Float(100) * xMultiplier6,
                                withHeight: 20,
                                withColor: colorBar)
            
        } else if widthOfIOSDevice == 320 && heightOfIOSDevice == 568 {
            print("Full Bar in iPOD 7th")
            
            drawASemiRoundedBar(onX: xSalaryBariPhoneSE,
                                onY: ySalaryBariPhoneSE,
                                withWidth: Float(100) * xMultiplierSE,
                                withHeight: heightSalaryBariPhoneSE,
                                withColor: colorBar)
            
        } else if widthOfIOSDevice == 390 && heightOfIOSDevice == 844 {
            print("iPhone 12, 12 Pro")
            
            drawASemiRoundedBar(onX: xSalaryBariPhone12,
                                onY: ySalaryBariPhone12,
                                withWidth: Float(100) * xMultiplier12,
                                withHeight: 20,
                                withColor: colorBar)
            
        } else if widthOfIOSDevice == 428 && heightOfIOSDevice == 926 {
            print("iPhone 12 Pro Max")
           
            drawASemiRoundedBar(onX: xSalaryBariPhone12ProMax,
                                onY: ySalaryBariPhone12ProMax,
                                withWidth: Float(100) * xMultiplier12ProMax,
                                withHeight: 20,
                                withColor: colorBar)
            
        //iPad
        } else if widthOfIOSDevice == 1024 && heightOfIOSDevice == 1366 {
           print("iPad Pro 12.9-inch 1st && (2nd generation)")
            eraseSphareiPadAnyway(myY: ySphareiPadPro12)
            
            drawASemiRoundedBar(onX: xSalaryBariPadPro12,
                                onY: ySalaryBariPadPro12,
                                withWidth: Float(widthOfIOSDevice - 75),
                                withHeight: 20,
                                withColor: colorBar)
            
        } else if widthOfIOSDevice == 834 && heightOfIOSDevice == 1112 {
            print("iPad Pro 10.5-inch")
            
            eraseSphareiPadAnyway(myY: ySalaryBariPadPro)
            
            drawASemiRoundedBar(onX: xSalaryBariPadPro,
                                onY: ySalaryBariPadPro,
                                withWidth: Float(widthOfIOSDevice - 75),
                                withHeight: 20,
                                withColor: colorBar)
            
        } else if widthOfIOSDevice == 768 && heightOfIOSDevice == 1024 {
            print("iPad Pro 9.7-inch & iPad Air 2 & i Pad Mini 4")
            
            eraseSphareiPadAnyway(myY: ySalaryBariPad)
            
            drawASemiRoundedBar(onX: xSalaryBariPad,
                                onY: ySalaryBariPad,
                                withWidth: Float(widthOfIOSDevice - 75),
                                withHeight: 20,
                                withColor: colorBar)
            
        } else if widthOfIOSDevice == 834 && heightOfIOSDevice == 1194 {
            print("iPad Pro 4th 11-inch")
          
            eraseSphareiPadAnyway(myY: ySalaryBariPadPro)
            
            drawASemiRoundedBar(onX: xSalaryBariPadPro,
                                onY: ySalaryBariPadPro,
                                withWidth: Float(widthOfIOSDevice - 75),
                                withHeight: 20,
                                withColor: colorBar)
            
        } else if widthOfIOSDevice == 810 && heightOfIOSDevice == 1080 {
            print("iPad 8th")
            
            eraseSphareiPadAnyway(myY: ySalaryBariPadPro)
            
            drawASemiRoundedBar(onX: xSalaryBariPadPro,
                                onY: ySalaryBariPadPro,
                                withWidth: Float(widthOfIOSDevice - 75),
                                withHeight: 20,
                                withColor: colorBar)
           
        } else if widthOfIOSDevice == 820 && heightOfIOSDevice == 1180 {
            print("iPadAir 4th generation Yeah!!!")
            
            
            
            eraseSphareiPadAnyway(myY: ySalaryBariPadPro)
            
            drawASemiRoundedBar(onX: xSalaryBariPadPro,
                                onY: ySalaryBariPadPro,
                                withWidth: Float(widthOfIOSDevice - 75),
                                withHeight: 20,
                                withColor: colorBar)
        }
    }//Func
    
    
    
    
    
    func drawRemaingCapitalBar(){
        
        let  widthOfIOSDevice = UIScreen.main.bounds.size.width
        let  heightOfIOSDevice = UIScreen.main.bounds.size.height
        
        
        
      
        if  widthOfIOSDevice == 320 && heightOfIOSDevice == 568 {
            print("Remaining in iPOD 7th")
            
            subDrawRemainingCapitalForiPod(xlbl: xlabelSpentPerCentSE,
                                             ylbl: ylabelSpentPerCentSE,
                                             xSph: xSphareSE,
                                             ySph: ySphareSE,
                                             rad: radiusErasingSE,
                                             xBar: xSalaryBariPhoneSE,
                                             yBar: ySalaryBariPhoneSE,
                                             xMult: xMultiplierSE)
            
            
       } else if widthOfIOSDevice == 375 && heightOfIOSDevice == 667 {
        print("Remaining in: iPhone 8, 6s Plus, 6 Plus, 7, 6s, 6, iPhone SE 2nd 14.4")
         
        subDrawRemainingCapitalForiPhone(xlbl: xlabelSpentPerCent6,
                                         ylbl: ylabelSpentPerCent6,
                                         xSph: xSphare6,
                                         ySph: ySphare6,
                                         rad: radiusErasing6,
                                         xBar: xSalaryBariPhone6,
                                         yBar: ySalaryBariPhone6,
                                         xMult: xMultiplier6)
           
            
            
        } else if widthOfIOSDevice == 414 && heightOfIOSDevice == 736 {
            print("iPhone 8 Plus & iPhone 7 Plus")
            //iphone 6+, 6s+, 7+, 8+
          
            subDrawRemainingCapitalForiPhone(xlbl: xlabelSpentPerCentPlus,
                                             ylbl: ylabelSpentPerCentPlus,
                                             xSph: xSpharePlus,
                                             ySph: ySpharePlus,
                                             rad: radiusErasingPlus,
                                             xBar: xSalaryBariPhonePlus,
                                             yBar: ySalaryBariPhonePlus,
                                             xMult: xMultiplierPlus)
            
        } else if widthOfIOSDevice == 375 && heightOfIOSDevice == 812 {
            print("iPhone 11 Pro, iPhone XS, iPhone X & iPhone 12 mini")
           
            subDrawRemainingCapitalForiPhone(xlbl: xlabelSpentPerCentX,
                                             ylbl: ylabelSpentPerCentX,
                                             xSph: xSphareX,
                                             ySph: ySphareX,
                                             rad: radiusErasingX,
                                             xBar: xSalaryBariPhoneX,
                                             yBar: ySalaryBariPhoneX,
                                             xMult: xMultiplierX)
            
        } else if widthOfIOSDevice == 414 && heightOfIOSDevice == 896 {
            print("iPhone 11 Pro Max, iPhone XS Max &&@2x iPhone 11, iPhone XR")
            
            subDrawRemainingCapitalForiPhone(xlbl: xlabelSpentPerCentXR,
                                             ylbl: ylabelSpentPerCentXR,
                                             xSph: xSphareXR,
                                             ySph: ySphareXR,
                                             rad: radiusErasingXR,
                                             xBar: xSalaryBariPhoneXR,
                                             yBar: ySalaryBariPhoneXR,
                                             xMult: xMultiplierXR)
            
            
        } else if  widthOfIOSDevice == 390 && heightOfIOSDevice == 844 {
            print("iPhone 12, 12 Pro")
            
            subDrawRemainingCapitalForiPhone(xlbl: xlabelSpentPerCent12,
                                             ylbl: ylabelSpentPerCent12,
                                             xSph: xSphare12,
                                             ySph: ySphare12,
                                             rad: radiusErasing12,
                                             xBar: xSalaryBariPhone12,
                                             yBar: ySalaryBariPhone12,
                                             xMult: xMultiplier12)
            
            
        } else if widthOfIOSDevice == 428 && heightOfIOSDevice == 926 {
            print("iPhone 12 Pro Max")
            
            subDrawRemainingCapitalForiPhone(xlbl: xlabelSpentPerCent12ProMax,
                                             ylbl: ylabelSpentPerCent12ProMax,
                                             xSph: xSphare12ProMax,
                                             ySph: ySphare12ProMax,
                                             rad: radiusErasing12ProMax,
                                             xBar: xSalaryBariPhone12ProMax,
                                             yBar: ySalaryBariPhone12ProMax,
                                             xMult: xMultiplier12ProMax)
            
            
            
        } else if widthOfIOSDevice == 1024 && heightOfIOSDevice == 1366 {
           print("iPad Pro 12.9-inch 1st && (2nd generation)")
            
            subDrawRemainingCapitalForiPad(xlbl: xlabelSpentPerCentiPadPro12,
                                           ylbl: ylabelSpentPerCentiPadPro12,
                                           xSph: xSphareiPadPro12,
                                           ySph: ySphareiPadPro12,
                                           rad: radiusErasingiPadPro12,
                                           xBar: xSalaryBariPadPro12,
                                           yBar: ySalaryBariPadPro12)
            
          
        } else if widthOfIOSDevice == 834 && heightOfIOSDevice == 1112 {
            print("iPad Pro 10.5-inch")
            
            subDrawRemainingCapitalForiPad(xlbl: xlabelSpentPerCentiPadPro,
                                           ylbl: ylabelSpentPerCentiPadPro,
                                           xSph: xSphareiPadPro,
                                           ySph: ySphareiPadPro,
                                           rad: radiusErasingiPadPro,
                                           xBar: xSalaryBariPadPro,
                                           yBar: ySalaryBariPadPro)
           
        } else if widthOfIOSDevice == 768 && heightOfIOSDevice == 1024 {
            print("iPad Pro 9.7-inch & iPad Air 2 & i Pad Mini 4")
            
            subDrawRemainingCapitalForiPad(xlbl: xlabelSpentPerCentiPad,
                                           ylbl: ylabelSpentPerCentiPad,
                                           xSph: xSphareiPad,
                                           ySph: ySphareiPad,
                                           rad: radiusErasingiPad,
                                           xBar: xSalaryBariPad,
                                           yBar: ySalaryBariPad)
            
         
        } else if widthOfIOSDevice == 834 && heightOfIOSDevice == 1194 {
            print("iPad Pro 4th 11-inch")
            
            subDrawRemainingCapitalForiPad(xlbl: xlabelSpentPerCentiPadPro,
                                           ylbl: ylabelSpentPerCentiPadPro,
                                           xSph: xSphareiPadPro,
                                           ySph: ySphareiPadPro,
                                           rad: radiusErasingiPadPro,
                                           xBar: xSalaryBariPadPro,
                                           yBar: ySalaryBariPadPro)
            
            
        } else if widthOfIOSDevice == 810 && heightOfIOSDevice == 1080 {
            print("iPad 8th")
            subDrawRemainingCapitalForiPad(xlbl: xlabelSpentPerCentiPadPro,
                                           ylbl: ylabelSpentPerCentiPadPro,
                                           xSph: xSphareiPadPro,
                                           ySph: ySphareiPadPro,
                                           rad: radiusErasingiPadPro,
                                           xBar: xSalaryBariPadPro,
                                           yBar: ySalaryBariPadPro)
          
       } else if widthOfIOSDevice == 820 && heightOfIOSDevice == 1180 {
        print("iPadAir 4th generation Yeah!!!")
        subDrawRemainingCapitalForiPad(xlbl: xlabelSpentPerCentiPadPro,
                                       ylbl: ylabelSpentPerCentiPadPro,
                                       xSph: xSphareiPadPro,
                                       ySph: ySphareiPadPro,
                                       rad: radiusErasingiPadPro,
                                       xBar: xSalaryBariPadPro,
                                       yBar: ySalaryBariPadPro)
    
        
        }
        
        
    }//FunctionEnds
    
    
    
    func drawMissingCapitalBar(){
        let widthOfIOSDevice = UIScreen.main.bounds.size.width
        let heightOfIOSDevice = UIScreen.main.bounds.size.height
        
       
        //iPhone
        if widthOfIOSDevice == 375 && heightOfIOSDevice == 812 {
            print("iPhone 11 Pro, iPhone XS, iPhone X & iPhone 12 mini")
            
           subDrawMissingCapitalBariPhone(xlbl: xlabelSpentPerCentX,
                                    ylbl: ylabelSpentPerCentX,
                                    xSph: xSphareX,
                                    ySph: ySphareX,
                                    rad: radiusErasingX,
                                    radS: radiusSphareX,
                                    xBar: xSalaryBariPhoneX,
                                    yBar: ySalaryBariPhoneX,
                                    xMult: xMultiplierX)
            
        } else if widthOfIOSDevice == 414 && heightOfIOSDevice == 736 {
            print("iPhone 8 Plus & iPhone 7 Plus")
            
            subDrawMissingCapitalBariPhone(xlbl: xlabelSpentPerCentPlus,
                                     ylbl: ylabelSpentPerCentPlus,
                                     xSph: xSpharePlus,
                                     ySph: ySpharePlus,
                                     rad: radiusErasingPlus,
                                     radS: radiusSpharePlus,
                                     xBar: xSalaryBariPhonePlus,
                                     yBar: ySalaryBariPhonePlus,
                                     xMult: xMultiplierPlus)
            
        } else if widthOfIOSDevice == 414 && heightOfIOSDevice == 896 {
            print("iPhone 11 Pro Max, iPhone XS Max &&@2x iPhone 11, iPhone XR")
            
            subDrawMissingCapitalBariPhone(xlbl: xlabelSpentPerCentXR,
                                     ylbl: ylabelSpentPerCentXR,
                                     xSph: xSphareXR,
                                     ySph: ySphareXR,
                                     rad: radiusErasingXR,
                                     radS: radiusSphareXR,
                                     xBar: xSalaryBariPhoneXR,
                                     yBar: ySalaryBariPhoneXR,
                                     xMult: xMultiplierXR)
            
        } else if widthOfIOSDevice == 375 && heightOfIOSDevice == 667 {
            print("Missing Capital Bar: iPhone 8, 6s Plus, 6 Plus, 7, 6s, 6, iPhone SE 2nd 14.4")
           
            subDrawMissingCapitalBariPhone(xlbl: xlabelSpentPerCent6,
                                     ylbl: ylabelSpentPerCent6,
                                     xSph: xSphare6,
                                     ySph: ySphare6,
                                     rad: radiusErasing6,
                                     radS: radiusSphare6,
                                     xBar: xSalaryBariPhone6,
                                     yBar: ySalaryBariPhone6,
                                     xMult: xMultiplier6)
            
            
        } else if widthOfIOSDevice == 320 && heightOfIOSDevice == 568 {
            print("Missing in iPOD 7th")
            
            
            subDrawMissingCapitalBariPod(xlbl: xlabelSpentPerCentSE,
                                     ylbl: ylabelSpentPerCentSE,
                                     xSph: xSphareSE,
                                     ySph: ySphareSE,
                                     rad: radiusErasingSE,
                                     radS: radiusSphareSE,
                                     xBar: xSalaryBariPhoneSE,
                                     yBar: ySalaryBariPhoneSE,
                                     xMult: xMultiplierSE)
            
           
        } else if widthOfIOSDevice == 390 && heightOfIOSDevice == 844 {
            print("iPhone 12, 12 Pro")
            
            subDrawMissingCapitalBariPhone(xlbl: xlabelSpentPerCent12,
                                     ylbl: ylabelSpentPerCent12,
                                     xSph: xSphare12,
                                     ySph: ySphare12,
                                     rad: radiusErasing12,
                                     radS: radiusSphare12,
                                     xBar: xSalaryBariPhone12,
                                     yBar: ySalaryBariPhone12,
                                     xMult: xMultiplier12)
           
        } else if widthOfIOSDevice == 428 && heightOfIOSDevice == 926 {
            print("iPhone 12 Pro Max")
            subDrawMissingCapitalBariPhone(xlbl: xlabelSpentPerCent12ProMax,
                                     ylbl: ylabelSpentPerCent12ProMax,
                                     xSph: xSphare12ProMax,
                                     ySph: ySphare12ProMax,
                                     rad: radiusErasing12ProMax,
                                     radS: radiusSphare12ProMax,
                                     xBar: xSalaryBariPhone12ProMax,
                                     yBar: ySalaryBariPhone12ProMax,
                                     xMult: xMultiplier12ProMax)
         
        //iPad
        } else if widthOfIOSDevice == 1024 && heightOfIOSDevice == 1366 {
           print("iPad Pro 12.9-inch 1st && (2nd generation)")
            
            subDrawMissingCapitalBariPad(xlbl: xlabelSpentPerCentiPadPro12,
                                         ylbl: ylabelSpentPerCentiPadPro12,
                                         xSph: xSphareiPadPro12,
                                         ySph: ySphareiPadPro12,
                                         rad: radiusErasingiPadPro12,
                                         radS: radiusSphareiPadPro12,
                                         xBar: xSalaryBariPadPro12,
                                         yBar: ySalaryBariPadPro12)
           
        } else if widthOfIOSDevice == 834 && heightOfIOSDevice == 1112 {
            print("iPad Pro 10.5-inch")
           
            subDrawMissingCapitalBariPad(xlbl: xlabelSpentPerCentiPadPro,
                                         ylbl: ylabelSpentPerCentiPadPro,
                                         xSph: xSphareiPadPro,
                                         ySph: ySphareiPadPro,
                                         rad: radiusErasingiPadPro,
                                         radS: radiusSphareiPadPro,
                                         xBar: xSalaryBariPadPro,
                                         yBar: ySalaryBariPadPro)
            
            
            
        } else if widthOfIOSDevice == 768 && heightOfIOSDevice == 1024 {
            print("iPad Pro 9.7-inch & iPad Air 2 & i Pad Mini 4")
            
            subDrawMissingCapitalBariPad(xlbl: xlabelSpentPerCentiPad,
                                         ylbl: ylabelSpentPerCentiPad,
                                         xSph: xSphareiPad,
                                         ySph: ySphareiPad,
                                         rad: radiusErasingiPad,
                                         radS: radiusSphareiPad,
                                         xBar: xSalaryBariPad,
                                         yBar: ySalaryBariPad)
            
         
        } else if widthOfIOSDevice == 834 && heightOfIOSDevice == 1194 {
            print("iPad Pro 4th 11-inch")
            
            subDrawMissingCapitalBariPad(xlbl: xlabelSpentPerCentiPadPro,
                                         ylbl: ylabelSpentPerCentiPadPro,
                                         xSph: xSphareiPadPro,
                                         ySph: ySphareiPadPro,
                                         rad: radiusErasingiPadPro,
                                         radS: radiusSphareiPadPro,
                                         xBar: xSalaryBariPadPro,
                                         yBar: ySalaryBariPadPro)
           
        } else if widthOfIOSDevice == 810 && heightOfIOSDevice == 1080 {
            print("iPad 8th")
           
            subDrawMissingCapitalBariPad(xlbl: xlabelSpentPerCentiPadPro,
                                         ylbl: ylabelSpentPerCentiPadPro,
                                         xSph: xSphareiPadPro,
                                         ySph: ySphareiPadPro,
                                         rad: radiusErasingiPadPro,
                                         radS: radiusSphareiPadPro,
                                         xBar: xSalaryBariPadPro,
                                         yBar: ySalaryBariPadPro)
            
        } else if widthOfIOSDevice == 820 && heightOfIOSDevice == 1180 {
            print("iPadAir 4th generation Yeah!!!")
            subDrawMissingCapitalBariPad(xlbl: xlabelSpentPerCentiPadPro,
                                         ylbl: ylabelSpentPerCentiPadPro,
                                         xSph: xSphareiPadPro,
                                         ySph: ySphareiPadPro,
                                         rad: radiusErasingiPadPro,
                                         radS: radiusSphareiPadPro,
                                         xBar: xSalaryBariPadPro,
                                         yBar: ySalaryBariPadPro)
        
        }
        
        
    }//Func
    
    
    
    
    
    
    
    
    
    func subDrawRemainingCapitalForiPhone(xlbl: Int, ylbl: Int, xSph: Int, ySph: Int, rad: Int, xBar: Int, yBar: Int, xMult: Float){
        
       // let  widthOfIOSDevice = UIScreen.main.bounds.size.width
       // let  heightOfIOSDevice = UIScreen.main.bounds.size.height
        
        self.labelForSpentPerCentIfInSalary.frame.origin = CGPoint(x: xlbl, y: ylbl )
       if remainingMoneyToSalaryPerCent > 50 {
           eraseExplotionSphare(onX: xSph, onY: ySph, withRadius: rad)
           drawFullBarNow(colorBar: UIColor.white)
           drawASemiRoundedBar(onX: xBar,
                               onY: yBar,
                               withWidth: Float(remainingMoneyToSalaryPerCent) * xMult,
                               withHeight: 20,
                               withColor: UIColor.green)
           self.labelForSpentPerCentIfInSalary.textColor = UIColor.brown
       } else if remainingMoneyToSalaryPerCent <= 50 && remainingMoneyToSalaryPerCent > 20 {
           eraseExplotionSphare(onX: xSph, onY: ySph, withRadius: rad)
           drawFullBarNow(colorBar: UIColor.white)
           drawASemiRoundedBar(onX: xBar,
                               onY: yBar,
                               withWidth: Float(remainingMoneyToSalaryPerCent) * xMult,
                               withHeight: 20,
                               withColor: UIColor.cyan)
           self.labelForSpentPerCentIfInSalary.textColor = UIColor.brown
       } else if remainingMoneyToSalaryPerCent <= 20 && remainingMoneyToSalaryPerCent >= 0 {
           eraseExplotionSphare(onX: xSph, onY: ySph, withRadius:rad)
           drawFullBarNow(colorBar: UIColor.white)
           drawASemiRoundedBar(onX: xBar,
                               onY: yBar,
                               withWidth: Float(remainingMoneyToSalaryPerCent) * xMult,
                               withHeight: 20,
                               withColor: UIColor.red)
           self.labelForSpentPerCentIfInSalary.textColor = UIColor.red
       }
       
       
    }//Sub
    
    
    func subDrawRemainingCapitalForiPod(xlbl: Int, ylbl: Int, xSph: Int, ySph: Int, rad: Int, xBar: Int, yBar: Int, xMult: Float){
        
       // let  widthOfIOSDevice = UIScreen.main.bounds.size.width
       // let  heightOfIOSDevice = UIScreen.main.bounds.size.height
        
        self.labelForSpentPerCentIfInSalary.frame.origin = CGPoint(x: xlbl, y: ylbl )
       if remainingMoneyToSalaryPerCent > 50 {
           eraseExplotionSphare(onX: xSph, onY: ySph, withRadius: rad)
           drawFullBarNow(colorBar: UIColor.white)
           drawASemiRoundedBar(onX: xBar,
                               onY: yBar,
                               withWidth: Float(remainingMoneyToSalaryPerCent) * xMult,
                               withHeight: heightSalaryBariPhoneSE,
                               withColor: UIColor.green)
           self.labelForSpentPerCentIfInSalary.textColor = UIColor.brown
       } else if remainingMoneyToSalaryPerCent <= 50 && remainingMoneyToSalaryPerCent > 20 {
           eraseExplotionSphare(onX: xSph, onY: ySph, withRadius: rad)
           drawFullBarNow(colorBar: UIColor.white)
           drawASemiRoundedBar(onX: xBar,
                               onY: yBar,
                               withWidth: Float(remainingMoneyToSalaryPerCent) * xMult,
                               withHeight: heightSalaryBariPhoneSE,
                               withColor: UIColor.cyan)
           self.labelForSpentPerCentIfInSalary.textColor = UIColor.brown
       } else if remainingMoneyToSalaryPerCent <= 20 && remainingMoneyToSalaryPerCent >= 0 {
           eraseExplotionSphare(onX: xSph, onY: ySph, withRadius:rad)
           drawFullBarNow(colorBar: UIColor.white)
           drawASemiRoundedBar(onX: xBar,
                               onY: yBar,
                               withWidth: Float(remainingMoneyToSalaryPerCent) * xMult,
                               withHeight: heightSalaryBariPhoneSE,
                               withColor: UIColor.red)
           self.labelForSpentPerCentIfInSalary.textColor = UIColor.red
       }
       
       
    }//Sub
    
    
    
    
    
    
    
    func subDrawRemainingCapitalForiPad(xlbl: Int, ylbl: Int, xSph: Int, ySph: Int, rad: Int, xBar: Int, yBar: Int){
        
        let  widthOfIOSDevice = UIScreen.main.bounds.size.width
        
        self.labelForSpentPerCentIfInSalary.frame.origin = CGPoint(x: xlbl, y: ylbl )
       if remainingMoneyToSalaryPerCent > 50 {
           eraseExplotionSphare(onX: xSph, onY: ySph, withRadius: rad)
           drawFullBarNow(colorBar: UIColor.white)
           drawASemiRoundedBar(onX: xBar,
                               onY: yBar,
                               withWidth: Float(remainingMoneyToSalaryPerCent) * Float(widthOfIOSDevice/100) - 75,
                               withHeight: 20,
                               withColor: UIColor.green)
           self.labelForSpentPerCentIfInSalary.textColor = UIColor.brown
       } else if remainingMoneyToSalaryPerCent <= 50 && remainingMoneyToSalaryPerCent > 20 {
           eraseExplotionSphare(onX: xSph, onY: ySph, withRadius: rad)
           drawFullBarNow(colorBar: UIColor.white)
           drawASemiRoundedBar(onX: xBar,
                               onY: yBar,
                               withWidth: Float(remainingMoneyToSalaryPerCent) * Float(widthOfIOSDevice/100) - 75,
                               withHeight: 20,
                               withColor: UIColor.cyan)
           self.labelForSpentPerCentIfInSalary.textColor = UIColor.brown
       } else if remainingMoneyToSalaryPerCent <= 20 && remainingMoneyToSalaryPerCent >= 0 {
           eraseExplotionSphare(onX: xSph, onY: ySph, withRadius:rad)
           drawFullBarNow(colorBar: UIColor.white)
           drawASemiRoundedBar(onX: xBar,
                               onY: yBar,
                               withWidth: Float(remainingMoneyToSalaryPerCent) * Float(widthOfIOSDevice/100),
                               withHeight: 20,
                               withColor: UIColor.red)
           self.labelForSpentPerCentIfInSalary.textColor = UIColor.red
       }
      
       
    }//Sub
    
    
    
    
    
    
    func subDrawMissingCapitalBariPhone(xlbl: Int, ylbl: Int, xSph: Int, ySph: Int, rad: Int, radS: Float,  xBar: Int, yBar: Int, xMult: Float){
        self.labelForSpentPerCentIfInSalary.frame.origin = CGPoint(x:xlbl, y:ylbl)
        self.labelForSpentPerCentIfInSalary.textColor = UIColor.black
        
        if missingMoneyToSalaryPerCent <= 100 {
            
            eraseExplotionSphare(onX: xSph, onY: ySph, withRadius: rad)
            //drawFullSalaryBarForSalaryMode()
            drawFullBarNow(colorBar: UIColor.white)
            
            drawASemiRoundedBar(onX: xBar,
                                onY: yBar,
                                withWidth: Float(missingMoneyToSalaryPerCent) * xMult,
                                withHeight: 20,
                                withColor: UIColor.black)
        } else if missingMoneyToSalaryPerCent > 100 && missingMoneyToSalaryPerCent < 150 {
            eraseExplotionSphare(onX: xSph, onY: ySph, withRadius: rad)
            //drawFullMissingCapitalBar()
            drawFullBarNow(colorBar: UIColor.black)
            drawExplotionSphare(onX: xSph, onY: ySph, withRadius: radS, withColor: UIColor.black)
        }  else {
            // drawFullMissingCapitalBar()
            drawFullBarNow(colorBar: UIColor.black)
            drawExplotionSphare(onX: xSph, onY: ySph, withRadius: radS + 3, withColor: UIColor.black)
            
        }
        
    }//Func
    
    
    func subDrawMissingCapitalBariPod(xlbl: Int, ylbl: Int, xSph: Int, ySph: Int, rad: Int, radS: Float,  xBar: Int, yBar: Int, xMult: Float){
        self.labelForSpentPerCentIfInSalary.frame.origin = CGPoint(x:xlbl, y:ylbl)
        self.labelForSpentPerCentIfInSalary.textColor = UIColor.black
        
        if missingMoneyToSalaryPerCent <= 100 {
            
            eraseExplotionSphare(onX: xSph, onY: ySph, withRadius: rad + 3)
            //drawFullSalaryBarForSalaryMode()
            drawFullBarNow(colorBar: UIColor.white)
            
            drawASemiRoundedBar(onX: xBar,
                                onY: yBar,
                                withWidth: Float(missingMoneyToSalaryPerCent) * xMult,
                                withHeight: heightSalaryBariPhoneSE,
                                withColor: UIColor.black)
        } else if missingMoneyToSalaryPerCent > 100 && missingMoneyToSalaryPerCent < 150 {
            eraseExplotionSphare(onX: xSph, onY: ySph, withRadius: rad + 3)
            //drawFullMissingCapitalBar()
            drawFullBarNow(colorBar: UIColor.black)
            drawExplotionSphare(onX: xSph, onY: ySph, withRadius: radS, withColor: UIColor.black)
        }  else {
            // drawFullMissingCapitalBar()
            drawFullBarNow(colorBar: UIColor.black)
            drawExplotionSphare(onX: xSph, onY: ySph, withRadius: radS + 3, withColor: UIColor.black)
            
        }
        
    }//Func
    
    
    
    
    
    func subDrawMissingCapitalBariPad(xlbl: Int, ylbl: Int, xSph: Int, ySph: Int, rad: Int, radS: Float,  xBar: Int, yBar: Int) {
        let  widthOfIOSDevice = UIScreen.main.bounds.size.width
        
        self.labelForSpentPerCentIfInSalary.frame.origin = CGPoint(x: xlbl, y: ylbl)
        self.labelForSpentPerCentIfInSalary.textColor = UIColor.black
        
        let xPosition = Int(widthOfIOSDevice - 20)
        
        if missingMoneyToSalaryPerCent < 20 {
            eraseExplotionSphare(onX: xPosition, onY: ySph, withRadius: rad + 3)
            //drawFullSalaryBarForSalaryMode()
            drawFullBarNow(colorBar: UIColor.white)
            
            drawASemiRoundedBar(onX: xBar,
                                onY: yBar,
                                withWidth: Float(missingMoneyToSalaryPerCent) * Float(widthOfIOSDevice/100),
                                withHeight: 20,
                                withColor: UIColor.black)
        } else if missingMoneyToSalaryPerCent > 20 && missingMoneyToSalaryPerCent <= 100 {
            
            eraseExplotionSphare(onX: xPosition, onY: ySph,withRadius: rad + 3 )
           // drawFullSalaryBarForSalaryMode()
            drawFullBarNow(colorBar: UIColor.white)
            
            drawASemiRoundedBar(onX: xBar,
                                onY: yBar,
                                withWidth: Float(missingMoneyToSalaryPerCent) * Float(widthOfIOSDevice/100) - 75,
                                withHeight: 20,
                                withColor: UIColor.black)
        } else if missingMoneyToSalaryPerCent > 100 && missingMoneyToSalaryPerCent < 150 {
             eraseExplotionSphare(onX: xPosition, onY: ySph, withRadius: rad + 3)
            //drawFullMissingCapitalBar()
            drawFullBarNow(colorBar: UIColor.black)
            drawExplotionSphare(onX: xPosition, onY: ySph, withRadius: radS, withColor: UIColor.black)
        } else {
           // drawFullMissingCapitalBar()
            drawFullBarNow(colorBar: UIColor.black)
            drawExplotionSphare(onX: xPosition, onY: ySph, withRadius: radS + 3, withColor: UIColor.black)
        }
        
    
    }//Func
    
    
    
    
    
    
    
    
   
    
    func drawASemiRoundedBar(onX: Int, onY: Int, withWidth: Float, withHeight: Int, withColor: UIColor){
       
        
        let myPath = UIBezierPath(roundedRect: CGRect(x: onX, y: onY, width: Int(withWidth), height: withHeight),
                                  byRoundingCorners: [.topRight, .bottomRight],
                                  cornerRadii: CGSize(width: 10, height: 10))
        let mask = CAShapeLayer()
        mask.fillColor = withColor.cgColor
        mask.path = myPath.cgPath
        self.view.layer.addSublayer(mask)
    }
    
    
    func drawExplotionSphare(onX: Int, onY: Int, withRadius: Float, withColor: UIColor ){
     
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x:onX ,y:onY), radius: CGFloat(withRadius), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        //change the fill color
        shapeLayer.fillColor = withColor.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = withColor.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        view.layer.addSublayer(shapeLayer)
    }
    
    func eraseExplotionSphare(onX: Int, onY: Int, withRadius: Int ){
      
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x:onX ,y:onY), radius: CGFloat(withRadius), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        //change the fill color
        shapeLayer.fillColor = UIColor.init(red: 0.9960784314, green: 0.9058823529, blue: 0.7333333333, alpha: 1).cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.init(red: 0.9960784314, green: 0.9058823529, blue: 0.7333333333, alpha: 1).cgColor
        //you can change the line width
        shapeLayer.lineWidth = 3.0
        view.layer.addSublayer(shapeLayer)
    }
    
    
    func eraseSphareiPadAnyway(myY: Int) {
        let  widthOfIOSDevice = UIScreen.main.bounds.size.width
        let xPosition = Int(widthOfIOSDevice - 20)
        eraseExplotionSphare(onX: xPosition, onY: myY , withRadius: 23)
    }
    
    
    
    
    
    
    
    
    
    //position the perCent labels( we call this function whenever we loadView in salary mode)
    /*
    func positionThePerCentLabels(){
        let  widthOfIOSDevice = UIScreen.main.bounds.size.width
        let  heightOfIOSDevice = UIScreen.main.bounds.size.height
        
        
        if widthOfIOSDevice < 350 && heightOfIOSDevice < 800  {
            //small iphone
            print("the device has width \(widthOfIOSDevice) so its smaller than 350")
            
            
            labelZero.frame.origin = CGPoint(x:10, y:417 )
            labelQuarter.frame.origin = CGPoint(x:78.75, y:417 )
            labelHalf.frame.origin = CGPoint(x:147.5, y:415 )
            labelThreeQuarters.frame.origin = CGPoint(x:216.25, y:417 )
            labelFullPerCent.frame.origin = CGPoint(x:280, y:417 )
            
            
            
            
            
            
        } else if widthOfIOSDevice > 350 && widthOfIOSDevice < 700 && heightOfIOSDevice < 800 {
            //iphone
            print("the device has width \(widthOfIOSDevice) so its bigger than 350 but its not an ipad")
            
            labelZero.frame.origin = CGPoint(x:10, y:435 )
            labelQuarter.frame.origin = CGPoint(x:92.5, y:435 )
            labelHalf.frame.origin = CGPoint(x:175, y:435 )
            labelThreeQuarters.frame.origin = CGPoint(x:257.5, y:435 )
            labelFullPerCent.frame.origin = CGPoint(x:335, y:435 )
            
            
        } else if widthOfIOSDevice > 350 && widthOfIOSDevice < 700 && heightOfIOSDevice > 800 {
            //iphone X
            print("the device has heght \(heightOfIOSDevice) so its bigger than 800 so you have an X")
            
            
            labelZero.frame.origin = CGPoint(x:10, y:552 )
            labelQuarter.frame.origin = CGPoint(x:92.5, y:552 )
            labelHalf.frame.origin = CGPoint(x:175, y:552 )
            labelThreeQuarters.frame.origin = CGPoint(x:257.5, y:552 )
            labelFullPerCent.frame.origin = CGPoint(x:335, y:552 )
            
           
            
        } else  {
            //ipad
            print("the device has width \(widthOfIOSDevice) so its an ipad")
            
            labelZero.frame.origin = CGPoint(x:10, y:405 )
            labelQuarter.frame.origin = CGPoint(x: Int(widthOfIOSDevice-30)/4 + 10, y:405 )
            labelHalf.frame.origin = CGPoint(x:Int(widthOfIOSDevice-30)/2 + 10, y:405 )
            labelThreeQuarters.frame.origin = CGPoint(x: 3 * Int(widthOfIOSDevice-30)/4 + 10, y:405 )
            labelFullPerCent.frame.origin = CGPoint(x:widthOfIOSDevice - 40, y:405 )
           //buttonWater.frame.origin = CGPoint(x:100, y:81 )
            // buttonWater.frame.origin = CGPoint(x: 100, y: 81)
            
            
            
        }
        
        
        
    }
    
    
    
    */
    
    
    
    
    
    
    
    
   
    
    // MARK: - View
    
    func loadDefaultsForHomePage(){
        
        //userDefautls
        if let categoryA = UserDefaults.standard.value(forKey: "categoryA") as? String {
            labelWater.text = categoryA
        }
        
        if let categoryB = UserDefaults.standard.value(forKey: "categoryB") as? String {
            labelBook.text = categoryB
        }
        
        if let categoryC = UserDefaults.standard.value(forKey: "categoryC") as? String {
            labelDiamond.text = categoryC
        }
        /*
         if let imageA = UserDefaults.standard.value(forKey: "imageA") as? UIImage{
         buttonWater.setBackgroundImage(imageA, for: .normal)
         }
         */
        
        
        //userDefautls---------------BUTTONS-----------------------------
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
            
            let picture = UIImage(data: imageData as Data)
            buttonWater.setImage(picture, for: .normal)
        }
        
        if let imageBData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
            
            let pictureB = UIImage(data: imageBData as Data)
            buttonBook.setImage(pictureB, for: .normal)
        }
        
        if let imageCData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
            
            let pictureC = UIImage(data: imageCData as Data)
            buttonDiamond.setImage(pictureC, for: .normal)
        }
    }
    
    
    
    
    func checkIfLanguageHasChangedAndIfSoShowAlertToRestart(){
       // print("RUNOKRUNOKRUNOKRUNOKRUNOKRUNOKRUNOK")
       // let languageChosen = UserDefaults.standard.object(forKey: "AppleLanguages") as? String
       
        let wishedLanguage = self.languageUsedComingBackFromSettings
        var attentionString: String = "Attention!"
        var messageString: String = "Please restart the app in order to load the new language completely"
        var okString: String = "Ok"
        
    
        
        switch wishedLanguage {
        case "en":
            attentionString = "Attention!"
            messageString = "Please restart the app in order to load the new language completely"
            okString = "Ok"
        case "el":
            attentionString = "Προσοχή!"
            messageString = "Παρακαλώ επανεκινήστε την εφαρμοφή, ώστε τα Ελληνικά να εγκατασταθούν πλήρως."
            okString = "Εντάξει"
        case "fr":
            attentionString = "Attention!"
            messageString = "Veuillez redémarrer l'application afin de charger complètement la nouvelle langue"
            okString = "D'accord"
        case "es":
             attentionString = "Atención!"
            messageString = "Reinicie la aplicación para cargar el nuevo idioma por completo."
            okString = "De acuerdo"
            
        case "de":
            attentionString = "Achtung!"
            messageString = "Bitte starten Sie die Anwendung, um die neue Sprache vollständig zu laden."
            okString = "Ok"
            
        case "it":
            attentionString = "Attenzione!"
            messageString = "Si prega di riavviare l'applicazione per caricare completamente la nuova lingua."
            okString = "Bene"
            
        case "ru":
            attentionString = "Oсторожность!"
            messageString = "Пожалуйста, перезапустите приложение, чтобы полностью загрузить новый язык."
            okString = "OK"
            
        case "zh-Hans":
            attentionString = "警告!"
            messageString = "请重新启动应用程序以完全加载新语言"
            okString = "行"
            
            
        default:
             attentionString = "Attention!"
             messageString = "Please restart the app in order to load the new language completely"
             okString = "Ok"
        }
        
        
        
        if self.languageUsedBeforeEnteringSettings == self.languageUsedComingBackFromSettings {
            
        } else {
            let languageChangedAlert = UIAlertController(title: attentionString,
                                                         message: messageString,
                                                         preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: okString,
                                         style: UIAlertAction.Style.default,
                                         handler: nil)
            
            languageChangedAlert.addAction(okAction)
            
            self.present(languageChangedAlert, animated:true, completion: nil)
            
            
            
            
        }
        
    }
    
    
    
    func loadFreeOrPaid(){
        let isPaid = KeychainWrapper.standard.bool(forKey: myProductList.appPro) ?? false
        if isPaid {
                   self.paidVersionIsOn = true
               }
    }//Func
    
    func cleanDefaults(){
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //cleanDefaults()
        
        //UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
            
       // })
        
       loadFreeOrPaid()
        
        if #available(iOS 13.0, *) {
            self.labelWater.textColor = UIColor.brown
        } else {
            self.labelWater.textColor = UIColor.white
        }
        
        
        
       
        
        let myModel = UIDevice.current.modelName
        print("Iiiiiii my model\(myModel)")
        
        self.navigationItem.title = LocalizedString.titleMainViewIncome.localized
        self.navigationItem.rightBarButtonItem?.title = LocalizedString.navItemMainRight.localized
        self.navigationItem.leftBarButtonItem?.title = LocalizedString.navItemMainLeft.localized
        
       // self.buttonForPeriod.setTitle("buttonForPeriodForDays".localized(), for: .normal)
        
        
        self.languageUsedBeforeEnteringSettings = Bundle.main.preferredLocalizations.first
        //print("the lang is \(self.languageUsedBeforeEnteringSettings)")
        self.languageUsedComingBackFromSettings = Bundle.main.preferredLocalizations.first
        
        self.labelOfEnteredTitle.text = LocalizedString.lastStoredExpense.localized
        self.segmentForRepeated.setTitle(LocalizedString.segmentTitleOnce.localized, forSegmentAt: 0)
        self.segmentForRepeated.setTitle(LocalizedString.segmentTitleDaily.localized, forSegmentAt: 1)
        self.segmentForRepeated.setTitle(LocalizedString.segmentTitleWeekly.localized, forSegmentAt: 2)
        self.segmentForRepeated.setTitle(LocalizedString.segmentTitleMonthly.localized, forSegmentAt: 3)
        self.segmentForRepeated.setTitle(LocalizedString.segmentTitleYearly.localized, forSegmentAt: 4)
        
        
        
        
        
        
        self.saveOneExpense.layer.cornerRadius = 7
        
        self.costTextField.becomeFirstResponder()
        self.costTextField.backgroundColor = UIColor.white //init(colorLiteralRed: 80/255, green: 80/255, blue: 80/255, alpha: 0.2), forKeyPath: "_placeholderLabel.textColor")
        self.nameTextField.backgroundColor = UIColor.white //init(colorLiteralRed: 80/255, green: 80/255, blue: 80/255, alpha: 0.2), forKeyPath: "_placeholderLabel.textColor")
        
        
        loadDefaultsForHomePage()
        positionTheButtons()
        arrangeTimesLineToBeInvisible()
    
       
        
        //for keyboard hiding==============
        self.costTextField.delegate = self
       self.nameTextField.delegate = self
        //=================================
        
        //for  shouldChangeCharactersInRangeFunction to work properly
        
        self.costTextField.tag = 0
        self.nameTextField.tag = 1
        self.textFieldTimes.tag = 2
        //=================================
        
        //Everything For Salary and the Drawing Of the income Bar===========>>>>>>>>>>>>>>>>>>
       setTheFirstDayOfCurrentAsMonthTheStartingDate()
       setTodayAsTheEndingDate()
        //createListOfExpenses()
        
       createListOfCoredExpenses()
        
        /*
        print("The array with the stored nameof the files is \(tableOfMonthExpences.description)")
        for (index, value) in tableOfMonthExpences.enumerated() {
            print("In position \(index) we find \(String(describing: value.size)) " )
        }*/
        
        sumMonthsExpenses()
         print("The sum is \(sumOfMonthsExpensesToDate)")
        
       
        
        
        
        //If there is a mode DAT Try to find it, utherwise we will have nil---------------------------------------
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        if Bundle.path(forResource: "mode", ofType: ".dat", inDirectory: documentsPath) != nil {
            findTheStoredModePropertyUnachiveItAndUseItToPutTheVARToTheCorrectCondition()
        
        findTheStoredModePropertyUnachiveItAndUseItToPutTheVARToTheCorrectCondition()
        print("The mode is \(modeCondition)")
        
        
        if modeCondition {
            //drawFullSalaryBarForIncomeMode()
            self.labelForSpentPerCentIfInSalary.text = ""
            drawFullBarNow(colorBar: UIColor.white)
            
            
            self.navigationItem.title =  LocalizedString.titleMainViewIncome.localized
            print("Do nothing")
        } else {
            
            findTheSalaryAndUnarchiveIt()
            print("The stored salary is \(String(storedSalary))")
            
            
            
            calculateTheExpensesToSalaryPerCent()
            print(" We have spent the \(String(describing: expensesToSalaryPerCentToday)) % of the salary ")
           
            calculateTheRemaingMoneyToSalaryPerCent()
            print("We are left with the \(String(describing: remainingMoneyToSalaryPerCent)) % of the salary")
            let perCentFormatter = NumberFormatter()
            perCentFormatter.maximumFractionDigits = 0
            
            if storedSalary > sumOfMonthsExpensesToDate {
                self.labelForSpentPerCentIfInSalary.text = perCentFormatter.string(from: NSNumber(value:self.remainingMoneyToSalaryPerCent))! + "%"
            } else {
                self.labelForSpentPerCentIfInSalary.text = perCentFormatter.string(from: NSNumber(value:self.missingMoneyToSalaryPerCent))! + "%"
            }
            
            
           
            
            //remaining Salary on title>>>>>>>>>>>>>>>>>
            self.remainingSalary = storedSalary - sumOfMonthsExpensesToDate
            self.remainingSalary = storedSalary - sumOfMonthsExpensesToDate
            let myFormatter = NumberFormatter()
            myFormatter.numberStyle = .currency
            let stringOfRemainingSalaryForTitle = myFormatter.string(from: self.remainingSalary as NSNumber)!
            self.navigationItem.title = stringOfRemainingSalaryForTitle
            
            
            
            
            //self.navigationItem.title = String(remainingSalary)
            //remaining Salary on title<<<<<<<<<<<<<<<<<<<<<
            
            
           // positionThePerCentLabels()
            
            
          // drawFullSalaryBarForSalaryMode()
            drawFullBarNow(colorBar: UIColor.white)
            if storedSalary > sumOfMonthsExpensesToDate {
                drawRemaingCapitalBar()
            } else if storedSalary == sumOfMonthsExpensesToDate{
              // drawFullSalaryBarForSalaryMode()
                drawFullBarNow(colorBar: UIColor.white)
            } else if sumOfMonthsExpensesToDate > storedSalary && sumOfMonthsExpensesToDate < 2 * storedSalary{
                drawMissingCapitalBar()
            } else {
               // drawFullMissingCapitalBar()
                drawFullBarNow(colorBar: UIColor.black)
            }
            
        }
        
        
        //drawLines()
         //Everything For the Drawing Of the income Bar===========<<<<<<<<<<<<<<<<<<<<<<<
        
        }
        // drawLines()
                // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    
    
    
    
    
    //Renew the hour in Datepicker after every viewChange
    override func viewWillAppear(_ animated: Bool) {
        
        fetchData {(done) in
            if done {
                print("data ready to load")
            } else {
                 print("data not Fetched")
            }
        
        }
        
        
        
        
        self.datePicker.setDate(Date(), animated: false)
        self.costTextField.becomeFirstResponder()
        
       
        
        loadDefaultsForHomePage()
        
        
        //Everything For the Drawing Of the income Bar===========>>>>>>>>>>>>>>>>>>
        setTheFirstDayOfCurrentAsMonthTheStartingDate()
        setTodayAsTheEndingDate()
        
        
        //ATTENTION We empry the array so that we will not load it twice
        
        tableOfMonthExpences = []
        
         //ATTENTION We empry the array so that we will not load it twice
        
        
       // createListOfExpenses()
        createListOfCoredExpenses()
       /*
        print("The array with the stored nameof the files is \(tableOfMonthExpences.description)")
        for (index, value) in tableOfMonthExpences.enumerated() {
            print("In position \(index) we find \(String(describing: value.size)) " )
        }*/
        
        self .sumOfMonthsExpensesToDate = 0.0
        sumMonthsExpenses()
        print("The sum is \(sumOfMonthsExpensesToDate)")
        
        
        findTheStoredModePropertyUnachiveItAndUseItToPutTheVARToTheCorrectCondition()
        print("The mode is \(modeCondition)")
        
        
        if modeCondition {
            
            //drawFullSalaryBarForIncomeMode()
            self.labelForSpentPerCentIfInSalary.text = ""
            drawFullBarNow(colorBar: UIColor.white)
            
            
             self.navigationItem.title = LocalizedString.titleMainViewIncome.localized
            print("Do nothing")
        } else {
           
            findTheSalaryAndUnarchiveIt()
            print("The stored salary is \(String(storedSalary))")
            
            
            
            calculateTheExpensesToSalaryPerCent()
            print(" We have spent the \(String(describing: expensesToSalaryPerCentToday)) % of the salary ")
            
            
            calculateTheRemaingMoneyToSalaryPerCent()
            print("We are left with the \(String(describing: remainingMoneyToSalaryPerCent)) % of the salary")
            
            
            let perCentFormatter = NumberFormatter()
            perCentFormatter.maximumFractionDigits = 0
            
            if storedSalary > sumOfMonthsExpensesToDate {
                self.labelForSpentPerCentIfInSalary.text = perCentFormatter.string(from: NSNumber(value:self.remainingMoneyToSalaryPerCent))! + "%"
            } else {
                self.labelForSpentPerCentIfInSalary.text = perCentFormatter.string(from: NSNumber(value:self.missingMoneyToSalaryPerCent))! + "%"
            }
            
            
            
            
            //remaining Salary on title>>>>>>>>>>>>>>>>>
            self.remainingSalary = storedSalary - sumOfMonthsExpensesToDate
            let myFormatter = NumberFormatter()
            myFormatter.numberStyle = .currency
            let stringOfRemainingSalaryForTitle = myFormatter.string(from: self.remainingSalary as NSNumber)!
            self.navigationItem.title = stringOfRemainingSalaryForTitle
            
            //self.navigationItem.title = String(remainingSalary)
            //remaining Salary on title<<<<<<<<<<<<<<<<<<<<<
            
            
            
           // positionThePerCentLabels()
            
            
           // drawFullSalaryBarForSalaryMode()
            drawFullBarNow(colorBar: UIColor.white)
            if storedSalary > sumOfMonthsExpensesToDate {
                
              
                drawRemaingCapitalBar()
                
            } else if storedSalary == sumOfMonthsExpensesToDate{
                
              // drawFullSalaryBarForSalaryMode()
                drawFullBarNow(colorBar: UIColor.white)
            } else if sumOfMonthsExpensesToDate > storedSalary && sumOfMonthsExpensesToDate < 2 * storedSalary{
                
                drawMissingCapitalBar()
            } else {
                
                drawMissingCapitalBar()
                //drawFullMissingCapitalBar()
            }
            
        }
       //Everything For the Drawing Of the income Bar===========>>>>>>>>>>>>>>>>>>
      
        
       checkIfLanguageHasChangedAndIfSoShowAlertToRestart()
        
        
    }
    
    
    @IBAction func unwindToHomepage(segue: UIStoryboardSegue){
        
        loadDefaultsForHomePage()
        
        /*
        //userDefautls---------------LABELS-----------------------------
        if let categoryA = UserDefaults.standard.value(forKey: "categoryA") as? String {
            labelWater.text = categoryA
        }
        
        if let categoryB = UserDefaults.standard.value(forKey: "categoryB") as? String {
            labelBook.text = categoryB
        }
        
        if let categoryC = UserDefaults.standard.value(forKey: "categoryC") as? String {
            labelDiamond.text = categoryC
        }
        
         //userDefautls---------------BUTTONS-----------------------------
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
           
        let picture = UIImage(data: imageData as Data)
        buttonWater.setImage(picture, for: .normal)
        }
        
       if let imageBData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
                
       let pictureB = UIImage(data: imageBData as Data)
       buttonBook.setImage(pictureB, for: .normal)
        }
            
        if let imageCData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
                    
        let pictureC = UIImage(data: imageCData as Data)
        buttonDiamond.setImage(pictureC, for: .normal)
        }*/
        
    
        
        
    }
    
    
    //CoreDateFunctions--------------------------------------------------------
    func saveOneExpenseUsingCoreData(completion: (_ finished: Bool) -> ()){
        //get in the core data global room named "appDelegate" and get the key
         guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
         let expense = ExpenseCore(context: managedContext)
        
        //initiate your number Formatter
        let nf = NumberFormatter()
        nf.locale = Locale.current
        
        //In case the previous entry was repeated
         self.labelOfOverallCost.text = ""
       
        //Saving Starts here
            if segmentForRepeated.selectedSegmentIndex == 0 { //LoopForRepeated
            labelOfEnteredTitle.text = LocalizedString.lastStoredExpense.localized
            if !(costTextField.text?.isEmpty)!  {//LoopForCostTextField
            if !(nameTextField.text?.isEmpty)!  {//LoopForNoteTextField
                
            // ---------------The code to save with COST and NOTE full--------------------->>>>>>>>>>>
            //CORE
                    if kindOfCostSegment.selectedSegmentIndex == 0 {
                            expense.size =  nf.number(from: self.costTextField.text!) as? Double ?? 1
                            expense.cash =  self.cashOrCardSwitch.isOn
                            expense.date =  self.datePicker.date as NSDate
                            expense.kind =  "Acost"
                            expense.note =  self.nameTextField.text
                        
                    } else if kindOfCostSegment.selectedSegmentIndex == 1 {
                            expense.size =  nf.number(from: self.costTextField.text!) as? Double ?? 1
                            expense.cash =  self.cashOrCardSwitch.isOn
                            expense.date =  self.datePicker.date as NSDate
                            expense.kind =  "Bcost"
                            expense.note =  self.nameTextField.text
                        
                    } else {
                            expense.size =  nf.number(from: self.costTextField.text!) as? Double ?? 1
                            expense.cash =  self.cashOrCardSwitch.isOn
                            expense.date =  self.datePicker.date as NSDate
                            expense.kind =  "Ccost"
                            expense.note =  self.nameTextField.text
                        
                    }
                
                do {
                    try managedContext.save()
                    print("Expense saved with note filled")
                    completion(true)
                } catch {
                    print("Failed to save with note filled", error.localizedDescription)
                    completion(false)
                }
                
                
                
                
                
                
                
                
                //NOTE
                self.enteredNameLabel.text = self.nameTextField.text //put the note in ENTERED CELL...
                self.nameTextField.text = ""                         //...and empty it afterwards.
                setLastStoredExpenseExceptNoteAndCleanFields()
                
                
                // ---------------The code to save with COST and NOTE full---------------------<<<<<<<<<<
                
                } else { //if nameTextFieldIsEmpty
                
                //CORE
                if kindOfCostSegment.selectedSegmentIndex == 0 {
                    expense.size =  nf.number(from: self.costTextField.text!) as? Double ?? 1
                    expense.cash =  self.cashOrCardSwitch.isOn
                    expense.date =  self.datePicker.date as NSDate
                    expense.kind =  "Acost"
                    expense.note =  self.labelWater.text
                    //NOTE
                    self.enteredNameLabel.text = self.labelWater.text
                } else if kindOfCostSegment.selectedSegmentIndex == 1 {
                    expense.size =  nf.number(from: self.costTextField.text!) as? Double ?? 1
                    expense.cash =  self.cashOrCardSwitch.isOn
                    expense.date =  self.datePicker.date as NSDate
                    expense.kind =  "Bcost"
                    expense.note =  self.labelBook.text
                    //NOTE
                    self.enteredNameLabel.text = self.labelBook.text
                } else {
                    expense.size =  nf.number(from: self.costTextField.text!) as? Double ?? 1
                    expense.cash =  self.cashOrCardSwitch.isOn
                    expense.date =  self.datePicker.date as NSDate
                    expense.kind =  "Ccost"
                    expense.note =  self.labelDiamond.text
                    //NOTE
                    self.enteredNameLabel.text = self.labelDiamond.text
                }
                
                setLastStoredExpenseExceptNoteAndCleanFields()
                
                do {
                    try managedContext.save()
                    print("Expense saved with note empty")
                     completion(true)
                } catch {
                    print("Failed to save with note empty", error.localizedDescription)
                     completion(false)
                }
                
                
                
                
                
                }//if nameTextField
              
                    
                } else { //costTexfieldIsEmpty
                    let emptyFieldsAlert = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                             message: LocalizedString.fieldWithAmountofCost.localized,
                                                             preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                                 style: UIAlertAction.Style.default,
                                                 handler: nil)
                    
                    emptyFieldsAlert.addAction(okAction)
                    
                    self.present(emptyFieldsAlert, animated:true, completion: nil)
                } //costTexfieldIsEmpty
            
                drawTheIncomeBarOnceYouSavedACost()
                
                //end of the ONCE selected segment%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                
                //DAILY SELECTED
            } else if segmentForRepeated.selectedSegmentIndex == 1 {
                
                if !(costTextField.text?.isEmpty)! && !(nameTextField.text?.isEmpty)! {
                    //saveDailyExpense()
                    saveDailyExpenseUsingCoreData()
                    drawTheIncomeBarOnceYouSavedACost()
                   
                } else { //AlertForRepeated
                    let emptyFieldsAlert2 = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                              message: LocalizedString.forrepeatedcostsbothFields.localized,
                                                              preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                                 style: UIAlertAction.Style.default,
                                                 handler: nil)
                    emptyFieldsAlert2.addAction(okAction)
                    self.present(emptyFieldsAlert2, animated:true, completion: nil)
                }
    
                //WEEKLY SELECTED
            } else if segmentForRepeated.selectedSegmentIndex == 2 {
                if !(costTextField.text?.isEmpty)! && !(nameTextField.text?.isEmpty)! {
                    //saveWeeklyExpense()
                    saveWeeklyExpenseUsingCoreData()
                    drawTheIncomeBarOnceYouSavedACost()
                } else { //AlertForRepeated
                    
                    let emptyFieldsAlert2 = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                              message: LocalizedString.forrepeatedcostsbothFields.localized,
                                                              preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                                 style: UIAlertAction.Style.default,
                                                 handler: nil)
                    
                    emptyFieldsAlert2.addAction(okAction)
                    
                    self.present(emptyFieldsAlert2, animated:true, completion: nil)
                    
                }
                //MONTHLY SELECTED
            } else if segmentForRepeated.selectedSegmentIndex == 3 {
                
                if !(costTextField.text?.isEmpty)! && !(nameTextField.text?.isEmpty)! {
                   // saveMonthlyExpense()
                    saveMonthlyExpenseUsingCoreData()
                    drawTheIncomeBarOnceYouSavedACost()
                } else {//AlertForRepeated
                    
                    let emptyFieldsAlert2 = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                              message: LocalizedString.forrepeatedcostsbothFields.localized,
                                                              preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                                 style: UIAlertAction.Style.default,
                                                 handler: nil)
                    
                    emptyFieldsAlert2.addAction(okAction)
                    
                    self.present(emptyFieldsAlert2, animated:true, completion: nil)
                    
                }
                //YEARLY SELECTED
            } else if segmentForRepeated.selectedSegmentIndex == 4 {
                
                if !(costTextField.text?.isEmpty)! && !(nameTextField.text?.isEmpty)! {
                    //saveYearlyExpense()
                    saveYearlyExpenseUsingCoreData()
                    drawTheIncomeBarOnceYouSavedACost()
                } else {//AlertForRepeated
                    
                    let emptyFieldsAlert2 = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                              message: LocalizedString.forrepeatedcostsbothFields.localized,
                                                              preferredStyle: UIAlertController.Style.alert)
                    let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                                 style: UIAlertAction.Style.default,
                                                 handler: nil)
                    
                    emptyFieldsAlert2.addAction(okAction)
                    
                    self.present(emptyFieldsAlert2, animated:true, completion: nil)
                }
                
        }//segment4Selected
                
                
          
    }//FuncEnds
    
    
    
    
    func setLastStoredExpenseExceptNoteAndCleanFields(){
        let nf = NumberFormatter()
        nf.locale = Locale.current
        
        //NOTE
        //self.enteredNameLabel.text = self.nameTextField.text //put the note in ENTERED CELL...
        //self.nameTextField.text = ""                         //...and empty it afterwards.
        
        //CASH
        if self.cashOrCardSwitch.isOn {//color size in ENTERED CELL according to the cash bool
            enteredSizeLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        } else {
            enteredSizeLabel.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
            
        }
        
        //SIZE
        //Preparation in order to show the entered Cost with the suitable currency---->
        let numberEntered = nf.number(from: self.costTextField.text!) as? Double
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        let stringrOfEnteredFormattedCost = myFormatter.string(from: numberEntered! as NSNumber)
        //In order to show the entered Cost with the suitable currency----<
        self.enteredSizeLabel.text = stringrOfEnteredFormattedCost //put the size in ENTERED CELL...
        self.costTextField.text = ""                               //...and empty it afterwards.
        
        //DATE
        //Preparation in order to show the Date Localized and Regionized
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat =  stringOfDate.regionize()
        //in order to show the Date Localized and Regionized
        self.enteredDateLabel.text = dateFormatter.string(from: self.datePicker.date)//put the date in ENTERED CELL...
        
        //KIND
        if kindOfCostSegment.selectedSegmentIndex == 0 {
            self.enteredImageLabel.image = self.buttonWater.image(for: .normal)
        } else if kindOfCostSegment.selectedSegmentIndex == 1 {
            self.enteredImageLabel.image = self.buttonBook.image(for: .normal)
        } else {
            self.enteredImageLabel.image = self.buttonDiamond.image(for: .normal)
        }
        
    }//FunctionEnds
    
    
    
  
    
    //MARK: - Helping to Save Repeatedly
    
    
    func checkWishedTimesAndShowAlert(wishedTimes:Int, upperLimit:Int, string1:String, string2:String){
        
        //initiate your number Formatter
        let nf = NumberFormatter()
        nf.locale = Locale.current
        
        if wishedTimes < upperLimit {
            self.times = wishedTimes
        } else {
            //store only for 5 years
            self.times = upperLimit
            //and show an alert with the fantastic overall cost
           // setNotificationInPlace()
            
            let fantasticOverall = Double(wishedTimes) * (nf.number(from: self.costTextField.text!) as? Double)!
            let stringStart = string1
            let stringLast = string2
            showAlertForUpperLimitOfRepetitions(fantasticOverall: fantasticOverall, stringStart: stringStart, stringLast: stringLast)
           
           
            
        }
    }
    
    
    func showAlertForUpperLimitOfRepetitions(fantasticOverall: Double, stringStart: String, stringLast: String){
        
        let myOtherFormatter = NumberFormatter()
        myOtherFormatter.numberStyle = .currency
        let stringOffantasticOverall = myOtherFormatter.string(from: fantasticOverall as NSNumber)
        
        var alertComponets = [String]()
         alertComponets.append("")
        alertComponets.append(stringStart)
        alertComponets.append(stringLast)
        
        let overflowDailyAlert = UIAlertController(title: LocalizedString.overAllCost.localized + stringOffantasticOverall!,
                                                   message: alertComponets.joined(separator: "\n"),
                                                   preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                     style: UIAlertAction.Style.default,
                                     handler: nil)
        
        overflowDailyAlert.addAction(okAction)
        self.present(overflowDailyAlert, animated:true, completion: nil)
    }
    
    
    
    func setNotificationInPlace(){
        let costID = self.nameTextField.text! + self.costTextField.text!
        var timeToExpire: Double = 0
        var  yearsStored: String = ""
        
        let indexa = self.segmentForRepeated.selectedSegmentIndex
        
        if indexa == 1 {
            timeToExpire = 5*365*24*60*60
            yearsStored = "5"
        } else if indexa == 2 {
            timeToExpire = 10*365*24*60*60
            yearsStored = "10"
        } else if indexa == 3 {
            timeToExpire = 30*365*24*60*60
            yearsStored = "30"
        } else if indexa == 4 {
            timeToExpire = 100*365*24*60*60
            yearsStored = "100"
        }
        
        
        let content = UNMutableNotificationContent()
        content.title = "Repeated Cost reminder"
        content.subtitle = "The repeated Cost \(String(describing: self.nameTextField.text)) that was stored for \(yearsStored) years expired today"
        content.body = "Please store it again if necessary."
        content.badge = 1
        content.sound = UNNotificationSound.default
        
        
        
       // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeToExpire, repeats: false)
        
         let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
        
        
        let request = UNNotificationRequest(identifier: costID, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    
    
    func cleanUpEnteredCell(){
        //ENTERED CELL Housekeeping
        let nf = NumberFormatter()
        nf.locale = Locale.current
        
        self.sizeOfFixedCost = Double(self.costTextField.text!)
        let overallCost = Double(self.times) * (nf.number(from:  self.costTextField.text!) as? Double)!
        
        //currency Format------>
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        let stringOfOverallCost = myFormatter.string(from: overallCost as NSNumber)
        //currency Format------<
        
        //OVERALL SIZE
        self.labelOfOverallCost.text = stringOfOverallCost
        
        
        //TITLE Of Entered Cell
        self.labelOfEnteredTitle.text = LocalizedString.overAllCost.localized
        
        //NOTE
        self.enteredNameLabel.text = self.nameTextField.text
        
        //CASH
        if self.cashOrCardSwitch.isOn {
            self.enteredSizeLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        } else {
            self.enteredSizeLabel.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
            
        }
        
        //In order to show the entered Cost with the suitable currency---->
        let numberEntered = nf.number(from: self.costTextField.text!) as? Double
        myFormatter.numberStyle = .currency
        let stringrOfEnteredFormattedCost = myFormatter.string(from: numberEntered! as NSNumber)
        //In order to show the entered Cost with the suitable currency----<
        
        //SIZE
        self.enteredSizeLabel.text = stringrOfEnteredFormattedCost
        
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat =  self.stringOfDate.regionize()
        
        var period = "days"
        var repetitionsOfPeriod: Int = 0
        let indexa = self.segmentForRepeated.selectedSegmentIndex
        
        
        
        //Days
        if self.buttonForPeriod.titleLabel?.text == LocalizedString.buttonDays.localized  && self.textFieldTimes.text != "1"{
            period = LocalizedString.buttonDays.localized
            
            repetitionsOfPeriod = self.times
        //OneDay
        } else if self.buttonForPeriod.titleLabel?.text == LocalizedString.buttonDays.localized && self.textFieldTimes.text == "1" {
            period = LocalizedString.oneDay.localized
            
            repetitionsOfPeriod = 1
            
            
            
            
            
            
            
         //Weeks
        } else if self.buttonForPeriod.titleLabel?.text == LocalizedString.buttonWeeks.localized && self.textFieldTimes.text != "1"{
            period = LocalizedString.buttonWeeks.localized
            
            
         
            if indexa == 1 {  //Daily
                 repetitionsOfPeriod = self.times / 7
            } else if indexa == 2 { //Weekly
                repetitionsOfPeriod = self.times
            }
        
        //OneWeek
        } else if self.buttonForPeriod.titleLabel?.text == LocalizedString.buttonWeeks.localized  && self.textFieldTimes.text == "1"{
            period = LocalizedString.oneWeek.localized
            
            repetitionsOfPeriod = 1
            
            
            
           //Months
        } else if self.buttonForPeriod.titleLabel?.text == LocalizedString.buttonMonths.localized && self.textFieldTimes.text != "1" {
            period = LocalizedString.buttonMonths.localized
            
            
            if indexa == 1 {//Daily
                repetitionsOfPeriod = self.times / 30
            } else if indexa == 2 { //Weekly
                repetitionsOfPeriod = self.times * 7 / 30
            } else if indexa == 3 { //Monthly
                repetitionsOfPeriod = self.times
            }
            
            //OneMonth
        } else if self.buttonForPeriod.titleLabel?.text == LocalizedString.buttonMonths.localized && self.textFieldTimes.text == "1" {
            period = LocalizedString.oneMonth.localized
            
            repetitionsOfPeriod = 1
           
            
            
            //Years
        } else if self.buttonForPeriod.titleLabel?.text == LocalizedString.buttonYears.localized && self.textFieldTimes.text != "1"{
            period = LocalizedString.buttonYears.localized
            
           
             if indexa == 1 {//Daily
                repetitionsOfPeriod = self.times / 365
            } else if indexa == 2 { //Weekly
                 repetitionsOfPeriod = self.times * 7 / 365
            } else if indexa == 3 { //Monthly
                repetitionsOfPeriod = self.times / 12
            } else if indexa == 4 { //Yearly
                 repetitionsOfPeriod = self.times
            }
            
            
            
            
            
            
            //OneYear
        } else if self.buttonForPeriod.titleLabel?.text == LocalizedString.buttonYears.localized  && self.textFieldTimes.text == "1" {
            period = LocalizedString.oneYear.localized
            
              repetitionsOfPeriod = 1
            
        }//ButtonHypothesis
        
        //DATE OF Repeated
      
        if indexa == 1 {
            
             self.enteredDateLabel.text = LocalizedString.dailyfor.localized + " \(String(describing: repetitionsOfPeriod)) \(period)"
        } else if indexa == 2 {
            
             self.enteredDateLabel.text = LocalizedString.weeklyfor.localized + " \(String(describing: repetitionsOfPeriod)) \(period)"
        } else if indexa == 3 {
            self.enteredDateLabel.text = LocalizedString.monthlyfor.localized + " \(String(describing: repetitionsOfPeriod)) \(period)"
        } else if indexa == 4 {
             self.enteredDateLabel.text = LocalizedString.yearlyfor.localized + " \(String(describing: repetitionsOfPeriod)) \(period)"
        }
        // self.enteredDateLabel.text = LocalizedString.dailyfor.localized + " \(String(describing: repetitionsOfPeriod)) \(period)"
        
        
        //IMAGE
        if self.kindOfCostSegment.selectedSegmentIndex == 0 {
            self.enteredImageLabel.image = self.buttonWater.image(for: .normal)
        } else if self.kindOfCostSegment.selectedSegmentIndex == 1 {
            self.enteredImageLabel.image = self.buttonBook.image(for: .normal)
        } else {
            self.enteredImageLabel.image = self.buttonDiamond.image(for: .normal)
        }
        
        //-----------------------------------------
        
        
        
        self.segmentForRepeated.selectedSegmentIndex = 0
        //once we entered repeated cost to back to once & make timeLineinvisible
        //once the UI did everything it has to go bach to once & make timeLineinvisible....
        self.arrangeTimesLineToBeInvisible()
        self.nameTextField.text = ""
        self.costTextField.text = ""
        
        
    }
    
    //MARK: - Save Reapeatedly
    
    func saveDailyExpenseUsingCoreData(){
        
        //initiate your number Formatter
        let nf = NumberFormatter()
        nf.locale = Locale.current
        
        if !(textFieldTimes.text?.isEmpty)! {
            //Depending On the PERIOD button the Overall Cost is calculated accordingly(*7,*30, *365) while ALERT is ON
            
            if buttonForPeriod.titleLabel?.text == LocalizedString.buttonDays.localized{
                
                let wishedTimes = Int(self.textFieldTimes.text!)!
                let stringStart = LocalizedString.alertBodyForDaily.localized
                let stringLast = LocalizedString.alertBodyForDailyLast.localized
                
                checkWishedTimesAndShowAlert(wishedTimes: wishedTimes, upperLimit: 1825, string1: stringStart, string2: stringLast)
                
            } else if buttonForPeriod.titleLabel?.text == LocalizedString.buttonWeeks.localized{
                
                let wishedTimes = Int(self.textFieldTimes.text!)! * 7
                let stringStart = LocalizedString.alertBodyForDailyEveryWeek.localized
                let stringLast = LocalizedString.alertBodyForDailyEveryWeekLast.localized
                checkWishedTimesAndShowAlert(wishedTimes: wishedTimes, upperLimit: 1825, string1: stringStart, string2: stringLast)
                
            } else if buttonForPeriod.titleLabel?.text == LocalizedString.buttonMonths.localized{
                
                let wishedTimes = Int(self.textFieldTimes.text!)! * 30
                let stringStart = LocalizedString.alertBodyForDailyEveryMonth.localized
                let stringLast = LocalizedString.alertBodyForDailyEveryMonthLast.localized
                checkWishedTimesAndShowAlert(wishedTimes: wishedTimes, upperLimit: 1825, string1: stringStart, string2: stringLast)
                
            } else if buttonForPeriod.titleLabel?.text == LocalizedString.buttonYears.localized{
                let wishedTimes = Int(self.textFieldTimes.text!)! * 365
                let stringStart = LocalizedString.alertBodyForDailyEveryYear.localized
                let stringLast = LocalizedString.alertBodyForDailyEveryYearLast.localized
                checkWishedTimesAndShowAlert(wishedTimes: wishedTimes, upperLimit: 1825, string1: stringStart, string2: stringLast)
                
            }
            
            
            
            
            //Variables to implicate MULTITHREADING
            let date = self.datePicker.date
            let indexOfCategory = self.kindOfCostSegment.selectedSegmentIndex
            let costInTheField = self.costTextField.text!
            let cashSwitchState = self.cashOrCardSwitch.isOn
            let noteMultiStored = self.nameTextField.text!
            
            
           
            //...while in the global background queue we will be storing furiously the repeated costs
            DispatchQueue.global(qos:.background).async {
                
                //get in the core data global room named "appDelegate" and get the key
                guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
                
                //we save in the privateContext whose parent is the managedObject so the app want crach randomly
                let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
                privateContext.parent = managedContext
                
                for i in 0...self.times - 1 {
                    //IMPORTANT: we have to create a new object every time we enter the loop
                    //...otherwise only the last loop will be saved
                    
                    let expense = ExpenseCore(context: privateContext)
                    
                    // let date = self.datePicker.date
                    let calendar = Calendar.current
                    let year = calendar.component(.year, from: date)
                    let month = calendar.component(.month, from: date)
                    let day = calendar.component(.day, from: date)
                    let components: NSDateComponents = NSDateComponents()
                    components.year = year
                    components.month = month
                    components.day = day + i
                    components.hour = 7
                    let iDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
                    // Now use e.nextID and save OneExpense to say 1.dat if e.nextID == 1 and so on.
                    
                    if indexOfCategory == 0 {
                        expense.size = (nf.number(from: costInTheField) as? Double)!
                        expense.cash = cashSwitchState
                        expense.date = iDate as NSDate
                        expense.kind = "Acost"
                        expense.note =  LocalizedString.dailyNote.localized + " " + noteMultiStored
                        
                        
                    } else if indexOfCategory == 1 {
                        expense.size = (nf.number(from: costInTheField) as? Double)!
                        expense.cash = cashSwitchState
                        expense.date = iDate as NSDate
                        expense.kind = "Bcost"
                        expense.note =  LocalizedString.dailyNote.localized + " " + noteMultiStored
                        
                        
                    } else {
                        expense.size = (nf.number(from: costInTheField) as? Double)!
                        expense.cash = cashSwitchState
                        expense.date = iDate as NSDate
                        expense.kind = "Ccost"
                        expense.note =  LocalizedString.dailyNote.localized + " " + noteMultiStored
                        
                    }
                    do {
                        try privateContext.save()
                        managedContext.perform{
                            do {
                                try managedContext.save()
                                //print("Daily Expense saved")
                            } catch {
                                print("Failed to save with note filled")
                            }
                            
                        }//perform
                        
                        
                        
                    } catch {
                        print("Failed to save with note filled", error.localizedDescription)
                        
                    }
                    
                    
                }//LOOP----------------------------------
                
                
            }//end Of Dispatch
            
            cleanUpEnteredCell()
            
        } else {
            let emptyFieldsAlert3 = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                      message: LocalizedString.forRepeatedcostsRepetitions.localized,
                                                      preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                         style: UIAlertAction.Style.default,
                                         handler: nil)
            
            emptyFieldsAlert3.addAction(okAction)
            
            self.present(emptyFieldsAlert3, animated:true, completion: nil)
            
            //self.textFieldTimes.becomeFirstResponder()
            
        }
        
        
    }//Func
    
    
    
    
    func saveWeeklyExpenseUsingCoreData(){
        
        
        //initiate your number Formatter
        let nf = NumberFormatter()
        nf.locale = Locale.current
        
        if !(textFieldTimes.text?.isEmpty)! {
            
            if buttonForPeriod.titleLabel?.text == LocalizedString.buttonWeeks.localized{
                
               
                let wishedTimes = Int(self.textFieldTimes.text!)!
                let stringStart = LocalizedString.alertBodyForWeekly.localized
                let stringLast = LocalizedString.alertBodyForWeeklyLast.localized
                checkWishedTimesAndShowAlert(wishedTimes: wishedTimes, upperLimit: 520, string1: stringStart, string2: stringLast)
            
            } else if buttonForPeriod.titleLabel?.text == LocalizedString.buttonMonths.localized{
           
            
                let wishedTimes = Int(self.textFieldTimes.text!)! * 30/7
                let stringStart = LocalizedString.alertBodyForWeeklyEveryMonth.localized
                let stringLast = LocalizedString.alertBodyForWeeklyEveryMonthLast.localized
                checkWishedTimesAndShowAlert(wishedTimes: wishedTimes, upperLimit: 520, string1: stringStart, string2: stringLast)
                
                
            } else if buttonForPeriod.titleLabel?.text == LocalizedString.buttonYears.localized{
                
                 let wishedTimes = Int(self.textFieldTimes.text!)! * 365/7
                let stringStart = LocalizedString.alertBodyForWeeklyEveryYear.localized
                let stringLast = LocalizedString.alertBodyForWeeklyEveryYearLast.localized
                checkWishedTimesAndShowAlert(wishedTimes: wishedTimes, upperLimit: 520, string1: stringStart, string2: stringLast)
                
            }
            
            //Variables to implicate MULTITHREADING
            let date = self.datePicker.date
            let indexOfCategory = self.kindOfCostSegment.selectedSegmentIndex
            let costInTheField = self.costTextField.text!
            let cashSwitchState = self.cashOrCardSwitch.isOn
            let noteMultiStored = self.nameTextField.text!
            
            
        
            
            //...while in the global background queue we will be storing furiously the repeated costs
            DispatchQueue.global(qos:.background).async {
                
                //get in the core data global room named "appDelegate" and get the key
                guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
                
                //we save in the privateContext whose parent is the managedObject so the app want crach randomly
                let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
                privateContext.parent = managedContext
                
                for i in 0...self.times - 1 {
                    //IMPORTANT: we have to create a new object every time we enter the loop
                    //...otherwise only the last loop will be saved
                    
                    let expense = ExpenseCore(context: privateContext)
                    
                    // let date = self.datePicker.date
                    let calendar = Calendar.current
                    let year = calendar.component(.year, from: date)
                    let month = calendar.component(.month, from: date)
                    let day = calendar.component(.day, from: date)
                    let components: NSDateComponents = NSDateComponents()
                    components.year = year
                    components.month = month
                    components.day = day + 7*i
                    components.hour = 7
                    let iDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
                  
                    
                    if indexOfCategory == 0 {
                        expense.size = (nf.number(from: costInTheField) as? Double)!
                        expense.cash = cashSwitchState
                        expense.date = iDate as NSDate
                        expense.kind = "Acost"
                        expense.note =  LocalizedString.weeklyNote.localized + " " + noteMultiStored
                        
                        
                    } else if indexOfCategory == 1 {
                        expense.size = (nf.number(from: costInTheField) as? Double)!
                        expense.cash = cashSwitchState
                        expense.date = iDate as NSDate
                        expense.kind = "Bcost"
                        expense.note =  LocalizedString.weeklyNote.localized + " " + noteMultiStored
                        
                        
                    } else {
                        expense.size = (nf.number(from: costInTheField) as? Double)!
                        expense.cash = cashSwitchState
                        expense.date = iDate as NSDate
                        expense.kind = "Ccost"
                        expense.note =  LocalizedString.weeklyNote.localized + " " + noteMultiStored
                        
                    }
                    do {
                        try privateContext.save()
                        managedContext.perform{
                            do {
                                try managedContext.save()
                                //print("Daily Expense saved")
                            } catch {
                                print("Failed to save with note filled")
                            }
                            
                        }//perform
                        
                        
                        
                    } catch {
                        print("Failed to save with note filled", error.localizedDescription)
                        
                    }
                    
                    
                }//LOOP----------------------------------
                
                
            }//end Of Dispatch
            
            
            cleanUpEnteredCell()
            
        } else {
            let emptyFieldsAlert3 = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                      message: LocalizedString.forRepeatedcostsRepetitions.localized,
                                                      preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                         style: UIAlertAction.Style.default,
                                         handler: nil)
            
            emptyFieldsAlert3.addAction(okAction)
            
            self.present(emptyFieldsAlert3, animated:true, completion: nil)
            
            //self.textFieldTimes.becomeFirstResponder()
            
            
            
        }
        
    }//FuncEnds
    
    
  
    
    
    
    func saveMonthlyExpenseUsingCoreData(){
       
        
        //initiate your number Formatter
        let nf = NumberFormatter()
        nf.locale = Locale.current
        
        if !(textFieldTimes.text?.isEmpty)! {
            
            
            if buttonForPeriod.titleLabel?.text == stringButtonMonths.localized(){
                
                let wishedTimes = Int(self.textFieldTimes.text!)!
                let stringStart = LocalizedString.alertBodyForMonthly.localized
                let stringLast = LocalizedString.alertBodyForMonthlyLast.localized
                checkWishedTimesAndShowAlert(wishedTimes: wishedTimes, upperLimit: 360, string1: stringStart, string2: stringLast)
                
            } else if buttonForPeriod.titleLabel?.text == stringButtonYears.localized(){
                
                let wishedTimes =  Int(self.textFieldTimes.text!)! * 12
                let stringStart = LocalizedString.alertBodyForMonthlyEveryYear.localized
                let stringLast = LocalizedString.alertBodyForMonthlyEveryYearLast.localized
                checkWishedTimesAndShowAlert(wishedTimes: wishedTimes, upperLimit: 360, string1: stringStart, string2: stringLast)
            
            }
            
            
            //Variables to implicate MULTITHREADING
            let date = self.datePicker.date
            let indexOfCategory = self.kindOfCostSegment.selectedSegmentIndex
            let costInTheField = self.costTextField.text!
            let cashSwitchState = self.cashOrCardSwitch.isOn
            let noteMultiStored = self.nameTextField.text!
            
            
        
            
            
            
            //...while in the global background queue we will be storing furiously the repeated costs
            DispatchQueue.global(qos:.background).async {
                //get in the core data global room named "appDelegate" and get the key
                guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
                
              
                //we save in the privateContext whose parent is the managedObject so the app want crach randomly
                let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
                privateContext.parent = managedContext
                
                for i in 0...self.times - 1 {
                    //IMPORTANT: we have to create a new object every time we enter the loop
                    //...otherwise only the last loop will be saved
                    
                    let expense = ExpenseCore(context: privateContext)
            
                    let calendar = Calendar.current
                    
                    let year = calendar.component(.year, from: date)
                    let month = calendar.component(.month, from: date)
                    let week = calendar.component(.weekOfYear, from: date)
                    let day = calendar.component(.day, from: date)
                    //let hour = calendar.component(.hour, from: date)
                    
                    let components: NSDateComponents = NSDateComponents()
                    components.year = year
                    components.month = month + i
                    components.weekOfYear = week
                    components.day = day
                    components.hour = 7
                    let iDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
                    
                    if indexOfCategory == 0 {
                        expense.size = (nf.number(from: costInTheField) as? Double)!
                        expense.cash = cashSwitchState
                        expense.date = iDate as NSDate
                        expense.kind = "Acost"
                        expense.note =  LocalizedString.monthlyNote.localized + " " + noteMultiStored
                        
                        
                    } else if indexOfCategory == 1 {
                        expense.size = (nf.number(from: costInTheField) as? Double)!
                        expense.cash = cashSwitchState
                        expense.date = iDate as NSDate
                        expense.kind = "Bcost"
                        expense.note =  LocalizedString.monthlyNote.localized + " " + noteMultiStored
                        
                        
                    } else {
                        expense.size = (nf.number(from: costInTheField) as? Double)!
                        expense.cash = cashSwitchState
                        expense.date = iDate as NSDate
                        expense.kind = "Ccost"
                        expense.note =  LocalizedString.monthlyNote.localized + " " + noteMultiStored
                        
                    }
                    do {
                        try privateContext.save()
                        managedContext.perform{
                            do {
                                try managedContext.save()
                                //print("Daily Expense saved")
                            } catch {
                                print("Failed to save with note filled")
                            }
                            
                        }//perform
                        
                        
                        
                    } catch {
                        print("Failed to save with note filled", error.localizedDescription)
                        
                    }
                    
                    
                }//LOOP----------------------------------
                
                
            }//end Of Dispatch
                
           cleanUpEnteredCell()
            
            
        } else {
            let emptyFieldsAlert3 = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                      message: LocalizedString.forRepeatedcostsRepetitions.localized,
                                                      preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                         style: UIAlertAction.Style.default,
                                         handler: nil)
            
            emptyFieldsAlert3.addAction(okAction)
            
            self.present(emptyFieldsAlert3, animated:true, completion: nil)
            
            //self.textFieldTimes.becomeFirstResponder()
            
        }
        
      
        
    }//FuncEnds
    
  
    
    func saveYearlyExpenseUsingCoreData(){
        
        //initiate your number Formatter (comma.DOT issue)
        let nf = NumberFormatter()
        nf.locale = Locale.current
        
        if !(textFieldTimes.text?.isEmpty)! {
            
            let wishedTimes = Int(self.textFieldTimes.text!)!
            let stringStart = LocalizedString.alertBodyForYearly.localized
            let stringLast = LocalizedString.alertBodyForYearlyLast.localized
            checkWishedTimesAndShowAlert(wishedTimes: wishedTimes, upperLimit: 100, string1: stringStart, string2: stringLast)
            
            
            //Variables to implicate MULTITHREADING
            let date = self.datePicker.date
            let indexOfCategory = self.kindOfCostSegment.selectedSegmentIndex
            let costInTheField = self.costTextField.text!
            let cashSwitchState = self.cashOrCardSwitch.isOn
            let noteMultiStored = self.nameTextField.text!
            
            //get in the core data global room named "appDelegate" and get the key
            guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
            
            
            //...while in the global background queue we will be storing furiously the repeated costs
            DispatchQueue.global(qos:.background).async {
                
                
                //we save in the privateContext whose parent is the managedObject so the app want crach randomly
                let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
                privateContext.parent = managedContext
                
                for i in 0...self.times - 1 {
                    //IMPORTANT: we have to create a new object every time we enter the loop
                    //...otherwise only the last loop will be saved
                    
                    let expense = ExpenseCore(context: privateContext)
                    
                    let calendar = Calendar.current
                    
                    let year = calendar.component(.year, from: date)
                    let month = calendar.component(.month, from: date)
                    let week = calendar.component(.weekOfYear, from: date)
                    let day = calendar.component(.day, from: date)
                    //let hour = calendar.component(.hour, from: date)
                    
                    
                    let components: NSDateComponents = NSDateComponents()
                    components.year = year + i
                    components.month = month
                    components.weekOfYear = week
                    components.day = day
                    components.hour = 7
                    let iDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
                    
                    if indexOfCategory == 0 {
                        expense.size = (nf.number(from: costInTheField) as? Double)!
                        expense.cash = cashSwitchState
                        expense.date = iDate as NSDate
                        expense.kind = "Acost"
                        expense.note =  LocalizedString.yearlyNote.localized + " " + noteMultiStored
                        
                        
                    } else if indexOfCategory == 1 {
                        expense.size = (nf.number(from: costInTheField) as? Double)!
                        expense.cash = cashSwitchState
                        expense.date = iDate as NSDate
                        expense.kind = "Bcost"
                        expense.note =  LocalizedString.yearlyNote.localized + " " + noteMultiStored
                        
                        
                    } else {
                        expense.size = (nf.number(from: costInTheField) as? Double)!
                        expense.cash = cashSwitchState
                        expense.date = iDate as NSDate
                        expense.kind = "Ccost"
                        expense.note =  LocalizedString.yearlyNote.localized + " " + noteMultiStored
                        
                    }
                    do {
                        try privateContext.save()
                        managedContext.perform{
                            do {
                                try managedContext.save()
                                //print("Daily Expense saved")
                            } catch {
                                print("Failed to save with note filled")
                            }
                            
                        }//perform
                        
                        
                        
                    } catch {
                        print("Failed to save with note filled", error.localizedDescription)
                        
                    }
                    
                }//LOOP----------------------------------
            }//end Of Dispatch
            
            cleanUpEnteredCell()
            
            
            /*
            let overallCost =  Double(times) * (nf.number(from: self.costTextField.text!) as? Double)!
            //currency Format------>
            let myFormatter = NumberFormatter()
            myFormatter.numberStyle = .currency
            let stringOfOverallCost = myFormatter.string(from: overallCost as NSNumber)
            self.labelOfOverallCost.text = stringOfOverallCost
            //currency Format------<
            
            // self.labelOfOverallCost.text = String(overallCost)
            self.labelOfEnteredTitle.text = LocalizedString.overAllCost.localized
            
            //get in the core data global room named "appDelegate" and get the key
            guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
            
            for i in 0...self.times - 1 {
                //IMPORTANT: we have to create a new object every time we enter the loop
                //...otherwise only the last loop will be saved
                
                let expense = ExpenseCore(context: managedContext)
                
                let date = self.datePicker.date
                let calendar = Calendar.current
                
                let year = calendar.component(.year, from: date)
                let month = calendar.component(.month, from: date)
                let week = calendar.component(.weekOfYear, from: date)
                let day = calendar.component(.day, from: date)
                //let hour = calendar.component(.hour, from: date)
                
                
                let components: NSDateComponents = NSDateComponents()
                components.year = year + i
                components.month = month
                components.weekOfYear = week
                components.day = day
                components.hour = 7
                let iDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
                
                
                
                
                
                
                if kindOfCostSegment.selectedSegmentIndex == 0 {
                    expense.size = (nf.number(from: self.costTextField.text!) as? Double)!
                    expense.cash = self.cashOrCardSwitch.isOn
                    expense.date = iDate as NSDate
                    expense.kind = "Acost"
                    expense.note = LocalizedString.yearlyNote.localized + " " + self.nameTextField.text!
                       
                    self.enteredNameLabel.text = "Acost"
                    self.enteredImageLabel.image = self.buttonWater.image(for: .normal)
                    
                } else if kindOfCostSegment.selectedSegmentIndex == 1 {
                    expense.size = (nf.number(from: self.costTextField.text!) as? Double)!
                    expense.cash = self.cashOrCardSwitch.isOn
                    expense.date = iDate as NSDate
                    expense.kind = "Bcost"
                    expense.note = LocalizedString.yearlyNote.localized + " " + self.nameTextField.text!
                        
                    self.enteredNameLabel.text = "Bcost"
                    self.enteredImageLabel.image = self.buttonBook.image(for: .normal)
                } else {
                    expense.size = (nf.number(from: self.costTextField.text!) as? Double)!
                    expense.cash = self.cashOrCardSwitch.isOn
                    expense.date = iDate as NSDate
                    expense.kind = "Ccost"
                    expense.note = LocalizedString.yearlyNote.localized + " " + self.nameTextField.text!
                       
                    self.enteredNameLabel.text = "Ccost"
                    self.enteredImageLabel.image = self.buttonDiamond.image(for: .normal)
                }
                
                do {
                    try managedContext.save()
                    print("Daily Expense saved")
                    
                } catch {
                    print("Failed to save with note filled", error.localizedDescription)
                    
                }
               
                
                self.enteredNameLabel.text = self.nameTextField.text
                //self.nameTextField.text = ""
                
                
                
                if self.cashOrCardSwitch.isOn {
                    enteredSizeLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                } else {
                    enteredSizeLabel.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
                    
                }
                
                
                
                //In order to show the entered Cost with the suitable currency---->
                
                let numberEntered = nf.number(from: self.costTextField.text!) as? Double
                let myFormatter = NumberFormatter()
                myFormatter.numberStyle = .currency
                let stringrOfEnteredFormattedCost = myFormatter.string(from: numberEntered! as NSNumber)
                self.enteredSizeLabel.text = stringrOfEnteredFormattedCost
                
                //In order to show the entered Cost with the suitable currency----<
                
                
                //self.enteredSizeLabel.text = self.costTextField.text
                //self.costTextField.text = ""
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale.current
                dateFormatter.dateFormat =  stringOfDate.regionize()
                
                // self.enteredDateLabel.text = "Yearly for \(String(describing: self.textFieldTimes.text!)) years"//dateFormatter.string(from: self.datePicker.date) //String(describing: self.datePicker.date)
                
                var period = "years"
                
                if buttonForPeriod.titleLabel?.text == LocalizedString.buttonYears.localized && self.textFieldTimes.text != "1"{
                    period = LocalizedString.buttonYears.localized
                } else if buttonForPeriod.titleLabel?.text == LocalizedString.buttonYears.localized && self.textFieldTimes.text == "1" {
                    period = LocalizedString.oneYear.localized
                }
                
                
                
                self.enteredDateLabel.text = LocalizedString.yearlyfor.localized + "\(String(describing: self.textFieldTimes.text!)) \(period)"
                
                if kindOfCostSegment.selectedSegmentIndex == 0 {
                    self.enteredImageLabel.image = self.buttonWater.image(for: .normal)
                } else if kindOfCostSegment.selectedSegmentIndex == 1 {
                    self.enteredImageLabel.image = self.buttonBook.image(for: .normal)
                } else {
                    self.enteredImageLabel.image = self.buttonDiamond.image(for: .normal)
                }
                
                
                
                //LOOP----------------------------------
            }
            //once we entered repeated cost to go back to once
            //self.textFieldTimes.text = "1"
            self.segmentForRepeated.selectedSegmentIndex = 0
            //self.labelDaysToYears.text = "time"
            arrangeTimesLineToBeInvisible()
            self.nameTextField.text = ""
            self.costTextField.text = ""
            //once we entered repeated cost to go back to once
            
            */
        } else {
            let emptyFieldsAlert3 = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                      message: LocalizedString.forRepeatedcostsRepetitions.localized,
                                                      preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                         style: UIAlertAction.Style.default,
                                         handler: nil)
            
            emptyFieldsAlert3.addAction(okAction)
            
            self.present(emptyFieldsAlert3, animated:true, completion: nil)
            
            //self.textFieldTimes.becomeFirstResponder()
            
            
            
            
            
        }
        
    }
    
    
    
    
    //MARK: Fetching
    
    func fetchData(completion: (_ complete:Bool) -> ()){
         guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ExpenseCore")
        
        do{
            coredExpensesArray = try managedContext.fetch(request) as! [ExpenseCore]
            completion(true)
            print("Data fetched, no issues")
        } catch {
            print("Unable to fetch data:", error.localizedDescription)
            completion(false)
        }
    }
    
    
    
    func fetchPericatedData(filteredBy: String? = nil){
         guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let myRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ExpenseCore")
        
       // let predicateFiltered = NSPredicate(format: "note == '\(String(describing: filteredBy))'")
        let predicateFiltered = NSPredicate(format: "note =[cd] %@", filteredBy!)
        
        

        myRequest.predicate = predicateFiltered
        
        do {
            self.coredExpensesArray = try managedContext.fetch(myRequest) as! [ExpenseCore]
        } catch {
            print("Unable to fetch data:", error.localizedDescription)
        }
        
        
        /*
        let sort = NSSortDescriptor(key: "date", ascending: true)
        
        
        let sort2 = NSSortDescriptor(key: "date",
                                    ascending: true,
                                    selector: "myFunc")
        
        let sort3 = NSSortDescriptor(key: "date",
                                     ascending: true,
                                     comparator: {(a,b) ->NSComparisonPredicate in
                                        return
        })
        */
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    func fetchByDate(from: Date, until: Date){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let myRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ExpenseCore")
        
        // let predicateFiltered = NSPredicate(format: "note == '\(String(describing: filteredBy))'")
        //let predicateFiltered = NSPredicate(format: "(date >= %@)", from AND "(date <= %@)", until)
        let datePredicate = NSCompoundPredicate(type: .and, subpredicates: [NSPredicate(format: "date >= %@", from as CVarArg), NSPredicate(format: "date =< %@", until as CVarArg)])
        
        
        myRequest.predicate = datePredicate
        
        do {
            self.coredExpensesArray = try managedContext.fetch(myRequest) as! [ExpenseCore]
        } catch {
            print("Unable to fetch data:", error.localizedDescription)
        }
    
    }
    
    
    func fetchByDateAndKind(from: Date, until: Date, ofKind: String){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let myRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ExpenseCore")
        
        // let predicateFiltered = NSPredicate(format: "note == '\(String(describing: filteredBy))'")
        //let predicateFiltered = NSPredicate(format: "(date >= %@)", from AND "(date <= %@)", until)
        let datePredicate = NSCompoundPredicate(type: .and, subpredicates: [NSPredicate(format: "date >= %@", from as CVarArg), NSPredicate(format: "date =< %@", until as CVarArg), NSPredicate(format: "kind = %@", ofKind as CVarArg)])
        
        
        myRequest.predicate = datePredicate
        
        do {
            self.coredExpensesArray = try managedContext.fetch(myRequest) as! [ExpenseCore]
        } catch {
            print("Unable to fetch data:", error.localizedDescription)
        }
        
    }
    
    
    
    
    
    /*
    func fetchMyData(){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ExpenseCore")
        
        do{
            tableOfMonthExpences = try managedContext.fetch(request) as! [ExpenseCore]
            
            print("Data fetched")
            print("the 1st Expense is of size: \(tableOfMonthExpences[0].size)")
        } catch {
            print("Unable to fetch data:", error.localizedDescription)
           
        }
        
    }*/
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}//Last and crucial Parenthesis


final class UILocalizedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        let title = self.title(for: .normal)?.localized()
        setTitle(title, for: .normal)
    }
}




public extension UIDevice {
    
    /// pares the deveice name as the standard name
    var modelName: String {
        
        #if targetEnvironment(simulator)
        let identifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]!
        #else
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 , value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        #endif
        
        switch identifier {
        case "iPod5,1":                                 return "iPod touch (5th generation)"
                    case "iPod7,1":                                 return "iPod touch (6th generation)"
                    case "iPod9,1":                                 return "iPod touch (7th generation)"
                    case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
                    case "iPhone4,1":                               return "iPhone 4s"
                    case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
                    case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
                    case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
                    case "iPhone7,2":                               return "iPhone 6"
                    case "iPhone7,1":                               return "iPhone 6 Plus"
                    case "iPhone8,1":                               return "iPhone 6s"
                    case "iPhone8,2":                               return "iPhone 6s Plus"
                    case "iPhone8,4":                               return "iPhone SE"
                    case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
                    case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
                    case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
                    case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
                    case "iPhone10,3", "iPhone10,6":                return "iPhone X"
                    case "iPhone11,2":                              return "iPhone XS"
                    case "iPhone11,4", "iPhone11,6":                return "iPhone XS Max"
                    case "iPhone11,8":                              return "iPhone XR"
                    case "iPhone12,1":                              return "iPhone 11"
                    case "iPhone12,3":                              return "iPhone 11 Pro"
                    case "iPhone12,5":                              return "iPhone 11 Pro Max"
                    case "iPhone12,8":                              return "iPhone SE (2nd generation)"
                    case "iPhone13,1":                              return "iPhone 12 mini"
                    case "iPhone13,2":                              return "iPhone 12"
                    case "iPhone13,3":                              return "iPhone 12 Pro"
                    case "iPhone13,4":                              return "iPhone 12 Pro Max"
                    case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
                    case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad (3rd generation)"
                    case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad (4th generation)"
                    case "iPad6,11", "iPad6,12":                    return "iPad (5th generation)"
                    case "iPad7,5", "iPad7,6":                      return "iPad (6th generation)"
                    case "iPad7,11", "iPad7,12":                    return "iPad (7th generation)"
                    case "iPad11,6", "iPad11,7":                    return "iPad (8th generation)"
                    case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
                    case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
                    case "iPad11,3", "iPad11,4":                    return "iPad Air (3rd generation)"
                    case "iPad13,1", "iPad13,2":                    return "iPad Air (4th generation)"
                    case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad mini"
                    case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad mini 2"
                    case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad mini 3"
                    case "iPad5,1", "iPad5,2":                      return "iPad mini 4"
                    case "iPad11,1", "iPad11,2":                    return "iPad mini (5th generation)"
                    case "iPad6,3", "iPad6,4":                      return "iPad Pro (9.7-inch)"
                    case "iPad7,3", "iPad7,4":                      return "iPad Pro (10.5-inch)"
                    case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return "iPad Pro (11-inch) (1st generation)"
                    case "iPad8,9", "iPad8,10":                     return "iPad Pro (11-inch) (2nd generation)"
                    case "iPad6,7", "iPad6,8":                      return "iPad Pro (12.9-inch) (1st generation)"
                    case "iPad7,1", "iPad7,2":                      return "iPad Pro (12.9-inch) (2nd generation)"
                    case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return "iPad Pro (12.9-inch) (3rd generation)"
                    case "iPad8,11", "iPad8,12":                    return "iPad Pro (12.9-inch) (4th generation)"
                    case "AppleTV5,3":                              return "Apple TV"
                    case "AppleTV6,2":                              return "Apple TV 4K"
                    case "AudioAccessory1,1":                       return "HomePod"
                    case "AudioAccessory5,1":                       return "HomePod mini"
                 //   case "i386", "x86_64":                          return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
                    default:                                        return identifier
        }
    }
    
}





extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}


enum LocalizedString: String {
    case noteOptional = "noteOptional"
    case noteForRepeated = "noteForRepeated"
    case everyDayFor = "everyDayFor"
    case everyWeekFor = "everyWeekFor"
    case everyMonthFor = "everyMonthFor"
    case everyYearFor = "everyYearFor"
    case buttonToPayCash = "buttonToPayCash"
    case buttonToCard = "buttonToCard"
    case placeholderCash = "placeholderCash"
    case placeholderAmount = "placeholderAmount"
    case fieldWithAmountofCost = "fieldWithAmountofCost"
    case forrepeatedcostsbothFields = "forrepeatedcostsbothFields"
    case spent80ofsalary = "spent80ofsalary"
    case spentAllofsalary = "spentAllofsalary"
    case dailyfor = "dailyfor"
    case weeklyfor = "weeklyfor"
    case monthlyfor = "monthlyfor"
    case yearlyfor = "yearlyfor"
    case forRepeatedcostsRepetitions = "forRepeatedcostsRepetitions"
    case lastStoredExpense = "LastStoredExpense:"
    case overAllCost = "overallCost"
    case pleaseRestartΑpp = "PleaseRestartApp"
    case titleMainViewIncome = "titleOfMainViewForIncome"
    case attentionAlert = "attentionAlert"
    case okInAlert = "Ok"
    case buttonDays = "buttonForPeriodForDays"
    case buttonWeeks = "buttonForPeriodForWeeks"
    case buttonMonths = "buttonForPeriodForMonths"
    case buttonYears =  "buttonForPeriodForYears"
    case oneDay = "buttonForPeriodForOneDay"
    case oneWeek = "buttonForPeriodForOneWeek"
    case oneMonth = "buttonForPeriodForOneMonth"
    case oneYear = "buttonForPeriodForOneYear"
    case segmentTitleOnce = "segmentTitleOnce"
    case segmentTitleDaily = "segmentTitleDaily"
    case segmentTitleWeekly = "segmentTitleWeekly"
    case segmentTitleMonthly = "segmentTitleMonthly"
    case segmentTitleYearly = "segmentTitleYearly"
    case navItemMainRight = "List"
    case navItemMainLeft = "Settings"
    case navItemListRight = "Report"
    case alertBodyForDaily = "alertBodyForDaily"
    case alertBodyForDailyLast = "alertBodyForDailyLast"
    case alertBodyForDailyEveryWeek = "alertBodyForDailyEveryWeek"
    case alertBodyForDailyEveryWeekLast = "alertBodyForDailyEveryWeekLast"
    case alertBodyForDailyEveryMonth = "alertBodyForDailyEveryMonth"
    case alertBodyForDailyEveryMonthLast = "alertBodyForDailyEveryMonthLast"
    case alertBodyForDailyEveryYear = "alertBodyForDailyEveryYear"
    case alertBodyForDailyEveryYearLast = "alertBodyForDailyEveryYearLast"
    case alertBodyForWeekly = "alertBodyForWeekly"
    case alertBodyForWeeklyLast =  "alertBodyForWeeklyLast"
    case alertBodyForWeeklyEveryMonth = "alertBodyForWeeklyEveryMonth"
    case alertBodyForWeeklyEveryMonthLast = "alertBodyForWeeklyEveryMonthLast"
    case alertBodyForWeeklyEveryYear = "alertBodyForWeeklyEveryYear"
    case alertBodyForWeeklyEveryYearLast = "alertBodyForWeeklyEveryYearLast"
    case alertBodyForMonthly = "alertBodyForMonthly"
    case alertBodyForMonthlyLast = "alertBodyForMonthlyLast"
    case alertBodyForMonthlyEveryYear = "alertBodyForMonthlyEveryYear"
    case alertBodyForMonthlyEveryYearLast = "alertBodyForMonthlyEveryYearLast"
    case alertBodyForYearly = "alertBodyForYearly"
    case alertBodyForYearlyLast = "alertBodyForYearlyLast"

    //List
    case allinListSegment = "AllinListSegment"
    case AInListSegment = "AinListSegment"
    case BinListSegment = "BinListSegment"
    case CinListSegment = "CinListSegment"
    case todayInPeriodSegment = "TodayInPeriodSegment"
    case weekInPeriodSegment = "WeekInPeriodSegment"
    case monthInPeriodSegment = "MonthInPeriodSegment"
    case quarterInPeriodSegment = "QuarterInPeriodSegment"
    case yearInPeriodSegment = "YearInPeriodSegment"
    case manuallyInPeriodSegment = "ManuallyInPeriodSegment"
    case dateOrderAlert = "dateOrderAlert"
    case dailyNote = "dailyNote"
    case weeklyNote =  "weeklyNote"
    case monthlyNote = "monthlyNote"
    case yearlyNote = "yearlyNote"
    case fixCostAlert =  "fixCostAlert"
    case whatFixToDelete = "whatFixToDelete"
    case justOne = "justOne"
    case futureFix = "futureFix"
    case totalFix = "totalFix"
    case cancelFixDeletion = "cancelFixDeletion"
    //Report
    case navItemReportTitle = "reportTitle"
    case navItemReportRight = "goToStatistics"
    case periodUpTitle = "periodShowingInReport"
    case profileOverIstogram = "profileOverBars"
    case totalCostInReport = "totalCostInReport"
    case cashInReport = "cashInReport"
    case cardInReport = "cardInReport"
    case overTextFieldSalary = "overTextFieldSalary"
    case overTextFieldIncome = "overTextFieldIncome"
    case storeNewSalary = "storeNewSalary"
    case deductCost = "deductCost"
    case placeHolderStored = "placeHolderStored"
    case placeHolderPaid = "placeHolderPaid"
    case placeHolderAmount = "placeHolderAmount"
    case outcome = "outcome"
    case saved = "saved"
    case missing = "missing"
    case balanced = "balanced"
    case fillInfieldOfSalary = "fillInfieldOfSalary"
    case pleaseStoreSalary = "pleaseStoreSalary"
    case notAvailableInFreeVersion = "notAvailableInFreeVersion"
    case iUnderstand = "iUnderstand"
    case advantageKiosk1a = "advantageKiosk1a" 
    case advantageKiosk1b = "advantageKiosk1b"
    case advantageKiosk2a = "advantageKiosk2a"
    case advantageKiosk2b = "advantageKiosk2b"
     //Statistics
    case statisticsTitle = "statisticsTitle"
    case periodShowingInStatistics = "periodShowingInStatistics"
    case overGreatest = "overGreatestExpenseOf"
    case allinGreatest = "allinGreatest"
    case segmentCostStat = "segmentCostStat"
    case segmentDayStat = "segmentDayStat"
    case segmentWeekStat = "segmentWeekStat"
    case segmentMonthStat = "segmentMonthStat"
    case segmentYearStat = "segmentYearStat"
    case average = "average"
    case median = "median"
    case costRed = "costRed"
    case dayRed = "dayRed"
    case weekRed = "weekRed"
    case monthRed = "monthRed"
    case yearRed = "yearRed"
    case most = "most"
    case generous = "generous"
    case economic = "economic"
    case daySmall = "daySmall"
    case weekSmall = "weekSmall"
    case monthSmall = "monthSmall"
    case yearSmall = "yearSmall"
    case generousMan = "generousMan"
    case generousThing = "generousThing"
    case economicMan = "economicMan"
    case economicThing = "economicThing"
    case monthSmallOristiki = "monthSmallOristiki"
    //PopUp
    case cashInPopUp = "cashInPopUp"
    case cardInPopUp = "cardInPopUp"
    case cancelPopUp = "cancelPopUp"
    case savePopUp = "savePopUp"
    case theFieldOfCostInPopUp = "theFieldOfCostInPopUp"
    //Select
    case selectTitle = "selectTitle"
    case saveSelections = "saveSelections"
    case cancelSelections = "cancelSelections"
    case selectCategoryTitle = "selectCategoryTitle"
    case selectIcon = "selectIcon"
    case contactUs  = "contactUs"
    case upgrade = "upgrade"
    case rateThisApp = "rateThisApp"
    case upgradeAlert = "upgradeAlert"
    case upgradeAdvantage0 = "upgradeAdvantage0"
    case upgradeAdvantage1 = "upgradeAdvantage1"
    case upgradeAdvantage2 = "upgradeAdvantage2"
    case noThanksAction = "noThanksAction"
    case upgradeAction = "upgradeAction"
    case costOfUpgrading = "costOfUpgrading"
    case category1 = "category1"
    case category2 = "category2"
    case category3 = "category3"
    case category4 = "category4"
    case category5 = "category5"
    case category6 = "category6"
    case category7 = "category7"
    case category8 = "category8"
    case category9 = "category9"
    case category10 = "category10"
    case category11 = "category11"
    case category12 = "category12"
    case category13 = "category13"
    case category14 = "category14"
    case iappetosThanks = "iappetosThanks"
    //language
    case saveLanguage = "saveLanguage"
    case cancelLanguage = "cancelLanguage"
    case NoteToRestartApp = "NoteToRestartApp"
    case restartAppLanguage = "restartAppLanguage"
    //Kiosk
    case restorePurchase = "restorePurchase"
    case connectionRequired = "connectionRequired"
    case waitThePrices = "waitThePrices"
    case onlyFor = "onlyFor"
    
  
    
    
    
    
    var localized: String {
        return self.rawValue.localized(tableName: "Localizable")
    }
}


extension String{
    func locationize(localID: String)-> String{
        return String(localID.suffix(2))
    }
}


extension String {
    
    func regionize() -> String {
        var stringOfLocaleDate: String
    switch  NSLocale.current.identifier.suffix(2) {
    case "US": stringOfLocaleDate = "MM/dd/yyyy, HH:mm"
    case "EU": stringOfLocaleDate = "dd/MM/yyyy, HH:mm"
    case "JP": stringOfLocaleDate = "dd/MM/yyyy, HH:mm"
    default: stringOfLocaleDate = "dd/MM/yyyy, HH:mm"
    }
    return stringOfLocaleDate
    }
 
}


extension String {
    
    func regionizeWithoutHours() -> String {
        var stringOfHourLess: String
        switch  NSLocale.current.identifier.suffix(2) {
       
        case "US": stringOfHourLess = "MM/dd/yyyy"
        case "EU": stringOfHourLess = "dd/MM/yyyy"
        case "JP": stringOfHourLess = "dd/MM/yyyy"
        default: stringOfHourLess = "dd/MM/yyyy"
        }
        return stringOfHourLess
    }
    
}


/*

extension String {
    dateLocalizer: String
    switch NSLocale.currentLocale().localeIdentifier {
    case "en_US": dateLocalizer = "MMM d"
    case "en_EU": dateLocalizer = "d MMM"
    default: dateLoclizer = "d MMM"
    }
}

enum DateLocalizer: String {
    case enUS =  "MMM d"
    
}

*/

/*
 //The Function that disables the Button when the text field is empty(in conection with the viewDidload text fielf lines)=======================================
 func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
 
 let text = (costTextField.text! as NSString).replacingCharacters(in: range, with: string)
 
 
 if !text.isEmpty  {
 
 saveOneExpense.isUserInteractionEnabled = true
 } else {
 saveOneExpense.isUserInteractionEnabled = false
 }
 return true
 }
 
 //======================================================
 */



/*
 
 
 override func viewWillAppear(_ animated: Bool) {
 
 //Disabling the button when the textfield is empty(in connection with the text Field function function)==============
 //costTextField.delegate = self
 if (costTextField.text?.isEmpty)! {
 saveOneExpense.isUserInteractionEnabled = false
 } else {
 saveOneExpense.isUserInteractionEnabled = true
 }
 //====================================================================
 
 //Disabling the button when the textfield is empty(in connection with the text Field function function)==============
 //nameTextField.delegate = self
 if (nameTextField.text?.isEmpty)! {
 saveOneExpense.isUserInteractionEnabled = false
 }else {
 saveOneExpense.isUserInteractionEnabled = true
 }
 //====================================================================
 
 }
 */


/*
 func checkField(sender: AnyObject) {
 if (costTextField.text?.isEmpty)! || (nameTextField.text?.isEmpty)!
 {
 saveOneExpense.isEnabled = false
 
 }
 else
 {
 saveOneExpense.isEnabled = true
 }
 }
 */




/*
 
 @IBAction func saveOneExpense(_ sender: Any) {
 
 
 let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
 print("app dir: \(documentsPath)")
 let idPath = Bundle.path(forResource: "expenseID", ofType: ".dat", inDirectory: documentsPath)
 let e:ExpenseID = NSKeyedUnarchiver.unarchiveObject(withFile: idPath!) as! ExpenseID
 
 // Now use e.nextID and save OneExpense to say 1.dat if e.nextID == 1 and so on.
 
 
 
 
 
 let pathToSave = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
 let fileName = (e.nextID)!.description + ".dat"
 let pathToFile = pathToSave + "/" + fileName
 print("Saving to file \(pathToFile)")
 
 let selectedSegment = kindOfCostSegment.selectedSegmentIndex
 if (self.costTextField.text?.isEmpty)! || (self.nameTextField.text?.isEmpty)! {
 print("empty entry texts")
 } else {
 //get id from expenseID.dat file and use this id for the oneSavedExpense?
 
 
 let oneSavedExpense = OneExpense (size: Float(self.costTextField.text!),
 cash: self.cashOrCardSwitch.isOn,
 date: self.datePicker.date,
 kind: self.kindOfCostSegment.titleForSegment(at: selectedSegment),
 note: self.nameTextField.text,
 expenseID: e.nextID)
 
 NSKeyedArchiver.archiveRootObject(oneSavedExpense ,toFile: pathToFile)
 
 // Now increment nextID, so next OneExpense object will have a different unique ID
 e.nextID = e.nextID! + 1
 NSKeyedArchiver.archiveRootObject(e, toFile: idPath!)
 
 }
 
 }
 */
/*
 func hideSaveButton() {
 if (self.costTextField.text?.isEmpty)! || (self.nameTextField.text?.isEmpty)! {
 self.saveOneExpense.isHidden = true
 }
 
 
 }
 
 */

/*
 The SEGMENTWIRES----------------------------------------------------------------------------
 
 
 @IBOutlet weak var segmentMain: UISegmentedControl!
 
 @IBOutlet weak var buttonBook: UIButton!
 @IBOutlet weak var buttonWater: UIButton!
 @IBOutlet weak var buttonDiamond: UIButton!
 
 @IBOutlet weak var labelWater: UILabel!
 @IBOutlet weak var labelBook: UILabel!
 @IBOutlet weak var labelDiamond: UILabel!
 
 
 
 
 @IBAction func arrangeTheLabelsOfTheButtons(_ sender: Any) {
 let chosenSegment = self.kindOfCostSegment.selectedSegmentIndex
 if chosenSegment == 0 {
 self.labelWater.textColor = UIColor.white
 self.labelBook.textColor = UIColor.blue
 self.labelDiamond.textColor = UIColor.blue
 
 } else if chosenSegment == 1 {
 self.labelWater.textColor = UIColor.blue
 self.labelBook.textColor = UIColor.white
 self.labelDiamond.textColor = UIColor.blue
 
 } else {
 self.labelWater.textColor = UIColor.blue
 self.labelBook.textColor = UIColor.blue
 self.labelDiamond.textColor = UIColor.white
 }
 
 }
 
 
 
 @IBAction func WaterPressedForSegment(_ sender: Any) {
 self.kindOfCostSegment.selectedSegmentIndex = 0
 self.labelWater.textColor = UIColor.white
 self.labelBook.textColor = UIColor.blue
 self.labelDiamond.textColor = UIColor.blue
 
 }
 
 
 @IBAction func bookPressedForSegment(_ sender: Any) {
 self.kindOfCostSegment.selectedSegmentIndex = 1
 self.labelWater.textColor = UIColor.blue
 self.labelBook.textColor = UIColor.white
 self.labelDiamond.textColor = UIColor.blue
 
 
 }
 
 
 @IBAction func diamondPressedForsegment(_ sender: Any) {
 self.kindOfCostSegment.selectedSegmentIndex = 2
 self.labelWater.textColor = UIColor.blue
 self.labelBook.textColor = UIColor.blue
 self.labelDiamond.textColor = UIColor.white
 
 }
 
 
 
 
 */


// dateFormatter.locale = Locale(identifier: "es_ES")
//  dateFormatter.locale = Locale(identifier: self.languageUsedBeforeEnteringSettings!)
//let localizedDate = localizeDate(date: Date())
// self.enteredDateLabel.text = dateFormatter.localizedDate
