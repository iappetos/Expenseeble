//
//  ReportViewController.swift
//  ExpenseWatch
//
//  Created by planB on 17/5/17.
//  Copyright © 2017 Ioannis. All rights reserved.
//

import UIKit
import CoreData
import SwiftKeychainWrapper

class ReportViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Properties
    
    var paidVersionIsOn : Bool = false
    var prizeTaken: String = " "
    
    //Variables deriving from the Table------
    var reportedTotalCosts: Double?
    var reportedPersonalCosts: Double?
    var reportedFamilyCosts: Double?
    var reportedBusinessCosts: Double?
    var reportedCashExpenses: Double?
    var reportedCardExpenses: Double?
    
    //Variables for the PerCent values
    var reportedPersonalPerCent: Double?
    var reportedFamilyPerCent: Double?
    var reportedBusinessPerCent: Double?
    var reportedCashPerCent: Double?
    var reportedCardPerCent: Double?
    var reportedSpentPerCent: Double?
    
    //Other Variables-------------------------
    var tableOfExpenses = [ExpenseCore]()
    var reportStartingDate: String? = ""
    var reportEndingDate: String? = ""
    
    //Regionized
    var stringOfDate: String = "dd/MM/yyyy, HH:mm"
    
    
    //ToBeLocalized
    @IBOutlet weak var labelUpPeriod: UILabel!
    @IBOutlet weak var labelProfile: UILabel!
    @IBOutlet weak var labelTotalCost: UILabel!
    @IBOutlet weak var labelLowCash: UILabel!
    @IBOutlet weak var labelLowCard: UILabel!
    
    
    //Cost Outlets----------------------------
    @IBOutlet weak var personalCostsLabel: UILabel!
    @IBOutlet weak var familyCostsLabel: UILabel!
    @IBOutlet weak var businessCostsLabel: UILabel!
    @IBOutlet weak var totalCostsLabel: UILabel!
    @IBOutlet weak var cashSpentLabel: UILabel!
    @IBOutlet weak var cardSpentLabel: UILabel!
    //@IBOutlet weak var totalIncomeLabel: UILabel!
    
    //Income Outlets---------------------------
    @IBOutlet weak var textFieldOfSource: UITextField!
   
    
    //PerCent Outlets
    @IBOutlet weak var personalPerCentLabel: UILabel!
    @IBOutlet weak var familyPerCentLabel: UILabel!
    @IBOutlet weak var businessPerCentLabel: UILabel!
    @IBOutlet weak var cashPerCentLabel: UILabel!
    @IBOutlet weak var cardPerCentLabel: UILabel!
    @IBOutlet weak var spentPerCentLabel: UILabel!
    
    @IBOutlet weak var labelOfSpentPerCentSign: UILabel!
    
    @IBOutlet weak var viewWithTotalCost: UIView!
    
    
    
    
    //Balance and Date Outlets
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var startingDateLabel: UILabel!
    @IBOutlet weak var endingDateLabel: UILabel!
    @IBOutlet weak var saveOrNotLabel: UILabel!
    
    //The Button
    //@IBOutlet weak var calculateButton: UIButton!
    
    //Images
    
    @IBOutlet weak var PersonalImage: UIImageView!
    @IBOutlet weak var HomeImage: UIImageView!
    @IBOutlet weak var BusinessImage: UIImageView!
    

    @IBOutlet weak var labelAOnReport: UILabel!
    @IBOutlet weak var labelBOnReport: UILabel!
    @IBOutlet weak var labelCOnReport: UILabel!
    
    
    //image for the bars
    
    
    
    @IBOutlet weak var labelForZeroPerCent: UILabel!
    @IBOutlet weak var labelForQuarterPerCent: UILabel!
    @IBOutlet weak var labelForHalfPerCent: UILabel!
    @IBOutlet weak var labelForThreeQuarters: UILabel!
    @IBOutlet weak var labelForHundredPerCent: UILabel!
    
    
    
    
    
    
    
    
    // MARK: - Salary Vars and Outlets
   //SalaryRelatedIssues======================================>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
    //@IBOutlet weak var labelIncomSalary: UILabel!
    @IBOutlet weak var switchForSalary: UISwitch!
    @IBOutlet weak var buttonForSalary: UIButton!
    @IBOutlet weak var labelOverSalaryIncome: UILabel!
   // @IBOutlet weak var labelOverSwitch: UILabel!
    
    
    var modeOfTheReport : IncomeModeObject?
    var incomeToUseInFunction : Double? = 0.00
    var theModeInWichTheReportIs : Bool?
    var timesOfSalaryPayments : Int = 0
    var spentToUseInFunction : Double? = 0.00
    //var salaryPaid : SalaryObject?
    
    
    //IncomeRelatedIssues======================================<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    
    // MARK: - Summing Functions
    //SUMMING functions
    
    func sumTotalExpenses(){
        var total: Double = 0.00
        for e in self.tableOfExpenses {
            let sizeOfEachExpense = e.size
            total += sizeOfEachExpense
        }
        reportedTotalCosts = total
        
    }
    
    
    func sumPersonalExpenses(){
        var total: Double = 0.0
        for e in self.tableOfExpenses {
            if e.kind == "Acost"{
                let sizeOfEachExpense = e.size
                total += sizeOfEachExpense
            }
        }
        reportedPersonalCosts = total
    }
    
    
    func sumFamilyExpenses(){
        var total: Double = 0.0
        for e in self.tableOfExpenses {
            if e.kind == "Bcost"{
                let sizeOfEachExpense = e.size
                total += sizeOfEachExpense
            }
        }
        reportedFamilyCosts = total
    }

    
    func sumBusinessExpenses(){
        var total: Double = 0.0
        for e in self.tableOfExpenses {
            if e.kind == "Ccost"{
                let sizeOfEachExpense = e.size
                total += sizeOfEachExpense
            }
        }
        reportedBusinessCosts = total
    }

    func sumCashExpenses(){
        var total: Double = 0.0
        for e in self.tableOfExpenses {
            if e.cash == true {
                let sizeOfEachExpense = e.size
                total += sizeOfEachExpense
            }
        }
        reportedCashExpenses = total
    }

    func sumCardExpenses(){
        var total: Double = 0.0
        for e in self.tableOfExpenses {
            if e.cash == false {
                let sizeOfEachExpense = e.size
                total += sizeOfEachExpense
            }
        }
        reportedCardExpenses = total
    }

    
    
    // MARK: - Calculating Actions & Functions
    
    //Calvulate Total Income and Balance
    
    @IBAction func calculateTotalIncome(_ sender: Any) {
    
        self.incomeToUseInFunction = Double(self.textFieldOfSource.text!)
        calculationOfBalanceUsingTheVarIncomeToUseInFunction()
        
    }
    
    
    //PER CENT Calculations--------------------------------
    
    
    func calculatePersonalPerCent(){
        var perCent: Double = 0.00
        perCent = (reportedPersonalCosts! / reportedTotalCosts!) * 100
        self.reportedPersonalPerCent = perCent
        
    }
    
    
    func calculateFamilyPerCent(){
        var perCent: Double = 0.00
        perCent = (reportedFamilyCosts! / reportedTotalCosts!) * 100
        self.reportedFamilyPerCent = perCent
        
    }

    
    func calculateBusinessPerCent(){
        var perCent: Double = 0.00
        perCent = (reportedBusinessCosts! / reportedTotalCosts!) * 100
        self.reportedBusinessPerCent = perCent
        
    }
    
    
    func calculateBalancePerCent(){
        var perCent: Double = 0.00
        perCent = (reportedBusinessCosts! / reportedTotalCosts!) * 100
        self.reportedBusinessPerCent = perCent
        
    }
    
    func calculateCashPerCent(){
        var perCent: Double = 0.00
        perCent = (reportedCashExpenses! / reportedTotalCosts!) * 100
        self.reportedCashPerCent = perCent
    }
    
    func calculateCardPerCent(){
        var perCent: Double = 0.00
        perCent = (reportedCardExpenses! / reportedTotalCosts!) * 100
        self.reportedCardPerCent = perCent
    }
    
    
    /*
    func calculateSpentPerCent(){
    
        var perCent: Float = 0.0
        if (modeOfTheReport != nil) {
            
            self.incomeToUseInFunction = Float(self.sourceALabel.text)
            perCent = (reportedTotalCosts! / incomeToUseInFunction! ) * 100
            self.reportedSpentPerCent = perCent
        }
             self.incomeToUseInFunction =
        perCent = (reportedTotalCosts! / incomeToUseInFunction!) * 100
        self.reportedSpentPerCent = perCent
        
    }
    
    */
    
    
    
    // MARK: - Graphical Functions
    
    
    //position the perCent labels( we call this function whenever we draw the lines)
    
    func positionThePerCentLabels(){
        let  widthOfIOSDevice = UIScreen.main.bounds.size.width
        let  heightOfIOSDevice = UIScreen.main.bounds.size.height
        
        
        if widthOfIOSDevice < 350 && heightOfIOSDevice < 800  {
            //small iphone
            print("the device has width \(widthOfIOSDevice) so its smaller than 350")
            
            
            labelForZeroPerCent.frame.origin = CGPoint(x:59, y:300 )
            labelForQuarterPerCent.frame.origin = CGPoint(x:115.5, y:300 )
            labelForHalfPerCent.frame.origin = CGPoint(x:178, y:300 )
            labelForThreeQuarters.frame.origin = CGPoint(x:240.5, y:300 )
            labelForHundredPerCent.frame.origin = CGPoint(x:290, y:300 )
            
          
            
            
            
            
        } else if widthOfIOSDevice > 350 && widthOfIOSDevice < 700 && heightOfIOSDevice < 800 {
            //iphone
            print("the device has width \(widthOfIOSDevice) so its bigger than 350 but its not an ipad")
            
            labelForZeroPerCent.frame.origin = CGPoint(x:59, y:300 )
            labelForQuarterPerCent.frame.origin = CGPoint(x:128, y:300 )
            labelForHalfPerCent.frame.origin = CGPoint(x:203, y:300 )
            labelForThreeQuarters.frame.origin = CGPoint(x:278, y:300 )
            labelForHundredPerCent.frame.origin = CGPoint(x:340, y:300 )
            
            
        } else if widthOfIOSDevice > 350 && widthOfIOSDevice < 700 && heightOfIOSDevice > 800 {
            //iphone X
            print("the device has heght \(heightOfIOSDevice) so its bigger than 800 so yoy have an X")
            
            labelForZeroPerCent.frame.origin = CGPoint(x:59, y:320 )
            labelForQuarterPerCent.frame.origin = CGPoint(x:128, y:320 )
            labelForHalfPerCent.frame.origin = CGPoint(x:203, y:320 )
            labelForThreeQuarters.frame.origin = CGPoint(x:278, y:320 )
            labelForHundredPerCent.frame.origin = CGPoint(x:340, y:320 )
            
            
            
        } else  {
            //ipad
            print("the device has width \(widthOfIOSDevice) so its an ipad")
            
            labelForZeroPerCent.frame.origin = CGPoint(x:59, y:300 )
            labelForQuarterPerCent.frame.origin = CGPoint(x:228, y:300 )
            labelForHalfPerCent.frame.origin = CGPoint(x:403, y:300 )
            labelForThreeQuarters.frame.origin = CGPoint(x:578, y:300 )
            labelForHundredPerCent.frame.origin = CGPoint(x:740, y:300 )
            
            
            
        
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
     //Drawing the 4 Vertical lines for quarter, half, threeQuarters and full
    
    func drawLines(){
        
        let  widthOfIOSDevice = UIScreen.main.bounds.size.width
        let  heightOfIOSDevice = UIScreen.main.bounds.size.height
        
        
        if widthOfIOSDevice < 350 {
            //small iphone
             print("the device has width \(widthOfIOSDevice) so its smaller than 350")
            
            let zeroPath = UIBezierPath(rect: CGRect(x: 61, y: 145, width: 2, height: 150))
            let layer0 = CAShapeLayer()
            layer0.path = zeroPath.cgPath
            layer0.strokeColor = UIColor.black.cgColor
            layer0.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer0)
            
            
            
            let doYourPath = UIBezierPath(rect: CGRect(x: 60 + 62.5, y: 145, width: 2, height: 150))
            let layer = CAShapeLayer()
            layer.path = doYourPath.cgPath
            layer.strokeColor = UIColor.black.cgColor
            layer.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer)
            
            
            let halfPath = UIBezierPath(rect: CGRect(x: 60 + 125, y: 145, width: 2, height: 150))
            let layer2 = CAShapeLayer()
            layer2.path = halfPath.cgPath
            layer2.strokeColor = UIColor.black.cgColor
            layer2.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer2)
            
            let morePath = UIBezierPath(rect: CGRect(x: 60 + 187.5, y: 145, width: 2, height: 150))
            let layer3 = CAShapeLayer()
            layer3.path = morePath.cgPath
            layer3.strokeColor = UIColor.black.cgColor
            layer3.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer3)
            
            let fullPath = UIBezierPath(rect: CGRect(x: 60 + 250, y: 145, width: 2, height: 150))
            let layer4 = CAShapeLayer()
            layer4.path = fullPath.cgPath
            layer4.strokeColor = UIColor.black.cgColor
            layer4.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer4)
            
            
            
            
        } else if widthOfIOSDevice > 350 && widthOfIOSDevice < 700  && heightOfIOSDevice < 800 {
            //iphone
            print("the device has width \(widthOfIOSDevice) so its bigger than 350 but its not an ipad")
            
            
            let zeroPath = UIBezierPath(rect: CGRect(x: 61, y: 145, width: 2, height: 150))
            let layer0 = CAShapeLayer()
            layer0.path = zeroPath.cgPath
            layer0.strokeColor = UIColor.black.cgColor
            layer0.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer0)
            
            
            
            let doYourPath = UIBezierPath(rect: CGRect(x: 60+75, y: 145, width: 2, height: 150))
            let layer = CAShapeLayer()
            layer.path = doYourPath.cgPath
            layer.strokeColor = UIColor.black.cgColor
            layer.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer)
            
            
            let halfPath = UIBezierPath(rect: CGRect(x: 60+150, y: 145, width: 2, height: 150))
            let layer2 = CAShapeLayer()
            layer2.path = halfPath.cgPath
            layer2.strokeColor = UIColor.black.cgColor
            layer2.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer2)
            
            let morePath = UIBezierPath(rect: CGRect(x: 60+225, y: 145, width: 2, height: 150))
            let layer3 = CAShapeLayer()
            layer3.path = morePath.cgPath
            layer3.strokeColor = UIColor.black.cgColor
            layer3.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer3)
            
            let fullPath = UIBezierPath(rect: CGRect(x: 60+300, y: 145, width: 2, height: 150))
            let layer4 = CAShapeLayer()
            layer4.path = fullPath.cgPath
            layer4.strokeColor = UIColor.black.cgColor
            layer4.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer4)
            
            
            
            
        } else if widthOfIOSDevice > 350 && widthOfIOSDevice < 700  && heightOfIOSDevice > 800 {
            //iphone X
            print("the device has heght \(heightOfIOSDevice) so its bigger than 800 so yoy have an X")
            
            let zeroPath = UIBezierPath(rect: CGRect(x: 61, y: 165, width: 2, height: 150))
            let layer0 = CAShapeLayer()
            layer0.path = zeroPath.cgPath
            layer0.strokeColor = UIColor.black.cgColor
            layer0.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer0)
            
            
            
            let doYourPath = UIBezierPath(rect: CGRect(x: 60+75, y: 165, width: 2, height: 150))
            let layer = CAShapeLayer()
            layer.path = doYourPath.cgPath
            layer.strokeColor = UIColor.black.cgColor
            layer.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer)
            
            
            let halfPath = UIBezierPath(rect: CGRect(x: 60+150, y: 165, width: 2, height: 150))
            let layer2 = CAShapeLayer()
            layer2.path = halfPath.cgPath
            layer2.strokeColor = UIColor.black.cgColor
            layer2.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer2)
            
            let morePath = UIBezierPath(rect: CGRect(x: 60+225, y: 165, width: 2, height: 150))
            let layer3 = CAShapeLayer()
            layer3.path = morePath.cgPath
            layer3.strokeColor = UIColor.black.cgColor
            layer3.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer3)
            
            let fullPath = UIBezierPath(rect: CGRect(x: 60+300, y: 165, width: 2, height: 150))
            let layer4 = CAShapeLayer()
            layer4.path = fullPath.cgPath
            layer4.strokeColor = UIColor.black.cgColor
            layer4.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer4)
            
            
            
            
            
        } else {
            //ipad
            print("the device has width \(widthOfIOSDevice) so its an ipad")
            
            let zeroPath = UIBezierPath(rect: CGRect(x: 61, y: 145, width: 2, height: 150))
            let layer0 = CAShapeLayer()
            layer0.path = zeroPath.cgPath
            layer0.strokeColor = UIColor.black.cgColor
            layer0.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer0)
            
            
            
            let doYourPath = UIBezierPath(rect: CGRect(x: 60+175, y: 145, width: 2, height: 150))
            let layer = CAShapeLayer()
            layer.path = doYourPath.cgPath
            layer.strokeColor = UIColor.black.cgColor
            layer.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer)
            
            
            let halfPath = UIBezierPath(rect: CGRect(x: 60+350, y: 145, width: 2, height: 150))
            let layer2 = CAShapeLayer()
            layer2.path = halfPath.cgPath
            layer2.strokeColor = UIColor.black.cgColor
            layer2.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer2)
            
            let morePath = UIBezierPath(rect: CGRect(x: 60+525, y: 145, width: 2, height: 150))
            let layer3 = CAShapeLayer()
            layer3.path = morePath.cgPath
            layer3.strokeColor = UIColor.black.cgColor
            layer3.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer3)
            
            let fullPath = UIBezierPath(rect: CGRect(x: 60+700, y: 145, width: 2, height: 150))
            let layer4 = CAShapeLayer()
            layer4.path = fullPath.cgPath
            layer4.strokeColor = UIColor.black.cgColor
            layer4.fillColor = UIColor.black.cgColor
            self.view.layer.addSublayer(layer4)
            
            
            
        }
       
        
    positionThePerCentLabels()
       
    //end of line drawing
    }
    
    
    //Drawing the Bars====================================
    
    func drawBars(){
        
        
       let  widthOfIOSDevice = UIScreen.main.bounds.size.width
       let  heightOfIOSDevice = UIScreen.main.bounds.size.height
        
        
        if widthOfIOSDevice > 350  && widthOfIOSDevice < 700 && heightOfIOSDevice < 800 {
            
            print("the device has width \(widthOfIOSDevice) so its bigger that 350")
            
            //BREATHING
            if Int(reportedTotalCosts!) > 0 {
                
                let breathBar = UIBezierPath()
                breathBar.move(to: CGPoint(x: 60, y: 150))
                
                
                breathBar.addLine(to: CGPoint(x: 60 + Int(reportedPersonalPerCent!)*3, y: 150))
                breathBar.addLine(to: CGPoint(x: 60 + Int(reportedPersonalPerCent!)*3, y: 190))
                breathBar.addLine(to: CGPoint(x: 60, y: 190))
                
                
                breathBar.close()
                
                let breathingPlace = CAShapeLayer()
                breathingPlace.path = breathBar.cgPath
                breathingPlace.fillColor = UIColor.green.cgColor
                self.view.layer.addSublayer(breathingPlace)
                
                
                //Growing
                let growBar = UIBezierPath()
                growBar.move(to: CGPoint(x: 60, y: 200))
                
                
                growBar.addLine(to: CGPoint(x: 60 + Int(reportedFamilyPerCent!)*3, y: 200))
                growBar.addLine(to: CGPoint(x: 60 + Int(reportedFamilyPerCent!)*3, y: 240))
                growBar.addLine(to: CGPoint(x: 60, y: 240))
                
                
                growBar.close()
                
                let growingPlace = CAShapeLayer()
                growingPlace.path = growBar.cgPath
                growingPlace.fillColor = UIColor.blue.cgColor
                
                
                self.view.layer.addSublayer(growingPlace)
                
                
                //Charming
                let charmBar = UIBezierPath()
                charmBar.move(to: CGPoint(x: 60, y: 250))
                
                
                charmBar.addLine(to: CGPoint(x: 60 + Int(reportedBusinessPerCent!)*3, y: 250))
                charmBar.addLine(to: CGPoint(x: 60 + Int(reportedBusinessPerCent!)*3, y: 290))
                charmBar.addLine(to: CGPoint(x: 60, y: 290))
                
                
                charmBar.close()
                
                let charmingPlace = CAShapeLayer()
                charmingPlace.path = charmBar.cgPath
                charmingPlace.fillColor = UIColor.orange.cgColor
                self.view.layer.addSublayer(charmingPlace)
                
                
           //close if reported total costs
            }
            
            
            
            
        } else if widthOfIOSDevice > 350  && widthOfIOSDevice < 700 && heightOfIOSDevice > 800 {
            print("you have iphoneX")
            
            //BREATHING
            if Int(reportedTotalCosts!) > 0 {
                
                let breathBar = UIBezierPath()
                breathBar.move(to: CGPoint(x: 60, y: 170))
                
                
                breathBar.addLine(to: CGPoint(x: 60 + Int(reportedPersonalPerCent!)*3, y: 170))
                breathBar.addLine(to: CGPoint(x: 60 + Int(reportedPersonalPerCent!)*3, y: 210))
                breathBar.addLine(to: CGPoint(x: 60, y: 210))
                
                
                breathBar.close()
                
                let breathingPlace = CAShapeLayer()
                breathingPlace.path = breathBar.cgPath
                breathingPlace.fillColor = UIColor.green.cgColor
                self.view.layer.addSublayer(breathingPlace)
                
                
                //Growing
                let growBar = UIBezierPath()
                growBar.move(to: CGPoint(x: 60, y: 220))
                
                
                growBar.addLine(to: CGPoint(x: 60 + Int(reportedFamilyPerCent!)*3, y: 220))
                growBar.addLine(to: CGPoint(x: 60 + Int(reportedFamilyPerCent!)*3, y: 260))
                growBar.addLine(to: CGPoint(x: 60, y: 260))
                
                
                growBar.close()
                
                let growingPlace = CAShapeLayer()
                growingPlace.path = growBar.cgPath
                growingPlace.fillColor = UIColor.blue.cgColor
                
                
                self.view.layer.addSublayer(growingPlace)
                
                
                //Charming
                let charmBar = UIBezierPath()
                charmBar.move(to: CGPoint(x: 60, y: 270))
                
                
                charmBar.addLine(to: CGPoint(x: 60 + Int(reportedBusinessPerCent!)*3, y: 270))
                charmBar.addLine(to: CGPoint(x: 60 + Int(reportedBusinessPerCent!)*3, y: 310))
                charmBar.addLine(to: CGPoint(x: 60, y: 310))
                
                
                charmBar.close()
                
                let charmingPlace = CAShapeLayer()
                charmingPlace.path = charmBar.cgPath
                charmingPlace.fillColor = UIColor.orange.cgColor
                self.view.layer.addSublayer(charmingPlace)
                
                
                //close if reported total costs
            }
            
            
            
            //close if width >350 and <1000
        } else if widthOfIOSDevice < 350 {
            //if width <350 (iphone 5, SE)
            print("the device has width \(widthOfIOSDevice) so its smaller that 350")
            
            
        
        //BREATHING
        if Int(reportedTotalCosts!) > 0 {
            
            let breathBar = UIBezierPath()
            breathBar.move(to: CGPoint(x: 60, y: 150))
            
            
            breathBar.addLine(to: CGPoint(x: Int(60 + Float(reportedPersonalPerCent!) * 2.5), y: 150))
            breathBar.addLine(to: CGPoint(x: Int(60 + Float(reportedPersonalPerCent!) * 2.5), y: 190))
            breathBar.addLine(to: CGPoint(x: 60, y: 190))
            
            
            breathBar.close()
            
            let breathingPlace = CAShapeLayer()
            breathingPlace.path = breathBar.cgPath
            breathingPlace.fillColor = UIColor.green.cgColor
            self.view.layer.addSublayer(breathingPlace)
            
            
            //Growing
            let growBar = UIBezierPath()
            growBar.move(to: CGPoint(x: 60, y: 200))
            
            
            growBar.addLine(to: CGPoint(x: Int(60 + Float(reportedFamilyPerCent!) * 2.5), y: 200))
            growBar.addLine(to: CGPoint(x: Int(60 + Float(reportedFamilyPerCent!) * 2.5), y: 240))
            growBar.addLine(to: CGPoint(x: 60, y: 240))
            
            
            growBar.close()
            
            let growingPlace = CAShapeLayer()
            growingPlace.path = growBar.cgPath
            growingPlace.fillColor = UIColor.blue.cgColor
            
            
            self.view.layer.addSublayer(growingPlace)
            
            
            //Charming
            let charmBar = UIBezierPath()
            charmBar.move(to: CGPoint(x: 60, y: 250))
            
            
            charmBar.addLine(to: CGPoint(x: Int(60 + Float(reportedBusinessPerCent!) * 2.5), y: 250))
            charmBar.addLine(to: CGPoint(x: Int(60 + Float(reportedBusinessPerCent!) * 2.5), y: 290))
            charmBar.addLine(to: CGPoint(x: 60, y: 290))
            
            
            charmBar.close()
            
            let charmingPlace = CAShapeLayer()
            charmingPlace.path = charmBar.cgPath
            charmingPlace.fillColor = UIColor.orange.cgColor
            self.view.layer.addSublayer(charmingPlace)
            
            
            //close if reported total costs
        }
            
            
            
        //close else for width
        } else {
            //if width > 700 (ipad)
             print("the device has width \(widthOfIOSDevice) so its an ipad")
            
            //BREATHING
            if Int(reportedTotalCosts!) > 0 {
                
                let breathBar = UIBezierPath()
                breathBar.move(to: CGPoint(x: 60, y: 150))
                
                
                breathBar.addLine(to: CGPoint(x: Int(60 + Float(reportedPersonalPerCent!) * 7), y: 150))
                breathBar.addLine(to: CGPoint(x: Int(60 + Float(reportedPersonalPerCent!) * 7), y: 190))
                breathBar.addLine(to: CGPoint(x: 60, y: 190))
                
                
                breathBar.close()
                
                let breathingPlace = CAShapeLayer()
                breathingPlace.path = breathBar.cgPath
                breathingPlace.fillColor = UIColor.green.cgColor
                self.view.layer.addSublayer(breathingPlace)
                
                
                //Growing
                let growBar = UIBezierPath()
                growBar.move(to: CGPoint(x: 60, y: 200))
                
                
                growBar.addLine(to: CGPoint(x: Int(60 + Float(reportedFamilyPerCent!) * 7), y: 200))
                growBar.addLine(to: CGPoint(x: Int(60 + Float(reportedFamilyPerCent!) * 7), y: 240))
                growBar.addLine(to: CGPoint(x: 60, y: 240))
                
                
                growBar.close()
                
                let growingPlace = CAShapeLayer()
                growingPlace.path = growBar.cgPath
                growingPlace.fillColor = UIColor.blue.cgColor
                
                
                self.view.layer.addSublayer(growingPlace)
                
                
                //Charming
                let charmBar = UIBezierPath()
                charmBar.move(to: CGPoint(x: 60, y: 250))
                
                
                charmBar.addLine(to: CGPoint(x: Int(60 + Float(reportedBusinessPerCent!) * 7), y: 250))
                charmBar.addLine(to: CGPoint(x: Int(60 + Float(reportedBusinessPerCent!) * 7), y: 290))
                charmBar.addLine(to: CGPoint(x: 60, y: 290))
                
                
                charmBar.close()
                
                let charmingPlace = CAShapeLayer()
                charmingPlace.path = charmBar.cgPath
                charmingPlace.fillColor = UIColor.orange.cgColor
                self.view.layer.addSublayer(charmingPlace)
                
                
                //close if reported total costs
            }
            
            
            
            
            
            
            
            
            
        //close else if width > 1000
        }
        
        
        
      //close function
    }
    
    /*
    // drawing in subview
    
    func drawBarsInSubview(){
        
        
        // let  widthOfIOSDevice = UIScreen.main.bounds.size.height
        
        //BREATHING
        if Int(reportedTotalCosts!) > 0 {
            
            let breathBar = UIBezierPath()
            breathBar.move(to: CGPoint(x: viewForGraphics.frame.size.width, y: viewForGraphics.frame.size.height/2))
            
            
            breathBar.addLine(to: CGPoint(x: viewForGraphics.frame.size.width/2 + Int(reportedPersonalPerCent!)*3, y: 150))
            breathBar.addLine(to: CGPoint(x: 60 + Int(reportedPersonalPerCent!)*3, y: 190))
            breathBar.addLine(to: CGPoint(x: 60, y: 190))
            
            
            breathBar.close()
            
            let breathingPlace = CAShapeLayer()
            breathingPlace.path = breathBar.cgPath
            breathingPlace.fillColor = UIColor.green.cgColor
            self.view.layer.addSublayer(breathingPlace)
            
            
            //Growing
            let growBar = UIBezierPath()
            growBar.move(to: CGPoint(x: 60, y: 200))
            
            
            growBar.addLine(to: CGPoint(x: 60 + Int(reportedFamilyPerCent!)*3, y: 200))
            growBar.addLine(to: CGPoint(x: 60 + Int(reportedFamilyPerCent!)*3, y: 240))
            growBar.addLine(to: CGPoint(x: 60, y: 240))
            
            
            growBar.close()
            
            let growingPlace = CAShapeLayer()
            growingPlace.path = growBar.cgPath
            growingPlace.fillColor = UIColor.blue.cgColor
            
            
            self.view.layer.addSublayer(growingPlace)
            
            
            //Charming
            let charmBar = UIBezierPath()
            charmBar.move(to: CGPoint(x: 60, y: 250))
            
            
            charmBar.addLine(to: CGPoint(x: 60 + Int(reportedBusinessPerCent!)*3, y: 250))
            charmBar.addLine(to: CGPoint(x: 60 + Int(reportedBusinessPerCent!)*3, y: 290))
            charmBar.addLine(to: CGPoint(x: 60, y: 290))
            
            
            charmBar.close()
            
            let charmingPlace = CAShapeLayer()
            charmingPlace.path = charmBar.cgPath
            charmingPlace.fillColor = UIColor.red.cgColor
            self.view.layer.addSublayer(charmingPlace)
            
        }
        
        
        
    }*/
    
    
  
    
    
    
    
    // MARK: - View Issues
    
    func takeStringsOfReportAndLocalizeThem(){
        navigationItem.title = LocalizedString.navItemReportTitle.localized
        navigationItem.rightBarButtonItem?.title = LocalizedString.navItemReportRight.localized
        self.labelUpPeriod.text = LocalizedString.periodUpTitle.localized
        self.labelProfile.text = LocalizedString.profileOverIstogram.localized
        self.saveOrNotLabel.text = LocalizedString.outcome.localized
        self.labelTotalCost.text = LocalizedString.totalCostInReport.localized
        self.labelLowCash.text = LocalizedString.cashInReport.localized
        self.labelLowCard.text = LocalizedString.cardInReport.localized
        
    }
    
    
    
    func loadFreeOrPaid(){
        let isPaid = KeychainWrapper.standard.bool(forKey: myProductList.appPro) ?? false
        if isPaid {
                   self.paidVersionIsOn = true
               }
    }//Func
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFreeOrPaid()
        
      
        
        //self.calculateButton.layer.cornerRadius = 7
        self.buttonForSalary.layer.cornerRadius = 7
        self.viewWithTotalCost.layer.cornerRadius = 4
        self.textFieldOfSource.backgroundColor = UIColor.white //init(colorLiteralRed: 80/255, green: 80/255, blue: 80/255, alpha: 0.3), forKeyPath: "_placeholderLabel.textColor")
       
        
        takeStringsOfReportAndLocalizeThem()
        
        
        
        
        
        
        //Disabling the button when the textfield is empty(in connection with the text Field function) & grey Out==============>
        textFieldOfSource.delegate = self
        if (textFieldOfSource.text?.isEmpty)!{
            buttonForSalary.isUserInteractionEnabled = false
            buttonForSalary.backgroundColor = UIColor.clear
            buttonForSalary.setTitleColor(UIColor.gray, for: .normal)
        }
        //Disabling the button when the textfield is empty(in connection with the text Field function)==============<
        
        //for keyboard hiding==============
        self.textFieldOfSource.delegate = self
        //=================================
        /*
        PersonalImage.image = #imageLiteral(resourceName: "Personal.png")
        HomeImage.image = #imageLiteral(resourceName: "Home.png")
        BusinessImage.image = #imageLiteral(resourceName: "Business.png")
        */
        //userDefautls---------------BUTTONS-----------------------------
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
            
            let picture = UIImage(data: imageData as Data)
            PersonalImage.image = picture
        }
        
        if let imageBData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
            
            let pictureB = UIImage(data: imageBData as Data)
            HomeImage.image = pictureB
        }
        
        if let imageCData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
            
            let pictureC = UIImage(data: imageCData as Data)
            BusinessImage.image = pictureC
        }

        //-------------------------------------------------------------------------
        
        
        //userDefautls---------------LABELS-----------------------------
        if let categoryA = UserDefaults.standard.value(forKey: "categoryA") as? String {
            labelAOnReport.text = categoryA
        }
        
        if let categoryB = UserDefaults.standard.value(forKey: "categoryB") as? String {
            labelBOnReport.text = categoryB
        }
        
        if let categoryC = UserDefaults.standard.value(forKey: "categoryC") as? String {
            labelCOnReport.text = categoryC
        }
        
          //-------------------------------------------------------------------------
        
        
        
        
        
        
        
        
        
        
        
        //Period Dates from the DatePicker Arrangement
        self.startingDateLabel.text = self.reportStartingDate
        self.endingDateLabel.text = self.reportEndingDate
        
        //Summing
        sumTotalExpenses()
        sumPersonalExpenses()
        sumFamilyExpenses()
        sumBusinessExpenses()
        sumCashExpenses()
        sumCardExpenses()
        
        //PerCent
        if Int(reportedTotalCosts!) > 0 {
        calculatePersonalPerCent()
        calculateFamilyPerCent()
        calculateBusinessPerCent()
         calculateCashPerCent()
         calculateCardPerCent()
        }
        
        
        
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        
        //Labels Filled with CURRENCY
        
        
        self.totalCostsLabel.text = myFormatter.string(from: self.reportedTotalCosts! as NSNumber)
        self.personalCostsLabel.text = myFormatter.string(from: reportedPersonalCosts! as NSNumber)
        self.familyCostsLabel.text = myFormatter.string(from: reportedFamilyCosts! as NSNumber)
        self.businessCostsLabel.text = myFormatter.string(from: reportedBusinessCosts! as NSNumber)
        self.cashSpentLabel.text = myFormatter.string(from: reportedCashExpenses! as NSNumber)
        self.cardSpentLabel.text = myFormatter.string(from: reportedCardExpenses! as NSNumber)
        
        //self.totalCostsLabel.text = String(describing: reportedTotalCosts!)
        //self.personalCostsLabel.text = String(describing: reportedPersonalCosts!)
        //self.familyCostsLabel.text = String(describing: reportedFamilyCosts!)
        //self.businessCostsLabel.text = String(describing: reportedBusinessCosts!)
       // self.cashSpentLabel.text = String(describing: reportedCashExpenses!)
       // self.cardSpentLabel.text = String(describing: reportedCardExpenses!)
        
    
        //PerCent Labels Filled================================>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        let formatter = NumberFormatter()
        //formatter.numberStyle = .decimal
        //formatter.roundingMode = .floor
         //formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 0
        
        if Int(reportedTotalCosts!) > 0 {
        self.personalPerCentLabel.text = formatter.string(from: NSNumber(value: reportedPersonalPerCent!))
        self.familyPerCentLabel.text = formatter.string(from: NSNumber(value: reportedFamilyPerCent!))
        self.businessPerCentLabel.text = formatter.string(from: NSNumber(value: reportedBusinessPerCent!))
        self.cashPerCentLabel.text = formatter.string(from: NSNumber(value:reportedCashPerCent!))
        self.cardPerCentLabel.text = formatter.string(from: NSNumber(value:reportedCardPerCent!))
        //self.spentPerCentLabel.text = formatter.string(from: NSNumber(value:spentToUseInFunction!))
        }
        //PerCent Labels Filled================================<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
       
        //And now that we made all the calculations arrange the view accordingly
        arrangeTheViewAndMakeAllCalculationsAccordingToTheIncomeModeWhenEnteringReport()
        drawLines()
        drawBars()
        
        
        
    }

    
    //keyboard shows
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField: textFieldOfSource, moveDistance: -70, up: true)
    }
    
    //keybord hidden
    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField: textFieldOfSource, moveDistance: 0, up: false)
    }
    
    
    
    
    
   //moving textField for small iphones
    func moveTextField(textField: UITextField, moveDistance:Int, up: Bool) {
        let  widthOfIOSDevice = UIScreen.main.bounds.size.width
        if widthOfIOSDevice < 350 {
        
        
        let moveDuration = 0.6
        let movement : CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = CGRect(x: 0, y: movement, width:self.view.bounds.width, height:self.view.bounds.height)
        UIView.commitAnimations()
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    //hiding the keyboard=========================================================
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        textFieldOfSource.resignFirstResponder()
        //sourceBLabel.resignFirstResponder()
        //sourceCLabel.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //costTextField.resignFirstResponder()
        // nameTextField.resignFirstResponder()
        self.view.endEditing(true)
        
    }
    
    //==================================================
   
    
    
    
    
    
    
    
   // override func viewWillAppear(_ animated: Bool) {
     //   calculateButton.isEnabled = false
  //  }
    
    
    
    //The Function that disables the Button when the text field is empty(in conection with the viewDidload text fielf lines)=======================================
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text = (textFieldOfSource.text! as NSString).replacingCharacters(in: range, with: string)
        
        if !text.isEmpty{
            self.buttonForSalary.isUserInteractionEnabled = true
            buttonForSalary.backgroundColor = UIColor.blue
            self.buttonForSalary.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            
        } else {
            self.buttonForSalary.isUserInteractionEnabled = false
            buttonForSalary.backgroundColor = UIColor.clear
            buttonForSalary.setTitleColor(UIColor.gray, for: .normal)
        }
        return true
    }
    
    //======================================================
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
    // MARK: - Salary Functions
    //SALARY ISSUES==============================>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
    
    func arrangeTheViewAndMakeAllCalculationsAccordingToTheIncomeModeWhenEnteringReport(){
        //SALARY
        
        //find Mode toutestin Unarchive it=======================================
        
        
        //If there is a mode DAT Try to find it, utherwise we will have nil---------------------------------------
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        if Bundle.path(forResource: "mode", ofType: ".dat", inDirectory: documentsPath) != nil {
            
            
            
            findTheStoredModePropertyUnachiveItAndUseItToPutTheSwitchAndTheVARToTheCorrectState()
            
            
            //if the Var(the mode of the IncomeModeObject) is true========================================
            if theModeInWichTheReportIs! {
                
                print("We entered in report while in Income mode So do no calculations, just fix the view")
                enterIncomeMode()
                
                //if we are in salary mode, do we have a stored SALARY????==============================================
            } else if Bundle.path(forResource: "salary", ofType: ".dat", inDirectory: documentsPath) != nil {
                
                enterSalaryMode()
                //find Salary toutestin Unarchive it========================================
                
                let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
                print("app dir: \(documentsPath)")
                let salaryPath = Bundle.path(forResource: "salary", ofType: ".dat", inDirectory: documentsPath)
                let salaryStored = NSKeyedUnarchiver.unarchiveObject(withFile: salaryPath!) as! SalaryObject
                
                
                print("We found the stored salary to be\(String(describing: salaryStored)) in \(String(describing: salaryPath))")
                
                //and fill the relevant fields with the result=======================
                if (textFieldOfSource.text?.isEmpty)!{
                    buttonForSalary.isUserInteractionEnabled = false
                    buttonForSalary.backgroundColor = UIColor.clear
                    buttonForSalary.setTitleColor(UIColor.gray, for: .normal)
                }else {
                self.buttonForSalary.setTitle(LocalizedString.storeNewSalary.localized, for: .normal)
                self.buttonForSalary.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
                
                }
                
                //SalaryTimes-----------------
                
                calculationOfSalaryTimesPaymentInSalaryModeAccordingToThePeriodSelected()
                
                 //SalaryTimes-----------------
                self.incomeToUseInFunction = salaryStored.income! * Double(timesOfSalaryPayments)
                calculationOfBalanceUsingTheVarIncomeToUseInFunction()
                
                
                //PerCent Saved or Spent
                self.spentToUseInFunction = self.reportedTotalCosts
                calculateTheSpentPerCentAccordingToPositiveOrNegativeBalance()
                
                //self.sourceALabel.text = "stored:" +
                
                
            } else {
                
                enterSalaryMode()
                alertForEnteringInSalaryModeWithoutASalaryStored()
                
            }
            
            //SALARY=================================================
        }
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func enterOrLeaveSalaryMode(_ sender: Any) {
        if switchForSalary.isOn {
            
            //save the mode bool and make it true (we are in Income mode)
            storeTheModePropertyOfIncomeModeObjectWithTheSwitchForSalaryValueToTheModeDatFile()
          
            //and arrange relevant buttons and the fields
            enterIncomeMode()
            
            self.balanceLabel.text = ""
            self.textFieldOfSource.text = ""
            self.spentPerCentLabel.text = ""
            self.labelOfSpentPerCentSign.text = ""
            
            self.saveOrNotLabel.text = LocalizedString.outcome.localized
            self.saveOrNotLabel.textColor = UIColor.black
            
            
           
        } else {
            
            //πιθανόν η 3η function να υπαρκαλύπει τις 2 πρώτες
            
            
            //save the mode bool and make it false (we are in Salary mode)
            storeTheModePropertyOfIncomeModeObjectWithTheSwitchForSalaryValueToTheModeDatFile()
            
            //and arrange relevant buttons and the fields
            enterSalaryMode()
            
            //when we switch to salary mode we use the stored amount(if there is one) for the calculations
            arrangeTheViewAndMakeAllCalculationsAccordingToTheIncomeModeWhenEnteringReport()
            
            self.textFieldOfSource.text = ""
            
            
            calculateTheSpentPerCentAccordingToPositiveOrNegativeBalance()
        }
    }
    
    
    
    @IBAction func saveSalary(_ sender: Any) {
        
        if self.switchForSalary.isOn {
            
            
            self.incomeToUseInFunction = Double(self.textFieldOfSource.text!)
            calculationOfBalanceUsingTheVarIncomeToUseInFunction()
            
            
            //PerCent Saved or Spent
            self.spentToUseInFunction = self.reportedTotalCosts
            calculateTheSpentPerCentAccordingToPositiveOrNegativeBalance()
            
            
            
            
            
        } else {
            //=================================================The code to save income with switch On and salaryText full=============================
            if  !(self.textFieldOfSource.text?.isEmpty)!{
                
                
                let pathToSave = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
                print("app dir: \(pathToSave)")
                let fileName = "salary" + ".dat"
                let fullPath = pathToSave + "/" + fileName
                print("Saving to file \(fullPath)")
                
                let mySavedMontlyIncome = SalaryObject (income: Double(self.textFieldOfSource.text!),
                                                        salaryFilePath: fullPath.description)
                
                
                NSKeyedArchiver.archiveRootObject(mySavedMontlyIncome ,toFile: fullPath)
                print("salary that is stored  \(String(describing: mySavedMontlyIncome.income?.description))")
                print("salary is stored on filePath \(String(describing: mySavedMontlyIncome.salaryFilePath?.description))")
                
                
                
            
                
                
                
                //and fill the relevant fields with the result=======================
                
                 calculationOfSalaryTimesPaymentInSalaryModeAccordingToThePeriodSelected()
                
                
                
                self.incomeToUseInFunction = Double(self.textFieldOfSource.text!)! * Double(timesOfSalaryPayments)
                calculationOfBalanceUsingTheVarIncomeToUseInFunction()
                
                //PerCent Saved or Spent
                self.spentToUseInFunction = self.reportedTotalCosts
                calculateTheSpentPerCentAccordingToPositiveOrNegativeBalance()
                
                
                
                //empty the textField when enter is pressed so that the stored value to appear
                
                let myFormatter = NumberFormatter()
                myFormatter.numberStyle = .currency
                
                let formattedSavedIncome = myFormatter.string(from: mySavedMontlyIncome.income! as NSNumber)
                
                self.textFieldOfSource.placeholder = LocalizedString.placeHolderStored.localized + formattedSavedIncome!
                
               // self.textFieldOfSource.placeholder = "stored:" + (mySavedMontlyIncome.income?.description)!
                self.textFieldOfSource.text = ""
                
                
                
                
                
                
                //=================================================But if switch is on but salary text is empty give an Alert=============================
            } else {
                alertForEmptySalaryField()
            }
            
        }
        
       
    }
    
    
    
    
    func storeTheModePropertyOfIncomeModeObjectWithTheSwitchForSalaryValueToTheModeDatFile(){
       /*
        if let incomeMode = UserDefaults.standard.value(forKey: "ModeOfIncome") as? Bool {
            self.theModeInWichTheReportIs = incomeMode
            self.switchForSalary.isOn = incomeMode
            
        }*/
            
       
        let pathToSave = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let fileName = "mode.dat"
        let fullPath = pathToSave + "/" + fileName
        print("Saving to file \(fullPath)")
        
        let modeState = IncomeModeObject (mode: self.switchForSalary.isOn)
        
        NSKeyedArchiver.archiveRootObject(modeState ,toFile: fullPath)
        
        print("the mode is \(modeState.mode)")
        
    }
    
    
    func storeCoreTheModePropertyOfIncomeModeObjectWithTheSwitchForSalaryValueToTheModeDatFile(){
        
        //get in the core data global room named "appDelegate" and get the key
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let mode = ModeCore(context: managedContext)
        mode.salaryOrIncome = self.switchForSalary.isOn
        
        
       // print("the mode is \(mode.salaryOrIncome)")
        
        
        
        do {
            try managedContext.save()
            print("MOde saved")
        } catch {
            print("Failed to save Mode", error.localizedDescription)
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func findTheStoredModePropertyUnachiveItAndUseItToPutTheSwitchAndTheVARToTheCorrectState(){
        
        
        
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print("app dir: \(documentsPath)")
        let modePath = Bundle.path(forResource: "mode", ofType: ".dat", inDirectory: documentsPath)
        let modeState = NSKeyedUnarchiver.unarchiveObject(withFile: modePath!) as! IncomeModeObject
        
        print("The mode state was unarchived with value \(modeState.mode)")
        
        
        //and now that you found a stored Salary make the theModeInWichTheReportIs whatever the mode is=========
        
        self.theModeInWichTheReportIs = modeState.mode
        
          //and now that you found a stored Salary make the switch whatever the mode is====================>>>>>>>>>>>>>>>>>
        
        self.switchForSalary.isOn = modeState.mode
        
          //and now that you found a stored Salary make the switch whatever the mode is====================<<<<<<<<<<<<<<<<<<<<
    
    }
    
    
    
    func fetchMyModeAndUseItToPutTheSwitchAndTheVARToTheCorrectState(){
        if let incomeMode = UserDefaults.standard.value(forKey: "ModeOfIncome") as? Bool {
        self.theModeInWichTheReportIs = incomeMode
        self.switchForSalary.isOn = self.theModeInWichTheReportIs!
        }
    }
    
    
    
    
    
    
    
    func enterSalaryMode(){
        
        //if there is already a salary stored
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        if Bundle.path(forResource: "salary", ofType: ".dat", inDirectory: documentsPath) != nil {
            
            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            print("app dir: \(documentsPath)")
            let salaryPath = Bundle.path(forResource: "salary", ofType: ".dat", inDirectory: documentsPath)
            let salaryStored = NSKeyedUnarchiver.unarchiveObject(withFile: salaryPath!) as! SalaryObject
            
            
            print("We found the stored salary to be\(String(describing: salaryStored)) in \(String(describing: salaryPath))")
            
            
            
            let myFormatter = NumberFormatter()
            myFormatter.numberStyle = .currency
            
            let formattedSavedIncome = myFormatter.string(from: salaryStored.income! as NSNumber)
            
            
            self.textFieldOfSource.placeholder = LocalizedString.placeHolderStored.localized + formattedSavedIncome!
            
           // self.textFieldOfSource.placeholder = "stored:" + String(describing: salaryStored.income!)
            if (textFieldOfSource.text?.isEmpty)!{
                buttonForSalary.isUserInteractionEnabled = false
                buttonForSalary.backgroundColor = UIColor.clear
                buttonForSalary.setTitleColor(UIColor.gray, for: .normal)
            }else {
            
            self.buttonForSalary.setTitle(LocalizedString.storeNewSalary.localized, for: .normal)
            self.buttonForSalary.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            }
            
            
        } else {
        self.textFieldOfSource.placeholder = LocalizedString.placeHolderPaid.localized
        }
        
       // self.labelIncomSalary.text = "Outcome:"
        
        self.labelOverSalaryIncome.text = LocalizedString.overTextFieldSalary.localized
       // self.labelOverSwitch.text = "Salary"
        
        self.buttonForSalary.backgroundColor = UIColor.blue
        self.buttonForSalary.isEnabled = true
        self.buttonForSalary.setTitle(LocalizedString.storeNewSalary.localized, for: .normal)
        self.buttonForSalary.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        

        
       // self.calculateButton.backgroundColor = UIColor.clear
       // self.calculateButton.isEnabled = false
      //  self.calculateButton.setTitleColor(UIColor.black, for: .normal)
        
        
       
        
        
        
    }
    
    
    
    
    
    func enterIncomeMode(){
        self.textFieldOfSource.placeholder = LocalizedString.placeHolderAmount.localized
        self.labelOfSpentPerCentSign.text = ""
        
        //self.labelIncomSalary.text = "Outcome:"
        
        self.labelOverSalaryIncome.text = LocalizedString.overTextFieldIncome.localized
       // self.labelOverSwitch.text = "Income"
        
        if (textFieldOfSource.text?.isEmpty)!{
            
            buttonForSalary.isUserInteractionEnabled = false
            buttonForSalary.backgroundColor = UIColor.clear
             self.buttonForSalary.setTitle(LocalizedString.deductCost.localized, for: .normal)
            buttonForSalary.setTitleColor(UIColor.gray, for: .normal)
            
        } else {
        
        
        
        
        self.buttonForSalary.backgroundColor = UIColor.blue
        self.buttonForSalary.isEnabled = true
        self.buttonForSalary.setTitle(LocalizedString.deductCost.localized, for: .normal)
        self.buttonForSalary.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        //self.calculateButton.backgroundColor = UIColor.blue
       // self.calculateButton.isEnabled = true
       // self.calculateButton.setTitleColor(UIColor.init(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }
            
    }
    
    
    
    func calculationOfBalanceUsingTheVarIncomeToUseInFunction(){
        
        //den exo kanei tipota
        var total: Double = 0.00
        var balance: Double = 0.00
        
        
        //let incomeA = Float(self.sourceALabel.text!)
        
        let incomeA = self.incomeToUseInFunction
            
        total = incomeA!
        
        balance = total - reportedTotalCosts!
        
        
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        self.balanceLabel.text = myFormatter.string(from: balance as NSNumber)!
        
        
       // self.balanceLabel.text = String(balance)
        
       
        
        
        if balance > 0 {
            saveOrNotLabel.text = LocalizedString.saved.localized
            //view.backgroundColor = UIColor.cyan
            //saveOrNotLabel.backgroundColor = UIColor.green
            saveOrNotLabel.textColor = UIColor.black
            //balanceLabel.backgroundColor = UIColor.green
            balanceLabel.textColor = UIColor.black
        } else if balance < 0 {
            saveOrNotLabel.text = LocalizedString.missing.localized
            //view.backgroundColor = UIColor.white
            //saveOrNotLabel.backgroundColor = UIColor.red
            saveOrNotLabel.textColor = UIColor.red
            //balanceLabel.backgroundColor = UIColor.red
            balanceLabel.textColor = UIColor.red
        } else {
            saveOrNotLabel.text = LocalizedString.balanced.localized
            //view.backgroundColor = UIColor.cyan
            //saveOrNotLabel.backgroundColor = UIColor.blue
            saveOrNotLabel.textColor = UIColor.black
            //balanceLabel.backgroundColor = UIColor.blue
            balanceLabel.textColor = UIColor.black
            
        }
        
    }
    
    
    func calculationOfSalaryTimesPaymentInSalaryModeAccordingToThePeriodSelected(){
        
        var salaryTimes : Int = 0
        var yearsDifference : Int = 0
        //var periodDuration : Int = 0
        
        //Components of Starting Date
        var dayOfStartingDate : Int = 0
        var monthOfStartingDate : Int = 0
        var yearOfStartingDate : Int = 0
        
        //Components of Ending Date
        var dayOfEndingDate : Int = 0
        var monthOfEndingDate : Int = 0
        var yearOfEndingDate : Int = 0
        
        
        
        
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        //Get the Date from the string
        let dateOfPeriodBeginning = dateFormatter.date(from: self.reportStartingDate!)
        let dateOfPeriodEnding = dateFormatter.date(from: self.reportEndingDate!)
        

        
        //Get the day of the Date and put it on the correct VAR
        dayOfStartingDate = Calendar.current.component(.day, from: dateOfPeriodBeginning!)
        dayOfEndingDate = Calendar.current.component(.day, from: dateOfPeriodEnding!)
        
        //Get the month of the Date and put it on the correct VAR
        monthOfStartingDate = Calendar.current.component(.month, from: dateOfPeriodBeginning!)
        monthOfEndingDate = Calendar.current.component(.month, from: dateOfPeriodEnding!)
        
        //Get the year of the Date and put it on the correct VAR
        yearOfStartingDate = Calendar.current.component(.year, from: dateOfPeriodBeginning!)
        yearOfEndingDate = Calendar.current.component(.year, from: dateOfPeriodEnding!)
        
        
        
        
        
        
        
        
        
        
        //SAME YEAR
        if yearOfEndingDate == yearOfStartingDate  {
            
         
            if monthOfEndingDate == monthOfStartingDate
            {
                //SAME YEAR & SAME MONTH
                  salaryTimes = 1
            }
            else if monthOfEndingDate - monthOfStartingDate == 1 && dayOfEndingDate + 31 - dayOfStartingDate <= 40
            {
                 //SAME YEAR & DIFFERENT MONTH with less than 31 days difference
                salaryTimes = 1
            }
            else if monthOfEndingDate - monthOfStartingDate > 1
            {
            //SAME YEAR & DIFFERENT MONTH with more than 31 days difference
                salaryTimes = monthOfEndingDate - monthOfStartingDate + 1
            }
            
         //DIFFERENT YEAR but less than 12 months(1 year difference)
        }
        else if yearOfEndingDate - yearOfStartingDate == 1 
        {
            salaryTimes = monthOfEndingDate + (12 - monthOfStartingDate) + 1
        //DIFFERENT YEAR but more than 12 months(2+ year difference)
        } else {
            yearsDifference = yearOfEndingDate - yearOfStartingDate
            salaryTimes = monthOfEndingDate + 12 * (yearsDifference - 1) + (12 - monthOfStartingDate) + 1
        }
        
        
        print("We have received \(salaryTimes) paycheks")
        self.timesOfSalaryPayments = salaryTimes
        
        
        /*
        var calendarUnitFlags: NSCalendar.Unit = [.day, .month, .year]
        var dateComponents = NSCalendar.currentCalendar.components(calendarUnitFlags, fromDate: dateOfPeriodBeginning)
        dateComponents.year
        dateComponents.month
        dateComponents.day
        dateComponents.hour
        dateComponents.minute
        dateComponents.second
        */
       // periodDuration = dateOfPeriodEnding - dateOfPeriodBeginning
        
        
       // stringFromApi = "May 26, 2016"
       // date = dateFormatter.dateFromString(stringFromApi)
        
       
        
    }
    
    
    func calculateTheSpentPerCentAccordingToPositiveOrNegativeBalance(){
        var income: Double = 0.00
        var spent : Double = 0.00
        var perCent : Double = 0.00
        //var negativePerCent : Float = 0.0
        //var negativeResult : Float = 0.0
        
        
        income = self.incomeToUseInFunction!
        spent = self.spentToUseInFunction!
        
        if income > spent {
            perCent = 100 - (spent / income) * 100
            //PerCent Labels Filled================================>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            let formatter = NumberFormatter()
            //formatter.numberStyle = .decimal
            //formatter.roundingMode = .floor
            //formatter.numberStyle = .percent
            formatter.maximumFractionDigits = 0
        
            self.spentPerCentLabel.text = formatter.string(from: NSNumber(value:perCent))
            self.labelOfSpentPerCentSign.text = "%"
        
            //PerCent Labels Filled================================<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
             //self.spentPerCentLabel.text = String(perCent)
            self.spentPerCentLabel.textColor = UIColor.black
            self.labelOfSpentPerCentSign.textColor = UIColor.black
            
        } else {
            //negativeResult = spent - income
            
            perCent = (spent/income) * 100
            
            //PerCent Labels Filled================================>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            let formatter = NumberFormatter()
            //formatter.numberStyle = .decimal
            //formatter.roundingMode = .floor
            //formatter.numberStyle = .percent
            formatter.maximumFractionDigits = 0
            
            self.spentPerCentLabel.text = formatter.string(from: NSNumber(value:perCent))
            self.labelOfSpentPerCentSign.text = "%"
            
            //PerCent Labels Filled================================<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
            
            
          //self.spentPerCentLabel.text = String(perCent)
          self.spentPerCentLabel.textColor = UIColor.red
           self.labelOfSpentPerCentSign.textColor =  UIColor.red
        }
        
       
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - Alerts
    
    func alertForEmptySalaryField(){
        let emptySalaryFieldAlert = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                      message: LocalizedString.fillInfieldOfSalary.localized,
                                                      preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                     style: UIAlertAction.Style.default,
                                     handler: nil)
        
        emptySalaryFieldAlert.addAction(okAction)
        
        self.present(emptySalaryFieldAlert, animated:true, completion: nil)
    }
    
    
    func alertForEnteringInSalaryModeWithoutASalaryStored() {
        let noSalaryAlert = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                              message: LocalizedString.pleaseStoreSalary.localized,
                                              preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                     style: UIAlertAction.Style.default,
                                     handler: nil)
        
        noSalaryAlert.addAction(okAction)
        
        self.present(noSalaryAlert, animated:true, completion: nil)
        
    }
    
    
    
    
    func showPaidVersionAlert() {
        let noSalaryAlert = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                              message: LocalizedString.notAvailableInFreeVersion.localized,
                                              preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                     style: UIAlertAction.Style.default,
                                     handler: nil)
        
        noSalaryAlert.addAction(okAction)
        
        self.present(noSalaryAlert, animated:true, completion: nil)
        
    }
    
    
    
    
    
    func showKioskAlert(){
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
                                        
                                        /*
                                        if let url = NSURL(string:"itms-apps://itunes.apple.com/app/idYOUR_APP_ID") {
                                            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                                        }
                                        
                                        */
                                       
        })
        
        
        
        upgradeAlert.addAction(upgradeAction)
        upgradeAlert.addAction(noThanksAction)
        
        self.present(upgradeAlert, animated:true, completion: nil)
        
    }
    
    
  
    
    //SALARY ISSUES==============================<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    
    

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if  segue.identifier == "reportSegue" {
        
        let destinationView = segue.destination as! ListOfExpences
        
        let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        let startingDateToReturn = dateFormatter.date(from: self.reportStartingDate!)
        let endingDateToReturn = dateFormatter.date(from: self.reportEndingDate!)
        
        
        destinationView.pickerOfStartingDate.date = startingDateToReturn!
        destinationView.pickerOfEndingDate.date = endingDateToReturn!
       
        } else {
            
            if paidVersionIsOn {
           
            let destinationOfStatisticsView = segue.destination as! StatisticsViewController
           
            
            destinationOfStatisticsView.tableOfExpenses = self.tableOfExpenses
            
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
            dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
            
            
            destinationOfStatisticsView.statisticsStartingDate = self.reportStartingDate
            destinationOfStatisticsView.statisticsEndingDate = self.reportEndingDate
                
            } else {
                showKiosk()
                //showKioskAlert()
                showPaidVersionAlert()
            }
            
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
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
    
    
     

}//Class







/*
 let fileNameToBeDeleted = "salary"
 print("The name of the file to be deleted is \(fileNameToBeDeleted)")
 var pathOfTheFile =
 print("The name of the path with the file to be deleted is \(String(describing: pathOfTheFile))")
 // We find the document directory on the device
 
 let documentPathOfDirectoriesForTheFile : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
 if documentPathOfDirectoriesForTheFile.count > 0 {
 let onePathOfDirectories =  documentPathOfDirectoriesForTheFile[0]
 pathOfTheFile = onePathOfDirectories.appendingFormat("/" + fileNameToBeDeleted)
 print("local path : \(String(describing: pathOfTheFile))")
 
 } else {
 print("Could not find local directory")
 return
 }
 
 do {
 let fileManager = FileManager.default
 
 
 if fileManager.fileExists(atPath: pathOfTheFile!){
 try fileManager.removeItem(atPath: pathOfTheFile!)
 } else {
 print("File does not exist")
 }
 
 } catch let error as NSError {
 print("An error took place: \(error)")
 }
 
 */



/*
 //self.sourceALabel.text = String(from: mySavedMontlyIncome as! Decoder)
 
 //and now that it is archived lets put it on the tesxtField as placeholder
 let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
 print("app dir: \(documentsPath)")
 let salaryPath = Bundle.path(forResource: "salary", ofType: ".dat", inDirectory: documentsPath)
 let s:SalaryObject = NSKeyedUnarchiver.unarchiveObject(withFile: salaryPath!) as! SalaryObject
 */

//DATE==================DATE=========================DATE>>>>>>>>>>>>>>>>>>>>>>>>>>
/*
 let dateFormatter = DateFormatter()
 dateFormatter.dateFormat = "dd/MM/yyyy"
 
 
 return dateFormatter.string(from: self).capitalized
 
 print(Date().date)
 
 
 var arrayOfDays = [Int]()
 let startingDateToReturn = dateFormatter.date(from: self.reportStartingDate!)
 let endingDateToReturn = dateFormatter.date(from: self.reportEndingDate!)
 
 let date = NSDate()
 let unitFlags: NSCalendar.Unit = [.hour, .day, .month, .year]
 // let components = NSCalendar.currentCalendar.components(unitFlags, fromDate: date)
 
 */








/*
 
 let calendar = Calendar.current
 
 // Set up date object
 let date = NSDate()
 
 
 extension Date {
 func dayOfWeek() -> String? {
 let dateFormatter = DateFormatter()
 dateFormatter.dateFormat = "EEEE"
 return dateFormatter.string(from: self).capitalized
 // or use capitalized(with: locale) if you want
 }
 }
 
 print(Date().dayOfWeek()!) // Wednesday
 
 // Create an NSDate for the first and last day of the month
 //let components = calendar.components(NSCalendarUnit.CalendarUnitYear |
 //                                     NSCalendarUnit.CalendarUnitMonth |
 //                                     NSCalendarUnit.WeekdayCalendarUnit |
 //                                     NSCalendarUnit.WeekCalendarUnit |
 //                                     NSCalendarUnit.CalendarUnitDay,
 //                                     fromDate: date)
 // Create an NSDate for the first and last day of the month
 let components = Calendar.current.components(Calendar.Unit.CalendarUnit.Month, fromDate: date)
 print("\(firstDateOfMonth)")
 
 
 components.month
 
 // Getting the First and Last date of the month
 components.day = 1
 let firstDateOfMonth: NSDate = calendar.dateFromComponents(components)!
 print("\(firstDateOfMonth)")
 
 components.month  += 1
 components.day     = 0
 let lastDateOfMonth: NSDate = calendar.dateFromComponents(components)!
 
 var unitFlags = NSCalendar.Unit.WeekOfMonthCalendarUnit |
 NSCalendar.Unit.WeekdayCalendarUnit     |
 NSCalendar.Unit.CalendarUnitDay
 
 let firstDateComponents = calendar.components(unitFlags, fromDate: firstDateOfMonth)
 let lastDateComponents  = calendar.components(unitFlags, fromDate: lastDateOfMonth)
 
 // Sun = 1, Sat = 7
 let firstWeek = firstDateComponents.weekOfMonth
 let lastWeek  = lastDateComponents.weekOfMonth
 
 let numOfDatesToPrepend = firstDateComponents.weekday - 1
 let numOfDatesToAppend  = 7 - lastDateComponents.weekday + (6 - lastDateComponents.weekOfMonth) * 7
 
 let startDate: NSDate = calendar.dateByAddingUnit(NSCalendar.Unit.CalendarUnitDay, value: -numOfDatesToPrepend, toDate: firstDateOfMonth, options: nil)!
 let endDate:   NSDate = calendar.dateByAddingUnit(NSCalendarUnit.CalendarUnitDay, value: numOfDatesToAppend, toDate: lastDateOfMonth, options: nil)!
 
 Array(map(0..<42) {
 calendar.dateByAddingUnit(NSCalendarUnit.CalendarUnitDay, value: $0, toDate: startDate, options: nil)!
 })
 
 "\(components.year)"
 
 
 var dateString = "2014-10-3" // change to your date format
 var dateFormatter = DateFormatter()
 dateFormatter.dateFormat = "YYYY-MM-dd"
 
 var someDate = dateFormatter.dateFromString(dateString)
 print(someDate)
 */

//DATE==================DATE=========================DATE<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


/*
 
 
 
 //THIS IS A VERY IMPORTANT PART WHERE WE DELETE THE STORED SALARY IF THER IS ANY======================>>>>>>>>>>>>>>>>>
 //IT WAS USED TO DELETE THE SALARY AUTOMATICALLY WHEN THE SWITCH WOULD GO INCOME MODE================>>>>>>>>>>>>>>>>>
 //delete the stored salary if there is any
 
 
 let pathToDelete = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
 let fileName = "salary.dat"
 let fullPath = pathToDelete + "/" + fileName
 print("Deleting the file \(fullPath)")
 
 
 
 let fileNameToBeDeleted = "salary"
 print("The name of the file to be deleted is \(fileNameToBeDeleted).dat)")
 var pathOfTheFile = pathToDelete + "/" + fileName
 print("The name of the path with the file to be deleted is \(String(describing: pathOfTheFile))")
 // We find the document directory on the device
 
 
 
 let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
 print("app dir: \(documentsPath)")
 
 
 //if there is a salary dat delete it=====================..>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 
 if let salaryPath = Bundle.path(forResource: "salary", ofType: ".dat", inDirectory: documentsPath) {
 
 
 
 
 
 let documentPathOfDirectoriesForTheFile : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
 if documentPathOfDirectoriesForTheFile.count > 0 {
 let onePathOfDirectories =  documentPathOfDirectoriesForTheFile[0]
 pathOfTheFile = onePathOfDirectories.appendingFormat("/" + "salary.dat")
 print("local path : \(String(describing: pathOfTheFile))")
 print("salaryPath is  : \(salaryPath))")
 
 } else {
 print("Could not find local directory")
 return
 }
 
 do {
 let fileManager = FileManager.default
 
 
 if fileManager.fileExists(atPath: pathOfTheFile){
 try fileManager.removeItem(atPath: pathOfTheFile)
 } else {
 print("File does not exist")
 }
 
 } catch let error as NSError {
 print("An error took place: \(error)")
 }
 
 
 
 }
 
 //if there is a salary.dat delete it=====================..<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 
 //THIS IS A VERY IMPORTANT PART WHERE WE DELETE THE STORED SALARY IF THER IS ANY======================<<<<<<<<<<<<<<<<<
 //IT WAS USED TO DELETE THE SALARY AUTOMATICALLY WHEN THE SWITCH WOULD GO INCOME MODE================<<<<<<<<<<<<<<<<<
 
 */

//=================================================The code to save income with switch On and salaryText full=============================
//let incomePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
// print("app dir: \(incomePath)")
//let salaryPath = Bundle.path(forResource: "salary", ofType: ".dat", inDirectory: incomePath)
//let i:MyMontlyIncome = NSKeyedUnarchiver.unarchiveObject(withFile: salaryPath!) as! MyMontlyIncome







//SALARY


//=================================================find Mode toutestin Unarchive it=============================


//find Mode toutestin Unarchive it=======================================


//If there is a mode DAT Try to find it, utherwise we will have nil---------------------------------------


//let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//if Bundle.path(forResource: "mode", ofType: ".dat", inDirectory: documentsPath) != nil {



//we put all the following to one function




/*
 let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
 print("app dir: \(documentsPath)")
 let modePath = Bundle.path(forResource: "mode", ofType: ".dat", inDirectory: documentsPath)
 let modeState = NSKeyedUnarchiver.unarchiveObject(withFile: modePath!) as! IncomeModeObject
 
 print("The mode state was unarchived with value \(modeState.mode)")
 
 
 //and now that you found a stored Salary make the switch whatever the mode is====================>>>>>>>>>>>>>>>>>
 
 self.switchForSalary.isOn = modeState.mode
 
 //and now that you found a stored Salary make the switch whatever the mode is====================<<<<<<<<<<<<<<<<<<
 */

//if modeState.mode {

//self.totalIncomeLabel.text = String(0.0)
//self.sourceALabel.text = String(0.0)
//self.sourceBLabel.text = String(0.0)
//self.sourceCLabel.text = String(0.0)
//self.balanceLabel.text = "Pending"






//calculateTotal income

/*
 var total: Float = 0.0
 var balance: Float = 0.0
 // var balancePerCent : Float = 0.0
 
 let incomeA = Float(self.sourceALabel.text!)
 //let incomeB = Float(self.sourceBLabel.text!)
 //let incomeC = Float(self.sourceCLabel.text!)
 total = incomeA!
 //self.totalIncomeLabel.text = String(total)
 balance = total - reportedTotalCosts!
 self.balanceLabel.text = String(balance)
 
 // balancePerCent = (balance / total) * 100
 
 
 
 
 
 //let incomeA = salaryStored.income
 
 
 
 
 
 
 
 
 
 
 
 if balance > 0 {
 saveOrNotLabel.text = "Saved"
 //view.backgroundColor = UIColor.cyan
 //saveOrNotLabel.backgroundColor = UIColor.green
 saveOrNotLabel.textColor = UIColor.black
 //balanceLabel.backgroundColor = UIColor.green
 balanceLabel.textColor = UIColor.black
 } else if balance < 0 {
 saveOrNotLabel.text = "Missing"
 view.backgroundColor = UIColor.white
 //saveOrNotLabel.backgroundColor = UIColor.red
 saveOrNotLabel.textColor = UIColor.red
 //balanceLabel.backgroundColor = UIColor.red
 balanceLabel.textColor = UIColor.red
 } else {
 saveOrNotLabel.text = "Balanced"
 //view.backgroundColor = UIColor.cyan
 //saveOrNotLabel.backgroundColor = UIColor.blue
 saveOrNotLabel.textColor = UIColor.black
 //balanceLabel.backgroundColor = UIColor.blue
 balanceLabel.textColor = UIColor.black
 
 }
 
 
 
 */






