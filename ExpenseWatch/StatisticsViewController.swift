//
//  StatisticsViewController.swift
//  ExpenseWatch
//
//  Created by planB on 7/9/18.
//  Copyright © 2018 Ioannis. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {

    
    
    //MARK:Variables
    var tableOfExpenses = [ExpenseCore]()
    var statisticsStartingDate: String? = ""
    var statisticsEndingDate: String? = ""
    
    var dateDifferenceInDays: Int = 0
    var dateDifferenceInWeeks: Int = 0
    var dateDifferenceInMonths: Int = 0
    var dateDifferenceInYears: Int = 0
    
    var periodDuration: String? = ""
    var averageCost: Double = 0.00
    var averageCostForA: Double = 0.00
    var averageCostForB: Double = 0.00
    var averageCostForC: Double = 0.00
    
    var averageCostPerDay: Double = 0.00
    var averageCostForAPerDay: Double = 0.00
    var averageCostForBPerDay: Double = 0.00
    var averageCostForCPerDay: Double = 0.00
    
    var averageCostPerWeek: Double = 0.00
    var averageCostForAPerWeek: Double = 0.00
    var averageCostForBPerWeek: Double = 0.00
    var averageCostForCPerWeek: Double = 0.00
    
    var averageCostPerMonth: Double = 0.00
    var averageCostForAPerMonth: Double = 0.00
    var averageCostForBPerMonth: Double = 0.00
    var averageCostForCPerMonth: Double = 0.00
    
    var averageCostPerYear: Double = 0.00
    var averageCostForAPerYear: Double = 0.00
    var averageCostForBPerYear: Double = 0.00
    var averageCostForCPerYear: Double = 0.00
    
    
   var sumOftheDay: Double = 0.00
    
    //exp
    var sumOfEachDay: Double = 0.00
    var arrayWithSumsofEachDay = [Double]()
    var arrayWithSumsofEachYear = [Double]()
    var arrayWithSumsofEachMonth = [Double]()
    var arrayWithSumsofEachWeek = [Double]()
    
    
  
    var dictionaryWithDateAndSumsOfEachDate: Dictionary<Date, Double> = [:]
    var dateOfMostGenerousDayofAll = Date()
    var dateOfMostGenerousDayofA = Date()
    var dateOfMostGenerousDayofB = Date()
    var dateOfMostGenerousDayofC = Date()
    
    //All
    var yearGenerousOfAll: Int = 0
    var monthGenerousOfAll = Date()
    var dateOfweekFirstDayGenerousOfAll = Date()
    
    
    var yearEconomicOfAll: Int = 0
    var monthEconomicOfAll = Date()
    var dateOfweekFirstDayEconomicOfAll = Date()
    
    //A
    var yearGenerousOfA: Int = 0
    var monthGenerousOfA = Date()
    var dateOfweekFirstDayGenerousOfA = Date()
    
    
    var yearEconomicOfA: Int = 0
    var monthEconomicOfA = Date()
    var dateOfweekFirstDayEconomicOfA = Date()
    
    
    //B
    var yearGenerousOfB: Int = 0
    var monthGenerousOfB = Date()
   var dateOfweekFirstDayGenerousOfB = Date()
    
    
    var yearEconomicOfB: Int = 0
    var monthEconomicOfB = Date()
     var dateOfweekFirstDayEconomicOfB = Date()
    
    //C
    var yearGenerousOfC: Int = 0
    var monthGenerousOfC = Date()
    var dateOfweekFirstDayGenerousOfC = Date()
    
    
    var yearEconomicOfC: Int = 0
    var monthEconomicOfC = Date()
    var dateOfweekFirstDayEconomicOfC = Date()
    
    
    
    //Day
    var dateOfMostEconomicDayofAll = Date()
    var dateOfMostEconomicDayofA = Date()
    var dateOfMostEconomicDayofB = Date()
    var dateOfMostEconomicDayofC = Date()
    
    var costOfMostGenerousDayOfAll: Double = 0.00
    var costOfMostGenerousDayForA: Double = 0.00
    var costOfMostGenerousDayForB: Double = 0.00
    var costOfMostGenerousDayForC: Double = 0.00
    
    var costOfMostEconomicDayOfAll: Double = 0.00
    var costOfMostEconomicDayForA: Double = 0.00
    var costOfMostEconomicDayForB: Double = 0.00
    var costOfMostEconomicDayForC: Double = 0.00
    
    //Year
    var mostEconomicYearOfAll: Int = 0
    var mostEconomicYearOfAllofA: Int = 0
    var mostEconomicYearOfAllofB: Int = 0
    var mostEconomicYearOfAllofC: Int = 0
    
    var costOfMostGenerousYearOfAll: Double = 0.00
    var costOfMostGenerousYearForA: Double = 0.00
    var costOfMostGenerousYearForB: Double = 0.00
    var costOfMostGenerousYearForC: Double = 0.00
    
    var costOfMostEconomicYearOfAll: Double = 0.00
    var costOfMostEconomicYearForA: Double = 0.00
    var costOfMostEconomicYearForB: Double = 0.00
    var costOfMostEconomicYearForC: Double = 0.00
    
    //Month
    var mostEconomicMonthOfAll: Int = 0
    var mostEconomicMonthOfAllofA: Int = 0
    var mostEconomicMonthOfAllofB: Int = 0
    var mostEconomicMonthOfAllofC: Int = 0
    
    var costOfMostGenerousMonthOfAll: Double = 0.00
    var costOfMostGenerousMonthForA: Double = 0.00
    var costOfMostGenerousMonthForB: Double = 0.00
    var costOfMostGenerousMonthForC: Double = 0.00
    
    var costOfMostEconomicMonthOfAll: Double = 0.00
    var costOfMostEconomicMonthForA: Double = 0.00
    var costOfMostEconomicMonthForB: Double = 0.00
    var costOfMostEconomicMonthForC: Double = 0.00
    
    
    
    //Week
    var mostEconomicWeekOfAll: Int = 0
    var mostEconomicWeekOfA: Int = 0
    var mostEconomicWeekOfB: Int = 0
    var mostEconomicWeekOfC: Int = 0
    
    var costOfMostGenerousWeekOfAll: Double = 0.00
    var costOfMostGenerousWeekForA: Double = 0.00
    var costOfMostGenerousWeekForB: Double = 0.00
    var costOfMostGenerousWeekForC: Double = 0.00
    
    var costOfMostEconomicWeekOfAll: Double = 0.00
    var costOfMostEconomicWeekForA: Double = 0.00
    var costOfMostEconomicWeekForB: Double = 0.00
    var costOfMostEconomicWeekForC: Double = 0.00
    
    
    var rollTracker: Int = 0
    
    //Regionized
    var stringOfDate: String = "dd/MM/yyyy, HH:mm"
    
    
    
    
    //MARK:Outlets
    //PeriodLine
    @IBOutlet weak var labelOfStartingDate: UILabel!
    @IBOutlet weak var labelOfEndingDate: UILabel!
    @IBOutlet weak var labelOfPeriodinStat: UILabel!
    
    
    
    
    //GreatestExpense
    
    @IBOutlet weak var labelOfGreatestExpenseTitle: UILabel!
    @IBOutlet weak var imageOfGratestExpense: UIImageView!
    @IBOutlet weak var labelForNoteOfGreatestExpense: UILabel!
    @IBOutlet weak var labelForDateOfGreatestExpense: UILabel!
    @IBOutlet weak var labelForSizeOfGreatestExpense: UILabel!
    @IBOutlet weak var buttonForCategoryGreatest: UIButton!
    
    //Segment
    @IBOutlet weak var segmentOfPeriodSelected: UISegmentedControl!
    
    
    
    
    
    
    @IBOutlet weak var buttonMedian: UIButton!
    
    
    //AverageBlock
    
    
    @IBOutlet weak var labelForAverageTitle: UILabel!
    
    
    @IBOutlet weak var imageAverageA: UIImageView!
    @IBOutlet weak var imageAverageB: UIImageView!
    @IBOutlet weak var imageAverageC: UIImageView!
    
    @IBOutlet weak var labelForCostAName: UILabel!
    @IBOutlet weak var labelForCostBName: UILabel!
    @IBOutlet weak var labelForCostCName: UILabel!
    
    @IBOutlet weak var labelAverageAll: UILabel!
    @IBOutlet weak var labelAverageA: UILabel!
    @IBOutlet weak var labelAverageB: UILabel!
    @IBOutlet weak var labelAverageC: UILabel!
    
    
    //Generous Block
    
    @IBOutlet weak var labelForGenerousTitle: UILabel!
    @IBOutlet weak var labelMostInGenerous: UILabel!
    @IBOutlet weak var buttonGenerous: UIButton!
    

    
    @IBOutlet weak var viewOfAverageLine: UIView!
    @IBOutlet weak var viewOfGenerousLine: UIView!
    
    
    
    @IBOutlet weak var imageGenerousA: UIImageView!
    @IBOutlet weak var imageGenerousB: UIImageView!
    @IBOutlet weak var imageGenerousC: UIImageView!
    
    
    @IBOutlet weak var labelOfGenerousDateA: UILabel!
    @IBOutlet weak var labelOfGenerousDateB: UILabel!
    @IBOutlet weak var labelOfGenerousDateC: UILabel!
    @IBOutlet weak var labelOfGenerousDateAll: UILabel!
    
    
    
    @IBOutlet weak var labelOfGenerousAll: UILabel!
    @IBOutlet weak var labelOfGenerousA: UILabel!
    @IBOutlet weak var labelOfGenerousB: UILabel!
    @IBOutlet weak var labelOfGenerousC: UILabel!
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: Actions
    
    @IBAction func changeButtonForCategoryOfGreatest(_ sender: Any) {
        let categoryA = UserDefaults.standard.value(forKey: "categoryA") as? String
        let categoryB = UserDefaults.standard.value(forKey: "categoryB") as? String
        let categoryC = UserDefaults.standard.value(forKey: "categoryC") as? String
       
       
        
        
        /*
        if self.buttonForCategoryGreatest.titleLabel?.text == "of All" {
            
            self.buttonForCategoryGreatest.setTitle("of \(String(describing: categoryA!))", for: .normal)
            findTheGreatestExpenseOfCategoryAandLoadIt()
            
        } else if  self.buttonForCategoryGreatest.titleLabel?.text == "of \(String(describing: categoryA!))" {
            
            self.buttonForCategoryGreatest.setTitle("of \(String(describing: categoryB!))", for: .normal)
            findTheGreatestExpenseOfCategoryBandLoadIt()
            
            
        } else if  self.buttonForCategoryGreatest.titleLabel?.text == "of \(String(describing: categoryB!))"  {
            
            self.buttonForCategoryGreatest.setTitle("of \(String(describing: categoryC!))", for: .normal)
            findTheGreatestExpenseOfCategoryCandLoadIt()
          
            
            
        } else if  self.buttonForCategoryGreatest.titleLabel?.text == "of \(String(describing: categoryC!))" {
            self.buttonForCategoryGreatest.setTitle("of All", for: .normal)
            findTheGreatestExpenseOfAllandLoadIt()
            
        }
        
        */
        
        
        if rollTracker == 0 {
            
            self.buttonForCategoryGreatest.setTitle("\(String(describing: categoryA!))", for: .normal)
            findTheGreatestExpenseOfCategoryAandLoadIt()
            rollTracker = 1
            
        } else if  rollTracker == 1 {
            
            self.buttonForCategoryGreatest.setTitle("\(String(describing: categoryB!))", for: .normal)
            findTheGreatestExpenseOfCategoryBandLoadIt()
            rollTracker = 2
            
        } else if  rollTracker == 2 {
            
            self.buttonForCategoryGreatest.setTitle("\(String(describing: categoryC!))", for: .normal)
            findTheGreatestExpenseOfCategoryCandLoadIt()
            rollTracker = 3
            
            
        } else if  rollTracker == 3 {
            self.buttonForCategoryGreatest.setTitle(LocalizedString.allinGreatest.localized, for: .normal)
            findTheGreatestExpenseOfAllandLoadIt()
            rollTracker = 0
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }//FuncionEnds
    
    
    
    
    
    
    @IBAction func changePeriodOfInterest(_ sender: Any) {
        
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        if segmentOfPeriodSelected.selectedSegmentIndex == 0 {
            self.labelForAverageTitle.text = LocalizedString.costRed.localized
            self.labelForGenerousTitle.text = " " + LocalizedString.daySmall.localized
            
            if buttonMedian.titleLabel?.text == LocalizedString.average.localized {
                loadTheAverageBlock()
            } else {
               
                loadTheMedianBlock()
            }
            
            if buttonGenerous.titleLabel?.text == LocalizedString.generous.localized || buttonGenerous.titleLabel?.text == LocalizedString.generousMan.localized || buttonGenerous.titleLabel?.text == LocalizedString.generousThing.localized {
                loadTheGenerousBlock()
                 self.buttonGenerous.setTitle(LocalizedString.generous.localized, for: .normal)
                
                
            } else {
                loadTheEconomicBlock()
                 self.buttonGenerous.setTitle(LocalizedString.economic.localized, for: .normal)
            }
            
            
            
            
            
        } else if segmentOfPeriodSelected.selectedSegmentIndex == 1 {
            
            self.labelForAverageTitle.text = LocalizedString.dayRed.localized
            self.labelForGenerousTitle.text = " " + LocalizedString.daySmall.localized
            
            if buttonMedian.titleLabel?.text == LocalizedString.average.localized{
                loadTheAverageBlockPerDay()
            } else {
                loadTheMedianBlockPerDay()
            }
            
            if buttonGenerous.titleLabel?.text == LocalizedString.generous.localized || buttonGenerous.titleLabel?.text == LocalizedString.generousMan.localized || buttonGenerous.titleLabel?.text == LocalizedString.generousThing.localized  {
                loadTheGenerousBlock()
                self.buttonGenerous.setTitle(LocalizedString.generous.localized, for: .normal)
            } else {
                loadTheEconomicBlock()
                 self.buttonGenerous.setTitle(LocalizedString.economic.localized, for: .normal)
            }
            
            
            
            
            
            
        } else if segmentOfPeriodSelected.selectedSegmentIndex == 2 {
            
            self.labelForAverageTitle.text = LocalizedString.weekRed.localized
            self.labelForGenerousTitle.text = " " + LocalizedString.weekSmall.localized
            
            
            if buttonMedian.titleLabel?.text == LocalizedString.average.localized{
                loadTheAverageBlockPerWeek()
            } else {
                loadTheMedianBlockPerWeek()
            }
           
            
            if buttonGenerous.titleLabel?.text == LocalizedString.generous.localized || buttonGenerous.titleLabel?.text == LocalizedString.generousMan.localized || buttonGenerous.titleLabel?.text == LocalizedString.generousThing.localized  {
                loadTheGenerousBlockForWeek()
                self.buttonGenerous.setTitle(LocalizedString.generous.localized, for: .normal)
            } else {
                loadTheEconomicBlockForWeek()
                 self.buttonGenerous.setTitle(LocalizedString.economic.localized, for: .normal)
            }
            
            
            
            
            
            
           
            
        } else if segmentOfPeriodSelected.selectedSegmentIndex == 3 {
            
            self.labelForAverageTitle.text = LocalizedString.monthRed.localized
            self.labelForGenerousTitle.text = " " + LocalizedString.monthSmallOristiki.localized
            
            if buttonMedian.titleLabel?.text == LocalizedString.average.localized{
                 loadTheAverageBlockPerMonth()
            } else {
                 loadTheMedianBlockPerMonth()
            }
            
            
            
            if buttonGenerous.titleLabel?.text == LocalizedString.generous.localized || buttonGenerous.titleLabel?.text == LocalizedString.generousMan.localized || buttonGenerous.titleLabel?.text == LocalizedString.generousThing.localized {
                loadTheGenerousBlockForMonth()
                self.buttonGenerous.setTitle(LocalizedString.generousMan.localized, for: .normal)
                
            } else {
                loadTheEconomicBlockForMonth()
                self.buttonGenerous.setTitle(LocalizedString.economicMan.localized, for: .normal)
            }
           
            
           
            
            
        }  else if segmentOfPeriodSelected.selectedSegmentIndex == 4 {
            
            self.labelForAverageTitle.text = LocalizedString.yearRed.localized
            self.labelForGenerousTitle.text = " " + LocalizedString.yearSmall.localized
            
            if buttonMedian.titleLabel?.text == LocalizedString.average.localized{
                loadTheAverageBlockPerYear()
            } else {
                loadTheMedianBlockPerYear()
            }
            
            if buttonGenerous.titleLabel?.text == LocalizedString.generous.localized || buttonGenerous.titleLabel?.text == LocalizedString.generousMan.localized || buttonGenerous.titleLabel?.text == LocalizedString.generousThing.localized   {
                loadTheGenerousBlockForYear()
                self.buttonGenerous.setTitle(LocalizedString.generousThing.localized, for: .normal)
            } else {
                loadTheEconomicBlockForYear()
                self.buttonGenerous.setTitle(LocalizedString.economicThing.localized, for: .normal)
            }
            
            
            
            
            
        }
        
    }
    
    
    
    @IBAction func changeButtonMedian(_ sender: Any) {
        /*
        if segmentOfPeriodSelected.selectedSegmentIndex == 0 {
            if self.buttonMedian.titleLabel?.text == LocalizedString.average.localized {
                
                if self.tableOfExpenses == []{
                    
                } else {
                    loadTheMedianBlock()
                }
                self.buttonMedian.setTitle(LocalizedString.median.localized, for: .normal)
            } else if self.buttonMedian.titleLabel?.text == LocalizedString.median.localized {
                
                
                if self.tableOfExpenses == []{
                    
                } else {
                    loadTheAverageBlock()
                }
                self.buttonMedian.setTitle(LocalizedString.average.localized, for: .normal)
            }
        } else if segmentOfPeriodSelected.selectedSegmentIndex == 1 {
            
            if self.buttonMedian.titleLabel?.text == LocalizedString.average.localized {
                
                if self.tableOfExpenses == []{
                    
                } else {
                    loadTheMedianBlockPerDay()
                }
                self.buttonMedian.setTitle(LocalizedString.median.localized, for: .normal)
            } else if self.buttonMedian.titleLabel?.text == LocalizedString.median.localized {
                
                
                if self.tableOfExpenses == []{
                    
                } else {
                    loadTheAverageBlockPerDay()
                }
                self.buttonMedian.setTitle(LocalizedString.average.localized, for: .normal)
            }
            
        } else if segmentOfPeriodSelected.selectedSegmentIndex == 2 {
            
            if self.buttonMedian.titleLabel?.text == LocalizedString.average.localized {
                
                if self.tableOfExpenses == []{
                    
                } else {
                    loadTheMedianBlockPerWeek()
                }
                self.buttonMedian.setTitle(LocalizedString.median.localized, for: .normal)
            } else if self.buttonMedian.titleLabel?.text == LocalizedString.median.localized {
                
                
                if self.tableOfExpenses == []{
                    
                } else {
                    loadTheAverageBlockPerWeek()
                }
                self.buttonMedian.setTitle(LocalizedString.average.localized, for: .normal)
            }
            
            
            
            
            
            
            
            
            
        } else if segmentOfPeriodSelected.selectedSegmentIndex == 3 {
            if self.buttonMedian.titleLabel?.text == LocalizedString.average.localized{
                
                if self.tableOfExpenses == []{
                    
                } else {
                    loadTheMedianBlockPerMonth()
                }
                self.buttonMedian.setTitle(LocalizedString.median.localized, for: .normal)
            } else if self.buttonMedian.titleLabel?.text == LocalizedString.median.localized {
                
                
                if self.tableOfExpenses == []{
                    
                } else {
                    loadTheAverageBlockPerMonth()
                }
                self.buttonMedian.setTitle(LocalizedString.average.localized, for: .normal)
            }
            
            
            
            
        } else if segmentOfPeriodSelected.selectedSegmentIndex == 4 {
            if self.buttonMedian.titleLabel?.text == LocalizedString.average.localized {
                
                if self.tableOfExpenses == []{
                    
                } else {
                    loadTheMedianBlockPerYear()
                }
                self.buttonMedian.setTitle(LocalizedString.median.localized, for: .normal)
            } else if self.buttonMedian.titleLabel?.text == LocalizedString.median.localized {
                
                
                if self.tableOfExpenses == []{
                    
                } else {
                    loadTheAverageBlockPerYear()
                }
                self.buttonMedian.setTitle(LocalizedString.average.localized, for: .normal)
            }
            
        }
        
        
      */
    }//ChangeButtonMedian
    
    
    
    
    @IBAction func changeButtonGenerous(_ sender: Any) {
       
       
        if buttonGenerous.titleLabel?.text == LocalizedString.generous.localized || buttonGenerous.titleLabel?.text == LocalizedString.generousMan.localized || buttonGenerous.titleLabel?.text == LocalizedString.generousThing.localized {
           
            if self.tableOfExpenses == []{
                
            } else {
                
                if segmentOfPeriodSelected.selectedSegmentIndex == 0 {
                    loadTheEconomicBlock()
                } else if segmentOfPeriodSelected.selectedSegmentIndex == 1 {
                    loadTheEconomicBlock()
                } else if segmentOfPeriodSelected.selectedSegmentIndex == 2 {
                    loadTheEconomicBlockForWeek()
                } else if segmentOfPeriodSelected.selectedSegmentIndex == 3 {
                    loadTheEconomicBlockForMonth()
                } else if segmentOfPeriodSelected.selectedSegmentIndex == 4 {
                    loadTheEconomicBlockForYear()
                }
                
                
                
                
                
            }
            
            
 
           // self.buttonGenerous.setTitle(LocalizedString.economic.localized, for: .normal)
            
            if segmentOfPeriodSelected.selectedSegmentIndex == 0 || segmentOfPeriodSelected.selectedSegmentIndex == 1 || segmentOfPeriodSelected.selectedSegmentIndex == 2 {
                
                self.buttonGenerous.setTitle(LocalizedString.economic.localized, for: .normal)
                
            } else if segmentOfPeriodSelected.selectedSegmentIndex == 3 {
                
                self.buttonGenerous.setTitle(LocalizedString.economicMan.localized, for: .normal)
                
            } else {
                
                self.buttonGenerous.setTitle(LocalizedString.economicThing.localized, for: .normal)
                
            }
            
            
            
            
            
            
            
        } else if self.buttonGenerous.titleLabel?.text == LocalizedString.economic.localized || self.buttonGenerous.titleLabel?.text == LocalizedString.economicMan.localized || self.buttonGenerous.titleLabel?.text == LocalizedString.economicThing.localized{
            
            
            if self.tableOfExpenses == []{
                
            } else {
                if segmentOfPeriodSelected.selectedSegmentIndex == 0 {
                    loadTheGenerousBlock()
                } else if segmentOfPeriodSelected.selectedSegmentIndex == 1 {
                    loadTheGenerousBlock()
                } else if segmentOfPeriodSelected.selectedSegmentIndex == 2 {
                   loadTheGenerousBlockForWeek()
                } else if segmentOfPeriodSelected.selectedSegmentIndex == 3 {
                    loadTheGenerousBlockForMonth()
                } else if segmentOfPeriodSelected.selectedSegmentIndex == 4 {
                    loadTheGenerousBlockForYear()
                }
                
                
                
                
                
               
            }
            if segmentOfPeriodSelected.selectedSegmentIndex == 0 || segmentOfPeriodSelected.selectedSegmentIndex == 1 || segmentOfPeriodSelected.selectedSegmentIndex == 2 {
            self.buttonGenerous.setTitle(LocalizedString.generous.localized, for: .normal)
            } else if segmentOfPeriodSelected.selectedSegmentIndex == 3 {
              self.buttonGenerous.setTitle(LocalizedString.generousMan.localized, for: .normal)
            } else {
                self.buttonGenerous.setTitle(LocalizedString.generousThing.localized, for: .normal)
            }
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: VIEW
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.buttonMedian.isEnabled = false
        
        
        
        getStringsAndLocalizeThem()
        
        
        
        
        //demanded in simulation (otherwise it coult be deleted)
        UserDefaults.standard.synchronize()
        
        self.labelOfStartingDate.text = self.statisticsStartingDate
        self.labelOfEndingDate.text = self.statisticsEndingDate
        self.viewOfGenerousLine.layer.cornerRadius = 8
        self.viewOfAverageLine.layer.cornerRadius = 8
        
        
        
        findTheGreatestExpenseOfAllandLoadIt()
        loadTheAverageBlock()
        loadTheGenerousBlock()
        
       
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func getStringsAndLocalizeThem(){
        
        self.navigationItem.title = LocalizedString.statisticsTitle.localized
        self.labelOfPeriodinStat.text = LocalizedString.periodShowingInStatistics.localized
        self.labelOfGreatestExpenseTitle.text = LocalizedString.overGreatest.localized
        //segment
        self.segmentOfPeriodSelected.setTitle(LocalizedString.segmentCostStat.localized, forSegmentAt: 0)
        self.segmentOfPeriodSelected.setTitle(LocalizedString.segmentDayStat.localized, forSegmentAt: 1)
        self.segmentOfPeriodSelected.setTitle(LocalizedString.segmentWeekStat.localized, forSegmentAt: 2)
        self.segmentOfPeriodSelected.setTitle(LocalizedString.segmentMonthStat.localized, forSegmentAt: 3)
        self.segmentOfPeriodSelected.setTitle(LocalizedString.segmentYearStat.localized, forSegmentAt: 4)
        //averageBlock
        self.buttonMedian.setTitle(LocalizedString.average.localized, for: .normal)
        self.labelForAverageTitle.text = LocalizedString.segmentCostStat.localized
        
        //generousBlock
        self.labelMostInGenerous.text = LocalizedString.most.localized
        
        
        //for the Fem Man Thing
        if segmentOfPeriodSelected.selectedSegmentIndex == 0 || segmentOfPeriodSelected.selectedSegmentIndex == 1 || segmentOfPeriodSelected.selectedSegmentIndex == 2 {
            self.buttonGenerous.setTitle(LocalizedString.generous.localized, for: .normal)
        } else if segmentOfPeriodSelected.selectedSegmentIndex == 3 {
            self.buttonGenerous.setTitle(LocalizedString.generousMan.localized, for: .normal)
        } else {
            self.buttonGenerous.setTitle(LocalizedString.generousThing.localized, for: .normal)
        }
        
        
        self.labelForGenerousTitle.text = LocalizedString.daySmall.localized
    }
    
    
    
    
    
    
    
    
    func loadDeafaultImagesForAverage(){
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageA.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageB.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageC.image = picture
        }
        
        //load Deafaults
        let categoryA = UserDefaults.standard.value(forKey: "categoryA") as? String
        let categoryB = UserDefaults.standard.value(forKey: "categoryB") as? String
        let categoryC = UserDefaults.standard.value(forKey: "categoryC") as? String
        
        
        //...and apply them
        self.labelForCostAName.text = "Average " + categoryA!
        self.labelForCostBName.text = "Average " + categoryB!
        self.labelForCostCName.text = "Average " + categoryC!
        
    }
    
    
    func loadDeafaultImagesForGenerous(){
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageGenerousA.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageGenerousB.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageGenerousC.image = picture
        }
        
        
        /*
        //load Deafaults
        let categoryA = UserDefaults.standard.value(forKey: "categoryA") as? String
        let categoryB = UserDefaults.standard.value(forKey: "categoryB") as? String
        let categoryC = UserDefaults.standard.value(forKey: "categoryC") as? String
        
        
        //...and apply them
        self.labelForCostAName.text = categoryA
        self.labelForCostBName.text = categoryB
        self.labelForCostCName.text = categoryC
        */
    }
    
    
    
    
    
    
    
    //MARK: Functions For Greatest
    
    func findTheGreatestExpenseOfAllandLoadIt(){
        
        let sortedTableFromMaxToMin = self.tableOfExpenses.sorted (by: {Int($0.size) > Int($1.size) })
        
        
        //I check if there is at least an A Cost
        if  sortedTableFromMaxToMin == [] {
            
            //NOTE
            self.labelForNoteOfGreatestExpense.text = ""
            //DATE
            self.labelForDateOfGreatestExpense.text = ""
            //SIZE
            self.labelForSizeOfGreatestExpense.text = ""
            //Image
            if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
                
                let picture = UIImage(data: imageData as Data)
                self.imageOfGratestExpense.image = picture
            }
            
            
        } else {
            
        
        
        
        
        
        
        let greatestExpense = sortedTableFromMaxToMin[0]
        
        //NOTE
        self.labelForNoteOfGreatestExpense.text = greatestExpense.note
        
        
        //DATE
        let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionize()
            self.labelForDateOfGreatestExpense.text = dateFormatter.string(from:greatestExpense.date! as Date)
        
        //SIZE
        //In order to show the entered Cost with the suitable currency---->
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
            let stringOfEnteredFormattedCost = myFormatter.string(from: greatestExpense.size as NSNumber)
        self.labelForSizeOfGreatestExpense.text = stringOfEnteredFormattedCost
        //In order to show the entered Cost with the suitable currency----<
        
        //CASH OR CARD
        if greatestExpense.cash == true {
            self.labelForSizeOfGreatestExpense.textColor = UIColor.black
        } else {
            self.labelForSizeOfGreatestExpense.textColor = UIColor.red
        }
        
        //Image
        if greatestExpense.kind == "Acost" {
            if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
                
                let picture = UIImage(data: imageData as Data)
                self.imageOfGratestExpense.image = picture
            }
        }//if  ACost
            
            
        else if greatestExpense.kind == "Bcost" {
            if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
                
                let picture = UIImage(data: imageData as Data)
                self.imageOfGratestExpense.image = picture
            }
        } //if  BCost
        else if greatestExpense.kind == "Ccost" {
            if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
                
                let picture = UIImage(data: imageData as Data)
                self.imageOfGratestExpense.image = picture
            }
            
        }//if  CCost
        }//if[]
    }//FUNCTION
    
    
    
    func findTheGreatestExpenseOfCategoryAandLoadIt(){
        let tableWithCategoryA = self.tableOfExpenses.filter {$0.kind == "Acost"}
        
        
        
        //I check if there is at least an A Cost
        if tableWithCategoryA == [] {
            
            //NOTE
            self.labelForNoteOfGreatestExpense.text = ""
            //DATE
            self.labelForDateOfGreatestExpense.text = ""
            //SIZE
            self.labelForSizeOfGreatestExpense.text = ""
            //Image
            if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
                
                let picture = UIImage(data: imageData as Data)
                self.imageOfGratestExpense.image = picture
            }
            
            
        } else {
        
        
        
        
        
        
            let sortedTableFromMaxToMin = tableWithCategoryA.sorted (by: {Int($0.size) > Int($1.size) })
        
        let greatestExpense = sortedTableFromMaxToMin[0]
        
        //NOTE
        self.labelForNoteOfGreatestExpense.text = greatestExpense.note
        
        
        //DATE
        let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionize()
            self.labelForDateOfGreatestExpense.text = dateFormatter.string(from:greatestExpense.date! as Date)
        
        //SIZE
        //In order to show the entered Cost with the suitable currency---->
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
            let stringOfEnteredFormattedCost = myFormatter.string(from: greatestExpense.size as NSNumber)
        self.labelForSizeOfGreatestExpense.text = stringOfEnteredFormattedCost
        //In order to show the entered Cost with the suitable currency----<
        
        //CASH OR CARD
        if greatestExpense.cash == true {
            self.labelForSizeOfGreatestExpense.textColor = UIColor.black
        } else {
            self.labelForSizeOfGreatestExpense.textColor = UIColor.red
        }
        
        //Image
        if greatestExpense.kind == "Acost" {
            if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
                
                let picture = UIImage(data: imageData as Data)
                self.imageOfGratestExpense.image = picture
            }
        }//if  ACost
            
            
        else if greatestExpense.kind == "Bcost" {
            if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
                
                let picture = UIImage(data: imageData as Data)
                self.imageOfGratestExpense.image = picture
            }
        } //if  BCost
        else if greatestExpense.kind == "Ccost" {
            if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
                
                let picture = UIImage(data: imageData as Data)
                self.imageOfGratestExpense.image = picture
            }
            
        }//if  CCost
        
            
        }//if[]
    }
    
    func findTheGreatestExpenseOfCategoryBandLoadIt(){
        let tableWithCategoryB = self.tableOfExpenses.filter {$0.kind == "Bcost"}
        
        
        if tableWithCategoryB == [] {
            //NOTE
            self.labelForNoteOfGreatestExpense.text = ""
            //DATE
            self.labelForDateOfGreatestExpense.text = ""
            //SIZE
            self.labelForSizeOfGreatestExpense.text = ""
            //Image
            if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
                
                let picture = UIImage(data: imageData as Data)
                self.imageOfGratestExpense.image = picture
            }
            
            
        } else {
        
            let sortedTableFromMaxToMin = tableWithCategoryB.sorted (by: {Int($0.size) > Int($1.size) })
        
        
        
       let greatestExpense = sortedTableFromMaxToMin[0]
        
        //NOTE
        self.labelForNoteOfGreatestExpense.text = greatestExpense.note
        
        
        //DATE
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionize()
            self.labelForDateOfGreatestExpense.text = dateFormatter.string(from:greatestExpense.date! as Date)
        
        //SIZE
        //In order to show the entered Cost with the suitable currency---->
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
            let stringOfEnteredFormattedCost = myFormatter.string(from: greatestExpense.size as NSNumber)
        self.labelForSizeOfGreatestExpense.text = stringOfEnteredFormattedCost
        //In order to show the entered Cost with the suitable currency----<
        
        //CASH OR CARD
        if greatestExpense.cash == true {
            self.labelForSizeOfGreatestExpense.textColor = UIColor.black
        } else {
            self.labelForSizeOfGreatestExpense.textColor = UIColor.red
        }
        
        //Image
        if greatestExpense.kind == "Acost" {
            if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
                
                let picture = UIImage(data: imageData as Data)
                self.imageOfGratestExpense.image = picture
            }
        }//if  ACost
            
            
        else if greatestExpense.kind == "Bcost" {
            if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
                
                let picture = UIImage(data: imageData as Data)
                self.imageOfGratestExpense.image = picture
            }
        } //if  BCost
        else if greatestExpense.kind == "Ccost" {
            if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
                
                let picture = UIImage(data: imageData as Data)
                self.imageOfGratestExpense.image = picture
            }
            
         }//if  CCost
           
        }//if[]
            
    }
    
    
    func findTheGreatestExpenseOfCategoryCandLoadIt(){
        let tableWithCategoryC = self.tableOfExpenses.filter {$0.kind == "Ccost"}
        
        
        //I check if there is at least an A Cost
        if tableWithCategoryC == [] {
            
            //NOTE
            self.labelForNoteOfGreatestExpense.text = ""
            //DATE
            self.labelForDateOfGreatestExpense.text = ""
            //SIZE
            self.labelForSizeOfGreatestExpense.text = ""
            //Image
            if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
                
                let picture = UIImage(data: imageData as Data)
                self.imageOfGratestExpense.image = picture
            }
            
            
        } else {
            
        
        
        
        
        
        
            let sortedTableFromMaxToMin = tableWithCategoryC.sorted (by: {Int($0.size) > Int($1.size) })
        
        let greatestExpense = sortedTableFromMaxToMin[0]
        
        //NOTE
        self.labelForNoteOfGreatestExpense.text = greatestExpense.note
        
        
        //DATE
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionize()
            self.labelForDateOfGreatestExpense.text = dateFormatter.string(from:greatestExpense.date! as Date)
        
        //SIZE
        //In order to show the entered Cost with the suitable currency---->
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
            let stringOfEnteredFormattedCost = myFormatter.string(from: greatestExpense.size as NSNumber)
        self.labelForSizeOfGreatestExpense.text = stringOfEnteredFormattedCost
        //In order to show the entered Cost with the suitable currency----<
        
        //CASH OR CARD
        if greatestExpense.cash == true {
            self.labelForSizeOfGreatestExpense.textColor = UIColor.black
        } else {
            self.labelForSizeOfGreatestExpense.textColor = UIColor.red
        }
        
        //Image
        if greatestExpense.kind == "Acost" {
            if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
                
                let picture = UIImage(data: imageData as Data)
                self.imageOfGratestExpense.image = picture
            }
        }//if  ACost
            
            
        else if greatestExpense.kind == "Bcost" {
            if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
                
                let picture = UIImage(data: imageData as Data)
                self.imageOfGratestExpense.image = picture
            }
        } //if  BCost
        else if greatestExpense.kind == "Ccost" {
            if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
                
                let picture = UIImage(data: imageData as Data)
                self.imageOfGratestExpense.image = picture
            }
            
        }//if  CCost
        }//if []
        
    }
   
    
    
    
    //MARK: AVERAGE/MEDIAN FUNCTIONS
    //MARK:Blocks
    
    func loadTheAverageBlock(){
    
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        
       
        
        findTheAverageCost()
        //and load it
        let stringOfFormattedAverageCost = myFormatter.string(from: self.averageCost as NSNumber)!
        self.labelAverageAll.text = stringOfFormattedAverageCost
        
        findTheAverageCostForA()
        //and load it
        let stringOfFormattedAverageCostForA = myFormatter.string(from: self.averageCostForA as NSNumber)!
        self.labelAverageA.text = stringOfFormattedAverageCostForA
        
        
        findTheAverageCostForB()
        //and load it
        let stringOfFormattedAverageCostForB = myFormatter.string(from: self.averageCostForB as NSNumber)!
        self.labelAverageB.text = stringOfFormattedAverageCostForB
        
        findTheAverageCostForC()
        //and load it
        let stringOfFormattedAverageCostForC = myFormatter.string(from: self.averageCostForC as NSNumber)!
        self.labelAverageC.text = stringOfFormattedAverageCostForC
        
        
            
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageA.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageB.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageC.image = picture
        }
        
        //load Deafaults
        let categoryA = UserDefaults.standard.value(forKey: "categoryA") as? String
        let categoryB = UserDefaults.standard.value(forKey: "categoryB") as? String
        let categoryC = UserDefaults.standard.value(forKey: "categoryC") as? String
        
        
        //...and apply them
        
        if categoryA != nil {
        
        self.labelForCostAName.text = LocalizedString.average.localized + " "  + categoryA!
        self.labelForCostBName.text = LocalizedString.average.localized + " "  + categoryB!
        self.labelForCostCName.text = LocalizedString.average.localized + " "  + categoryC!
        } else {
            self.labelForCostAName.text = LocalizedString.average.localized + " "  + LocalizedString.category14.localized
            self.labelForCostBName.text = LocalizedString.average.localized + " "  + LocalizedString.category3.localized
            self.labelForCostCName.text = LocalizedString.average.localized + " "  + LocalizedString.category2.localized
            
            
        }
        
    }
    
    
    func loadTheAverageBlockPerDay(){
        
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        
        
        
        findTheAverageCostPerDay()
        //and load it
        let stringOfFormattedAverageCost = myFormatter.string(from: self.averageCostPerDay as NSNumber)!
        self.labelAverageAll.text = stringOfFormattedAverageCost
        
        findTheAverageCostForAPerDay()
        //and load it
        let stringOfFormattedAverageCostForA = myFormatter.string(from: self.averageCostForAPerDay as NSNumber)!
        self.labelAverageA.text = stringOfFormattedAverageCostForA
        
        
        findTheAverageCostForBPerDay()
        //and load it
        let stringOfFormattedAverageCostForB = myFormatter.string(from: self.averageCostForBPerDay as NSNumber)!
        self.labelAverageB.text = stringOfFormattedAverageCostForB
        
        findTheAverageCostForCPerDay()
        //and load it
        let stringOfFormattedAverageCostForC = myFormatter.string(from: self.averageCostForCPerDay as NSNumber)!
        self.labelAverageC.text = stringOfFormattedAverageCostForC
        
        
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageA.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageB.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageC.image = picture
        }
        
        //load Deafaults
        let categoryA = UserDefaults.standard.value(forKey: "categoryA") as? String
        let categoryB = UserDefaults.standard.value(forKey: "categoryB") as? String
        let categoryC = UserDefaults.standard.value(forKey: "categoryC") as? String
        
        
        //...and apply them
        if categoryA != nil {
        self.labelForCostAName.text = LocalizedString.average.localized + " " + categoryA! + "/" + LocalizedString.daySmall.localized
        self.labelForCostBName.text = LocalizedString.average.localized + " " + categoryB! + "/" + LocalizedString.daySmall.localized
        self.labelForCostCName.text = LocalizedString.average.localized + " " + categoryC! + "/" + LocalizedString.daySmall.localized
        } else {
            self.labelForCostAName.text = LocalizedString.average.localized + " " + LocalizedString.category14.localized + "/" + LocalizedString.daySmall.localized
            self.labelForCostBName.text = LocalizedString.average.localized + " " + LocalizedString.category3.localized + "/" + LocalizedString.daySmall.localized
            self.labelForCostCName.text = LocalizedString.average.localized + " " + LocalizedString.category2.localized + "/" + LocalizedString.daySmall.localized
        }
        
    }
    
    
    
    func loadTheAverageBlockPerWeek(){
        
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        
        
        
        findTheAverageCostPerWeek()
        //and load it
        let stringOfFormattedAverageCost = myFormatter.string(from: self.averageCostPerWeek as NSNumber)!
        self.labelAverageAll.text = stringOfFormattedAverageCost
        
        findTheAverageCostForAPerWeek()
        //and load it
        let stringOfFormattedAverageCostForA = myFormatter.string(from: self.averageCostForAPerWeek as NSNumber)!
        self.labelAverageA.text = stringOfFormattedAverageCostForA
        
        
        findTheAverageCostForBPerWeek()
        //and load it
        let stringOfFormattedAverageCostForB = myFormatter.string(from: self.averageCostForBPerWeek as NSNumber)!
        self.labelAverageB.text = stringOfFormattedAverageCostForB
        
        findTheAverageCostForCPerWeek()
        //and load it
        let stringOfFormattedAverageCostForC = myFormatter.string(from: self.averageCostForCPerWeek as NSNumber)!
        self.labelAverageC.text = stringOfFormattedAverageCostForC
        
        
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageA.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageB.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageC.image = picture
        }
        
        //load Deafaults
        let categoryA = UserDefaults.standard.value(forKey: "categoryA") as? String
        let categoryB = UserDefaults.standard.value(forKey: "categoryB") as? String
        let categoryC = UserDefaults.standard.value(forKey: "categoryC") as? String
        
        
        
        //...and apply them
        if categoryA != nil {
            self.labelForCostAName.text = LocalizedString.average.localized + " " + categoryA! + "/" + LocalizedString.weekSmall.localized
            self.labelForCostBName.text = LocalizedString.average.localized + " " + categoryB! + "/" + LocalizedString.weekSmall.localized
            self.labelForCostCName.text = LocalizedString.average.localized + " " + categoryC! + "/" + LocalizedString.weekSmall.localized
        } else {
        self.labelForCostAName.text = LocalizedString.average.localized + " " + LocalizedString.category14.localized + "/" + LocalizedString.weekSmall.localized
        self.labelForCostBName.text = LocalizedString.average.localized + " " + LocalizedString.category3.localized + "/" + LocalizedString.weekSmall.localized
        self.labelForCostCName.text = LocalizedString.average.localized + " " + LocalizedString.category2.localized + "/" + LocalizedString.weekSmall.localized
        }
        
    }
    
    
    func loadTheAverageBlockPerMonth(){
        
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        
        
        
        findTheAverageCostPerMonth()
        //and load it
        let stringOfFormattedAverageCost = myFormatter.string(from: self.averageCostPerMonth as NSNumber)!
        self.labelAverageAll.text = stringOfFormattedAverageCost
        
        findTheAverageCostForAPerMonth()
        //and load it
        let stringOfFormattedAverageCostForA = myFormatter.string(from: self.averageCostForAPerMonth as NSNumber)!
        self.labelAverageA.text = stringOfFormattedAverageCostForA
        
        
        findTheAverageCostForBPerMonth()
        //and load it
        let stringOfFormattedAverageCostForB = myFormatter.string(from: self.averageCostForBPerMonth as NSNumber)!
        self.labelAverageB.text = stringOfFormattedAverageCostForB
        
        findTheAverageCostForCPerMonth()
        //and load it
        let stringOfFormattedAverageCostForC = myFormatter.string(from: self.averageCostForCPerMonth as NSNumber)!
        self.labelAverageC.text = stringOfFormattedAverageCostForC
        
        
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageA.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageB.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageC.image = picture
        }
        
        //load Deafaults
        let categoryA = UserDefaults.standard.value(forKey: "categoryA") as? String
        let categoryB = UserDefaults.standard.value(forKey: "categoryB") as? String
        let categoryC = UserDefaults.standard.value(forKey: "categoryC") as? String
        
        
        
        //...and apply them
        if categoryA != nil {
        self.labelForCostAName.text = LocalizedString.average.localized + " " + categoryA! + "/" + LocalizedString.monthSmall.localized
        self.labelForCostBName.text = LocalizedString.average.localized + " " + categoryB! + "/" + LocalizedString.monthSmall.localized
        self.labelForCostCName.text = LocalizedString.average.localized + " " + categoryC! + "/" + LocalizedString.monthSmall.localized
        } else {
            self.labelForCostAName.text = LocalizedString.average.localized + " " + LocalizedString.category14.localized + "/" + LocalizedString.monthSmall.localized
            self.labelForCostBName.text = LocalizedString.average.localized + " " + LocalizedString.category3.localized + "/" + LocalizedString.monthSmall.localized
            self.labelForCostCName.text = LocalizedString.average.localized + " " + LocalizedString.category2.localized + "/" + LocalizedString.monthSmall.localized
        }
        
    }
    
    
    
    
    func loadTheAverageBlockPerYear(){
        
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        
        
        
        findTheAverageCostPerYear()
        //and load it
        let stringOfFormattedAverageCost = myFormatter.string(from: self.averageCostPerYear as NSNumber)!
        self.labelAverageAll.text = stringOfFormattedAverageCost
        
        findTheAverageCostForAPerYear()
        //and load it
        let stringOfFormattedAverageCostForA = myFormatter.string(from: self.averageCostForAPerYear as NSNumber)!
        self.labelAverageA.text = stringOfFormattedAverageCostForA
        
        
        findTheAverageCostForBPerYear()
        //and load it
        let stringOfFormattedAverageCostForB = myFormatter.string(from: self.averageCostForBPerYear as NSNumber)!
        self.labelAverageB.text = stringOfFormattedAverageCostForB
        
        findTheAverageCostForCPerYear()
        //and load it
        let stringOfFormattedAverageCostForC = myFormatter.string(from: self.averageCostForCPerYear as NSNumber)!
        self.labelAverageC.text = stringOfFormattedAverageCostForC
        
        
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageA.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageB.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageC.image = picture
        }
        
        //load Deafaults
        let categoryA = UserDefaults.standard.value(forKey: "categoryA") as? String
        let categoryB = UserDefaults.standard.value(forKey: "categoryB") as? String
        let categoryC = UserDefaults.standard.value(forKey: "categoryC") as? String
        
        
        //...and apply them
        if categoryA != nil {
            self.labelForCostAName.text = LocalizedString.average.localized + " " + categoryA! + "/" + LocalizedString.yearSmall.localized
            self.labelForCostBName.text = LocalizedString.average.localized + " " + categoryB! + "/" + LocalizedString.yearSmall.localized
            self.labelForCostCName.text = LocalizedString.average.localized + " " + categoryC! + "/" + LocalizedString.yearSmall.localized
            
        } else {
        self.labelForCostAName.text = LocalizedString.average.localized + " " + LocalizedString.category14.localized + "/" + LocalizedString.yearSmall.localized
        self.labelForCostBName.text = LocalizedString.average.localized + " " + LocalizedString.category3.localized + "/" + LocalizedString.yearSmall.localized
        self.labelForCostCName.text = LocalizedString.average.localized + " " + LocalizedString.category2.localized + "/" + LocalizedString.yearSmall.localized
        }
        
    }
    
    
    
    
    func loadTheMedianBlock() {
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        findTheMedianCost()
        //and load it
        let stringOfFormattedAverageCost = myFormatter.string(from: self.averageCost as NSNumber)!
        self.labelAverageAll.text = stringOfFormattedAverageCost
        
        findTheMedianCostForA()
        //and load it
        let stringOfFormattedAverageCostForA = myFormatter.string(from: self.averageCostForA as NSNumber)!
        self.labelAverageA.text = stringOfFormattedAverageCostForA
        
        
        findTheMedianCostForB()
        //and load it
        let stringOfFormattedAverageCostForB = myFormatter.string(from: self.averageCostForB as NSNumber)!
        self.labelAverageB.text = stringOfFormattedAverageCostForB
        
        findTheMedianCostForC()
        //and load it
        let stringOfFormattedAverageCostForC = myFormatter.string(from: self.averageCostForC as NSNumber)!
        self.labelAverageC.text = stringOfFormattedAverageCostForC
        
        
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageA.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageB.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageC.image = picture
        }
        
        //load Deafaults
        let categoryA = UserDefaults.standard.value(forKey: "categoryA") as? String
        let categoryB = UserDefaults.standard.value(forKey: "categoryB") as? String
        let categoryC = UserDefaults.standard.value(forKey: "categoryC") as? String
        
        
        //...and apply them
        self.labelForCostAName.text = LocalizedString.median.localized + " " + categoryA!
        self.labelForCostBName.text = LocalizedString.median.localized + " " + categoryB!
        self.labelForCostCName.text = LocalizedString.median.localized + " " + categoryC!
        
        
    }
    
    func loadTheMedianBlockPerDay() {
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        findTheMedianCostPerDay()
        //and load it
        let stringOfFormattedAverageCost = myFormatter.string(from: self.averageCost as NSNumber)!
        self.labelAverageAll.text = stringOfFormattedAverageCost
        
        findTheMedianCostPerDayForA()
        //and load it
        let stringOfFormattedAverageCostForA = myFormatter.string(from: self.averageCostForA as NSNumber)!
        self.labelAverageA.text = stringOfFormattedAverageCostForA
        
        
        findTheMedianCostPerDayForB()
        //and load it
        let stringOfFormattedAverageCostForB = myFormatter.string(from: self.averageCostForB as NSNumber)!
        self.labelAverageB.text = stringOfFormattedAverageCostForB
        
        findTheMedianCostPerDayForC()
        //and load it
        let stringOfFormattedAverageCostForC = myFormatter.string(from: self.averageCostForC as NSNumber)!
        self.labelAverageC.text = stringOfFormattedAverageCostForC
        
        
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageA.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageB.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageC.image = picture
        }
        
        //load Deafaults
        let categoryA = UserDefaults.standard.value(forKey: "categoryA") as? String
        let categoryB = UserDefaults.standard.value(forKey: "categoryB") as? String
        let categoryC = UserDefaults.standard.value(forKey: "categoryC") as? String
        
        
        //...and apply them
        self.labelForCostAName.text = LocalizedString.median.localized + " " + categoryA! + "/" + LocalizedString.daySmall.localized
        self.labelForCostBName.text = LocalizedString.median.localized + " " + categoryB! + "/" + LocalizedString.daySmall.localized
        self.labelForCostCName.text = LocalizedString.median.localized + " " + categoryC! + "/" + LocalizedString.daySmall.localized
        
        
    }
    
    
    
    
    func loadTheMedianBlockPerYear() {
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        findTheMedianCostPerYear()
        //and load it
        let stringOfFormattedAverageCost = myFormatter.string(from: self.averageCost as NSNumber)!
        self.labelAverageAll.text = stringOfFormattedAverageCost
        
        findTheMedianCostPerYearForA()
        //and load it
        let stringOfFormattedAverageCostForA = myFormatter.string(from: self.averageCostForA as NSNumber)!
        self.labelAverageA.text = stringOfFormattedAverageCostForA
        
        
        findTheMedianCostPerYearForB()
        //and load it
        let stringOfFormattedAverageCostForB = myFormatter.string(from: self.averageCostForB as NSNumber)!
        self.labelAverageB.text = stringOfFormattedAverageCostForB
        
        findTheMedianCostPerYearForC()
        //and load it
        let stringOfFormattedAverageCostForC = myFormatter.string(from: self.averageCostForC as NSNumber)!
        self.labelAverageC.text = stringOfFormattedAverageCostForC
        
        
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageA.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageB.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageC.image = picture
        }
        
        //load Deafaults
        let categoryA = UserDefaults.standard.value(forKey: "categoryA") as? String
        let categoryB = UserDefaults.standard.value(forKey: "categoryB") as? String
        let categoryC = UserDefaults.standard.value(forKey: "categoryC") as? String
        
        
        //...and apply them
        self.labelForCostAName.text = LocalizedString.median.localized + " " + categoryA! + "/" + LocalizedString.yearSmall.localized
        self.labelForCostBName.text = LocalizedString.median.localized + " " + categoryB! + "/" + LocalizedString.yearSmall.localized
        self.labelForCostCName.text = LocalizedString.median.localized + " " + categoryC! + "/" + LocalizedString.yearSmall.localized
        
        
    }
    
    
    func loadTheMedianBlockPerMonth() {
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        findTheMedianCostPerMonth()
        //and load it
        let stringOfFormattedAverageCost = myFormatter.string(from: self.averageCost as NSNumber)!
        self.labelAverageAll.text = stringOfFormattedAverageCost
        
        findTheMedianCostPerMonthForA()
        //and load it
        let stringOfFormattedAverageCostForA = myFormatter.string(from: self.averageCostForA as NSNumber)!
        self.labelAverageA.text = stringOfFormattedAverageCostForA
        
        
        findTheMedianCostPerMonthForB()
        //and load it
        let stringOfFormattedAverageCostForB = myFormatter.string(from: self.averageCostForB as NSNumber)!
        self.labelAverageB.text = stringOfFormattedAverageCostForB
        
        findTheMedianCostPerMonthForC()
        //and load it
        let stringOfFormattedAverageCostForC = myFormatter.string(from: self.averageCostForC as NSNumber)!
        self.labelAverageC.text = stringOfFormattedAverageCostForC
        
        
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageA.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageB.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageC.image = picture
        }
        
        //load Deafaults
        let categoryA = UserDefaults.standard.value(forKey: "categoryA") as? String
        let categoryB = UserDefaults.standard.value(forKey: "categoryB") as? String
        let categoryC = UserDefaults.standard.value(forKey: "categoryC") as? String
        
        
        //...and apply them
        self.labelForCostAName.text = LocalizedString.median.localized + " " + categoryA! + "/" + LocalizedString.monthSmall.localized
        self.labelForCostBName.text = LocalizedString.median.localized + " " + categoryB! + "/" + LocalizedString.monthSmall.localized
        self.labelForCostCName.text = LocalizedString.median.localized + " " + categoryC! + "/" + LocalizedString.monthSmall.localized
        
        
    }
    
    
    
    
    func loadTheMedianBlockPerWeek() {
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        findTheMedianCostPerWeek()
        //and load it
        let stringOfFormattedAverageCost = myFormatter.string(from: self.averageCost as NSNumber)!
        self.labelAverageAll.text = stringOfFormattedAverageCost
        
        findTheMedianCostPerWeekForA()
        //and load it
        let stringOfFormattedAverageCostForA = myFormatter.string(from: self.averageCostForA as NSNumber)!
        self.labelAverageA.text = stringOfFormattedAverageCostForA
        
        
        findTheMedianCostPerWeekForB()
        //and load it
        let stringOfFormattedAverageCostForB = myFormatter.string(from: self.averageCostForB as NSNumber)!
        self.labelAverageB.text = stringOfFormattedAverageCostForB
        
        findTheMedianCostPerWeekForC()
        //and load it
        let stringOfFormattedAverageCostForC = myFormatter.string(from: self.averageCostForC as NSNumber)!
        self.labelAverageC.text = stringOfFormattedAverageCostForC
        
        
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageA.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageB.image = picture
        }
        
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
            let picture = UIImage(data: imageData as Data)
            self.imageAverageC.image = picture
        }
        
        //load Deafaults
        let categoryA = UserDefaults.standard.value(forKey: "categoryA") as? String
        let categoryB = UserDefaults.standard.value(forKey: "categoryB") as? String
        let categoryC = UserDefaults.standard.value(forKey: "categoryC") as? String
        
        
        //...and apply them
        self.labelForCostAName.text = LocalizedString.median.localized + " " + categoryA! + "/" + LocalizedString.weekSmall.localized
        self.labelForCostBName.text = LocalizedString.median.localized + " " + categoryB! + "/" + LocalizedString.weekSmall.localized
        self.labelForCostCName.text = LocalizedString.median.localized + " " + categoryC! + "/" + LocalizedString.weekSmall.localized
        
        
    }
    
    //day
    func loadTheGenerousBlock(){
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
     
        createTupleArrayOfDailySumsAndGetMaxMin()
        self.labelOfGenerousDateAll.text = dateFormatter.string(from: self.dateOfMostGenerousDayofAll)
        self.labelOfGenerousAll.text = myFormatter .string(from: self.costOfMostGenerousDayOfAll as NSNumber)
        
        createTupleArrayOfDailySumsForAAndGetMaxMin()
        self.labelOfGenerousDateA.text = dateFormatter.string(from: self.dateOfMostGenerousDayofA)
        self.labelOfGenerousA.text = myFormatter .string(from: self.costOfMostGenerousDayForA as NSNumber)
        
        createTupleArrayOfDailySumsForBAndGetMaxMin()
        self.labelOfGenerousDateB.text = dateFormatter.string(from: self.dateOfMostGenerousDayofB)
        self.labelOfGenerousB.text = myFormatter .string(from: self.costOfMostGenerousDayForB as NSNumber)
        
        createTupleArrayOfDailySumsForCAndGetMaxMin()
        self.labelOfGenerousDateC.text = dateFormatter.string(from: self.dateOfMostGenerousDayofC)
         self.labelOfGenerousC.text = myFormatter .string(from: self.costOfMostGenerousDayForC as NSNumber)
        
        
        loadDeafaultImagesForGenerous()
        
        
    }
    //year
    func loadTheGenerousBlockForYear(){
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        createTheArrayWithTheSortedYearCostTuplesAndLoadTheVariables()
        self.labelOfGenerousDateAll.text = String(self.yearGenerousOfAll)
        self.labelOfGenerousAll.text = myFormatter .string(from: self.costOfMostGenerousYearOfAll as NSNumber)
        
       createTheArrayWithTheSortedYearCostTuplesAndLoadTheVariablesForA()
        self.labelOfGenerousDateA.text = String(self.yearGenerousOfA)
        self.labelOfGenerousA.text = myFormatter .string(from: self.costOfMostGenerousYearForA as NSNumber)
        
        createTheArrayWithTheSortedYearCostTuplesAndLoadTheVariablesForB()
        self.labelOfGenerousDateB.text = String(self.yearGenerousOfB)
        self.labelOfGenerousB.text = myFormatter .string(from: self.costOfMostGenerousYearForB as NSNumber)
        
        createTheArrayWithTheSortedYearCostTuplesAndLoadTheVariablesForC()
        self.labelOfGenerousDateC.text = String(self.yearGenerousOfC)
        self.labelOfGenerousC.text = myFormatter .string(from: self.costOfMostGenerousYearForC  as NSNumber)
        
        
        loadDeafaultImagesForGenerous()
        
        
    }
    
    
    //month
    func loadTheGenerousBlockForMonth(){
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "MMM YYYY"
        
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        createTheArrayWithTheSortedMonthCostTuplesAndLoadTheVariables()
        self.labelOfGenerousDateAll.text = dateFormatter.string(from: self.monthGenerousOfAll)
        self.labelOfGenerousAll.text = myFormatter .string(from: self.costOfMostGenerousMonthOfAll as NSNumber)
        
        createTheArrayWithTheSortedMonthCostTuplesAndLoadTheVariablesForA()
        self.labelOfGenerousDateA.text = dateFormatter.string(from: self.monthGenerousOfA)
        self.labelOfGenerousA.text = myFormatter.string(from: self.costOfMostGenerousMonthForA as NSNumber)
        
        createTheArrayWithTheSortedMonthCostTuplesAndLoadTheVariablesForB()
        self.labelOfGenerousDateB.text = dateFormatter.string(from: self.monthGenerousOfB)
        self.labelOfGenerousB.text = myFormatter .string(from: self.costOfMostGenerousMonthForB as NSNumber)
        
        createTheArrayWithTheSortedMonthCostTuplesAndLoadTheVariablesForC()
        self.labelOfGenerousDateC.text = dateFormatter.string(from: self.monthGenerousOfC)
        self.labelOfGenerousC.text = myFormatter .string(from: self.costOfMostGenerousMonthForC as NSNumber)
        
        
        loadDeafaultImagesForGenerous()
        
        
    }
    
    
    func getWeeksFinalDay(weeksFirtsDay: Date) -> Date {
        //crete The final day
        let date = weeksFirtsDay
        
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        //let weekday = calendar.component(.weekday, from: date)
        
        let components: NSDateComponents = NSDateComponents()
        
        components.year = year
        components.month = month
        components.day = day + 7
        let dateOfGenerousWeekFinalDay: NSDate = calendar.date(from: components as DateComponents)! as NSDate
        return dateOfGenerousWeekFinalDay as Date
    }
    
        

    func loadTheGenerousBlockForWeek(){
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
       
        
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        
        createTheArrayWithTheSortedWeekCostTuplesAndLoadTheVariables()
        let dateOfGenerousWeekFinalDay = getWeeksFinalDay(weeksFirtsDay: self.dateOfweekFirstDayGenerousOfAll)
        self.labelOfGenerousDateAll.text = dateFormatter.string(from: self.dateOfweekFirstDayGenerousOfAll) + "-" + dateFormatter.string(from: dateOfGenerousWeekFinalDay as Date)
        self.labelOfGenerousAll.text = myFormatter.string(from: self.costOfMostGenerousWeekOfAll as NSNumber)
        
        
        
        createTheArrayWithTheSortedWeekCostTuplesAndLoadTheVariablesForA()
        let dateOfGenerousWeekFinalDayForA = getWeeksFinalDay(weeksFirtsDay: self.dateOfweekFirstDayGenerousOfA)
        self.labelOfGenerousDateA.text = dateFormatter.string(from: self.dateOfweekFirstDayGenerousOfA) + "-" + dateFormatter.string(from: dateOfGenerousWeekFinalDayForA as Date)
        self.labelOfGenerousA.text = myFormatter.string(from: self.costOfMostGenerousWeekForA as NSNumber)
        
        createTheArrayWithTheSortedWeekCostTuplesAndLoadTheVariablesForB()
        let dateOfGenerousWeekFinalDayForB = getWeeksFinalDay(weeksFirtsDay: self.dateOfweekFirstDayGenerousOfB)
        self.labelOfGenerousDateB.text = dateFormatter.string(from: self.dateOfweekFirstDayGenerousOfB) + "-" + dateFormatter.string(from: dateOfGenerousWeekFinalDayForB as Date)
        self.labelOfGenerousB.text = myFormatter.string(from: self.costOfMostGenerousWeekForB as NSNumber)
        
        
        createTheArrayWithTheSortedWeekCostTuplesAndLoadTheVariablesForC()
        let dateOfGenerousWeekFinalDayForC = getWeeksFinalDay(weeksFirtsDay: self.dateOfweekFirstDayGenerousOfC)
        self.labelOfGenerousDateC.text = dateFormatter.string(from: self.dateOfweekFirstDayGenerousOfC) + "-" + dateFormatter.string(from: dateOfGenerousWeekFinalDayForC as Date)
        self.labelOfGenerousC.text = myFormatter.string(from: self.costOfMostGenerousWeekForC as NSNumber)
       
        
        loadDeafaultImagesForGenerous()
        
        
        
        
        
    }
    
    
    
    
    
    
    //DAY
    func loadTheEconomicBlock(){
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        createTupleArrayOfDailySumsAndGetMaxMin()
        self.labelOfGenerousDateAll.text = dateFormatter.string(from: self.dateOfMostEconomicDayofAll)
        self.labelOfGenerousAll.text = myFormatter .string(from: self.costOfMostEconomicDayOfAll as NSNumber)
        
        createTupleArrayOfDailySumsForAAndGetMaxMin()
        self.labelOfGenerousDateA.text = dateFormatter.string(from: self.dateOfMostEconomicDayofA)
        self.labelOfGenerousA.text = myFormatter .string(from: self.costOfMostEconomicDayForA as NSNumber)
        
        createTupleArrayOfDailySumsForBAndGetMaxMin()
        self.labelOfGenerousDateB.text = dateFormatter.string(from: self.dateOfMostEconomicDayofB)
        self.labelOfGenerousB.text = myFormatter .string(from: self.costOfMostEconomicDayForB as NSNumber)
        
        createTupleArrayOfDailySumsForCAndGetMaxMin()
        self.labelOfGenerousDateC.text = dateFormatter.string(from: self.dateOfMostEconomicDayofC)
        self.labelOfGenerousC.text = myFormatter .string(from: self.costOfMostEconomicDayForC as NSNumber)
        
        
        loadDeafaultImagesForGenerous()
        
        
    }
    //year
    func loadTheEconomicBlockForYear(){
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        createTheArrayWithTheSortedYearCostTuplesAndLoadTheVariables()
        self.labelOfGenerousDateAll.text = String(self.yearEconomicOfAll)
        self.labelOfGenerousAll.text = myFormatter .string(from: self.costOfMostEconomicYearOfAll as NSNumber)
        //print("the year with the lower cost is\(self.yearEconomicOfAll) and it costs \(self.costOfMostEconomicYearOfAll)")
        
        createTheArrayWithTheSortedYearCostTuplesAndLoadTheVariablesForA()
        self.labelOfGenerousDateA.text = String(self.yearEconomicOfA)
        self.labelOfGenerousA.text = myFormatter.string(from: self.costOfMostEconomicYearForA as NSNumber)
        print("the year with the lower Acost is\(self.yearEconomicOfA) and it costs \(self.costOfMostEconomicYearForA)")
        
        createTheArrayWithTheSortedYearCostTuplesAndLoadTheVariablesForB()
        self.labelOfGenerousDateB.text = String(self.yearEconomicOfB)
        self.labelOfGenerousB.text = myFormatter.string(from: self.costOfMostEconomicYearForB as NSNumber)
        
        createTheArrayWithTheSortedYearCostTuplesAndLoadTheVariablesForC()
        self.labelOfGenerousDateC.text = String(self.yearEconomicOfC)
        self.labelOfGenerousC.text = myFormatter.string(from: self.costOfMostEconomicYearForC as NSNumber)
        
        
        loadDeafaultImagesForGenerous()
        
        
    }
    
    
    //month
    func loadTheEconomicBlockForMonth() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "MMM YYYY"
        
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        createTheArrayWithTheSortedMonthCostTuplesAndLoadTheVariables()
        self.labelOfGenerousDateAll.text = dateFormatter.string(from: self.monthEconomicOfAll)
        self.labelOfGenerousAll.text = myFormatter.string(from: self.costOfMostEconomicMonthOfAll as NSNumber)
        
        createTheArrayWithTheSortedMonthCostTuplesAndLoadTheVariablesForA()
        self.labelOfGenerousDateA.text = dateFormatter.string(from: self.monthEconomicOfA)
        self.labelOfGenerousA.text = myFormatter.string(from: self.costOfMostEconomicMonthForA as NSNumber)
        
        createTheArrayWithTheSortedMonthCostTuplesAndLoadTheVariablesForB()
        self.labelOfGenerousDateB.text = dateFormatter.string(from: self.monthEconomicOfB)
        self.labelOfGenerousB.text = myFormatter.string(from: self.costOfMostEconomicMonthForB as NSNumber)
        
        createTheArrayWithTheSortedMonthCostTuplesAndLoadTheVariablesForC()
        self.labelOfGenerousDateC.text = dateFormatter.string(from: self.monthEconomicOfC)
        self.labelOfGenerousC.text = myFormatter.string(from: self.costOfMostEconomicMonthForC  as NSNumber)
        
        
        loadDeafaultImagesForGenerous()
        
        
    }
    
    func loadTheEconomicBlockForWeek(){
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        
        createTheArrayWithTheSortedWeekCostTuplesAndLoadTheVariables()
        let dateOfEconomicWeekFinalDay = getWeeksFinalDay(weeksFirtsDay: self.dateOfweekFirstDayEconomicOfAll)
        self.labelOfGenerousDateAll.text = dateFormatter.string(from: self.dateOfweekFirstDayEconomicOfAll) + "-" + dateFormatter.string(from: dateOfEconomicWeekFinalDay as Date)
        self.labelOfGenerousAll.text = myFormatter.string(from: self.costOfMostEconomicWeekOfAll as NSNumber)

        
        createTheArrayWithTheSortedWeekCostTuplesAndLoadTheVariablesForA()
        let dateOfEconomicWeekFinalDayForA = getWeeksFinalDay(weeksFirtsDay: self.dateOfweekFirstDayEconomicOfA)
        self.labelOfGenerousDateA.text = dateFormatter.string(from: self.dateOfweekFirstDayEconomicOfA) + "-" + dateFormatter.string(from: dateOfEconomicWeekFinalDayForA as Date)
        self.labelOfGenerousA.text = myFormatter.string(from: self.costOfMostEconomicWeekForA as NSNumber)
        
        
        createTheArrayWithTheSortedWeekCostTuplesAndLoadTheVariablesForB()
        let dateOfEconomicWeekFinalDayForB = getWeeksFinalDay(weeksFirtsDay: self.dateOfweekFirstDayEconomicOfB)
        self.labelOfGenerousDateB.text = dateFormatter.string(from: self.dateOfweekFirstDayEconomicOfB) + "-" + dateFormatter.string(from: dateOfEconomicWeekFinalDayForB as Date)
        self.labelOfGenerousB.text = myFormatter.string(from: self.costOfMostEconomicWeekForB as NSNumber)
        
        createTheArrayWithTheSortedWeekCostTuplesAndLoadTheVariablesForC()
        let dateOfEconomicWeekFinalDayForC = getWeeksFinalDay(weeksFirtsDay: self.dateOfweekFirstDayEconomicOfC)
        self.labelOfGenerousDateC.text = dateFormatter.string(from: self.dateOfweekFirstDayEconomicOfC) + "-" + dateFormatter.string(from: dateOfEconomicWeekFinalDayForC as Date)
        self.labelOfGenerousC.text = myFormatter.string(from: self.costOfMostEconomicWeekForC as NSNumber)
        
    }
    
    
    
    
    
    
    
    
    //MARK: Bricks
    //MARK: Average
    func findTheAverageCost()  {
        
        let sum = self.tableOfExpenses.reduce(0, {$0 + $1.size})
        print("\(sum)")
        let plithos = self.tableOfExpenses.count
        print("\(plithos)")
        self.averageCost = sum/(Double(plithos))
    
    }
    
    func findTheAverageCostPerDay() {
       
        let sum = self.tableOfExpenses.reduce(0, {$0 + $1.size})
        calculateDateDifferenceInDays()
        self.averageCostPerDay = sum/Double(self.dateDifferenceInDays)
        
        
    }
    
    
    func findTheAverageCostPerWeek() {
        
        let sum = self.tableOfExpenses.reduce(0, {$0 + $1.size})
        calculateDateDifferenceInWeeks()
        self.averageCostPerWeek = sum/Double(self.dateDifferenceInWeeks)
        
        
    }
    
    
    
    func findTheAverageCostPerMonth() {
        
        let sum = self.tableOfExpenses.reduce(0, {$0 + $1.size})
        calculateDateDifferenceInMonths()
        self.averageCostPerMonth = sum/Double(self.dateDifferenceInMonths)
        
        
    }
    
    
    func findTheAverageCostPerYear() {
        
        let sum = self.tableOfExpenses.reduce(0, {$0 + $1.size})
        calculateDateDifferenceInYears()
        self.averageCostPerYear = sum/Double(self.dateDifferenceInYears)
        
        
    }
    
    
    //MARK: Average For A Category
    
    func findTheAverageCostForA()  {
        
        let tableWithCategoryA = self.tableOfExpenses.filter {$0.kind == "Acost"}
        
        let sum = tableWithCategoryA.reduce(0, {$0 + $1.size})
        print("\(sum)")
        let plithos = tableWithCategoryA.count
        print("\(plithos)")
        self.averageCostForA = sum/(Double(plithos))
        
    }
    
    
    func findTheAverageCostForAPerDay(){
         let tableWithCategoryA = self.tableOfExpenses.filter {$0.kind == "Acost"}
        let sum = tableWithCategoryA.reduce(0, {$0 + $1.size})
        calculateDateDifferenceInDays()
        self.averageCostForAPerDay = sum/Double(self.dateDifferenceInDays)
       
      
    }
    
    
    func findTheAverageCostForAPerWeek(){
        let tableWithCategoryA = self.tableOfExpenses.filter {$0.kind == "Acost"}
        let sum = tableWithCategoryA.reduce(0, {$0 + $1.size})
        calculateDateDifferenceInWeeks()
        self.averageCostForAPerWeek = sum/Double(self.dateDifferenceInWeeks)
        
        
    }
    
    func findTheAverageCostForAPerMonth(){
        let tableWithCategoryA = self.tableOfExpenses.filter {$0.kind == "Acost"}
        let sum = tableWithCategoryA.reduce(0, {$0 + $1.size})
        calculateDateDifferenceInMonths()
        self.averageCostForAPerMonth = sum/Double(self.dateDifferenceInMonths)
        
        
    }
    
    func findTheAverageCostForAPerYear(){
        let tableWithCategoryA = self.tableOfExpenses.filter {$0.kind == "Acost"}
        let sum = tableWithCategoryA.reduce(0, {$0 + $1.size})
        calculateDateDifferenceInYears()
        self.averageCostForAPerYear = sum/Double(self.dateDifferenceInYears)
        
        
    }
    
    
    
    
    //MARK: Average For B Category
    
    
    func findTheAverageCostForB()  {
        
        let tableWithCategoryB = self.tableOfExpenses.filter {$0.kind == "Bcost"}
        
        let sum = tableWithCategoryB.reduce(0, {$0 + $1.size})
        print("\(sum)")
        let plithos = tableWithCategoryB.count
        print("\(plithos)")
        self.averageCostForB = sum/(Double(plithos))
        
    }
    
    func findTheAverageCostForBPerDay(){
        let tableWithCategoryB = self.tableOfExpenses.filter {$0.kind == "Bcost"}
        let sum = tableWithCategoryB.reduce(0, {$0 + $1.size})
        calculateDateDifferenceInDays()
        self.averageCostForBPerDay = sum/Double(self.dateDifferenceInDays)
        
        
    }
    
    func findTheAverageCostForBPerWeek(){
        let tableWithCategoryB = self.tableOfExpenses.filter {$0.kind == "Bcost"}
        let sum = tableWithCategoryB.reduce(0, {$0 + $1.size})
        calculateDateDifferenceInWeeks()
        self.averageCostForBPerWeek = sum/Double(self.dateDifferenceInWeeks)
        
        
    }
    
    func findTheAverageCostForBPerMonth(){
        let tableWithCategoryB = self.tableOfExpenses.filter {$0.kind == "Bcost"}
        let sum = tableWithCategoryB.reduce(0, {$0 + $1.size})
        calculateDateDifferenceInMonths()
        self.averageCostForBPerMonth = sum/Double(self.dateDifferenceInMonths)
        
        
    }
    
    func findTheAverageCostForBPerYear(){
        let tableWithCategoryB = self.tableOfExpenses.filter {$0.kind == "Bcost"}
        let sum = tableWithCategoryB.reduce(0, {$0 + $1.size})
        calculateDateDifferenceInYears()
        self.averageCostForBPerYear = sum/Double(self.dateDifferenceInYears)
        
        
    }
    
    
    
    //MARK: Average For C Category
    
    
    func findTheAverageCostForC()  {
        
        let tableWithCategoryC = self.tableOfExpenses.filter {$0.kind == "Ccost"}
        
        let sum = tableWithCategoryC.reduce(0, {$0 + $1.size})
        print("\(sum)")
        let plithos = tableWithCategoryC.count
        print("\(plithos)")
        self.averageCostForC = sum/(Double(plithos))
        
    }
    
   
    func findTheAverageCostForCPerDay(){
        let tableWithCategoryC = self.tableOfExpenses.filter {$0.kind == "Ccost"}
        let sum = tableWithCategoryC.reduce(0, {$0 + $1.size})
        calculateDateDifferenceInDays()
        self.averageCostForCPerDay = sum/Double(self.dateDifferenceInDays)
        
        
    }
  
    func findTheAverageCostForCPerWeek(){
        let tableWithCategoryC = self.tableOfExpenses.filter {$0.kind == "Ccost"}
        let sum = tableWithCategoryC.reduce(0, {$0 + $1.size})
        calculateDateDifferenceInWeeks()
        self.averageCostForCPerWeek = sum/Double(self.dateDifferenceInWeeks)
        
        
    }
    
    func findTheAverageCostForCPerMonth(){
        let tableWithCategoryC = self.tableOfExpenses.filter {$0.kind == "Ccost"}
        let sum = tableWithCategoryC.reduce(0, {$0 + $1.size})
        calculateDateDifferenceInMonths()
        self.averageCostForCPerMonth = sum/Double(self.dateDifferenceInMonths)
        
        
    }
    
    func findTheAverageCostForCPerYear(){
        let tableWithCategoryC = self.tableOfExpenses.filter {$0.kind == "Ccost"}
        let sum = tableWithCategoryC.reduce(0, {$0 + $1.size})
        calculateDateDifferenceInYears()
        self.averageCostForCPerYear = sum/Double(self.dateDifferenceInYears)
        
        
    }
    
    
    
    
    
    //MARK: Median
    func findTheMedianCost(){
        var medianCost = Double()
        
        
        let sortedTableFromMaxToMin = self.tableOfExpenses.sorted (by: {Int($0.size) > Int($1.size) })
        print("the sorted table has \(self.tableOfExpenses.count) items")
        
        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0].size
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0].size
            let m2 = sortedTableFromMaxToMin[1].size
            medianCost = (m1+m2)/2
        } else {
        
        
        if sortedTableFromMaxToMin.count % 2 == 0{
            let evenCount = sortedTableFromMaxToMin.count
            let medianIndex = evenCount/2
            let m1 = sortedTableFromMaxToMin[medianIndex - 1].size
            let m2 = sortedTableFromMaxToMin[medianIndex].size
            medianCost = (m1+m2)/2
        } else {
            let oddCount = sortedTableFromMaxToMin.count
            let medianIndex = oddCount/2
            medianCost = sortedTableFromMaxToMin[medianIndex].size
        }
        
      //  self.averageCost = medianCost
            
            
        }//if []
        self.averageCost = medianCost
    }
    
    
    func findTheMedianCostPerDay(){
        var medianCost = Double()
        
        self.arrayWithSumsofEachDay = []
        createArrayWithTheSumsOfEachDay()
        
        let sortedTableFromMaxToMin = self.arrayWithSumsofEachDay.sorted (by: {$0 > $1 })
       
        print("The sorted array is \(sortedTableFromMaxToMin)")
        //let sortedTableFromMaxToMin = self.arrayWithSumsofEachPeriod.sorted (by: {Int($0.size!) > Int($1.size!) })
        


        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0]
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0]
            let m2 = sortedTableFromMaxToMin[1]
            medianCost = (m1+m2)/2
        } else {
            
            if sortedTableFromMaxToMin.count % 2 == 0{
                let evenCount = sortedTableFromMaxToMin.count
                let medianIndex = evenCount/2
                let m1 = sortedTableFromMaxToMin[medianIndex - 1]
                let m2 = sortedTableFromMaxToMin[medianIndex]
                medianCost = (m1 + m2)/2
            } else {
                let oddCount = sortedTableFromMaxToMin.count
                let medianIndex = oddCount/2
                medianCost = sortedTableFromMaxToMin[medianIndex]
            }
            
           // self.averageCost = medianCost
            
            
        }//if []
        self.averageCost = medianCost

    }
    
    
    
    
    func findTheMedianCostPerYear(){
        var medianCost = Double()
        
        self.arrayWithSumsofEachYear = []
        createArrayWithTheSumsOfEachYear()
        
        let sortedTableFromMaxToMin = self.arrayWithSumsofEachYear.sorted (by: {$0 > $1 })
        
        print("The sorted array is \(sortedTableFromMaxToMin)")
        //let sortedTableFromMaxToMin = self.arrayWithSumsofEachPeriod.sorted (by: {Int($0.size!) > Int($1.size!) })
        
        

        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0]
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0]
            let m2 = sortedTableFromMaxToMin[1]
            medianCost = (m1+m2)/2
        } else {
            
            if sortedTableFromMaxToMin.count % 2 == 0{
                let evenCount = sortedTableFromMaxToMin.count
                let medianIndex = evenCount/2
                let m1 = sortedTableFromMaxToMin[medianIndex - 1]
                let m2 = sortedTableFromMaxToMin[medianIndex]
                medianCost = (m1 + m2)/2
            } else {
                let oddCount = sortedTableFromMaxToMin.count
                let medianIndex = oddCount/2
                medianCost = sortedTableFromMaxToMin[medianIndex]
            }
            
            // self.averageCost = medianCost
            
            
        }//if []
        self.averageCost = medianCost
        
    }
    
    func findTheMedianCostPerMonth(){
        var medianCost = Double()
        
        self.arrayWithSumsofEachMonth = []
        createArrayWithTheSumsOfEachMonth()
        
        let sortedTableFromMaxToMin = self.arrayWithSumsofEachMonth.sorted (by: {$0 > $1 })
        
        print("The sorted array is \(sortedTableFromMaxToMin)")
        //let sortedTableFromMaxToMin = self.arrayWithSumsofEachPeriod.sorted (by: {Int($0.size!) > Int($1.size!) })
        
        
        
        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0]
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0]
            let m2 = sortedTableFromMaxToMin[1]
            medianCost = (m1+m2)/2
        } else {
            
            if sortedTableFromMaxToMin.count % 2 == 0{
                let evenCount = sortedTableFromMaxToMin.count
                let medianIndex = evenCount/2
                let m1 = sortedTableFromMaxToMin[medianIndex - 1]
                let m2 = sortedTableFromMaxToMin[medianIndex]
                medianCost = (m1 + m2)/2
            } else {
                let oddCount = sortedTableFromMaxToMin.count
                let medianIndex = oddCount/2
                medianCost = sortedTableFromMaxToMin[medianIndex]
            }
            
            // self.averageCost = medianCost
            
            
        }//if []
        self.averageCost = medianCost
        
    }
    
    func findTheMedianCostPerWeek(){
        var medianCost = Double()
        
        self.arrayWithSumsofEachWeek = []
        createArrayWithTheSumsOfEachWeek()
        
        let sortedTableFromMaxToMin = self.arrayWithSumsofEachWeek.sorted (by: {$0 > $1 })
        
        print("The sorted array is \(sortedTableFromMaxToMin)")
        //let sortedTableFromMaxToMin = self.arrayWithSumsofEachPeriod.sorted (by: {Int($0.size!) > Int($1.size!) })
        
        
        
        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0]
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0]
            let m2 = sortedTableFromMaxToMin[1]
            medianCost = (m1+m2)/2
        } else {
            
            if sortedTableFromMaxToMin.count % 2 == 0{
                let evenCount = sortedTableFromMaxToMin.count
                let medianIndex = evenCount/2
                let m1 = sortedTableFromMaxToMin[medianIndex - 1]
                let m2 = sortedTableFromMaxToMin[medianIndex]
                medianCost = (m1 + m2)/2
            } else {
                let oddCount = sortedTableFromMaxToMin.count
                let medianIndex = oddCount/2
                medianCost = sortedTableFromMaxToMin[medianIndex]
            }
            
            // self.averageCost = medianCost
            
            
        }//if []
        self.averageCost = medianCost
        
    }
    
    
    
    //MARK: Median Cost For A
    
    
    func findTheMedianCostForA(){
        var medianCost = Double()
        
        let tableWithCategoryA = self.tableOfExpenses.filter {$0.kind == "Acost"}
        let sortedTableFromMaxToMin = tableWithCategoryA.sorted (by: {Int($0.size) > Int($1.size) })
        
        
        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0].size
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0].size
            let m2 = sortedTableFromMaxToMin[1].size
            medianCost = (m1+m2)/2
        } else {
        
        
        //let sortedTableFromMaxToMin = tableWithCategoryA.sorted (by: {Int($0.size!) > Int($1.size!) })
        if sortedTableFromMaxToMin.count % 2 == 0{
            let evenCount = sortedTableFromMaxToMin.count
            let medianIndex = evenCount/2
            let m1 = sortedTableFromMaxToMin[medianIndex - 1].size
            let m2 = sortedTableFromMaxToMin[medianIndex].size
            medianCost = (m1+m2)/2
        } else {
            let oddCount = sortedTableFromMaxToMin.count
            let medianIndex = oddCount/2
            medianCost = sortedTableFromMaxToMin[medianIndex].size
        }
        
       // self.averageCostForA = medianCost
         }//if []
         self.averageCostForA = medianCost
    }
    
    
    
    
    func findTheMedianCostPerDayForA(){
        var medianCost = Double()
        
        self.arrayWithSumsofEachDay = []
        createArrayWithTheSumsOfEachDayForA()
        
        let sortedTableFromMaxToMin = self.arrayWithSumsofEachDay.sorted (by: {$0 > $1 })
        
        print("The sorted array is \(sortedTableFromMaxToMin)")
        //let sortedTableFromMaxToMin = self.arrayWithSumsofEachPeriod.sorted (by: {Int($0.size!) > Int($1.size!) })
        
        
        
        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0]
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0]
            let m2 = sortedTableFromMaxToMin[1]
            medianCost = (m1+m2)/2
        } else {
            
            if sortedTableFromMaxToMin.count % 2 == 0{
                let evenCount = sortedTableFromMaxToMin.count
                let medianIndex = evenCount/2
                let m1 = sortedTableFromMaxToMin[medianIndex - 1]
                let m2 = sortedTableFromMaxToMin[medianIndex]
                medianCost = (m1 + m2)/2
            } else {
                let oddCount = sortedTableFromMaxToMin.count
                let medianIndex = oddCount/2
                medianCost = sortedTableFromMaxToMin[medianIndex]
            }
            
          //  self.averageCostForA = medianCost
            
            
        }//if []
          self.averageCostForA = medianCost
    }
    
    
    
    func findTheMedianCostPerYearForA(){
        var medianCost = Double()
        
        self.arrayWithSumsofEachYear = []
        createArrayWithTheSumsOfEachYearForA()
        
        let sortedTableFromMaxToMin = self.arrayWithSumsofEachYear.sorted (by: {$0 > $1 })
        
        print("The sorted array is \(sortedTableFromMaxToMin)")
        //let sortedTableFromMaxToMin = self.arrayWithSumsofEachPeriod.sorted (by: {Int($0.size!) > Int($1.size!) })
        
        
        
        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0]
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0]
            let m2 = sortedTableFromMaxToMin[1]
            medianCost = (m1+m2)/2
        } else {
            
            if sortedTableFromMaxToMin.count % 2 == 0{
                let evenCount = sortedTableFromMaxToMin.count
                let medianIndex = evenCount/2
                let m1 = sortedTableFromMaxToMin[medianIndex - 1]
                let m2 = sortedTableFromMaxToMin[medianIndex]
                medianCost = (m1 + m2)/2
            } else {
                let oddCount = sortedTableFromMaxToMin.count
                let medianIndex = oddCount/2
                medianCost = sortedTableFromMaxToMin[medianIndex]
            }
            
            //  self.averageCostForA = medianCost
            
            
        }//if []
        self.averageCostForA = medianCost
    }
    
    func findTheMedianCostPerMonthForA(){
        var medianCost = Double()
        
        self.arrayWithSumsofEachMonth = []
        createArrayWithTheSumsOfEachMonthForA()
        
        let sortedTableFromMaxToMin = self.arrayWithSumsofEachYear.sorted (by: {$0 > $1 })
        
        print("The sorted array is \(sortedTableFromMaxToMin)")
        //let sortedTableFromMaxToMin = self.arrayWithSumsofEachPeriod.sorted (by: {Int($0.size!) > Int($1.size!) })
        
        
        
        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0]
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0]
            let m2 = sortedTableFromMaxToMin[1]
            medianCost = (m1+m2)/2
        } else {
            
            if sortedTableFromMaxToMin.count % 2 == 0{
                let evenCount = sortedTableFromMaxToMin.count
                let medianIndex = evenCount/2
                let m1 = sortedTableFromMaxToMin[medianIndex - 1]
                let m2 = sortedTableFromMaxToMin[medianIndex]
                medianCost = (m1 + m2)/2
            } else {
                let oddCount = sortedTableFromMaxToMin.count
                let medianIndex = oddCount/2
                medianCost = sortedTableFromMaxToMin[medianIndex]
            }
            
            //  self.averageCostForA = medianCost
            
            
        }//if []
        self.averageCostForA = medianCost
    }
    
    
    
    func findTheMedianCostPerWeekForA(){
        var medianCost = Double()
        
        self.arrayWithSumsofEachWeek = []
        createArrayWithTheSumsOfEachWeekForA()
        
        let sortedTableFromMaxToMin = self.arrayWithSumsofEachWeek.sorted (by: {$0 > $1 })
        
        print("The sorted array is \(sortedTableFromMaxToMin)")
        //let sortedTableFromMaxToMin = self.arrayWithSumsofEachPeriod.sorted (by: {Int($0.size!) > Int($1.size!) })
        
        
        
        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0]
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0]
            let m2 = sortedTableFromMaxToMin[1]
            medianCost = (m1+m2)/2
        } else {
            
            if sortedTableFromMaxToMin.count % 2 == 0{
                let evenCount = sortedTableFromMaxToMin.count
                let medianIndex = evenCount/2
                let m1 = sortedTableFromMaxToMin[medianIndex - 1]
                let m2 = sortedTableFromMaxToMin[medianIndex]
                medianCost = (m1 + m2)/2
            } else {
                let oddCount = sortedTableFromMaxToMin.count
                let medianIndex = oddCount/2
                medianCost = sortedTableFromMaxToMin[medianIndex]
            }
            
            //  self.averageCostForA = medianCost
            
            
        }//if []
        self.averageCostForA = medianCost
    }
    
    
    
    
    
    
    
    
      //MARK: Median Cost For B
    func findTheMedianCostForB(){
        var medianCost = Double()
        
        let tableWithCategoryB = self.tableOfExpenses.filter {$0.kind == "Bcost"}
        let sortedTableFromMaxToMin = tableWithCategoryB.sorted (by: {Int($0.size) > Int($1.size) })
        print("tableB: \(sortedTableFromMaxToMin)")
        
        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0].size
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0].size
            
            let m2 = sortedTableFromMaxToMin[1].size
          
            medianCost = (m1+m2)/2
            print(medianCost)
        } else {
            
            let sortedTableFromMaxToMin = tableWithCategoryB.sorted (by: {Int($0.size) > Int($1.size) })
        if sortedTableFromMaxToMin.count % 2 == 0{
            let evenCount = sortedTableFromMaxToMin.count
            let medianIndex = evenCount/2
            let m1 = sortedTableFromMaxToMin[medianIndex - 1].size
            let m2 = sortedTableFromMaxToMin[medianIndex].size
            medianCost = (m1+m2)/2
        } else {
            let oddCount = sortedTableFromMaxToMin.count
            let medianIndex = oddCount/2
            medianCost = sortedTableFromMaxToMin[medianIndex].size
        }
        
       // self.averageCostForB = medianCost
        }//if []
        self.averageCostForB = medianCost
    }
    
    func findTheMedianCostPerDayForB(){
        var medianCost = Double()
        
        self.arrayWithSumsofEachDay = []
        createArrayWithTheSumsOfEachDayForB()
        
        let sortedTableFromMaxToMin = self.arrayWithSumsofEachDay.sorted (by: {$0 > $1 })
        
        print("The sorted array is \(sortedTableFromMaxToMin)")
        //let sortedTableFromMaxToMin = self.arrayWithSumsofEachPeriod.sorted (by: {Int($0.size!) > Int($1.size!) })
        
        
        
        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0]
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0]
            let m2 = sortedTableFromMaxToMin[1]
            medianCost = (m1+m2)/2
        } else {
            
            if sortedTableFromMaxToMin.count % 2 == 0{
                let evenCount = sortedTableFromMaxToMin.count
                let medianIndex = evenCount/2
                let m1 = sortedTableFromMaxToMin[medianIndex - 1]
                let m2 = sortedTableFromMaxToMin[medianIndex]
                medianCost = (m1 + m2)/2
            } else {
                let oddCount = sortedTableFromMaxToMin.count
                let medianIndex = oddCount/2
                medianCost = sortedTableFromMaxToMin[medianIndex]
            }
            
          //  self.averageCostForB = medianCost
            
            
        }//if []
         self.averageCostForB = medianCost
    }
    
    
    func findTheMedianCostPerYearForB(){
        var medianCost = Double()
        
        self.arrayWithSumsofEachYear = []
        createArrayWithTheSumsOfEachYearForB()
        
        let sortedTableFromMaxToMin = self.arrayWithSumsofEachYear.sorted (by: {$0 > $1 })
        
        print("The sorted array is \(sortedTableFromMaxToMin)")
        //let sortedTableFromMaxToMin = self.arrayWithSumsofEachPeriod.sorted (by: {Int($0.size!) > Int($1.size!) })
        
        
        
        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0]
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0]
            let m2 = sortedTableFromMaxToMin[1]
            medianCost = (m1+m2)/2
        } else {
            
            if sortedTableFromMaxToMin.count % 2 == 0{
                let evenCount = sortedTableFromMaxToMin.count
                let medianIndex = evenCount/2
                let m1 = sortedTableFromMaxToMin[medianIndex - 1]
                let m2 = sortedTableFromMaxToMin[medianIndex]
                medianCost = (m1 + m2)/2
            } else {
                let oddCount = sortedTableFromMaxToMin.count
                let medianIndex = oddCount/2
                medianCost = sortedTableFromMaxToMin[medianIndex]
            }
            
            //  self.averageCostForA = medianCost
            
            
        }//if []
        self.averageCostForA = medianCost
    }
    
    
    func findTheMedianCostPerMonthForB(){
        var medianCost = Double()
        
        self.arrayWithSumsofEachMonth = []
        createArrayWithTheSumsOfEachMonthForB()
        
        let sortedTableFromMaxToMin = self.arrayWithSumsofEachYear.sorted (by: {$0 > $1 })
        
        print("The sorted array is \(sortedTableFromMaxToMin)")
        //let sortedTableFromMaxToMin = self.arrayWithSumsofEachPeriod.sorted (by: {Int($0.size!) > Int($1.size!) })
        
        
        
        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0]
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0]
            let m2 = sortedTableFromMaxToMin[1]
            medianCost = (m1+m2)/2
        } else {
            
            if sortedTableFromMaxToMin.count % 2 == 0{
                let evenCount = sortedTableFromMaxToMin.count
                let medianIndex = evenCount/2
                let m1 = sortedTableFromMaxToMin[medianIndex - 1]
                let m2 = sortedTableFromMaxToMin[medianIndex]
                medianCost = (m1 + m2)/2
            } else {
                let oddCount = sortedTableFromMaxToMin.count
                let medianIndex = oddCount/2
                medianCost = sortedTableFromMaxToMin[medianIndex]
            }
            
            //  self.averageCostForA = medianCost
            
            
        }//if []
        self.averageCostForA = medianCost
    }
    
    
    func findTheMedianCostPerWeekForB(){
        var medianCost = Double()
        
        self.arrayWithSumsofEachWeek = []
        createArrayWithTheSumsOfEachWeekForB()
        
        let sortedTableFromMaxToMin = self.arrayWithSumsofEachWeek.sorted (by: {$0 > $1 })
        
        print("The sorted array is \(sortedTableFromMaxToMin)")
        //let sortedTableFromMaxToMin = self.arrayWithSumsofEachPeriod.sorted (by: {Int($0.size!) > Int($1.size!) })
        
        
        
        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0]
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0]
            let m2 = sortedTableFromMaxToMin[1]
            medianCost = (m1+m2)/2
        } else {
            
            if sortedTableFromMaxToMin.count % 2 == 0{
                let evenCount = sortedTableFromMaxToMin.count
                let medianIndex = evenCount/2
                let m1 = sortedTableFromMaxToMin[medianIndex - 1]
                let m2 = sortedTableFromMaxToMin[medianIndex]
                medianCost = (m1 + m2)/2
            } else {
                let oddCount = sortedTableFromMaxToMin.count
                let medianIndex = oddCount/2
                medianCost = sortedTableFromMaxToMin[medianIndex]
            }
            
            //  self.averageCostForA = medianCost
            
            
        }//if []
        self.averageCostForA = medianCost
    }
    
    
    
    
    
    
    
    
    
      //MARK: Median Cost For C
    func findTheMedianCostForC(){
        var medianCost = Double()
        
        let tableWithCategoryC = self.tableOfExpenses.filter {$0.kind == "Ccost"}
        let sortedTableFromMaxToMin = tableWithCategoryC.sorted (by: {Int($0.size) > Int($1.size) })
        
        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0].size
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0].size
            let m2 = sortedTableFromMaxToMin[1].size
            medianCost = (m1+m2)/2
        } else {
            
        
       // let sortedTableFromMaxToMin = tableWithCategoryC.sorted (by: {Int($0.size!) > Int($1.size!) })
        if sortedTableFromMaxToMin.count % 2 == 0{
            let evenCount = sortedTableFromMaxToMin.count
            let medianIndex = evenCount/2
            let m1 = sortedTableFromMaxToMin[medianIndex - 1].size
            let m2 = sortedTableFromMaxToMin[medianIndex].size
            medianCost = (m1+m2)/2
        } else {
            let oddCount = sortedTableFromMaxToMin.count
            let medianIndex = oddCount/2
            medianCost = sortedTableFromMaxToMin[medianIndex].size
        }
        
       // self.averageCostForC = medianCost
        }//if []
        self.averageCostForC = medianCost
    }
    
    
    func findTheMedianCostPerDayForC(){
        var medianCost = Double()
        
         self.arrayWithSumsofEachDay = []
        createArrayWithTheSumsOfEachDayForC()
        
        let sortedTableFromMaxToMin = self.arrayWithSumsofEachDay.sorted (by: {$0 > $1 })
        
        print("The sorted array is \(sortedTableFromMaxToMin)")
        //let sortedTableFromMaxToMin = self.arrayWithSumsofEachPeriod.sorted (by: {Int($0.size!) > Int($1.size!) })
        
        
        
        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0]
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0]
            let m2 = sortedTableFromMaxToMin[1]
            medianCost = (m1+m2)/2
        } else {
            
            if sortedTableFromMaxToMin.count % 2 == 0{
                let evenCount = sortedTableFromMaxToMin.count
                let medianIndex = evenCount/2
                let m1 = sortedTableFromMaxToMin[medianIndex - 1]
                let m2 = sortedTableFromMaxToMin[medianIndex]
                medianCost = (m1 + m2)/2
            } else {
                let oddCount = sortedTableFromMaxToMin.count
                let medianIndex = oddCount/2
                medianCost = sortedTableFromMaxToMin[medianIndex]
            }
            
            //self.averageCostForC = medianCost
            
            
        }//if []
         self.averageCostForC = medianCost
    }
    
    
    
    
    
    func findTheMedianCostPerYearForC(){
        var medianCost = Double()
        
        self.arrayWithSumsofEachYear = []
        createArrayWithTheSumsOfEachYearForC()
        
        let sortedTableFromMaxToMin = self.arrayWithSumsofEachYear.sorted (by: {$0 > $1 })
        
        print("The sorted array is \(sortedTableFromMaxToMin)")
        //let sortedTableFromMaxToMin = self.arrayWithSumsofEachPeriod.sorted (by: {Int($0.size!) > Int($1.size!) })
        
        
        
        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0]
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0]
            let m2 = sortedTableFromMaxToMin[1]
            medianCost = (m1+m2)/2
        } else {
            
            if sortedTableFromMaxToMin.count % 2 == 0{
                let evenCount = sortedTableFromMaxToMin.count
                let medianIndex = evenCount/2
                let m1 = sortedTableFromMaxToMin[medianIndex - 1]
                let m2 = sortedTableFromMaxToMin[medianIndex]
                medianCost = (m1 + m2)/2
            } else {
                let oddCount = sortedTableFromMaxToMin.count
                let medianIndex = oddCount/2
                medianCost = sortedTableFromMaxToMin[medianIndex]
            }
            
            //  self.averageCostForA = medianCost
            
            
        }//if []
        self.averageCostForA = medianCost
    }
    
    
    func findTheMedianCostPerMonthForC(){
        var medianCost = Double()
        
        self.arrayWithSumsofEachMonth = []
        createArrayWithTheSumsOfEachMonthForC()
        
        let sortedTableFromMaxToMin = self.arrayWithSumsofEachYear.sorted (by: {$0 > $1 })
        
        print("The sorted array is \(sortedTableFromMaxToMin)")
        //let sortedTableFromMaxToMin = self.arrayWithSumsofEachPeriod.sorted (by: {Int($0.size!) > Int($1.size!) })
        
        
        
        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0]
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0]
            let m2 = sortedTableFromMaxToMin[1]
            medianCost = (m1+m2)/2
        } else {
            
            if sortedTableFromMaxToMin.count % 2 == 0{
                let evenCount = sortedTableFromMaxToMin.count
                let medianIndex = evenCount/2
                let m1 = sortedTableFromMaxToMin[medianIndex - 1]
                let m2 = sortedTableFromMaxToMin[medianIndex]
                medianCost = (m1 + m2)/2
            } else {
                let oddCount = sortedTableFromMaxToMin.count
                let medianIndex = oddCount/2
                medianCost = sortedTableFromMaxToMin[medianIndex]
            }
            
            //  self.averageCostForA = medianCost
            
            
        }//if []
        self.averageCostForA = medianCost
    }
    
    func findTheMedianCostPerWeekForC(){
        var medianCost = Double()
        
        self.arrayWithSumsofEachWeek = []
        createArrayWithTheSumsOfEachWeekForC()
        
        let sortedTableFromMaxToMin = self.arrayWithSumsofEachWeek.sorted (by: {$0 > $1 })
        
        print("The sorted array is \(sortedTableFromMaxToMin)")
        //let sortedTableFromMaxToMin = self.arrayWithSumsofEachPeriod.sorted (by: {Int($0.size!) > Int($1.size!) })
        
        
        
        if sortedTableFromMaxToMin == [] {
            
        } else if sortedTableFromMaxToMin.count == 1 {
            medianCost = sortedTableFromMaxToMin[0]
            
        } else if sortedTableFromMaxToMin.count == 2 {
            let m1 = sortedTableFromMaxToMin[0]
            let m2 = sortedTableFromMaxToMin[1]
            medianCost = (m1+m2)/2
        } else {
            
            if sortedTableFromMaxToMin.count % 2 == 0{
                let evenCount = sortedTableFromMaxToMin.count
                let medianIndex = evenCount/2
                let m1 = sortedTableFromMaxToMin[medianIndex - 1]
                let m2 = sortedTableFromMaxToMin[medianIndex]
                medianCost = (m1 + m2)/2
            } else {
                let oddCount = sortedTableFromMaxToMin.count
                let medianIndex = oddCount/2
                medianCost = sortedTableFromMaxToMin[medianIndex]
            }
            
            //  self.averageCostForA = medianCost
            
            
        }//if []
        self.averageCostForA = medianCost
    }
    
    
    
    
    
    
    
    
    //MARK: Create The Foundamental Arrays
    
    func createArrayWithTheSumsOfEachDay(){
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: self.tableOfExpenses, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        //create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
      
   
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        //and i will put this sum in a new array
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count  {
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        //I have the array but now I will add zero cost for each day i spent nothing
       
        //calculate how many days had Zero expenses to use them in the median calculation
        calculateDateDifferenceInDays()
         print("Day Dofference\(self.dateDifferenceInDays)")
        print("Days with Costs:\(arrayOfArraysWithSameDayCosts.count)")
        let numberOfZeroDays = self.dateDifferenceInDays - arrayOfArraysWithSameDayCosts.count
        
        
        if numberOfZeroDays > 0 {
        
        for _ in 0..<numberOfZeroDays {
            self.arrayWithSumsofEachDay.append(0)
        }
            
        }
        
        print("the zero days are: \(numberOfZeroDays)")
        print("the Array UFO with the sums is \(self.arrayWithSumsofEachDay)")
    }
    
    
    
    func createArrayWithTheSumsOfEachDayForA(){
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        let filteredTableForA = self.tableOfExpenses.filter {$0.kind == "Acost"}
       
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: filteredTableForA, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        //create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
        
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count{
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        //I have the array but now I will add zero cost for each day i spent nothing
        
        //calculate how many days had Zero expenses to use them in the median calculation
        calculateDateDifferenceInDays()
        print("Day Dofference\(self.dateDifferenceInDays)")
        let numberOfZeroDays = self.dateDifferenceInDays - arrayOfArraysWithSameDayCosts.count
        
        if numberOfZeroDays > 0 {
        for _ in 0..<numberOfZeroDays {
            self.arrayWithSumsofEachDay.append(0)
            
        }
        
        }
        
        
        
        print("the ArrayA UFO with the sums is \(self.arrayWithSumsofEachDay)")
    }
    
    func createArrayWithTheSumsOfEachDayForB(){
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        let filteredTableForB = self.tableOfExpenses.filter {$0.kind == "Bcost"}
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: filteredTableForB, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        //create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count {
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        //I have the array but now I will add zero cost for each day i spent nothing
        
        //calculate how many days had Zero expenses to use them in the median calculation
        calculateDateDifferenceInDays()
        let numberOfZeroDays = self.dateDifferenceInDays - arrayOfArraysWithSameDayCosts.count
        
         if numberOfZeroDays > 0 {
        for _ in 0..<numberOfZeroDays {
            self.arrayWithSumsofEachDay.append(0)
            
        }
        
        }
        print("the ArrayB UFO with the sums is \(self.arrayWithSumsofEachDay)")
    }
    
    
    
    func createArrayWithTheSumsOfEachDayForC(){
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        let filteredTableForC = self.tableOfExpenses.filter {$0.kind == "Ccost"}
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: filteredTableForC, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        //create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
        
      
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count{
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        
        
        //I have the array but now I will add zero cost for each day i spent nothing
        
        //calculate how many days had Zero expenses to use them in the median calculation
        calculateDateDifferenceInDays()
        let numberOfZeroDays = self.dateDifferenceInDays - arrayOfArraysWithSameDayCosts.count
         if numberOfZeroDays > 0 {
        for _ in 0..<numberOfZeroDays {
            self.arrayWithSumsofEachDay.append(0)
            
        }
        
        }
        
        
        print("the ArrayC UFO with the sums is \(self.arrayWithSumsofEachDay)")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func createArrayWithTheSumsOfEachYear() {
        
        
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: self.tableOfExpenses, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        
        //Now I have to change the keys according to week
        //first I export the keys to a new array
        let arrayOfDateKeys = [Date](dictionaryOfDatedCosts.keys)
        
        
        print("the array of keys\(arrayOfDateKeys)")
        
        
        //the array where I will store the
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        
        for dateOfKey in arrayOfDateKeys {
            
           
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            let weekday = calendar.component(.weekday, from: date)
            
            
            print("\(year)")
            print("\(month)")
            print("\(day)")
            print("\(week)")
             print("\(weekday)")
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
            //arrayOfSize.append(e.size!)
           // arrayOfDateOfCost.append(e.date)
            
            
            
        }
        
        
        //πρέπει να αρθροίσω κάθε πίνακα ξεχωριστά
        //create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
       // let tupleArray = zip(arrayOfArraysWithSameDayCosts, arrayOfYears)
        // print("the tuple array\(tupleArray)")
        
        //var dictionaryOfTupleForYear: [Int: [OneExpense]] = [:]
        
       // dictionaryOfTupleForYear = Dictionary(grouping: tupleArray, by: {})
        
        
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        //and i will put this sum in a new array
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count  {
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        
        var arrayTupleYearSum = [(Int(), Double())]
        
        if self.arrayWithSumsofEachDay.count == 0 {
            
        } else {
        
        for i in 0...arrayWithSumsofEachDay.count - 1 {
            let tupleValue = (arrayOfYears[i], self.arrayWithSumsofEachDay[i])
           arrayTupleYearSum.append(tupleValue)
        
        }
        
        }//count
        
        
        
        
      //  var arrayTupleYearSum = Zip2Sequence(sequence1: arrayOfYears, sequence2: self.arrayWithSumsofEachDay)
        
        
        var dictionaryOfYearlySums: Dictionary<Int, Double> = [:]
        for tupleYear in arrayTupleYearSum  {
            dictionaryOfYearlySums[tupleYear.0] = (dictionaryOfYearlySums[tupleYear.0] ?? 0) + tupleYear.1
        }
        
        print("the DADA Dictionary \(dictionaryOfYearlySums)")
        
        //and this is the ARRAY with SUMS of each year
        let arrayOfEachYearsSum = [Double](dictionaryOfYearlySums.values)
        print("the DADA ARRAY \(arrayOfEachYearsSum)")
        
        self.arrayWithSumsofEachYear = arrayOfEachYearsSum
        
        //I have the array but now I will add zero cost for each year i spent nothing
        
        //calculate how many years had Zero expenses to use them in the median calculation
        calculateDateDifferenceInYears()
        print("Year Difference\(self.dateDifferenceInYears)")
        print("Years with Costs:\(arrayOfEachYearsSum.count)")
        let numberOfZeroYears = self.dateDifferenceInYears - arrayOfEachYearsSum.count
        
        
        if numberOfZeroYears > 0 {
            
            for _ in 0..<numberOfZeroYears {
                self.arrayWithSumsofEachYear.append(0)
            }
            
        }
        
        print("the zero years are: \(numberOfZeroYears)")
        print("the Array UFO with the sums is \(self.arrayWithSumsofEachYear)")
    }
    
    
    
    
    
    
    func createArrayWithTheSumsOfEachYearForA() {
        
        
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        let filteredTableForA = self.tableOfExpenses.filter {$0.kind == "Acost"}
        
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: filteredTableForA, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        
        //Now I have to change the keys according to week
        //first I export the keys to a new array
        let arrayOfDateKeys = [Date](dictionaryOfDatedCosts.keys)
        
        
        print("the array of keys\(arrayOfDateKeys)")
        
        
        //the array where I will store the
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        
        for dateOfKey in arrayOfDateKeys {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            let weekday = calendar.component(.weekday, from: date)
            
            
            print("\(year)")
            print("\(month)")
            print("\(day)")
            print("\(week)")
            print("\(weekday)")
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
            //arrayOfSize.append(e.size!)
            // arrayOfDateOfCost.append(e.date)
            
            
            
        }
        
        
        
        //create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
        // let tupleArray = zip(arrayOfArraysWithSameDayCosts, arrayOfYears)
        // print("the tuple array\(tupleArray)")
        
        //var dictionaryOfTupleForYear: [Int: [OneExpense]] = [:]
        
        // dictionaryOfTupleForYear = Dictionary(grouping: tupleArray, by: {})
        
        
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        //and i will put this sum in a new array
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count  {
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        //----------------------------------Migration Solution
        var arrayTupleYearSum = [(Int(), Double())]
        
        if self.arrayWithSumsofEachDay.count == 0{
            
        } else {
        for i in 0...arrayWithSumsofEachDay.count - 1 {
            let tupleValue = (arrayOfYears[i], self.arrayWithSumsofEachDay[i])
            arrayTupleYearSum.append(tupleValue)
            
        }
        }//count
         //----------------------------------Migration Solution
        
        
        
        
        
        
        
        
        
     //   let arrayTupleYearSum = Zip2Sequence(_sequence1: arrayOfYears, _sequence2: self.arrayWithSumsofEachDay)
        
        
        var dictionaryOfYearlySums: Dictionary<Int, Double> = [:]
        for tupleYear in arrayTupleYearSum  {
            dictionaryOfYearlySums[tupleYear.0] = (dictionaryOfYearlySums[tupleYear.0] ?? 0) + tupleYear.1
        }
        
        print("the DADA Dictionary \(dictionaryOfYearlySums)")
        
        //and this is the ARRAY with SUMS of each year
        let arrayOfEachYearsSum = [Double](dictionaryOfYearlySums.values)
        print("the DADA ARRAY \(arrayOfEachYearsSum)")
        
        self.arrayWithSumsofEachYear = arrayOfEachYearsSum
        
        //I have the array but now I will add zero cost for each year i spent nothing
        
        //calculate how many years had Zero expenses to use them in the median calculation
        calculateDateDifferenceInYears()
        print("Year Difference\(self.dateDifferenceInYears)")
        print("Years with Costs:\(arrayOfEachYearsSum.count)")
        let numberOfZeroYears = self.dateDifferenceInYears - arrayOfEachYearsSum.count
        
        
        if numberOfZeroYears > 0 {
            
            for _ in 0..<numberOfZeroYears {
                self.arrayWithSumsofEachYear.append(0)
            }
            
        }
        
        print("the zero years are: \(numberOfZeroYears)")
        print("the Array UFO with the sums is \(self.arrayWithSumsofEachYear)")
    }
    
    
    
    
    func createArrayWithTheSumsOfEachYearForB() {
        
        
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        let filteredTableForB = self.tableOfExpenses.filter {$0.kind == "Bcost"}
        
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: filteredTableForB, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        
        //Now I have to change the keys according to week
        //first I export the keys to a new array
        let arrayOfDateKeys = [Date](dictionaryOfDatedCosts.keys)
        
        
        print("the array of keys\(arrayOfDateKeys)")
        
        
        //the array where I will store the
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        
        for dateOfKey in arrayOfDateKeys {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            let weekday = calendar.component(.weekday, from: date)
            
            
            print("\(year)")
            print("\(month)")
            print("\(day)")
            print("\(week)")
            print("\(weekday)")
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
            //arrayOfSize.append(e.size!)
            // arrayOfDateOfCost.append(e.date)
            
            
            
        }
        
        
        
        //create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
        // let tupleArray = zip(arrayOfArraysWithSameDayCosts, arrayOfYears)
        // print("the tuple array\(tupleArray)")
        
        //var dictionaryOfTupleForYear: [Int: [OneExpense]] = [:]
        
        // dictionaryOfTupleForYear = Dictionary(grouping: tupleArray, by: {})
        
        
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        //and i will put this sum in a new array
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count  {
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
    
        //----------------------------------Migration Solution
        var arrayTupleYearSum = [(Int(), Double())]
        if self.arrayWithSumsofEachDay.count == 0 {
            
        } else {
        
        for i in 0...arrayWithSumsofEachDay.count - 1 {
            let tupleValue = (arrayOfYears[i], self.arrayWithSumsofEachDay[i])
            arrayTupleYearSum.append(tupleValue)
            
        }
        }
        //----------------------------------Migration Solution
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        //let arrayTupleYearSum = Zip2Sequence(_sequence1: Double(arrayOfYears), _sequence2: self.arrayWithSumsofEachDay)
        
        
        var dictionaryOfYearlySums: Dictionary<Int, Double> = [:]
        for tupleYear in arrayTupleYearSum  {
            dictionaryOfYearlySums[tupleYear.0] = (dictionaryOfYearlySums[tupleYear.0] ?? 0) + tupleYear.1
        }
        
        print("the DADA Dictionary \(dictionaryOfYearlySums)")
        
        //and this is the ARRAY with SUMS of each year
        let arrayOfEachYearsSum = [Double](dictionaryOfYearlySums.values)
        print("the DADA ARRAY \(arrayOfEachYearsSum)")
        
        self.arrayWithSumsofEachYear = arrayOfEachYearsSum
        
        //I have the array but now I will add zero cost for each year i spent nothing
        
        //calculate how many years had Zero expenses to use them in the median calculation
        calculateDateDifferenceInYears()
        print("Year Difference\(self.dateDifferenceInYears)")
        print("Years with Costs:\(arrayOfEachYearsSum.count)")
        let numberOfZeroYears = self.dateDifferenceInYears - arrayOfEachYearsSum.count
        
        
        if numberOfZeroYears > 0 {
            
            for _ in 0..<numberOfZeroYears {
                self.arrayWithSumsofEachYear.append(0)
            }
            
        }
        
        print("the zero years are: \(numberOfZeroYears)")
        print("the Array UFO with the sums is \(self.arrayWithSumsofEachYear)")
    }
    
    
    
    
    func createArrayWithTheSumsOfEachYearForC() {
        
        
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        let filteredTableForC = self.tableOfExpenses.filter {$0.kind == "Ccost"}
        
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: filteredTableForC, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        
        //Now I have to change the keys according to week
        //first I export the keys to a new array
        let arrayOfDateKeys = [Date](dictionaryOfDatedCosts.keys)
        
        
        print("the array of keys\(arrayOfDateKeys)")
        
        
        //the array where I will store the
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        
        for dateOfKey in arrayOfDateKeys {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            let weekday = calendar.component(.weekday, from: date)
            
            
            print("\(year)")
            print("\(month)")
            print("\(day)")
            print("\(week)")
            print("\(weekday)")
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
            //arrayOfSize.append(e.size!)
            // arrayOfDateOfCost.append(e.date)
            
            
            
        }
        
        
        
        //create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
        // let tupleArray = zip(arrayOfArraysWithSameDayCosts, arrayOfYears)
        // print("the tuple array\(tupleArray)")
        
        //var dictionaryOfTupleForYear: [Int: [OneExpense]] = [:]
        
        // dictionaryOfTupleForYear = Dictionary(grouping: tupleArray, by: {})
        
        
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        //and i will put this sum in a new array
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count  {
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        
        
        //----------------------------------Migration Solution
        var arrayTupleYearSum = [(Int(), Double())]
        
        if self.arrayWithSumsofEachDay.count == 0 {
            
        } else {
        for i in 0...arrayWithSumsofEachDay.count - 1 {
            let tupleValue = (arrayOfYears[i], self.arrayWithSumsofEachDay[i])
            arrayTupleYearSum.append(tupleValue)
            
        }
        }
        //----------------------------------Migration Solution
        
        
        
        
        
        
        
        
        
        
       // let arrayTupleYearSum = Zip2Sequence(_sequence1: arrayOfYears, _sequence2: self.arrayWithSumsofEachDay)
        
        
        var dictionaryOfYearlySums: Dictionary<Int, Double> = [:]
        for tupleYear in arrayTupleYearSum  {
            dictionaryOfYearlySums[tupleYear.0] = (dictionaryOfYearlySums[tupleYear.0] ?? 0) + tupleYear.1
        }
        
        print("the DADA Dictionary \(dictionaryOfYearlySums)")
        
        //and this is the ARRAY with SUMS of each year
        let arrayOfEachYearsSum = [Double](dictionaryOfYearlySums.values)
        print("the DADA ARRAY \(arrayOfEachYearsSum)")
        
        self.arrayWithSumsofEachYear = arrayOfEachYearsSum
        
        //I have the array but now I will add zero cost for each year i spent nothing
        
        //calculate how many years had Zero expenses to use them in the median calculation
        calculateDateDifferenceInYears()
        print("Year Difference\(self.dateDifferenceInYears)")
        print("Years with Costs:\(arrayOfEachYearsSum.count)")
        let numberOfZeroYears = self.dateDifferenceInYears - arrayOfEachYearsSum.count
        
        
        if numberOfZeroYears > 0 {
            
            for _ in 0..<numberOfZeroYears {
                self.arrayWithSumsofEachYear.append(0)
            }
            
        }
        
        print("the zero years are: \(numberOfZeroYears)")
        print("the Array UFO with the sums is \(self.arrayWithSumsofEachYear)")
    }
    
    
    
    
    
    
    func createArrayWithTheSumsOfEachMonth() {
        
        
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: self.tableOfExpenses, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        
        
        //first I export the keys to a new array
        let arrayOfDateKeys = [Date](dictionaryOfDatedCosts.keys)
        
        
        print("the array of keys\(arrayOfDateKeys)")
        
        
        //the array where I will store the values of months years days
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        
        for dateOfKey in arrayOfDateKeys {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            let weekday = calendar.component(.weekday, from: date)
            
            
            print("\(year)")
            print("\(month)")
            print("\(day)")
            print("\(week)")
            print("\(weekday)")
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
            //arrayOfSize.append(e.size!)
            // arrayOfDateOfCost.append(e.date)
            
            
            
        }
        
        //1st)create array eith year and month merged
       // let arrayYearMonth = map(Zip2(arrayOfYears, arrayOfMonths)) { $0 + " " + $1 }
        
        var arrayYearMonth: [String] = []
        
        for index in 0..<arrayOfYears.count {
            arrayYearMonth.append(String(arrayOfYears[index]) + "-" + String(arrayOfMonths[index]))
        }
        print("YEARMONTHEFFECT\(arrayYearMonth)")
        
        
        //2nd)create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
        // let tupleArray = zip(arrayOfArraysWithSameDayCosts, arrayOfYears)
        // print("the tuple array\(tupleArray)")
        
        //var dictionaryOfTupleForYear: [Int: [OneExpense]] = [:]
        
        // dictionaryOfTupleForYear = Dictionary(grouping: tupleArray, by: {})
        
        
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        //and i will put this sum in a new array
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count  {
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        var arrayTupleYearMonthSum = [(String(), Double())]
        
        if self.arrayWithSumsofEachDay.count == 0 {
            
        } else {
        for i in 0...arrayWithSumsofEachDay.count - 1 {
             let tupleValue = (arrayYearMonth[i], self.arrayWithSumsofEachDay[i])
                 arrayTupleYearMonthSum.append(tupleValue)
            
        }
        }//
        
        // arrayTupleYearMonthSum = [("1", 2),("1", 2) ]
        
        
        
        
        //The TUPLE with months And Sums
       // let arrayTupleYearMonthSum = Zip2Sequence(_sequence1: arrayYearMonth, _sequence2: self.arrayWithSumsofEachDay)
        
        
        
        
        var dictionaryOfPeriodSums: Dictionary<String, Double> = [:]
        for tupleYear in arrayTupleYearMonthSum  {
            dictionaryOfPeriodSums[tupleYear.0] = (dictionaryOfPeriodSums[tupleYear.0] ?? 0) + tupleYear.1
        }
        
        print("the DADA Dictionary \(dictionaryOfPeriodSums)")
        
        //and this is the ARRAY with SUMS of each year
        let arrayOfEachPeriodSum = [Double](dictionaryOfPeriodSums.values)
        print("the DADA ARRAY \(arrayOfEachPeriodSum)")
        
        self.arrayWithSumsofEachMonth = arrayOfEachPeriodSum
        
        //I have the array but now I will add zero cost for each year i spent nothing
        
        //calculate how many years had Zero expenses to use them in the median calculation
        calculateDateDifferenceInMonths()
        print("Months Difference\(self.dateDifferenceInMonths)")
        print("Months with Costs:\(arrayOfEachPeriodSum.count)")
        let numberOfZeroMonths = self.dateDifferenceInMonths - arrayOfEachPeriodSum.count
        
        
        if numberOfZeroMonths > 0 {
            
            for _ in 0..<numberOfZeroMonths {
                self.arrayWithSumsofEachMonth.append(0)
            }
            
        }
        
        print("the zero years are: \(numberOfZeroMonths)")
        print("the Array UFO with the sums is \(self.arrayWithSumsofEachMonth)")
    }
    
    
    
    func createArrayWithTheSumsOfEachMonthForA() {
        
        
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        
        let filteredTableForA = self.tableOfExpenses.filter {$0.kind == "Acost"}
        
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: filteredTableForA, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        
        
        //first I export the keys to a new array
        let arrayOfDateKeys = [Date](dictionaryOfDatedCosts.keys)
        
        
        print("the array of keys\(arrayOfDateKeys)")
        
        
        //the array where I will store the values of months years days
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        
        for dateOfKey in arrayOfDateKeys {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            let weekday = calendar.component(.weekday, from: date)
            
            
            print("\(year)")
            print("\(month)")
            print("\(day)")
            print("\(week)")
            print("\(weekday)")
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
            //arrayOfSize.append(e.size!)
            // arrayOfDateOfCost.append(e.date)
            
            
            
        }
        
        //1st)create array eith year and month merged
        // let arrayYearMonth = map(Zip2(arrayOfYears, arrayOfMonths)) { $0 + " " + $1 }
        
        var arrayYearMonth: [String] = []
        
        for index in 0..<arrayOfYears.count {
            arrayYearMonth.append(String(arrayOfYears[index]) + "-" + String(arrayOfMonths[index]))
        }
        print("YEARMONTHEFFECT\(arrayYearMonth)")
        
        
        //2nd)create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
        // let tupleArray = zip(arrayOfArraysWithSameDayCosts, arrayOfYears)
        // print("the tuple array\(tupleArray)")
        
        //var dictionaryOfTupleForYear: [Int: [OneExpense]] = [:]
        
        // dictionaryOfTupleForYear = Dictionary(grouping: tupleArray, by: {})
        
        
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        //and i will put this sum in a new array
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count  {
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        
        
        //----------------------------------Migration Solution
        var arrayTupleYearMonthSum = [(String(), Double())]
        
        if self.arrayWithSumsofEachDay.count == 0 {
            
        } else {
        for i in 0...arrayWithSumsofEachDay.count - 1 {
            let tupleValue = (arrayYearMonth[i], self.arrayWithSumsofEachDay[i])
            arrayTupleYearMonthSum.append(tupleValue)
            
        }
        }
        //----------------------------------Migration Solution
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        //The TUPLE with months And Sums
        //let arrayTupleYearMonthSum = Zip2Sequence(_sequence1: arrayYearMonth, _sequence2: self.arrayWithSumsofEachDay)
        
        
        var dictionaryOfPeriodSums: Dictionary<String, Double> = [:]
        for tupleYear in arrayTupleYearMonthSum  {
            dictionaryOfPeriodSums[tupleYear.0] = (dictionaryOfPeriodSums[tupleYear.0] ?? 0) + tupleYear.1
        }
        
        print("the DADA Dictionary \(dictionaryOfPeriodSums)")
        
        //and this is the ARRAY with SUMS of each year
        let arrayOfEachPeriodSum = [Double](dictionaryOfPeriodSums.values)
        print("the DADA ARRAY \(arrayOfEachPeriodSum)")
        
        self.arrayWithSumsofEachMonth = arrayOfEachPeriodSum
        
        //I have the array but now I will add zero cost for each year i spent nothing
        
        //calculate how many years had Zero expenses to use them in the median calculation
        calculateDateDifferenceInMonths()
        print("Months Difference\(self.dateDifferenceInMonths)")
        print("Months with Costs:\(arrayOfEachPeriodSum.count)")
        let numberOfZeroMonths = self.dateDifferenceInMonths - arrayOfEachPeriodSum.count
        
        
        if numberOfZeroMonths > 0 {
            
            for _ in 0..<numberOfZeroMonths {
                self.arrayWithSumsofEachMonth.append(0)
            }
            
        }
        
        print("the zero years are: \(numberOfZeroMonths)")
        print("the Array UFO with the sums is \(self.arrayWithSumsofEachMonth)")
    }
    
    
    
    
    
    func createArrayWithTheSumsOfEachMonthForB() {
        
        
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        
        let filteredTableForB = self.tableOfExpenses.filter {$0.kind == "Bcost"}
        
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: filteredTableForB, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        
        
        //first I export the keys to a new array
        let arrayOfDateKeys = [Date](dictionaryOfDatedCosts.keys)
        
        
        print("the array of keys\(arrayOfDateKeys)")
        
        
        //the array where I will store the values of months years days
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
       
        
        
        for dateOfKey in arrayOfDateKeys {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            let weekday = calendar.component(.weekday, from: date)
            
            
            print("\(year)")
            print("\(month)")
            print("\(day)")
            print("\(week)")
            print("\(weekday)")
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
            //arrayOfSize.append(e.size!)
            // arrayOfDateOfCost.append(e.date)
            
            
            
        }
        
        //1st)create array eith year and month merged
        // let arrayYearMonth = map(Zip2(arrayOfYears, arrayOfMonths)) { $0 + " " + $1 }
        
        var arrayYearMonth: [String] = []
        
        for index in 0..<arrayOfYears.count {
            arrayYearMonth.append(String(arrayOfYears[index]) + "-" + String(arrayOfMonths[index]))
        }
        print("YEARMONTHEFFECT\(arrayYearMonth)")
        
        
        //2nd)create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
        // let tupleArray = zip(arrayOfArraysWithSameDayCosts, arrayOfYears)
        // print("the tuple array\(tupleArray)")
        
        //var dictionaryOfTupleForYear: [Int: [OneExpense]] = [:]
        
        // dictionaryOfTupleForYear = Dictionary(grouping: tupleArray, by: {})
        
        
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        //and i will put this sum in a new array
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count  {
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        
        //----------------------------------Migration Solution
        var arrayTupleYearMonthSum = [(String(), Double())]
        
        if self.arrayWithSumsofEachDay.count <= 0 {
            
        } else {
        for i in 0...arrayWithSumsofEachDay.count - 1 {
            let tupleValue = (arrayYearMonth[i], self.arrayWithSumsofEachDay[i])
            arrayTupleYearMonthSum.append(tupleValue)
            
        }
        }
        //----------------------------------Migration Solution
        
        
        
        
        
        //The TUPLE with months And Sums
       // let arrayTupleYearMonthSum = Zip2Sequence(_sequence1: arrayYearMonth, _sequence2: self.arrayWithSumsofEachDay)
        
        
        var dictionaryOfPeriodSums: Dictionary<String, Double> = [:]
        for tupleYear in arrayTupleYearMonthSum  {
            dictionaryOfPeriodSums[tupleYear.0] = (dictionaryOfPeriodSums[tupleYear.0] ?? 0) + tupleYear.1
        }
        
        print("the DADA Dictionary \(dictionaryOfPeriodSums)")
        
        //and this is the ARRAY with SUMS of each year
        let arrayOfEachPeriodSum = [Double](dictionaryOfPeriodSums.values)
        print("the DADA ARRAY \(arrayOfEachPeriodSum)")
        
        self.arrayWithSumsofEachMonth = arrayOfEachPeriodSum
        
        //I have the array but now I will add zero cost for each year i spent nothing
        
        //calculate how many years had Zero expenses to use them in the median calculation
        calculateDateDifferenceInMonths()
        print("Months Difference\(self.dateDifferenceInMonths)")
        print("Months with Costs:\(arrayOfEachPeriodSum.count)")
        let numberOfZeroMonths = self.dateDifferenceInMonths - arrayOfEachPeriodSum.count
        
        
        if numberOfZeroMonths > 0 {
            
            for _ in 0..<numberOfZeroMonths {
                self.arrayWithSumsofEachMonth.append(0)
            }
            
        }
        
        print("the zero years are: \(numberOfZeroMonths)")
        print("the Array UFO with the sums is \(self.arrayWithSumsofEachMonth)")
    }
    
    
    
    
    func createArrayWithTheSumsOfEachMonthForC() {
        
        
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        
        let filteredTableForC = self.tableOfExpenses.filter {$0.kind == "Ccost"}
        
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: filteredTableForC, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        
        
        //first I export the keys to a new array
        let arrayOfDateKeys = [Date](dictionaryOfDatedCosts.keys)
        
        
        print("the array of keys\(arrayOfDateKeys)")
        
        
        //the array where I will store the values of months years days
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        
        for dateOfKey in arrayOfDateKeys {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            let weekday = calendar.component(.weekday, from: date)
            
            
            print("\(year)")
            print("\(month)")
            print("\(day)")
            print("\(week)")
            print("\(weekday)")
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
            //arrayOfSize.append(e.size!)
            // arrayOfDateOfCost.append(e.date)
            
            
            
        }
        
        //1st)create array eith year and month merged
        // let arrayYearMonth = map(Zip2(arrayOfYears, arrayOfMonths)) { $0 + " " + $1 }
        
        var arrayYearMonth: [String] = []
        
        for index in 0..<arrayOfYears.count {
            arrayYearMonth.append(String(arrayOfYears[index]) + "-" + String(arrayOfMonths[index]))
        }
        print("YEARMONTHEFFECT\(arrayYearMonth)")
        
        
        //2nd)create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
        // let tupleArray = zip(arrayOfArraysWithSameDayCosts, arrayOfYears)
        // print("the tuple array\(tupleArray)")
        
        //var dictionaryOfTupleForYear: [Int: [OneExpense]] = [:]
        
        // dictionaryOfTupleForYear = Dictionary(grouping: tupleArray, by: {})
        
        
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        //and i will put this sum in a new array
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count  {
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        
        //----------------------------------Migration Solution
        var arrayTupleYearMonthSum = [(String(), Double())]
        
        if self.arrayWithSumsofEachDay.count == 0 {
            
        } else {
        for i in 0...arrayWithSumsofEachDay.count - 1 {
            let tupleValue = (arrayYearMonth[i], self.arrayWithSumsofEachDay[i])
            arrayTupleYearMonthSum.append(tupleValue)
            
        }
        }
        //----------------------------------Migration Solution
        
        
        //The TUPLE with months And Sums
       // let arrayTupleYearMonthSum = Zip2Sequence(_sequence1: arrayYearMonth, _sequence2: self.arrayWithSumsofEachDay)
        
        
        var dictionaryOfPeriodSums: Dictionary<String, Double> = [:]
        for tupleYear in arrayTupleYearMonthSum  {
            dictionaryOfPeriodSums[tupleYear.0] = (dictionaryOfPeriodSums[tupleYear.0] ?? 0) + tupleYear.1
        }
        
        print("the DADA Dictionary \(dictionaryOfPeriodSums)")
        
        //and this is the ARRAY with SUMS of each year
        let arrayOfEachPeriodSum = [Double](dictionaryOfPeriodSums.values)
        print("the DADA ARRAY \(arrayOfEachPeriodSum)")
        
        self.arrayWithSumsofEachMonth = arrayOfEachPeriodSum
        
        //I have the array but now I will add zero cost for each year i spent nothing
        
        //calculate how many years had Zero expenses to use them in the median calculation
        calculateDateDifferenceInMonths()
        print("Months Difference\(self.dateDifferenceInMonths)")
        print("Months with Costs:\(arrayOfEachPeriodSum.count)")
        let numberOfZeroMonths = self.dateDifferenceInMonths - arrayOfEachPeriodSum.count
        
        
        if numberOfZeroMonths > 0 {
            
            for _ in 0..<numberOfZeroMonths {
                self.arrayWithSumsofEachMonth.append(0)
            }
            
        }
        
        print("the zero years are: \(numberOfZeroMonths)")
        print("the Array UFO with the sums is \(self.arrayWithSumsofEachMonth)")
    }
    
    
    
    
    func createArrayWithTheSumsOfEachWeek() {
        
        
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: self.tableOfExpenses, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        
        
        //first I export the keys to a new array
        let arrayOfDateKeys = [Date](dictionaryOfDatedCosts.keys)
        
        
        print("the array of keys\(arrayOfDateKeys)")
        
        
        //the array where I will store the values of months years days
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        
        for dateOfKey in arrayOfDateKeys {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            let weekday = calendar.component(.weekday, from: date)
            
            
            print("\(year)")
            print("\(month)")
            print("\(day)")
            print("\(week)")
            print("\(weekday)")
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
            //arrayOfSize.append(e.size!)
            // arrayOfDateOfCost.append(e.date)
            
            
            
        }
        
        //1st)create array eith year and month merged
        // let arrayYearMonth = map(Zip2(arrayOfYears, arrayOfMonths)) { $0 + " " + $1 }
        
        var arrayYearWeek: [String] = []
        
        for index in 0..<arrayOfYears.count {
            arrayYearWeek.append(String(arrayOfYears[index]) + "-" + String(arrayOfWeeks[index]))
        }
        print("YEARMONTHEFFECT\(arrayYearWeek)")
        
        
        //2nd)create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
        // let tupleArray = zip(arrayOfArraysWithSameDayCosts, arrayOfYears)
        // print("the tuple array\(tupleArray)")
        
        //var dictionaryOfTupleForYear: [Int: [OneExpense]] = [:]
        
        // dictionaryOfTupleForYear = Dictionary(grouping: tupleArray, by: {})
        
        
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        //and i will put this sum in a new array
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count  {
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        
        //----------------------------------Migration Solution
        var  arrayTupleYearWeekSum = [(String(), Double())]
        
        
        if self.arrayWithSumsofEachDay.count == 0 && arrayYearWeek.count <= 2 {
            
        } else {
        
        for i in 0...arrayWithSumsofEachDay.count - 1 {
            let tupleValue = (arrayYearWeek[i], self.arrayWithSumsofEachDay[i])
             arrayTupleYearWeekSum.append(tupleValue)
            
        }
        }//count =0
        //----------------------------------Migration Solution
        
        
        
        
        
        
        //The TUPLE with months And Sums
        //let arrayTupleYearWeekSum = Zip2Sequence(_sequence1: arrayYearWeek, _sequence2: self.arrayWithSumsofEachDay)
        
        
        var dictionaryOfPeriodSums: Dictionary<String, Double> = [:]
        for tupleYear in arrayTupleYearWeekSum  {
            dictionaryOfPeriodSums[tupleYear.0] = (dictionaryOfPeriodSums[tupleYear.0] ?? 0) + tupleYear.1
        }
        
        print("the DADA Dictionary \(dictionaryOfPeriodSums)")
        
        //and this is the ARRAY with SUMS of each year
        let arrayOfEachPeriodSum = [Double](dictionaryOfPeriodSums.values)
        print("the DADA ARRAY \(arrayOfEachPeriodSum)")
        
        self.arrayWithSumsofEachWeek = arrayOfEachPeriodSum
        
        //I have the array but now I will add zero cost for each year i spent nothing
        
        //calculate how many years had Zero expenses to use them in the median calculation
        calculateDateDifferenceInMonths()
        print("Weeks Difference\(self.dateDifferenceInWeeks)")
        print("Weeks with Costs:\(arrayOfEachPeriodSum.count)")
        let numberOfZeroPeriods = self.dateDifferenceInWeeks - arrayOfEachPeriodSum.count
        
        
        if numberOfZeroPeriods > 0 {
            
            for _ in 0..<numberOfZeroPeriods {
                self.arrayWithSumsofEachWeek.append(0)
            }
            
        }
        
        print("the zero weeks are: \(numberOfZeroPeriods)")
        print("the Array UFO with the sums is \(self.arrayWithSumsofEachWeek)")
    }
    
    func createArrayWithTheSumsOfEachWeekForA() {
        
        
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        
         let filteredTableForA = self.tableOfExpenses.filter {$0.kind == "Acost"}
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: filteredTableForA, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        
        
        //first I export the keys to a new array
        let arrayOfDateKeys = [Date](dictionaryOfDatedCosts.keys)
        
        
        print("the array of keys\(arrayOfDateKeys)")
        
        
        //the array where I will store the values of months years days
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        
        for dateOfKey in arrayOfDateKeys {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            let weekday = calendar.component(.weekday, from: date)
            
            
            print("\(year)")
            print("\(month)")
            print("\(day)")
            print("\(week)")
            print("\(weekday)")
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
            //arrayOfSize.append(e.size!)
            // arrayOfDateOfCost.append(e.date)
            
            
            
        }
        
        //1st)create array eith year and month merged
        // let arrayYearMonth = map(Zip2(arrayOfYears, arrayOfMonths)) { $0 + " " + $1 }
        
        var arrayYearWeek: [String] = []
        
        for index in 0..<arrayOfYears.count {
            arrayYearWeek.append(String(arrayOfYears[index]) + "-" + String(arrayOfWeeks[index]))
        }
        print("YEARMONTHEFFECT\(arrayYearWeek)")
        
        
        //2nd)create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
        // let tupleArray = zip(arrayOfArraysWithSameDayCosts, arrayOfYears)
        // print("the tuple array\(tupleArray)")
        
        //var dictionaryOfTupleForYear: [Int: [OneExpense]] = [:]
        
        // dictionaryOfTupleForYear = Dictionary(grouping: tupleArray, by: {})
        
        
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        //and i will put this sum in a new array
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count  {
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        
        
        //----------------------------------Migration Solution
        var  arrayTupleYearWeekSum = [(String(), Double())]
        
        if self.arrayWithSumsofEachDay.count == 0 {
            
        } else {
        for i in 0...arrayWithSumsofEachDay.count - 1 {
            let tupleValue = (arrayYearWeek[i], self.arrayWithSumsofEachDay[i])
            arrayTupleYearWeekSum.append(tupleValue)
            
        }
        }//count = 0
        //----------------------------------Migration Solution
        
        
        
        
        
        //The TUPLE with months And Sums
       // let arrayTupleYearWeekSum = Zip2Sequence(_sequence1: arrayYearWeek, _sequence2: self.arrayWithSumsofEachDay)
        
        
        var dictionaryOfPeriodSums: Dictionary<String, Double> = [:]
        for tupleYear in arrayTupleYearWeekSum  {
            dictionaryOfPeriodSums[tupleYear.0] = (dictionaryOfPeriodSums[tupleYear.0] ?? 0) + tupleYear.1
        }
        
        print("the DADA Dictionary \(dictionaryOfPeriodSums)")
        
        //and this is the ARRAY with SUMS of each year
        let arrayOfEachPeriodSum = [Double](dictionaryOfPeriodSums.values)
        print("the DADA ARRAY \(arrayOfEachPeriodSum)")
        
        self.arrayWithSumsofEachWeek = arrayOfEachPeriodSum
        
        //I have the array but now I will add zero cost for each year i spent nothing
        
        //calculate how many years had Zero expenses to use them in the median calculation
        calculateDateDifferenceInMonths()
        print("Weeks Difference\(self.dateDifferenceInWeeks)")
        print("Weeks with Costs:\(arrayOfEachPeriodSum.count)")
        let numberOfZeroPeriods = self.dateDifferenceInWeeks - arrayOfEachPeriodSum.count
        
        
        if numberOfZeroPeriods > 0 {
            
            for _ in 0..<numberOfZeroPeriods {
                self.arrayWithSumsofEachWeek.append(0)
            }
            
        }
        
        print("the zero weeks are: \(numberOfZeroPeriods)")
        print("the Array UFO with the sums is \(self.arrayWithSumsofEachWeek)")
    }
    
    func createArrayWithTheSumsOfEachWeekForB() {
        
        
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        
        let filteredTableForB = self.tableOfExpenses.filter {$0.kind == "Bcost"}
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: filteredTableForB, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        
        
        //first I export the keys to a new array
        let arrayOfDateKeys = [Date](dictionaryOfDatedCosts.keys)
        
        
        print("the array of keys\(arrayOfDateKeys)")
        
        
        //the array where I will store the values of months years days
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        for dateOfKey in arrayOfDateKeys {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            let weekday = calendar.component(.weekday, from: date)
            
            
            print("\(year)")
            print("\(month)")
            print("\(day)")
            print("\(week)")
            print("\(weekday)")
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
            //arrayOfSize.append(e.size!)
            // arrayOfDateOfCost.append(e.date)
            
            
            
        }
        
        //1st)create array eith year and month merged
        // let arrayYearMonth = map(Zip2(arrayOfYears, arrayOfMonths)) { $0 + " " + $1 }
        
        var arrayYearWeek: [String] = []
        
        for index in 0..<arrayOfYears.count {
            arrayYearWeek.append(String(arrayOfYears[index]) + "-" + String(arrayOfWeeks[index]))
        }
        print("YEARMONTHEFFECT\(arrayYearWeek)")
        
        
        //2nd)create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
        // let tupleArray = zip(arrayOfArraysWithSameDayCosts, arrayOfYears)
        // print("the tuple array\(tupleArray)")
        
        //var dictionaryOfTupleForYear: [Int: [OneExpense]] = [:]
        
        // dictionaryOfTupleForYear = Dictionary(grouping: tupleArray, by: {})
        
        
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        //and i will put this sum in a new array
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count  {
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        
        
        //----------------------------------Migration Solution
        var  arrayTupleYearWeekSum = [(String(), Double())]
        
        if self.arrayWithSumsofEachDay.count == 0 {
            
        } else {
            
        for i in 0...arrayWithSumsofEachDay.count - 1 {
            let tupleValue = (arrayYearWeek[i], self.arrayWithSumsofEachDay[i])
            arrayTupleYearWeekSum.append(tupleValue)
            
        }
        }//count = 0
        //----------------------------------Migration Solution
        
        
        
        
        //The TUPLE with months And Sums
       // let arrayTupleYearWeekSum = Zip2Sequence(_sequence1: arrayYearWeek, _sequence2: self.arrayWithSumsofEachDay)
        
        
        var dictionaryOfPeriodSums: Dictionary<String, Double> = [:]
        for tupleYear in arrayTupleYearWeekSum  {
            dictionaryOfPeriodSums[tupleYear.0] = (dictionaryOfPeriodSums[tupleYear.0] ?? 0) + tupleYear.1
        }
        
        print("the DADA Dictionary \(dictionaryOfPeriodSums)")
        
        //and this is the ARRAY with SUMS of each year
        let arrayOfEachPeriodSum = [Double](dictionaryOfPeriodSums.values)
        print("the DADA ARRAY \(arrayOfEachPeriodSum)")
        
        self.arrayWithSumsofEachWeek = arrayOfEachPeriodSum
        
        //I have the array but now I will add zero cost for each year i spent nothing
        
        //calculate how many years had Zero expenses to use them in the median calculation
        calculateDateDifferenceInMonths()
        print("Weeks Difference\(self.dateDifferenceInWeeks)")
        print("Weeks with Costs:\(arrayOfEachPeriodSum.count)")
        let numberOfZeroPeriods = self.dateDifferenceInWeeks - arrayOfEachPeriodSum.count
        
        
        if numberOfZeroPeriods > 0 {
            
            for _ in 0..<numberOfZeroPeriods {
                self.arrayWithSumsofEachWeek.append(0)
            }
            
        }
        
        print("the zero weeks are: \(numberOfZeroPeriods)")
        print("the Array UFO with the sums is \(self.arrayWithSumsofEachWeek)")
    }
    
    
    
    func createArrayWithTheSumsOfEachWeekForC() {
        
        
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        
        let filteredTableForC = self.tableOfExpenses.filter {$0.kind == "Ccost"}
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: filteredTableForC, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        
        
        //first I export the keys to a new array
        let arrayOfDateKeys = [Date](dictionaryOfDatedCosts.keys)
        
        
        print("the array of keys\(arrayOfDateKeys)")
        
        
        //the array where I will store the values of months years days
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        for dateOfKey in arrayOfDateKeys {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            let weekday = calendar.component(.weekday, from: date)
            
            
            print("\(year)")
            print("\(month)")
            print("\(day)")
            print("\(week)")
            print("\(weekday)")
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
            //arrayOfSize.append(e.size!)
            // arrayOfDateOfCost.append(e.date)
            
            
            
        }
        
        //1st)create array eith year and month merged
        // let arrayYearMonth = map(Zip2(arrayOfYears, arrayOfMonths)) { $0 + " " + $1 }
        
        var arrayYearWeek: [String] = []
        
        for index in 0..<arrayOfYears.count {
            arrayYearWeek.append(String(arrayOfYears[index]) + "-" + String(arrayOfWeeks[index]))
        }
        print("YEARMONTHEFFECT\(arrayYearWeek)")
        
        
        //2nd)create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
        // let tupleArray = zip(arrayOfArraysWithSameDayCosts, arrayOfYears)
        // print("the tuple array\(tupleArray)")
        
        //var dictionaryOfTupleForYear: [Int: [OneExpense]] = [:]
        
        // dictionaryOfTupleForYear = Dictionary(grouping: tupleArray, by: {})
        
        
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        //and i will put this sum in a new array
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count  {
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        //----------------------------------Migration Solution
        var  arrayTupleYearWeekSum = [(String(), Double())]
        
        if self.arrayWithSumsofEachDay.count == 0 {
            
        } else {
        for i in 0...arrayWithSumsofEachDay.count - 1 {
            let tupleValue = (arrayYearWeek[i], self.arrayWithSumsofEachDay[i])
            arrayTupleYearWeekSum.append(tupleValue)
            
        }
        }//count
        //----------------------------------Migration Solution
        
        
        //The TUPLE with months And Sums
      //  let arrayTupleYearWeekSum = Zip2Sequence(_sequence1: arrayYearWeek, _sequence2: self.arrayWithSumsofEachDay)
        
        
        var dictionaryOfPeriodSums: Dictionary<String, Double> = [:]
        for tupleYear in arrayTupleYearWeekSum  {
            dictionaryOfPeriodSums[tupleYear.0] = (dictionaryOfPeriodSums[tupleYear.0] ?? 0) + tupleYear.1
        }
        
        print("the DADA Dictionary \(dictionaryOfPeriodSums)")
        
        //and this is the ARRAY with SUMS of each year
        let arrayOfEachPeriodSum = [Double](dictionaryOfPeriodSums.values)
        print("the DADA ARRAY \(arrayOfEachPeriodSum)")
        
        self.arrayWithSumsofEachWeek = arrayOfEachPeriodSum
        
        //I have the array but now I will add zero cost for each year i spent nothing
        
        //calculate how many years had Zero expenses to use them in the median calculation
        calculateDateDifferenceInMonths()
        print("Weeks Difference\(self.dateDifferenceInWeeks)")
        print("Weeks with Costs:\(arrayOfEachPeriodSum.count)")
        let numberOfZeroPeriods = self.dateDifferenceInWeeks - arrayOfEachPeriodSum.count
        
        
        if numberOfZeroPeriods > 0 {
            
            for _ in 0..<numberOfZeroPeriods {
                self.arrayWithSumsofEachWeek.append(0)
            }
            
        }
        
        print("the zero weeks are: \(numberOfZeroPeriods)")
        print("the Array UFO with the sums is \(self.arrayWithSumsofEachWeek)")
    }
    
    
    
    //MARK: Foundamental Arrays for Generous
    
    //MARK:All
    
    
    func createDictionaryWithTheSumsOfEachDayForGenerous(){
        
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: self.tableOfExpenses, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        print("the RUN wonder grouping Dictionaly:\(dictionaryOfDatedCosts)")
        
        //Once I have the dictionary in place
        //First I export The KEYS**************************
        
        //Now I have to change the keys according to week
        //first I export the keys to a new array
        let arrayOfDateKeys = [Date](dictionaryOfDatedCosts.keys)
        print("the RUN wonder array of keys\(arrayOfDateKeys)")
 
        
        
        //Then I create the array eith the Daily Expenses**************************
        //create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
        print("the RUN array of arrays:\(arrayOfArraysWithSameDayCosts)")
        
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        //and i will put this sum in a new array
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count  {
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        
        //----------------------------------Migration Solution
        var  arrayTupleDateSum = [(Date(), Double())]
        
        if self.arrayWithSumsofEachDay.count == 0 {
            
        } else {
        
        for i in 0...arrayWithSumsofEachDay.count - 1 {
            let tupleValue = (arrayOfDateKeys[i], self.arrayWithSumsofEachDay[i])
            arrayTupleDateSum.append(tupleValue)
        }
        
        }//count=0
        //----------------------------------Migration Solution
        
        
        
        
        
        
        
        //Now the arrayWithSumsOfEachDay is Loaded
        
        //I combine the 2 arrays I created in a tuple (DateKeys, Sums)
        //In this tuple array thera are same dates in differentt KEys**************************************************************
      //  let arrayTupleDateSum = Zip2Sequence(_sequence1: arrayOfDateKeys, _sequence2: self.arrayWithSumsofEachDay)
        
        
        var dictionaryOfDateSums: Dictionary<Date, Double> = [:]
        for tupleDate in arrayTupleDateSum  {
            dictionaryOfDateSums[tupleDate.0] = (dictionaryOfDateSums[tupleDate.0] ?? 0) + tupleDate.1
        }
      
        print("the DATe Dictionary \(dictionaryOfDateSums)")
        
        
        self.dictionaryWithDateAndSumsOfEachDate = dictionaryOfDateSums
        
        
        
       
    }
    
    
    
    
    func createTupleArrayOfDailySumsAndGetMaxMin() {
       
        self.arrayWithSumsofEachDay = []
        createDictionaryWithTheSumsOfEachDayForGenerous()
        
        let arrayOfDatesOfSumedDictionary = [Date](self.dictionaryWithDateAndSumsOfEachDate.keys)
        print("the array of keys\(arrayOfDatesOfSumedDictionary)")
        
        let arrayOfSumsOfSumedDictionary = [Double](self.dictionaryWithDateAndSumsOfEachDate.values)
        print("the array of values\(arrayOfSumsOfSumedDictionary)")
        
        //In this tuple array therE are not same dates with differentt KEys. EaCH DATE(KEY) HAS ONE DOUBLE(VALUE)*********************
        let tupleArrayOfDatesAndSums = Array(zip(arrayOfDatesOfSumedDictionary,arrayOfSumsOfSumedDictionary))
        
        let sortedTupleArray = tupleArrayOfDatesAndSums.sorted(by:{$0.1 > $1.1})
        
        if sortedTupleArray.isEmpty {
            
        } else {
        self.dateOfMostGenerousDayofAll = sortedTupleArray[0].0
        self.costOfMostGenerousDayOfAll = sortedTupleArray[0].1
        
        self.dateOfMostEconomicDayofAll = sortedTupleArray[sortedTupleArray.count - 1].0
        self.costOfMostEconomicDayOfAll = sortedTupleArray[sortedTupleArray.count - 1].1
        
        
        print(" date Generous\(sortedTupleArray[0].0)")
        print(" cost Generous\(sortedTupleArray[0].1)")
        
        print(" date Economic\(sortedTupleArray[sortedTupleArray.count - 1].0)")
        print(" cost Economic\(sortedTupleArray[sortedTupleArray.count - 1].1)")
        
        }
        
    } //FUNCTION
    
    
    func createTheArrayWithTheSortedYearCostTuplesAndLoadTheVariables(){
        var arrayOfDates = [Date]()
        
        for e in self.tableOfExpenses {
            let dateOfCost = e.date
            arrayOfDates.append(dateOfCost! as Date)
        }
        print("the array of my dates is:\(arrayOfDates)")
        
        //Now create array of years
        //create arrays of date components
        //the arrays where I will store the values of months years days
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        
        for dateOfKey in arrayOfDates {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            //let weekday = calendar.component(.weekday, from: date)
            
            /*
             print("\(year)")
             print("\(month)")
             print("\(day)")
             print("\(week)")
             print("\(weekday)")*/
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
        }
        
        print("My array of years is:\(arrayOfYears)")
        
        //Now I will have my array of Size
        var arrayOfSize = [Double]()
        for e in self.tableOfExpenses {
            let sizeOfCost = e.size
            arrayOfSize.append(sizeOfCost)
        }
        print("the array of my size Of cost is:\(arrayOfSize)")
        
        
        
        let tupleYearCost = Array(zip(arrayOfYears, arrayOfSize))
        
        
        print("the tupleArray of my size Of cost is:\(tupleYearCost)")
        
        
        var myDictionaryWithYearsAndCosts: Dictionary<Int, Double> = [:]
        
        for tuple in tupleYearCost {
            myDictionaryWithYearsAndCosts[tuple.0] = (myDictionaryWithYearsAndCosts[tuple.0] ?? 0) + tuple.1
        }
        
        print("the diction is:\(myDictionaryWithYearsAndCosts)")
        
        
        let sortedArrayWithYearsAndCostsTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.0 < $1.0})
        
        print("the sorted diction accoding to year  is actually My array of tuples:\(sortedArrayWithYearsAndCostsTuples)")
        
        let sortedArrayMaxMinOfCostYearTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.1 > $1.1})
        
        print(" BUt the sorted diction accoding to size  is actually My array of tuples:\(sortedArrayMaxMinOfCostYearTuples)")
        
        
        if sortedArrayMaxMinOfCostYearTuples.isEmpty {
            
        } else {
            
            self.yearGenerousOfAll = sortedArrayMaxMinOfCostYearTuples[0].key
            self.costOfMostGenerousYearOfAll = sortedArrayMaxMinOfCostYearTuples[0].value
            
            self.yearEconomicOfAll = sortedArrayMaxMinOfCostYearTuples[sortedArrayMaxMinOfCostYearTuples.count - 1].key
            self.costOfMostEconomicYearOfAll = sortedArrayMaxMinOfCostYearTuples[sortedArrayMaxMinOfCostYearTuples.count - 1].value
        }
        
        
    }//FUNCTION
    
    
    func createTheArrayWithTheSortedMonthCostTuplesAndLoadTheVariables(){
        var arrayOfDates = [Date]()
        
        for e in self.tableOfExpenses {
            let dateOfCost = e.date
            arrayOfDates.append(dateOfCost! as Date)
        }
        print("the array of my dates is:\(arrayOfDates)")
        
        //Now create array of years
        //create arrays of date components
        //the arrays where I will store the values of months years days
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        for dateOfKey in arrayOfDates {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            //let weekday = calendar.component(.weekday, from: date)
            
            /*
             print("\(year)")
             print("\(month)")
             print("\(day)")
             print("\(week)")
             print("\(weekday)")*/
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
        }
        
        print("My array of years is:\(arrayOfYears)")
        
        //Now I will have my array of Size
        var arrayOfSize = [Double]()
        for e in self.tableOfExpenses {
            let sizeOfCost = e.size
            arrayOfSize.append(sizeOfCost)
        }
        print("the array of my size Of cost is:\(arrayOfSize)")
        
        //1st)create array eith year and month merged
        // let arrayYearMonth = map(Zip2(arrayOfYears, arrayOfMonths)) { $0 + " " + $1 }
        
        var arrayYearMonth: [String] = []
        
        for index in 0..<arrayOfYears.count {
            arrayYearMonth.append(String(arrayOfYears[index]) + "-" + String(arrayOfMonths[index]))
        }
        print("YEARMONTHEFFECT\(arrayYearMonth)")
        
        
        
        
        //everything is the same  but Int to String
        
        let tupleYearCost = Array(zip(arrayYearMonth, arrayOfSize))
        
        
        print("the tupleArray of my size Of cost is:\(tupleYearCost)")
        
        
        var myDictionaryWithYearsAndCosts: Dictionary<String, Double> = [:]
        
        for tuple in tupleYearCost {
            myDictionaryWithYearsAndCosts[tuple.0] = (myDictionaryWithYearsAndCosts[tuple.0] ?? 0) + tuple.1
        }
        
        print("the diction is:\(myDictionaryWithYearsAndCosts)")
        
        
        let sortedArrayWithYearsAndCostsTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.0 < $1.0})
        
        print("the sorted diction accoding to year  is actually My array of tuples:\(sortedArrayWithYearsAndCostsTuples)")
        
        let sortedArrayMaxMinOfCostYearTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.1 > $1.1})
        
        print(" BUt the sorted diction accoding to size  is actually My array of tuples:\(sortedArrayMaxMinOfCostYearTuples)")
        
        
        
       
        let myDateFormatter = DateFormatter()
        myDateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        myDateFormatter.dateFormat = "yyyy-MM"
        
        
        
        if sortedArrayMaxMinOfCostYearTuples.isEmpty {
            
        } else {
            //I need to get dates from strings
            let stringOfYearMonth = sortedArrayMaxMinOfCostYearTuples[0].key
            print("STTRRIIIIIIING\(stringOfYearMonth)")
            
            let dateOfGenerousMonth = myDateFormatter.date(from: stringOfYearMonth)
            print("DAAAAAAAAATE\(String(describing: dateOfGenerousMonth))")
            
            
            
            
            let stringEcoYearMonth = sortedArrayMaxMinOfCostYearTuples[sortedArrayMaxMinOfCostYearTuples.count - 1].key
            let dateOfEconomicMonth = myDateFormatter.date(from: stringEcoYearMonth)
            
            
            
            
            
            self.monthGenerousOfAll = dateOfGenerousMonth!
            self.costOfMostGenerousMonthOfAll = sortedArrayMaxMinOfCostYearTuples[0].value
            
            self.monthEconomicOfAll = dateOfEconomicMonth!
            self.costOfMostEconomicMonthOfAll = sortedArrayMaxMinOfCostYearTuples[sortedArrayMaxMinOfCostYearTuples.count - 1].value
        }
        
        
    }//FUNCTION
    
    
    func createTheArrayWithTheSortedWeekCostTuplesAndLoadTheVariables(){
        
        let arrayWithExpenses = self.tableOfExpenses
        
        //array with date of expenses
        var arrayOfDates = [Date]()
        for e in arrayWithExpenses {
            let dateOfCost = e.date
            arrayOfDates.append(dateOfCost! as Date)
        }
       //from array of dates I get two arrays (One with years[Int] and one with weeks[Int])...
        let arrayOfYears = getArrayOfYears(arrayOfDates: arrayOfDates)
        let arrayOfWeeks = getArrayOfWeeks(arrayOfDates: arrayOfDates)
        
        //...and I combine them in an array with [Strings] of "Year-Week"
        var arrayYearWeek: [String] = []
        for index in 0..<arrayOfYears.count {
            arrayYearWeek.append(String(arrayOfYears[index]) + "-" + String(arrayOfWeeks[index]))
        }
        
        //array of size of cost [Double]
        var arrayOfSize = [Double]()
        for e in arrayWithExpenses {
            let sizeOfCost = e.size
            arrayOfSize.append(sizeOfCost)
        }
       
        //create array of the tuple "Year-Week" and size, as [(String), Double]...
        let tupleYearCost = Array(zip(arrayYearWeek, arrayOfSize))
        
        //...and create a dictionary where the same YearWeeks are in one key and the va;ue of that key is the sum of sizes
        var myDictionaryWithYearsAndCosts: Dictionary<String, Double> = [:]
        for tuple in tupleYearCost {
            myDictionaryWithYearsAndCosts[tuple.0] = (myDictionaryWithYearsAndCosts[tuple.0] ?? 0) + tuple.1
        }
        
       //Get the sorted array of Tuples(YearWeek, Sum) where YearWeek is key and Sum is value,  according to size of sum in the dictionary...
        let sortedArrayMaxMinOfCostYearTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.1 > $1.1})
        
        if sortedArrayMaxMinOfCostYearTuples.isEmpty {
            
        } else {
        
        //...and if it is not empty extract first day of the week from the String "Year-Week" of the first item, which is the beggining of the most GENEROUS week
        let dateGenerousToLoad = getDateOfWeeksFirstDayWhenGivenAYearWeekString(yearWeek: sortedArrayMaxMinOfCostYearTuples[0].key)
        
        // Also  extract first day of the week from the String "Year-Week" of the LAST item, which is the beggining of the most ECONOMIC week
        let n = sortedArrayMaxMinOfCostYearTuples.count
        let dateEconomicToLoad = getDateOfWeeksFirstDayWhenGivenAYearWeekString(yearWeek: sortedArrayMaxMinOfCostYearTuples[n - 1].key)
        
            self.dateOfweekFirstDayGenerousOfAll = dateGenerousToLoad
            self.costOfMostGenerousWeekOfAll = sortedArrayMaxMinOfCostYearTuples[0].value
            
            self.dateOfweekFirstDayEconomicOfAll = dateEconomicToLoad
            self.costOfMostEconomicWeekOfAll = sortedArrayMaxMinOfCostYearTuples[n - 1].value
        }
    }//FUNCTION
    
    
    
    func getDateAndSumOfGenerousAndEconomicWeekGivenAnArrayOfExpenses(arrayOfExpenses:[OneExpense]) -> (Date, Double, Date, Double){
        
        let arrayOfGivenExpenses = [OneExpense]()
        
        var dateGenerousToLoad = Date()
        var valueGenerousToLoad: Double = 0.00
        var dateEconomicToLoad = Date()
        var valueEconomicToLoad: Double = 0.00
        
        //array with date of expenses
        var arrayOfDates = [Date]()
        for e in arrayOfGivenExpenses {
            let dateOfCost = e.date
            arrayOfDates.append(dateOfCost)
        }
        //from array of dates I get two arrays (One with years[Int] and one with weeks[Int])...
        let arrayOfYears = getArrayOfYears(arrayOfDates: arrayOfDates)
        let arrayOfWeeks = getArrayOfWeeks(arrayOfDates: arrayOfDates)
        
        //...and I combine them in an array with [Strings] of "Year-Week"
        var arrayYearWeek: [String] = []
        for index in 0..<arrayOfYears.count {
            arrayYearWeek.append(String(arrayOfYears[index]) + "-" + String(arrayOfWeeks[index]))
        }
        
        //array of size of cost [Double]
        var arrayOfSize = [Double]()
        for e in arrayOfGivenExpenses {
            let sizeOfCost = e.size
            arrayOfSize.append(sizeOfCost!)
        }
        
        //create array of the tuple "Year-Week" and size, as [(String), Double]...
        let tupleYearCost = Array(zip(arrayYearWeek, arrayOfSize))
        
        //...and create a dictionary where the same YearWeeks are in one key and the va;ue of that key is the sum of sizes
        var myDictionaryWithYearsAndCosts: Dictionary<String, Double> = [:]
        for tuple in tupleYearCost {
            myDictionaryWithYearsAndCosts[tuple.0] = (myDictionaryWithYearsAndCosts[tuple.0] ?? 0) + tuple.1
        }
        
        //Get the sorted array of Tuples(YearWeek, Sum) where YearWeek is key and Sum is value,  according to size of sum in the dictionary...
        let sortedArrayMaxMinOfCostYearTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.1 > $1.1})
        
        if sortedArrayMaxMinOfCostYearTuples.isEmpty {
            
        } else {
        
        //...and extract first day of the week from the String "Year-Week" of the first item, which is the beggining of the most GENEROUS week
        dateGenerousToLoad = getDateOfWeeksFirstDayWhenGivenAYearWeekString(yearWeek: sortedArrayMaxMinOfCostYearTuples[0].key)
        //extract also the respective value
        valueGenerousToLoad = sortedArrayMaxMinOfCostYearTuples[0].value
        
        // Also  extract first day of the week from the String "Year-Week" of the LAST item, which is the beggining of the most ECONOMIC week
        let n = sortedArrayMaxMinOfCostYearTuples.count
        dateEconomicToLoad = getDateOfWeeksFirstDayWhenGivenAYearWeekString(yearWeek: sortedArrayMaxMinOfCostYearTuples[n - 1].key)
        //extract also the respective value
        valueEconomicToLoad = sortedArrayMaxMinOfCostYearTuples[n - 1].value
        
        }
        
        return (dateGenerousToLoad,valueGenerousToLoad, dateEconomicToLoad, valueEconomicToLoad)
        
        
    }//FUNCTION
    
    
    
    
    
    
    
    
    func getArrayOfYears(arrayOfDates:[Date]) -> Array<Int>{
        var arrayOfYears = [Int]()
        
        for dateOfKey in arrayOfDates {
            let date = dateOfKey
            let calendar = Calendar.current
            let year = calendar.component(.year, from: date)
            
            let components: NSDateComponents = NSDateComponents()
            components.year = year
            arrayOfYears.append(year)
        }
        
        return arrayOfYears
    }
    
    func getArrayOfWeeks(arrayOfDates:[Date]) -> Array<Int>{
        var arrayOfWeeks = [Int]()
        
        for dateOfKey in arrayOfDates {
            let date = dateOfKey
            let calendar = Calendar.current
            let week = calendar.component(.weekOfYear, from: date)
            
            let components: NSDateComponents = NSDateComponents()
            components.weekOfYear = week
            arrayOfWeeks.append(week)
        }
        return arrayOfWeeks
    }
    
    
    
    func getDateOfWeeksFirstDayWhenGivenAYearWeekString(yearWeek:String) -> Date {
        var dateOfGenerousWeekFirstDay = Date()
        let splittedStringArray = yearWeek.split(separator: "-", maxSplits:1).map(String.init)
        
        let yearString = splittedStringArray[0]
        let weekOfYearString = splittedStringArray[1]
        
        if let year = Int(yearString), let weekOfYear = Int(weekOfYearString) {
        let components = DateComponents(weekOfYear:weekOfYear, yearForWeekOfYear: year)
        let outputDay = Calendar.current.date(from: components)
        dateOfGenerousWeekFirstDay  = outputDay!
            
        }
       
        /*The Stolen Code forAbove
         let yearString = splittedStringArray[0]
         let weekOfYearString = splittedStringArray[1]
         
         guard let year = Int(yearString), let weekOfYear = Int(weekOfYearString) else{return}
         let components = DateComponents(weekOfYear:weekOfYear, yearForWeekOfYear: year)
         guard let dateOfGenerousWeekFirstDay = Calendar.current.date(from: components) else {return}
         
         
         let df = DateFormatter()
         df.dateFormat = "yyyy-MM-dd"
         
         
         let outputDate = df.string(from: dateOfGenerousWeekFirstDay)
         */
        
        return dateOfGenerousWeekFirstDay
    }
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: GenerousA
    
    func createDictionaryWithTheSumsOfEachDayForGenerousA(){
        
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        let filteredTableForA = self.tableOfExpenses.filter {$0.kind == "Acost"}
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: filteredTableForA, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        
        
        //Once I have the dictionary in place
        //First I export The KEYS**************************
        
        //Now I have to change the keys according to week
        //first I export the keys to a new array
        let arrayOfDateKeys = [Date](dictionaryOfDatedCosts.keys)
        print("the array of keys\(arrayOfDateKeys)")
        
        
        
        //Then I create the array eith the Daily Expenses**************************
        //create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
        
        
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        //and i will put this sum in a new array
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count  {
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        
        
        //----------------------------------Migration Solution
        var  arrayTupleDateSum = [(Date(), Double())]
        
        
        if self.arrayWithSumsofEachDay.count == 0 {
            
        } else {
        
        for i in 0...arrayWithSumsofEachDay.count - 1 {
            let tupleValue = (arrayOfDateKeys[i], self.arrayWithSumsofEachDay[i])
            arrayTupleDateSum.append(tupleValue)
            
        }
        }//count 0
        //----------------------------------Migration Solution
        
        //Now the arrayWithSumsOfEachDay is Loaded
        
        //I combine the 2 arrays I created in a tuple (DateKeys, Sums)
        //In this tuple array thera are same dates in differentt KEys**************************************************************
       // let arrayTupleDateSum = Zip2Sequence(_sequence1: arrayOfDateKeys, _sequence2: self.arrayWithSumsofEachDay)
        
        
        var dictionaryOfDateSums: Dictionary<Date, Double> = [:]
        for tupleDate in arrayTupleDateSum  {
            dictionaryOfDateSums[tupleDate.0] = (dictionaryOfDateSums[tupleDate.0] ?? 0) + tupleDate.1
        }
        
        print("the DATe Dictionary \(dictionaryOfDateSums)")
        
        
        self.dictionaryWithDateAndSumsOfEachDate = dictionaryOfDateSums
        
        
    }
    
    
    func createTupleArrayOfDailySumsForAAndGetMaxMin(){
        self.arrayWithSumsofEachDay = []
        createDictionaryWithTheSumsOfEachDayForGenerousA()
        
        let arrayOfDatesOfSumedDictionary = [Date](self.dictionaryWithDateAndSumsOfEachDate.keys)
        print("the array of keys\(arrayOfDatesOfSumedDictionary)")
        
        let arrayOfSumsOfSumedDictionary = [Double](self.dictionaryWithDateAndSumsOfEachDate.values)
        print("the array of values\(arrayOfSumsOfSumedDictionary)")
        
        //In this tuple array therE are not same dates with differentt KEys. EaCH DATE(KEY) HAS ONE DOUBLE(VALUE)*********************
        let tupleArrayOfDatesAndSums = Array(zip(arrayOfDatesOfSumedDictionary,arrayOfSumsOfSumedDictionary))
        
        let sortedTupleArray = tupleArrayOfDatesAndSums.sorted(by:{$0.1 > $1.1})
        
        if sortedTupleArray.isEmpty {
            
        } else {
        
        
        self.dateOfMostGenerousDayofA = sortedTupleArray[0].0
        self.costOfMostGenerousDayForA = sortedTupleArray[0].1
        
        self.dateOfMostEconomicDayofA = sortedTupleArray[sortedTupleArray.count - 1].0
        self.costOfMostEconomicDayForA = sortedTupleArray[sortedTupleArray.count - 1].1
        
        
        print(" date GenerousA:\(sortedTupleArray[0].0)")
        print(" cost GenerousA:\(sortedTupleArray[0].1)")
        
        print(" date EconomicA:\(sortedTupleArray[sortedTupleArray.count - 1].0)")
        print(" cost EconomicA:\(sortedTupleArray[sortedTupleArray.count - 1].1)")
        
        }
    } //FUNCTION
    
    
    
    func createTheArrayWithTheSortedYearCostTuplesAndLoadTheVariablesForA(){
        var arrayOfDates = [Date]()
        
       
     let filteredTableForA = self.tableOfExpenses.filter {$0.kind == "Acost"}
        
        
        for e in filteredTableForA {
            let dateOfCost = e.date
            arrayOfDates.append(dateOfCost! as Date)
        }
        print("the Aarray of my dates is:\(arrayOfDates)")
        
        //Now create array of years
        //create arrays of date components
        //the arrays where I will store the values of months years days
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        
        for dateOfKey in arrayOfDates {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            //let weekday = calendar.component(.weekday, from: date)
            
            /*
             print("\(year)")
             print("\(month)")
             print("\(day)")
             print("\(week)")
             print("\(weekday)")*/
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
        }
        
        print("My array of years is:\(arrayOfYears)")
        
        //Now I will have my array of Size
        var arrayOfSize = [Double]()
        for e in filteredTableForA {
            let sizeOfCost = e.size
            arrayOfSize.append(sizeOfCost)
        }
        print("the array of my size Of cost is:\(arrayOfSize)")
        
        
        
        let tupleYearCost = Array(zip(arrayOfYears, arrayOfSize))
        
        
        print("the tupleArray of my size Of cost is:\(tupleYearCost)")
        
        
        var myDictionaryWithYearsAndCosts: Dictionary<Int, Double> = [:]
        
        for tuple in tupleYearCost {
            myDictionaryWithYearsAndCosts[tuple.0] = (myDictionaryWithYearsAndCosts[tuple.0] ?? 0) + tuple.1
        }
        
        print("the diction is:\(myDictionaryWithYearsAndCosts)")
        
        
        let sortedArrayWithYearsAndCostsTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.0 < $1.0})
        
        print("the sorted diction accoding to year  is actually My array of tuples:\(sortedArrayWithYearsAndCostsTuples)")
        
        let sortedArrayMaxMinOfCostYearTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.1 > $1.1})
        
        print(" BUt the sorted diction accoding to size  is actually My array of tuples:\(sortedArrayMaxMinOfCostYearTuples)")
        
        
        if sortedArrayMaxMinOfCostYearTuples.isEmpty {
            
        } else {
            
            self.yearGenerousOfA = sortedArrayMaxMinOfCostYearTuples[0].key
            self.costOfMostGenerousYearForA = sortedArrayMaxMinOfCostYearTuples[0].value
            
            self.yearEconomicOfA = sortedArrayMaxMinOfCostYearTuples[sortedArrayMaxMinOfCostYearTuples.count - 1].key
            self.costOfMostEconomicYearForA = sortedArrayMaxMinOfCostYearTuples[sortedArrayMaxMinOfCostYearTuples.count - 1].value
        }
        
        
    }//FUNCTION
    
    
    
    func createTheArrayWithTheSortedMonthCostTuplesAndLoadTheVariablesForA(){
        var arrayOfDates = [Date]()
        
        let filteredTableForA = self.tableOfExpenses.filter {$0.kind == "Acost"}
        
        
        for e in filteredTableForA {
            let dateOfCost = e.date
            arrayOfDates.append(dateOfCost! as Date)
        }
        print("the array of my dates is:\(arrayOfDates)")
        
        //Now create array of years
        //create arrays of date components
        //the arrays where I will store the values of months years days
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        for dateOfKey in arrayOfDates {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            //let weekday = calendar.component(.weekday, from: date)
            
            /*
             print("\(year)")
             print("\(month)")
             print("\(day)")
             print("\(week)")
             print("\(weekday)")*/
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
        }
        
        print("My array of years is:\(arrayOfYears)")
        
        //Now I will have my array of Size
        var arrayOfSize = [Double]()
        for e in filteredTableForA {
            let sizeOfCost = e.size
            arrayOfSize.append(sizeOfCost)
        }
        print("the array of my size Of cost is:\(arrayOfSize)")
        
        //1st)create array eith year and month merged
        // let arrayYearMonth = map(Zip2(arrayOfYears, arrayOfMonths)) { $0 + " " + $1 }
        
        var arrayYearMonth: [String] = []
        
        for index in 0..<arrayOfYears.count {
            arrayYearMonth.append(String(arrayOfYears[index]) + "-" + String(arrayOfMonths[index]))
        }
        print("YEARMONTHEFFECT\(arrayYearMonth)")
        
        
        
        
        //everything is the same  but Int to String
        
        let tupleYearCost = Array(zip(arrayYearMonth, arrayOfSize))
        
        
        print("the tupleArray of my size Of cost is:\(tupleYearCost)")
        
        
        var myDictionaryWithYearsAndCosts: Dictionary<String, Double> = [:]
        
        for tuple in tupleYearCost {
            myDictionaryWithYearsAndCosts[tuple.0] = (myDictionaryWithYearsAndCosts[tuple.0] ?? 0) + tuple.1
        }
        
        print("the diction is:\(myDictionaryWithYearsAndCosts)")
        
        
        let sortedArrayWithYearsAndCostsTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.0 < $1.0})
        
        print("the sorted diction accoding to year  is actually My array of tuples:\(sortedArrayWithYearsAndCostsTuples)")
        
        let sortedArrayMaxMinOfCostYearTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.1 > $1.1})
        
        print(" BUt the sorted diction accoding to size  is actually My array of tuples:\(sortedArrayMaxMinOfCostYearTuples)")
        
        
        
        
        let myDateFormatter = DateFormatter()
        myDateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        myDateFormatter.dateFormat = "yyyy-MM"
        
        
        
        if sortedArrayMaxMinOfCostYearTuples.isEmpty {
            
        } else {
            //I need to get dates from strings
            let stringOfYearMonth = sortedArrayMaxMinOfCostYearTuples[0].key
            print("STTRRIIIIIIING\(stringOfYearMonth)")
            
            let dateOfGenerousMonth = myDateFormatter.date(from: stringOfYearMonth)
            print("DAAAAAAAAATE\(String(describing: dateOfGenerousMonth))")
            
            
            
            
            let stringEcoYearMonth = sortedArrayMaxMinOfCostYearTuples[sortedArrayMaxMinOfCostYearTuples.count - 1].key
            let dateOfEconomicMonth = myDateFormatter.date(from: stringEcoYearMonth)
            
            self.monthGenerousOfA = dateOfGenerousMonth!
            self.costOfMostGenerousMonthForA = sortedArrayMaxMinOfCostYearTuples[0].value
            
            self.monthEconomicOfA = dateOfEconomicMonth!
            self.costOfMostEconomicMonthForA = sortedArrayMaxMinOfCostYearTuples[sortedArrayMaxMinOfCostYearTuples.count - 1].value
        }
        
        
    }//FUNCTION
    
    
    
    func createTheArrayWithTheSortedWeekCostTuplesAndLoadTheVariablesForA(){
        
        let arrayWithExpenses = self.tableOfExpenses.filter {$0.kind == "Acost"}
        
        //array with date of expenses
        var arrayOfDates = [Date]()
        for e in arrayWithExpenses {
            let dateOfCost = e.date
            arrayOfDates.append(dateOfCost! as Date)
        }
        //from array of dates I get two arrays (One with years[Int] and one with weeks[Int])...
        let arrayOfYears = getArrayOfYears(arrayOfDates: arrayOfDates)
        let arrayOfWeeks = getArrayOfWeeks(arrayOfDates: arrayOfDates)
        
        //...and I combine them in an array with [Strings] of "Year-Week"
        var arrayYearWeek: [String] = []
        for index in 0..<arrayOfYears.count {
            arrayYearWeek.append(String(arrayOfYears[index]) + "-" + String(arrayOfWeeks[index]))
        }
        
        //array of size of cost [Double]
        var arrayOfSize = [Double]()
        for e in arrayWithExpenses {
            let sizeOfCost = e.size
            arrayOfSize.append(sizeOfCost)
        }
        
        //create array of the tuple "Year-Week" and size, as [(String), Double]...
        let tupleYearCost = Array(zip(arrayYearWeek, arrayOfSize))
        
        //...and create a dictionary where the same YearWeeks are in one key and the va;ue of that key is the sum of sizes
        var myDictionaryWithYearsAndCosts: Dictionary<String, Double> = [:]
        for tuple in tupleYearCost {
            myDictionaryWithYearsAndCosts[tuple.0] = (myDictionaryWithYearsAndCosts[tuple.0] ?? 0) + tuple.1
        }
        
        //Get the sorted array of Tuples(YearWeek, Sum) where YearWeek is key and Sum is value,  according to size of sum in the dictionary...
        let sortedArrayMaxMinOfCostYearTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.1 > $1.1})
        
        if sortedArrayMaxMinOfCostYearTuples.isEmpty {
            
        } else {
            
        //...and if it is not empty extract first day of the week from the String "Year-Week" of the first item, which is the beggining of the most GENEROUS week
        let dateGenerousToLoad = getDateOfWeeksFirstDayWhenGivenAYearWeekString(yearWeek: sortedArrayMaxMinOfCostYearTuples[0].key)
        
        // Also  extract first day of the week from the String "Year-Week" of the LAST item, which is the beggining of the most ECONOMIC week
        let n = sortedArrayMaxMinOfCostYearTuples.count
        let dateEconomicToLoad = getDateOfWeeksFirstDayWhenGivenAYearWeekString(yearWeek: sortedArrayMaxMinOfCostYearTuples[n - 1].key)
       
            self.dateOfweekFirstDayGenerousOfA = dateGenerousToLoad
            self.costOfMostGenerousWeekForA = sortedArrayMaxMinOfCostYearTuples[0].value
            
            self.dateOfweekFirstDayEconomicOfA = dateEconomicToLoad
            self.costOfMostEconomicWeekForA = sortedArrayMaxMinOfCostYearTuples[n - 1].value
        }
    }//FUNCTION
    
    
    
  
    
    
    //MARK: GenerousB
    
    func createDictionaryWithTheSumsOfEachDayForGenerousB(){
        
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        let filteredTableForB = self.tableOfExpenses.filter {$0.kind == "Bcost"}
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: filteredTableForB, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        
        
        //Once I have the dictionary in place
        //First I export The KEYS**************************
        
        //Now I have to change the keys according to week
        //first I export the keys to a new array
        let arrayOfDateKeys = [Date](dictionaryOfDatedCosts.keys)
        print("the array of keys\(arrayOfDateKeys)")
        
        
        
        //Then I create the array eith the Daily Expenses**************************
        //create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
        
        
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        //and i will put this sum in a new array
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count  {
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        //----------------------------------Migration Solution
        var  arrayTupleDateSum = [(Date(), Double())]
        
        
        if self.arrayWithSumsofEachDay.count == 0 {
            
        } else {
        
        for i in 0...arrayWithSumsofEachDay.count - 1 {
            let tupleValue = (arrayOfDateKeys[i], self.arrayWithSumsofEachDay[i])
            arrayTupleDateSum.append(tupleValue)
            
        }
        }//count
        //----------------------------------Migration Solution
        
        
        //Now the arrayWithSumsOfEachDay is Loaded
        
        //I combine the 2 arrays I created in a tuple (DateKeys, Sums)
        //In this tuple array thera are same dates in differentt KEys**************************************************************
      //  let arrayTupleDateSum = Zip2Sequence(_sequence1: arrayOfDateKeys, _sequence2: self.arrayWithSumsofEachDay)
        
        
        var dictionaryOfDateSums: Dictionary<Date, Double> = [:]
        for tupleDate in arrayTupleDateSum  {
            dictionaryOfDateSums[tupleDate.0] = (dictionaryOfDateSums[tupleDate.0] ?? 0) + tupleDate.1
        }
        
        print("the DATe Dictionary \(dictionaryOfDateSums)")
        
        
        self.dictionaryWithDateAndSumsOfEachDate = dictionaryOfDateSums
        
        
    }
    
    
    func createTupleArrayOfDailySumsForBAndGetMaxMin(){
        self.arrayWithSumsofEachDay = []
        createDictionaryWithTheSumsOfEachDayForGenerousB()
        
        let arrayOfDatesOfSumedDictionary = [Date](self.dictionaryWithDateAndSumsOfEachDate.keys)
        print("the array of keys\(arrayOfDatesOfSumedDictionary)")
        
        let arrayOfSumsOfSumedDictionary = [Double](self.dictionaryWithDateAndSumsOfEachDate.values)
        print("the array of values\(arrayOfSumsOfSumedDictionary)")
        
        //In this tuple array therE are not same dates with differentt KEys. EaCH DATE(KEY) HAS ONE DOUBLE(VALUE)*********************
        let tupleArrayOfDatesAndSums = Array(zip(arrayOfDatesOfSumedDictionary,arrayOfSumsOfSumedDictionary))
        
        let sortedTupleArray = tupleArrayOfDatesAndSums.sorted(by:{$0.1 > $1.1})
        
        if sortedTupleArray.isEmpty{
            
        } else {
        self.dateOfMostGenerousDayofB = sortedTupleArray[0].0
        self.costOfMostGenerousDayForB = sortedTupleArray[0].1
        
        self.dateOfMostEconomicDayofB = sortedTupleArray[sortedTupleArray.count - 1].0
        self.costOfMostEconomicDayForB = sortedTupleArray[sortedTupleArray.count - 1].1
        
        
        print(" date GenerousB:\(sortedTupleArray[0].0)")
        print(" cost GenerousB:\(sortedTupleArray[0].1)")
        
        print(" date EconomicB:\(sortedTupleArray[sortedTupleArray.count - 1].0)")
        print(" cost EconomicB:\(sortedTupleArray[sortedTupleArray.count - 1].1)")
        }
    } //FUNCTION
    
    
 
    func createTheArrayWithTheSortedYearCostTuplesAndLoadTheVariablesForB(){
        var arrayOfDates = [Date]()
        
        let filteredTableForB = self.tableOfExpenses.filter({$0.kind == "Bcost"})
        
        
        
        for e in filteredTableForB {
            let dateOfCost = e.date
            arrayOfDates.append(dateOfCost! as Date)
        }
        print("the Barray of my dates is:\(arrayOfDates)")
        
        //Now create array of years
        //create arrays of date components
        //the arrays where I will store the values of months years days
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        for dateOfKey in arrayOfDates {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            //let weekday = calendar.component(.weekday, from: date)
            
            /*
             print("\(year)")
             print("\(month)")
             print("\(day)")
             print("\(week)")
             print("\(weekday)")*/
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
        }
        
        print("My array of years is:\(arrayOfYears)")
        
        //Now I will have my array of Size
        var arrayOfSize = [Double]()
        for e in filteredTableForB {
            let sizeOfCost = e.size
            arrayOfSize.append(sizeOfCost)
        }
        print("the array of my size Of cost is:\(arrayOfSize)")
        
        
        
        let tupleYearCost = Array(zip(arrayOfYears, arrayOfSize))
        
        
        print("the tupleArray of my size Of cost is:\(tupleYearCost)")
        
        
        var myDictionaryWithYearsAndCosts: Dictionary<Int, Double> = [:]
        
        for tuple in tupleYearCost {
            myDictionaryWithYearsAndCosts[tuple.0] = (myDictionaryWithYearsAndCosts[tuple.0] ?? 0) + tuple.1
        }
        
        print("the diction is:\(myDictionaryWithYearsAndCosts)")
        
        
        let sortedArrayWithYearsAndCostsTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.0 < $1.0})
        
        print("the sorted diction accoding to year  is actually My array of tuples:\(sortedArrayWithYearsAndCostsTuples)")
        
        let sortedArrayMaxMinOfCostYearTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.1 > $1.1})
        
        print(" BUt the sorted diction accoding to size  is actually My array of tuples:\(sortedArrayMaxMinOfCostYearTuples)")
        
        
        if sortedArrayMaxMinOfCostYearTuples.isEmpty {
            
        } else {
            
            self.yearGenerousOfB = sortedArrayMaxMinOfCostYearTuples[0].key
            self.costOfMostGenerousYearForB = sortedArrayMaxMinOfCostYearTuples[0].value
            
            self.yearEconomicOfB = sortedArrayMaxMinOfCostYearTuples[sortedArrayMaxMinOfCostYearTuples.count - 1].key
            self.costOfMostEconomicYearForB = sortedArrayMaxMinOfCostYearTuples[sortedArrayMaxMinOfCostYearTuples.count - 1].value
        }
        
        
    }//FUNCTION
    
    
    
    func createTheArrayWithTheSortedMonthCostTuplesAndLoadTheVariablesForB(){
        var arrayOfDates = [Date]()
        
        let filteredTableForB = self.tableOfExpenses.filter {$0.kind == "Bcost"}
        
        
        for e in filteredTableForB {
            let dateOfCost = e.date
            arrayOfDates.append(dateOfCost! as Date)
        }
        print("the array of my dates is:\(arrayOfDates)")
        
        //Now create array of years
        //create arrays of date components
        //the arrays where I will store the values of months years days
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        for dateOfKey in arrayOfDates {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            //let weekday = calendar.component(.weekday, from: date)
            
            /*
             print("\(year)")
             print("\(month)")
             print("\(day)")
             print("\(week)")
             print("\(weekday)")*/
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
        }
        
        print("My array of years is:\(arrayOfYears)")
        
        //Now I will have my array of Size
        var arrayOfSize = [Double]()
        for e in filteredTableForB {
            let sizeOfCost = e.size
            arrayOfSize.append(sizeOfCost)
        }
        print("the array of my size Of cost is:\(arrayOfSize)")
        
        //1st)create array eith year and month merged
        // let arrayYearMonth = map(Zip2(arrayOfYears, arrayOfMonths)) { $0 + " " + $1 }
        
        var arrayYearMonth: [String] = []
        
        for index in 0..<arrayOfYears.count {
            arrayYearMonth.append(String(arrayOfYears[index]) + "-" + String(arrayOfMonths[index]))
        }
        print("YEARMONTHEFFECT\(arrayYearMonth)")
        
        
        
        
        //everything is the same  but Int to String
        
        let tupleYearCost = Array(zip(arrayYearMonth, arrayOfSize))
        
        
        print("the tupleArray of my size Of cost is:\(tupleYearCost)")
        
        
        var myDictionaryWithYearsAndCosts: Dictionary<String, Double> = [:]
        
        for tuple in tupleYearCost {
            myDictionaryWithYearsAndCosts[tuple.0] = (myDictionaryWithYearsAndCosts[tuple.0] ?? 0) + tuple.1
        }
        
        print("the diction is:\(myDictionaryWithYearsAndCosts)")
        
        
        let sortedArrayWithYearsAndCostsTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.0 < $1.0})
        
        print("the sorted diction accoding to year  is actually My array of tuples:\(sortedArrayWithYearsAndCostsTuples)")
        
        let sortedArrayMaxMinOfCostYearTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.1 > $1.1})
        
        print(" BUt the sorted diction accoding to size  is actually My array of tuples:\(sortedArrayMaxMinOfCostYearTuples)")
        
        
        
        
        let myDateFormatter = DateFormatter()
        myDateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        myDateFormatter.dateFormat = "yyyy-MM"
        
        
        
        if sortedArrayMaxMinOfCostYearTuples.isEmpty {
            
        } else {
            
            //I need to get dates from strings
            let stringOfYearMonth = sortedArrayMaxMinOfCostYearTuples[0].key
            print("STTRRIIIIIIING\(stringOfYearMonth)")
            
            let dateOfGenerousMonth = myDateFormatter.date(from: stringOfYearMonth)
            print("DAAAAAAAAATE\(String(describing: dateOfGenerousMonth))")
            
            
            
            
            let stringEcoYearMonth = sortedArrayMaxMinOfCostYearTuples[sortedArrayMaxMinOfCostYearTuples.count - 1].key
            let dateOfEconomicMonth = myDateFormatter.date(from: stringEcoYearMonth)
            
            
            
            self.monthGenerousOfB = dateOfGenerousMonth!
            self.costOfMostGenerousMonthForB = sortedArrayMaxMinOfCostYearTuples[0].value
            
            self.monthEconomicOfB = dateOfEconomicMonth!
            self.costOfMostEconomicMonthForB = sortedArrayMaxMinOfCostYearTuples[sortedArrayMaxMinOfCostYearTuples.count - 1].value
        }
        
        
    }//FUNCTION
    
    func createTheArrayWithTheSortedWeekCostTuplesAndLoadTheVariablesForB(){
        
        let arrayWithExpenses = self.tableOfExpenses.filter {$0.kind == "Bcost"}
        
        //array with date of expenses
        var arrayOfDates = [Date]()
        for e in arrayWithExpenses {
            let dateOfCost = e.date
            arrayOfDates.append(dateOfCost! as Date)
        }
        //from array of dates I get two arrays (One with years[Int] and one with weeks[Int])...
        let arrayOfYears = getArrayOfYears(arrayOfDates: arrayOfDates)
        let arrayOfWeeks = getArrayOfWeeks(arrayOfDates: arrayOfDates)
        
        //...and I combine them in an array with [Strings] of "Year-Week"
        var arrayYearWeek: [String] = []
        for index in 0..<arrayOfYears.count {
            arrayYearWeek.append(String(arrayOfYears[index]) + "-" + String(arrayOfWeeks[index]))
        }
        
        //array of size of cost [Double]
        var arrayOfSize = [Double]()
        for e in arrayWithExpenses {
            let sizeOfCost = e.size
            arrayOfSize.append(sizeOfCost)
        }
        
        //create array of the tuple "Year-Week" and size, as [(String), Double]...
        let tupleYearCost = Array(zip(arrayYearWeek, arrayOfSize))
        
        //...and create a dictionary where the same YearWeeks are in one key and the va;ue of that key is the sum of sizes
        var myDictionaryWithYearsAndCosts: Dictionary<String, Double> = [:]
        for tuple in tupleYearCost {
            myDictionaryWithYearsAndCosts[tuple.0] = (myDictionaryWithYearsAndCosts[tuple.0] ?? 0) + tuple.1
        }
        
        //Get the sorted array of Tuples(YearWeek, Sum) where YearWeek is key and Sum is value,  according to size of sum in the dictionary...
        let sortedArrayMaxMinOfCostYearTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.1 > $1.1})
        
        
        if sortedArrayMaxMinOfCostYearTuples.isEmpty {
            
        } else {
            
        //...and if it is not empty extract first day of the week from the String "Year-Week" of the first item, which is the beggining of the most GENEROUS week
        let dateGenerousToLoad = getDateOfWeeksFirstDayWhenGivenAYearWeekString(yearWeek: sortedArrayMaxMinOfCostYearTuples[0].key)
        
        // Also  extract first day of the week from the String "Year-Week" of the LAST item, which is the beggining of the most ECONOMIC week
        let n = sortedArrayMaxMinOfCostYearTuples.count
        let dateEconomicToLoad = getDateOfWeeksFirstDayWhenGivenAYearWeekString(yearWeek: sortedArrayMaxMinOfCostYearTuples[n - 1].key)
        
       
            self.dateOfweekFirstDayGenerousOfB = dateGenerousToLoad
            self.costOfMostGenerousWeekForB = sortedArrayMaxMinOfCostYearTuples[0].value
            
            self.dateOfweekFirstDayEconomicOfB = dateEconomicToLoad
            self.costOfMostEconomicWeekForB = sortedArrayMaxMinOfCostYearTuples[n - 1].value
        }
    }//FUNCTION
    
    
    
    
    
    
    
    //MARK: GenerousC
    func createDictionaryWithTheSumsOfEachDayForGenerousC(){
        
        //The dictionary with [Date] as Key and [Array with same Date expenses] as values
        var dictionaryOfDatedCosts: [Date: [ExpenseCore]] = [:]
        
        let filteredTableForC = self.tableOfExpenses.filter {$0.kind == "Ccost"}
        
        //Here i create this wonderfull dictionary
        dictionaryOfDatedCosts = Dictionary(grouping: filteredTableForC, by: { $0.date }) as! [Date : [ExpenseCore]]
        
        
        
        //Once I have the dictionary in place
        //First I export The KEYS**************************
        
        //Now I have to change the keys according to week
        //first I export the keys to a new array
        let arrayOfDateKeys = [Date](dictionaryOfDatedCosts.keys)
        print("the array of keys\(arrayOfDateKeys)")
        
        
        
        //Then I create the array eith the Daily Expenses**************************
        //create an array with the ********ARRAYS of the Same Day Expenses*************************
        let arrayOfArraysWithSameDayCosts = [[ExpenseCore]](dictionaryOfDatedCosts.values)
        
        
        
        
        //for every Array(item) I will calculate the sum(this will be the sum of each day)
        //and i will put this sum in a new array
        
        for i in 0..<arrayOfArraysWithSameDayCosts.count  {
            
            let sumOfEachDay = arrayOfArraysWithSameDayCosts[i].reduce(0, {$0 + $1.size})
            self.sumOfEachDay = sumOfEachDay
            self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
            
        }
        
        //----------------------------------Migration Solution
        var  arrayTupleDateSum = [(Date(), Double())]
        if self.arrayWithSumsofEachDay.count == 0 {
            
        } else {
        
        for i in 0...arrayWithSumsofEachDay.count - 1 {
            let tupleValue = (arrayOfDateKeys[i], self.arrayWithSumsofEachDay[i])
            arrayTupleDateSum.append(tupleValue)
            
        }
        }//cont
        //----------------------------------Migration Solution
        
        
        //Now the arrayWithSumsOfEachDay is Loaded
        
        //I combine the 2 arrays I created in a tuple (DateKeys, Sums)
        //In this tuple array thera are same dates in differentt KEys**************************************************************
       // let arrayTupleDateSum = Zip2Sequence(_sequence1: arrayOfDateKeys, _sequence2: self.arrayWithSumsofEachDay)
        
        
        var dictionaryOfDateSums: Dictionary<Date, Double> = [:]
        for tupleDate in arrayTupleDateSum  {
            dictionaryOfDateSums[tupleDate.0] = (dictionaryOfDateSums[tupleDate.0] ?? 0) + tupleDate.1
        }
        
        print("the DATe Dictionary \(dictionaryOfDateSums)")
        
        
        self.dictionaryWithDateAndSumsOfEachDate = dictionaryOfDateSums
        
        
    }
    
    
    func createTupleArrayOfDailySumsForCAndGetMaxMin(){
        self.arrayWithSumsofEachDay = []
        createDictionaryWithTheSumsOfEachDayForGenerousC()
        
        let arrayOfDatesOfSumedDictionary = [Date](self.dictionaryWithDateAndSumsOfEachDate.keys)
        print("the array of keys\(arrayOfDatesOfSumedDictionary)")
        
        let arrayOfSumsOfSumedDictionary = [Double](self.dictionaryWithDateAndSumsOfEachDate.values)
        print("the array of values\(arrayOfSumsOfSumedDictionary)")
        
        //In this tuple array therE are not same dates with differentt KEys. EaCH DATE(KEY) HAS ONE DOUBLE(VALUE)*********************
        let tupleArrayOfDatesAndSums = Array(zip(arrayOfDatesOfSumedDictionary,arrayOfSumsOfSumedDictionary))
        
        let sortedTupleArray = tupleArrayOfDatesAndSums.sorted(by:{$0.1 > $1.1})
        
        if sortedTupleArray.isEmpty {
            
        } else {
        self.dateOfMostGenerousDayofC = sortedTupleArray[0].0
        self.costOfMostGenerousDayForC = sortedTupleArray[0].1
        
        self.dateOfMostEconomicDayofC = sortedTupleArray[sortedTupleArray.count - 1].0
        self.costOfMostEconomicDayForC = sortedTupleArray[sortedTupleArray.count - 1].1
        
        
        print(" date GenerousA:\(sortedTupleArray[0].0)")
        print(" cost GenerousA:\(sortedTupleArray[0].1)")
        
        print(" date EconomicA:\(sortedTupleArray[sortedTupleArray.count - 1].0)")
        print(" cost EconomicA:\(sortedTupleArray[sortedTupleArray.count - 1].1)")
        }
    } //FUNCTION
    
    
    
    
    func createTheArrayWithTheSortedYearCostTuplesAndLoadTheVariablesForC(){
        var arrayOfDates = [Date]()
        
        let filteredTableForC = self.tableOfExpenses.filter({$0.kind == "Ccost"})
        
        
        
        for e in filteredTableForC {
            let dateOfCost = e.date
            arrayOfDates.append(dateOfCost! as Date)
        }
        print("the Carray of my dates is:\(arrayOfDates)")
        
        //Now create array of years
        //create arrays of date components
        //the arrays where I will store the values of months years days
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        for dateOfKey in arrayOfDates {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            //let weekday = calendar.component(.weekday, from: date)
            
            /*
             print("\(year)")
             print("\(month)")
             print("\(day)")
             print("\(week)")
             print("\(weekday)")*/
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
        }
        
        print("My array of years is:\(arrayOfYears)")
        
        //Now I will have my array of Size
        var arrayOfSize = [Double]()
        for e in filteredTableForC {
            let sizeOfCost = e.size
            arrayOfSize.append(sizeOfCost)
        }
        print("the array of my size Of cost is:\(arrayOfSize)")
        
        
        
        let tupleYearCost = Array(zip(arrayOfYears, arrayOfSize))
        
        
        print("the tupleArray of my size Of cost is:\(tupleYearCost)")
        
        
        var myDictionaryWithYearsAndCosts: Dictionary<Int, Double> = [:]
        
        for tuple in tupleYearCost {
            myDictionaryWithYearsAndCosts[tuple.0] = (myDictionaryWithYearsAndCosts[tuple.0] ?? 0) + tuple.1
        }
        
        print("the diction is:\(myDictionaryWithYearsAndCosts)")
        
        
        let sortedArrayWithYearsAndCostsTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.0 < $1.0})
        
        print("the sorted diction accoding to year  is actually My array of tuples:\(sortedArrayWithYearsAndCostsTuples)")
        
        let sortedArrayMaxMinOfCostYearTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.1 > $1.1})
        
        print(" BUt the sorted diction accoding to size  is actually My array of tuples:\(sortedArrayMaxMinOfCostYearTuples)")
        
        
        if sortedArrayMaxMinOfCostYearTuples.isEmpty {
            
        } else {
            
            self.yearGenerousOfC = sortedArrayMaxMinOfCostYearTuples[0].key
            self.costOfMostGenerousYearForC = sortedArrayMaxMinOfCostYearTuples[0].value
            
            self.yearEconomicOfC = sortedArrayMaxMinOfCostYearTuples[sortedArrayMaxMinOfCostYearTuples.count - 1].key
            self.costOfMostEconomicYearForC = sortedArrayMaxMinOfCostYearTuples[sortedArrayMaxMinOfCostYearTuples.count - 1].value
        }
        
        
    }//FUNCTION
    
    
    
    
    
    
    
    func createTupleArrayOfYearlySumsForCAndGetMaxMin() {
        
        self.arrayWithSumsofEachYear = []
        createDictionaryWithTheSumsOfEachDayForGenerousC()
        
        
        //Decomposing the dictionary
        let arrayOfDatesOfSumedDictionary = [Date](self.dictionaryWithDateAndSumsOfEachDate.keys)
        print("the array of keys\(arrayOfDatesOfSumedDictionary)")
        
        let arrayOfSumsOfSumedDictionary = [Double](self.dictionaryWithDateAndSumsOfEachDate.values)
        print("the array of values\(arrayOfSumsOfSumedDictionary)")
        
        
        //create arrays of date components
        //the arrays where I will store the values of months years days
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        for dateOfKey in arrayOfDatesOfSumedDictionary {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            let weekday = calendar.component(.weekday, from: date)
            
            
            print("\(year)")
            print("\(month)")
            print("\(day)")
            print("\(week)")
            print("\(weekday)")
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
            //arrayOfSize.append(e.size!)
            // arrayOfDateOfCost.append(e.date)
            
            
            
        }
        
        
        
        
        //In this tuple array therE are not same dates with differentt KEys. EaCH DATE(KEY) HAS ONE DOUBLE(VALUE)*********************
        let tupleArrayOfDatesAndSums = Array(zip(arrayOfYears,arrayOfSumsOfSumedDictionary))
        
        let sortedTupleArray = tupleArrayOfDatesAndSums.sorted(by:{$0.1 > $1.1})
        
        if sortedTupleArray.isEmpty {
            
        } else {
        self.yearGenerousOfC = sortedTupleArray[0].0
        self.costOfMostGenerousYearForC = sortedTupleArray[0].1
        
        self.yearEconomicOfC = sortedTupleArray[sortedTupleArray.count - 1].0
        self.costOfMostEconomicYearForC = sortedTupleArray[sortedTupleArray.count - 1].1
        
        
        print(" date Generous\(sortedTupleArray[0].0)")
        print(" cost Generous\(sortedTupleArray[0].1)")
        
        print(" date Economic\(sortedTupleArray[sortedTupleArray.count - 1].0)")
        print(" cost Economic\(sortedTupleArray[sortedTupleArray.count - 1].1)")
        }
        
        
    } //FUNCTION
    
    
    func createTheArrayWithTheSortedMonthCostTuplesAndLoadTheVariablesForC(){
        var arrayOfDates = [Date]()
        
        let filteredTableForC = self.tableOfExpenses.filter {$0.kind == "Ccost"}
        
        
        for e in filteredTableForC {
            let dateOfCost = e.date
            arrayOfDates.append(dateOfCost! as Date)
        }
        print("the array of my dates is:\(arrayOfDates)")
        
        //Now create array of years
        //create arrays of date components
        //the arrays where I will store the values of months years days
        var arrayOfYears = [Int]()
        var arrayOfMonths = [Int]()
        var arrayOfWeeks = [Int]()
        var arrayOfDays = [Int]()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        for dateOfKey in arrayOfDates {
            
            
            let date = dateOfKey
            let calendar = Calendar.current
            
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let week = calendar.component(.weekOfYear, from: date)
            //let weekday = calendar.component(.weekday, from: date)
            
            /*
             print("\(year)")
             print("\(month)")
             print("\(day)")
             print("\(week)")
             print("\(weekday)")*/
            let components: NSDateComponents = NSDateComponents()
            
            components.year = year
            components.month = month
            components.weekOfYear = week
            components.day = day
            // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            arrayOfYears.append(year)
            arrayOfMonths.append(month)
            arrayOfWeeks.append(week)
            arrayOfDays.append(day)
        }
        
        print("My array of years is:\(arrayOfYears)")
        
        //Now I will have my array of Size
        var arrayOfSize = [Double]()
        for e in filteredTableForC {
            let sizeOfCost = e.size
            arrayOfSize.append(sizeOfCost)
        }
        print("the array of my size Of cost is:\(arrayOfSize)")
        
        //1st)create array eith year and month merged
        // let arrayYearMonth = map(Zip2(arrayOfYears, arrayOfMonths)) { $0 + " " + $1 }
        
        var arrayYearMonth: [String] = []
        
        for index in 0..<arrayOfYears.count {
            arrayYearMonth.append(String(arrayOfYears[index]) + "-" + String(arrayOfMonths[index]))
        }
        print("YEARMONTHEFFECT\(arrayYearMonth)")
        
        
        
        
        //everything is the same  but Int to String
        
        let tupleYearCost = Array(zip(arrayYearMonth, arrayOfSize))
        
        
        print("the tupleArray of my size Of cost is:\(tupleYearCost)")
        
        
        var myDictionaryWithYearsAndCosts: Dictionary<String, Double> = [:]
        
        for tuple in tupleYearCost {
            myDictionaryWithYearsAndCosts[tuple.0] = (myDictionaryWithYearsAndCosts[tuple.0] ?? 0) + tuple.1
        }
        
        print("the diction is:\(myDictionaryWithYearsAndCosts)")
        
        
        let sortedArrayWithYearsAndCostsTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.0 < $1.0})
        
        print("the sorted diction accoding to year  is actually My array of tuples:\(sortedArrayWithYearsAndCostsTuples)")
        
        let sortedArrayMaxMinOfCostYearTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.1 > $1.1})
        
        print(" BUt the sorted diction accoding to size  is actually My array of tuples:\(sortedArrayMaxMinOfCostYearTuples)")
        
        
        
        
        let myDateFormatter = DateFormatter()
        myDateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        myDateFormatter.dateFormat = "yyyy-MM"
        
        
        if sortedArrayMaxMinOfCostYearTuples.isEmpty {
            
        } else {
            //I need to get dates from strings
            let stringOfYearMonth = sortedArrayMaxMinOfCostYearTuples[0].key
            print("STTRRIIIIIIING\(stringOfYearMonth)")
            
            let dateOfGenerousMonth = myDateFormatter.date(from: stringOfYearMonth)
            print("DAAAAAAAAATE\(String(describing: dateOfGenerousMonth))")
            
            
            
            
            let stringEcoYearMonth = sortedArrayMaxMinOfCostYearTuples[sortedArrayMaxMinOfCostYearTuples.count - 1].key
            let dateOfEconomicMonth = myDateFormatter.date(from: stringEcoYearMonth)
            
            self.monthGenerousOfC = dateOfGenerousMonth!
            self.costOfMostGenerousMonthForC = sortedArrayMaxMinOfCostYearTuples[0].value
            
            self.monthEconomicOfC = dateOfEconomicMonth!
            self.costOfMostEconomicMonthForC = sortedArrayMaxMinOfCostYearTuples[sortedArrayMaxMinOfCostYearTuples.count - 1].value
        }
        
        
    }//FUNCTION
    
    func createTheArrayWithTheSortedWeekCostTuplesAndLoadTheVariablesForC(){
        
        let arrayWithExpenses = self.tableOfExpenses.filter {$0.kind == "Ccost"}
        
        //array with date of expenses
        var arrayOfDates = [Date]()
        for e in arrayWithExpenses {
            let dateOfCost = e.date
            arrayOfDates.append(dateOfCost! as Date)
        }
        //from array of dates I get two arrays (One with years[Int] and one with weeks[Int])...
        let arrayOfYears = getArrayOfYears(arrayOfDates: arrayOfDates)
        let arrayOfWeeks = getArrayOfWeeks(arrayOfDates: arrayOfDates)
        
        //...and I combine them in an array with [Strings] of "Year-Week"
        var arrayYearWeek: [String] = []
        for index in 0..<arrayOfYears.count {
            arrayYearWeek.append(String(arrayOfYears[index]) + "-" + String(arrayOfWeeks[index]))
        }
        
        //array of size of cost [Double]
        var arrayOfSize = [Double]()
        for e in arrayWithExpenses {
            let sizeOfCost = e.size
            arrayOfSize.append(sizeOfCost)
        }
        
        //create array of the tuple "Year-Week" and size, as [(String), Double]...
        let tupleYearCost = Array(zip(arrayYearWeek, arrayOfSize))
        
        //...and create a dictionary where the same YearWeeks are in one key and the va;ue of that key is the sum of sizes
        var myDictionaryWithYearsAndCosts: Dictionary<String, Double> = [:]
        for tuple in tupleYearCost {
            myDictionaryWithYearsAndCosts[tuple.0] = (myDictionaryWithYearsAndCosts[tuple.0] ?? 0) + tuple.1
        }
        
        //Get the sorted array of Tuples(YearWeek, Sum) where YearWeek is key and Sum is value,  according to size of sum in the dictionary...
        let sortedArrayMaxMinOfCostYearTuples = myDictionaryWithYearsAndCosts.sorted(by: {$0.1 > $1.1})
        
        if sortedArrayMaxMinOfCostYearTuples.isEmpty {
            
        } else {
            
        //...and if it is not empty extract first day of the week from the String "Year-Week" of the first item, which is the beggining of the most GENEROUS week
        let dateGenerousToLoad = getDateOfWeeksFirstDayWhenGivenAYearWeekString(yearWeek: sortedArrayMaxMinOfCostYearTuples[0].key)
        
        // Also  extract first day of the week from the String "Year-Week" of the LAST item, which is the beggining of the most ECONOMIC week
        let n = sortedArrayMaxMinOfCostYearTuples.count
        let dateEconomicToLoad = getDateOfWeeksFirstDayWhenGivenAYearWeekString(yearWeek: sortedArrayMaxMinOfCostYearTuples[n - 1].key)
        
        
            self.dateOfweekFirstDayGenerousOfC = dateGenerousToLoad
            self.costOfMostGenerousWeekForC = sortedArrayMaxMinOfCostYearTuples[0].value
            
            self.dateOfweekFirstDayEconomicOfC = dateEconomicToLoad
            self.costOfMostEconomicWeekForC = sortedArrayMaxMinOfCostYearTuples[n - 1].value
        }
    }//FUNCTION
    
    
    
    
    
    
    
   
        
        
    
    //MARK:Period Functions
    func calculateDateDifferenceInDays(){
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        //Get the Date from the string
        let dateOfPeriodBeginning = dateFormatter.date(from: self.labelOfStartingDate.text!)
        let dateOfPeriodEnding = dateFormatter.date(from: self.labelOfEndingDate.text!)
        
        
        self.dateDifferenceInDays = Calendar.current.dateComponents([.day], from: dateOfPeriodBeginning!, to: dateOfPeriodEnding!).day! + 1
        print("this period has \(String(describing: self.dateDifferenceInDays)) days")
        
    }
    
    
    func calculateDateDifferenceInWeeks(){
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        //Get the Date from the string
        let dateOfPeriodBeginning = dateFormatter.date(from: self.labelOfStartingDate.text!)
        let dateOfPeriodEnding = dateFormatter.date(from: self.labelOfEndingDate.text!)
        
        
        self.dateDifferenceInWeeks = Calendar.current.dateComponents([.weekOfYear], from: dateOfPeriodBeginning!, to: dateOfPeriodEnding!).weekOfYear! + 1
        print("this period has \(String(describing: self.dateDifferenceInWeeks)) Weeks")
        
    }
    
    func calculateDateDifferenceInMonths(){
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        //Get the Date from the string
        let dateOfPeriodBeginning = dateFormatter.date(from: self.labelOfStartingDate.text!)
        let dateOfPeriodEnding = dateFormatter.date(from: self.labelOfEndingDate.text!)
        
        
        self.dateDifferenceInMonths = Calendar.current.dateComponents([.month], from: dateOfPeriodBeginning!, to: dateOfPeriodEnding!).month! + 1
        print("this period has \(String(describing: self.dateDifferenceInMonths)) Months")
        
    }
    
    
    func calculateDateDifferenceInYears(){
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        //Get the Date from the string
        let dateOfPeriodBeginning = dateFormatter.date(from: self.labelOfStartingDate.text!)
        let dateOfPeriodEnding = dateFormatter.date(from: self.labelOfEndingDate.text!)
        
        
        self.dateDifferenceInYears = Calendar.current.dateComponents([.year], from: dateOfPeriodBeginning!, to: dateOfPeriodEnding!).year! + 1
        print("this period has \(String(describing: self.dateDifferenceInYears)) Years")
        
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}






extension Date {
    
    /// Returns a Date with the specified days added to the one it is called with
    func add(dateToChange: Date, years: Int = 0, months: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date {
        var targetDay = dateToChange
        targetDay = Calendar.current.date(byAdding: .year, value: years, to: dateToChange)!
        targetDay = Calendar.current.date(byAdding: .month, value: months, to: targetDay)!
        targetDay = Calendar.current.date(byAdding: .day, value: days, to: targetDay)!
        targetDay = Calendar.current.date(byAdding: .hour, value: hours, to: targetDay)!
        targetDay = Calendar.current.date(byAdding: .minute, value: minutes, to: targetDay)!
        targetDay = Calendar.current.date(byAdding: .second, value: seconds, to: targetDay)!
        return targetDay
    }
    /*
    /// Returns a Date with the specified days subtracted from the one it is called with
    func subtract(years: Int = 0, months: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date {
        let inverseYears = -1 * years
        let inverseMonths = -1 * months
        let inverseDays = -1 * days
        let inverseHours = -1 * hours
        let inverseMinutes = -1 * minutes
        let inverseSeconds = -1 * seconds
        return add(dateToChange: <#Date#>, years: inverseYears, months: inverseMonths, days: inverseDays, hours: inverseHours, minutes: inverseMinutes, seconds: inverseSeconds)
    }
    */
}

/*
 func findDurationOfPeriodInDays(){
 
 // var salaryTimes : Int = 0
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
 dateFormatter.dateFormat = "dd/MM/yyy"
 
 //Get the Date from the string
 let dateOfPeriodBeginning = dateFormatter.date(from: self.labelOfStartingDate.text!)
 let dateOfPeriodEnding = dateFormatter.date(from: self.labelOfEndingDate.text!)
 
 
 let dateDifferenceInDays = Calendar.current.dateComponents([.day], from: dateOfPeriodBeginning!, to: dateOfPeriodEnding!).day
 
 
 
 //Get the day of the Date and put it on the correct VAR
 dayOfStartingDate = Calendar.current.component(.day, from: dateOfPeriodBeginning!)
 dayOfEndingDate = Calendar.current.component(.day, from: dateOfPeriodEnding!)
 
 //Get the month of the Date and put it on the correct VAR
 monthOfStartingDate = Calendar.current.component(.month, from: dateOfPeriodBeginning!)
 monthOfEndingDate = Calendar.current.component(.month, from: dateOfPeriodEnding!)
 
 //Get the year of the Date and put it on the correct VAR
 yearOfStartingDate = Calendar.current.component(.year, from: dateOfPeriodBeginning!)
 yearOfEndingDate = Calendar.current.component(.year, from: dateOfPeriodEnding!)
 
 
 
 
 
 
 }
 
 */

/*
func groupExpensesOfTheSameDay(){
    var arrayOfYears = [Int]()
    var arrayOfMonths = [Int]()
    var arrayOfWeeks = [Int]()
    var arrayOfDays = [Int]()
    var arrayOfSize = [Double]()
    var arrayOfDateOfCost = [Date]()
    var arrayOfCosts = [OneExpense]()
    
    var arrayOfDailySums = [Double]()
    var sumOfDay = Double()
    
    
    var groupedYears : [[Int]] = []
    var groupedMonths : [[Int]] = []
    var groupedDays : [[Int]] = []
    
    var arrayTest = [Int]()
    var dictionaryOfExpenses: [Int:OneExpense] = [:]
    var dictionaryOfDatedCosts: [Date: [OneExpense]] = [:]
    
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyy"
    
    for e in self.tableOfExpenses {
        
        
        
        
        
        
        let date = e.date
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let week = calendar.component(.weekOfYear, from: date)
        let weekday = calendar.component(.weekday, from: date)
        
        
        print("\(year)")
        print("\(month)")
        print("\(day)")
        print("\(weekday)")
        
        let components: NSDateComponents = NSDateComponents()
        
        components.year = year
        components.month = month
        components.weekOfYear = week
        components.day = day
        // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
        
        arrayOfYears.append(year)
        arrayOfMonths.append(month)
        arrayOfWeeks.append(week)
        arrayOfDays.append(day)
        arrayOfSize.append(e.size!)
        arrayOfDateOfCost.append(e.date)
        
        
        
    }
    
    print("years\(arrayOfYears)")
    print("months\(arrayOfMonths)")
    print("weeks\(arrayOfWeeks)")
    print("days\(arrayOfDays)")
    
    
    
    
    for (index, element) in arrayOfDays.enumerated()
    {
        dictionaryOfExpenses[element] = self.tableOfExpenses[index]
    }
    print("day12\(String(describing: dictionaryOfExpenses[12]?.date)))")
    
    
    
    
    //create a dictionary with arrays of the same date and the key is each date
    
    dictionaryOfDatedCosts = Dictionary(grouping: self.tableOfExpenses, by: { $0.date })
    
    //print("grouped \(String(describing: dictionaryOfDatedCosts[2018/09/12]?.date)))")
    print("NOW")
    print(dictionaryOfDatedCosts)
    
    
    
    
    
    let arrayOfWhateverKeys = dictionaryOfDatedCosts.keys
    
    let arrayOfWhateverValues = [[OneExpense]](dictionaryOfDatedCosts.values)
    
    
    // for i in 0...arrayOfWhateverValues
    print("the item 1 is \(arrayOfWhateverValues[0])")
    
    let sumOFFirstArray = arrayOfWhateverValues[0].reduce(0, {$0 + $1.size!})
    
    print("The sum of day 1 is \(sumOFFirstArray)")
    
    
    
    
    
    for i in 0..<arrayOfWhateverValues.count {
        
        let sumOfWhatever = arrayOfWhateverValues[i].reduce(0, {$0 + $1.size!})
        self.sumOfEachDay = sumOfWhatever
        self.arrayWithSumsofEachDay.append(self.sumOfEachDay)
        
    }
    
    
    
    
    
    
    
    print("the Array UFO with the sums is \(self.arrayWithSumsofEachDay)")
    
    
    
    
    //  print("CHECK\(arrayOfWhateverValues)")
    //   print("CHECK2\(arrayOfWhateverKeys)")
    
    //try to export each array
    var array = [[OneExpense]]()
    for i in 0...dictionaryOfDatedCosts.count {
        // array[i] = dictionaryOfDatedCosts[i]
        
        //   let array = [OneExpense](dictionaryOfDatedCosts.values)
        
    }
    
    
    
    // var myArrayWithSums = [Double]()
    
    //for i in 0..<myArrayWithSums.count  {
    
    
    //for (key, value) in dictionaryOfDatedCosts {
    //    for (key, value) in dictionaryOfDatedCosts {
    //   let newArray = [OneExpense](dictionaryOfDatedCosts.values)
    //      let sum = newArray?.reduce(0, {$0 + $1.size!})
    //      myArrayWithSums[i] = sum!
    
    //  }
    
    //   }
    
    //   print("MY ARRAY is \(myArrayWithSums)")
    /*
     [
     "dinner": [
     StatEvents(name: "dinner", date: "01-01-2015", hours: 1),
     StatEvents(name: "dinner", date: "01-01-2015", hours: 1),
     StatEvents(name: "dinner", date: "01-01-2015", hours: 1)
     ],
     "lunch": [
     StatEvents(name: "lunch", date: "01-01-2015", hours: 1),
     StatEvents(name: "lunch", date: "01-01-2015", hours: 1)
     ]
     */
    
    
    
    
    
    /*
     arrayTest.forEach { element in
     if let index = groupedYears.index(where: {$0.last == element}) {
     groupedYears[index].append(element)
     } else {
     groupedYears.append([element])
     }
     
     }
     
     
     print("grouped years\(arrayTest)")
     */
    
    
    
    
    // let setOfDates = Set<arrayDate>(arrayDate).map{ value in return arrayDate.filter{$0==value}}
    
    let setOfCosts = Set(arrayOfCosts).map{ value in return arrayOfCosts.filter{$0 != value}}
    
    print("The group of costs is \(setOfCosts)")
    
    
    
    /*
     let setOfYears = Set(arrayOfYears).map{ value in return arrayOfYears.filter{$0==value}}
     let setOfMonths = Set(arrayOfMonths).map{ value in return arrayOfMonths.filter{$0==value}}
     let setOfDays = Set(arrayOfDays).map{ value in return arrayOfDays.filter{$0==value}}
     
     
     
     
     
     
     print("The group of years is \(setOfYears)")
     print("The group of months is \(setOfMonths)")
     print("The group of days is \(setOfDays)")
     */
    
    //let arrayDate = zip(arrayOfYears, arrayOfMonths).enumerated().filter{$1.0 != $1.1}
    
    //print("Year and Month\(arrayDate)")
    
    
    
    
    
    
    
    
    for i in 0...arrayOfSize.count - 2  {
        //If we are on the same year
        
        
        
        
        
        
        
        if arrayOfYears[i] == arrayOfYears[i+1] && arrayOfMonths[i] == arrayOfMonths[i+1] && arrayOfDays[i] == arrayOfDays[i+1] {
            self.sumOftheDay  += arrayOfSize[i]
            
            self.sumOftheDay = arrayOfSize.reduce(0, + )
            
            // print("This day costed\(sumOfDay)")
            // arrayOfDailySums.append(sumOfDay)
        }
        // arrayOfDailySums.append(sumOfDay)
        // print("The day \(i) costed\(sumOfDay)")
    }
    arrayOfDailySums.append(sumOfDay)
    print("The day  costed\(self.sumOftheDay)")
    // arrayOfDailySums.append(sumOfTheSameDay)
    // print("\(sumOfTheSameDay)")
    
}//Function





*/






/*
 for e in self.tableOfExpences {
 if let sizeOfEachExpense = e.size {
 total += sizeOfEachExpense
 }*/
//let arrayOfSameYear = arrayOfYears.filter({$0 = $1 })
/*
 let toBeFiltered = ["star0", "star2", "star1", "star0", "star3", "star4"]
 let theFilter = ["star1", "star3"]
 
 let filtered = toBeFiltered.filter { theFilter.contains($0) }
 
 
 for i in 0...arrayOfSize.count - 2 {
 //If we are on the same year
 arrayOfSameYear =
 
 
 */


/*
func createTupleArrayOfYearlySumsAndGetMaxMin() {
    
    self.arrayWithSumsofEachYear = []
    createDictionaryWithTheSumsOfEachDayForGenerous()
    
    
    
    print("The RUN dictonary:\(self.dictionaryWithDateAndSumsOfEachDate)")
    //Decomposing the dictionary
    let arrayOfDatesOfSumedDictionary = [Date](self.dictionaryWithDateAndSumsOfEachDate.keys)
    print("The array of keys:\(arrayOfDatesOfSumedDictionary)")
    
    let arrayOfSumsOfSumedDictionary = [Double](self.dictionaryWithDateAndSumsOfEachDate.values)
    print("The RUN array of values\(arrayOfSumsOfSumedDictionary)")
    
    
    //create arrays of date components
    //the arrays where I will store the values of months years days
    var arrayOfYears = [Int]()
    var arrayOfMonths = [Int]()
    var arrayOfWeeks = [Int]()
    var arrayOfDays = [Int]()
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyy"
    
    
    for dateOfKey in arrayOfDatesOfSumedDictionary {
        
        
        let date = dateOfKey
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let week = calendar.component(.weekOfYear, from: date)
        let weekday = calendar.component(.weekday, from: date)
        
        /*
         print("\(year)")
         print("\(month)")
         print("\(day)")
         print("\(week)")
         print("\(weekday)")*/
        let components: NSDateComponents = NSDateComponents()
        
        components.year = year
        components.month = month
        components.weekOfYear = week
        components.day = day
        // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
        
        arrayOfYears.append(year)
        arrayOfMonths.append(month)
        arrayOfWeeks.append(week)
        arrayOfDays.append(day)
        //arrayOfSize.append(e.size!)
        // arrayOfDateOfCost.append(e.date)
        
        
        
    }
    
    // let arrayTupleYearSum = Zip2Sequence(_sequence1: arrayOfYears, _sequence2: self.arrayWithSumsofEachDay)//ίσως βάλω το arrayOfSumsOfSumedDictionary
    
    //let arrayTupleYearSum = Zip2Sequence(_sequence1: arrayOfYears, _sequence2: arrayOfSumsOfSumedDictionary)
    
    //ορ
    
    let arrayTupleYearSum = Array(zip(arrayOfYears,arrayOfSumsOfSumedDictionary))
    
    //και ξανα δημιουργώ ένα dictionary
    
    var dictionaryOfYearlySums: Dictionary<Int, Double> = [:]
    for tupleYear in arrayTupleYearSum  {
        dictionaryOfYearlySums[tupleYear.0] = (dictionaryOfYearlySums[tupleYear.0] ?? 0) + tupleYear.1
    }
    
    print("the DADA Dictionary \(dictionaryOfYearlySums)")
    
    //and this is the ARRAY with SUMS of each year
    let arrayOfEachYearsSum = [Double](dictionaryOfYearlySums.values)
    print("the DADA ARRAY \(arrayOfEachYearsSum)")
    /////////-----
    
    
    
    
    
    
    
    
    //In this tuple array therE are not same dates with differentt KEys. EaCH DATE(KEY) HAS ONE DOUBLE(VALUE)*********************
    let tupleArrayOfDatesAndSums = Array(zip(arrayOfYears,arrayOfEachYearsSum))//arrayOfSumsOfSumedDictionary))
    
    print("the tupled ARRAY with years and Sum is \(tupleArrayOfDatesAndSums)")
    
    //and now I only have to add the $0.1 when the $0.0 είναι ίδιο
    
    
    
    
    
    let sortedTupleArray = tupleArrayOfDatesAndSums.sorted(by:{$0.1 > $1.1})
    
    if sortedTupleArray.isEmpty{
        
    } else {
        self.yearGenerousOfAll = sortedTupleArray[0].0
        self.costOfMostGenerousYearOfAll = sortedTupleArray[0].1
        
        self.yearEconomicOfAll = sortedTupleArray[sortedTupleArray.count - 1].0
        self.costOfMostEconomicYearOfAll = sortedTupleArray[sortedTupleArray.count - 1].1
        
        
        print(" date Generous\(sortedTupleArray[0].0)")
        print(" cost Generous\(sortedTupleArray[0].1)")
        
        print(" date Economic\(sortedTupleArray[sortedTupleArray.count - 1].0)")
        print(" cost Economic\(sortedTupleArray[sortedTupleArray.count - 1].1)")
        
    }
    
} //FUNCTION

*/


/*-------------------------------------------------------dateOfFirst Day------------------
 //I need to get dates from strings
 let stringOfYearWeek = sortedArrayMaxMinOfCostYearTuples[0].key
 print("STTRRIIIIIIING\(stringOfYearWeek)")
 
 
 let splittedStringArray = stringOfYearWeek.split(separator: "-", maxSplits:1).map(String.init)
 print("obobobooAAaaaaaaa\(splittedStringArray)")
 
 
 
 
 let yearString = splittedStringArray[0]
 let weekOfYearString = splittedStringArray[1]
 
 guard let year = Int(yearString), let weekOfYear = Int(weekOfYearString) else{return}
 let components = DateComponents(weekOfYear:weekOfYear, yearForWeekOfYear: year)
 guard let dateOfGenerousWeekFirstDay = Calendar.current.date(from: components) else {return}
 
 
 let df = DateFormatter()
 df.dateFormat = "yyyy-MM-dd"
 
 
 let outputDate = df.string(from: dateOfGenerousWeekFirstDay)
 
 
 
 
 
 ------------------------------------------------------dateOfFirst Day-----
 
 */


// let dateOfGenerousWeek = myDateFormatter.date(from: stringOfYearWeek)
// print("DAAAAAAAAATE\(String(describing: dateOfGenerousWeek))")




// let stringEcoYearWeek = sortedArrayMaxMinOfCostYearTuples[sortedArrayMaxMinOfCostYearTuples.count - 1].key
// let dateOfEconomicWeek = myDateFormatter.date(from: stringEcoYearWeek)

/*
 //Now create array of years
 //create arrays of date components
 //the arrays where I will store the values of months years days
 var arrayOfYears = [Int]()
 var arrayOfMonths = [Int]()
 var arrayOfWeeks = [Int]()
 var arrayOfDays = [Int]()
 
 let dateFormatter = DateFormatter()
 dateFormatter.dateFormat = "dd/MM/yyy"
 
 
 for dateOfKey in arrayOfDates {
 
 
 let date = dateOfKey
 let calendar = Calendar.current
 
 let year = calendar.component(.year, from: date)
 let month = calendar.component(.month, from: date)
 let day = calendar.component(.day, from: date)
 let week = calendar.component(.weekOfYear, from: date)
 //let weekday = calendar.component(.weekday, from: date)
 
 /*
 print("\(year)")
 print("\(month)")
 print("\(day)")
 print("\(week)")
 print("\(weekday)")*/
 let components: NSDateComponents = NSDateComponents()
 
 components.year = year
 components.month = month
 components.weekOfYear = week
 components.day = day
 // let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
 
 arrayOfYears.append(year)
 arrayOfMonths.append(month)
 arrayOfWeeks.append(week)
 arrayOfDays.append(day)
 }
 */

/*
func loadTheGenerousBlockForWeek(){
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    
    let myFormatter = NumberFormatter()
    myFormatter.numberStyle = .currency
    
    /*
     createTheArrayWithTheSortedWeekCostTuplesAndLoadTheVariables()
     let dateOfGenerousWeekFinalDay = getWeeksFinalDay(weeksFirtsDay: self.dateOfweekFirstDayGenerousOfAll)
     self.labelOfGenerousDateAll.text = dateFormatter.string(from: self.dateOfweekFirstDayGenerousOfAll) + "-" + dateFormatter.string(from: dateOfGenerousWeekFinalDay as Date)
     
     let myFormatter = NumberFormatter()
     myFormatter.numberStyle = .currency
     self.labelOfGenerousAll.text = myFormatter.string(from: self.costOfMostGenerousWeekOfAll as NSNumber)
     */
    // using the GET function for All
    
    let tupleExpected = getDateAndSumOfGenerousAndEconomicWeekGivenAnArrayOfExpenses(arrayOfExpenses: self.tableOfExpenses)
    
    let dateOfGenerousWeekFinalDay = getWeeksFinalDay(weeksFirtsDay: tupleExpected.0)
    self.labelOfGenerousDateAll.text = dateFormatter.string(from: tupleExpected.0) + "-" + dateFormatter.string(from: dateOfGenerousWeekFinalDay as Date)
    self.labelOfGenerousAll.text = myFormatter.string(from:tupleExpected.1 as NSNumber)
    
    
    
    
    //using the GET function for A B C  categories----------------------------------------------
    //for A
    let filteredTableForA = self.tableOfExpenses.filter {$0.kind == "Acost"}
    let tupleExpectedForA = getDateAndSumOfGenerousAndEconomicWeekGivenAnArrayOfExpenses(arrayOfExpenses: filteredTableForA)
    
    let dateOfGenerousWeekFinalDayOfA = getWeeksFinalDay(weeksFirtsDay: tupleExpectedForA.0)
    self.labelOfGenerousDateA.text = dateFormatter.string(from:tupleExpectedForA.0) + "-" + dateFormatter.string(from: dateOfGenerousWeekFinalDayOfA as Date)
    self.labelOfGenerousA.text = myFormatter.string(from: tupleExpectedForA.1 as NSNumber)
    
    
    
    //for B
    let filteredTableForB = self.tableOfExpenses.filter {$0.kind == "Bcost"}
    let tupleExpectedForB = getDateAndSumOfGenerousAndEconomicWeekGivenAnArrayOfExpenses(arrayOfExpenses: filteredTableForB)
    
    let dateOfGenerousWeekFinalDayOfB = getWeeksFinalDay(weeksFirtsDay: tupleExpectedForB.0)
    self.labelOfGenerousDateB.text = dateFormatter.string(from:tupleExpectedForB.0) + "-" + dateFormatter.string(from: dateOfGenerousWeekFinalDayOfB as Date)
    self.labelOfGenerousB.text = myFormatter.string(from: tupleExpectedForB.1 as NSNumber)
    
    //for C
    let filteredTableForC = self.tableOfExpenses.filter {$0.kind == "Ccost"}
    let tupleExpectedForC = getDateAndSumOfGenerousAndEconomicWeekGivenAnArrayOfExpenses(arrayOfExpenses: filteredTableForC)
    
    let dateOfGenerousWeekFinalDayOfC = getWeeksFinalDay(weeksFirtsDay: tupleExpectedForC.0)
    self.labelOfGenerousDateC.text = dateFormatter.string(from:tupleExpectedForC.0) + "-" + dateFormatter.string(from: dateOfGenerousWeekFinalDayOfC as Date)
    
    /*
     createTheArrayWithTheSortedMonthCostTuplesAndLoadTheVariablesForA()
     self.labelOfGenerousDateA.text = dateFormatter.string(from: self.monthGenerousOfA)
     self.labelOfGenerousA.text = myFormatter.string(from: self.costOfMostGenerousMonthForA as NSNumber)
     
     createTheArrayWithTheSortedMonthCostTuplesAndLoadTheVariablesForB()
     self.labelOfGenerousDateB.text = dateFormatter.string(from: self.monthGenerousOfB)
     self.labelOfGenerousB.text = myFormatter .string(from: self.costOfMostGenerousMonthForB as NSNumber)
     
     createTheArrayWithTheSortedMonthCostTuplesAndLoadTheVariablesForC()
     self.labelOfGenerousDateC.text = dateFormatter.string(from: self.monthGenerousOfC)
     self.labelOfGenerousC.text = myFormatter .string(from: self.costOfMostGenerousMonthForC as NSNumber)
     */
    
    loadDeafaultImagesForGenerous()
    
    
    
    
    
}

*/



