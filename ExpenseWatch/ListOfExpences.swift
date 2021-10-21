//
//  ListOfExpences.swift
//  ExpenseWatch
//
//  Created by planB on 2/5/17.
//  Copyright © 2017 Ioannis. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

class ListOfExpences: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating  {
    
    
    //MARK: Outlets
    @IBOutlet weak var pickerOfStartingDate: UIDatePicker!
    @IBOutlet weak var pickerOfEndingDate: UIDatePicker!
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var segmentOfKind: UISegmentedControl!
    @IBOutlet weak var segmentOfPeriod: UISegmentedControl!
    @IBOutlet weak var indicatorOfActivity: UIActivityIndicatorView!
    
    //MARK: Variables
    var coredExpensesArray = [ExpenseCore]()
    var tableOfExpences = [ExpenseCore]()
    var sumOfAllExpenses: Double = 0.00
    var periodExpenses: Double = 0.0
    
    //Regionized
    var stringOfDate: String = "dd/MM/yyyy, HH:mm"
    
    //RepeatedDetection
    var englishDaily = "Daily"
    var englishWeekly = "Weekly"
    var englishMonthly = "Monthly"
    var englishYearly = "Yearly"
    
    var greekDaily = "Καθημερινά"
    var greekWeekly = "Εβδομαδιαία"
    var greekMonthly = "Mensuel"
    var greekYearly = "Ετήσια"
  
    
    var frenchDaily = "Tous les jours"
    var frenchWeekly = "Hebdomadaire"
    var frenchMonthly = "Μηνιαία"
    var frenchYearly = "Annuel"
    
  
    var spanishDaily = "Diario"
    var spanishWeekly = "Semanal"
    var spanishMonthly = "Mensual"
    var spanishYearly = "Anual"
    
    var italianDaily = "Quotidiano"
    var italianWeekly = "Settimanale"
    var italianMonthly = "Mensile"
    var italianYearly = "Annuale"
    
 
    
    var germanDaily = "Täglich"
    var germanWeekly = "Wöchentlich"
    var germanMonthly = "Monatlich"
    var germanYearly = "Jährlich"
    
    var chineseDaily = "日常"
    var chineseWeekly = "每周"
    var chineseMonthly = "每月"
    var chineseYearly = "每年"
  
    
    var russianDaily = "Ежедневно"
    var russianWeekly = "Еженедельноy"
    var russianMonthly = "Ежемесячно"
    var russianYearly = "Ежегодно"
    
    
    

    
    
    //Search Related
    var searchController : UISearchController!
    var resultsController = UITableViewController()
    var search = UISearchController(searchResultsController: nil)
    var searchActive: Bool = false
    var isSearching: Bool = false
    var filteredTable = [ExpenseCore]()
    var textThatWasSearched: String?
    //==========================Effort to have the right date on Report==================================
    //=========because if load is not pressed the date label shows wrong dates on report=================
    var selectedDStartingDate = Date()
    var selectedEndingDate = Date()
    
    //=====================================================================================================
   
    //MARK: -Fetching
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
    
    func fetchyData(){
        fetchData {(done) in
            if done {
                if coredExpensesArray.count > 0{
                    print("There are stoered items")
                }
                
            } else {
                print("data not Fetched")
            }
        }
    }
    
    
    
    
    func fetchMyData(){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ExpenseCore")
       
        do{
            coredExpensesArray = try managedContext.fetch(request) as! [ExpenseCore]
            
            print("Data fetched")
        } catch {
            print("Unable to fetch data:", error.localizedDescription)
            
        }
        
    }
    /*
    func fetchMyDataAccordingToNoteAttribute(noteOfExpense: String) -> (){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ExpenseCore")
        let predicateSameNote = NSPredicate(format: "note == %@", noteOfExpense)
        request.predicate = predicateSameNote
        do{
            coredExpensesArray = try managedContext.fetch(request) as! [ExpenseCore]
            
            print("Data fetched")
        } catch {
            print("Unable to fetch data:", error.localizedDescription)
            
        }
        
    }
    */
    
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
    
    
    func fetchByDateAndSearchedText(from: Date, until: Date, withText: String){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let myRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ExpenseCore")
        
        // let predicateFiltered = NSPredicate(format: "note == '\(String(describing: filteredBy))'")
        //let predicateFiltered = NSPredicate(format: "(date >= %@)", from AND "(date <= %@)", until)
        let datePredicate = NSCompoundPredicate(type: .and, subpredicates: [NSPredicate(format: "date >= %@", from as CVarArg), NSPredicate(format: "date =< %@", until as CVarArg), NSPredicate(format: "note CONTAINS[cd] %@", withText as CVarArg)])
        
        
        myRequest.predicate = datePredicate
        
        do {
            self.coredExpensesArray = try managedContext.fetch(myRequest) as! [ExpenseCore]
        } catch {
            print("Unable to fetch data:", error.localizedDescription)
        }
        
    }
    
    
    func fetchByDateKindAndSearchedText(from: Date, until: Date, ofKind: String, withText: String){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let myRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ExpenseCore")
        
        // let predicateFiltered = NSPredicate(format: "note == '\(String(describing: filteredBy))'")
        //let predicateFiltered = NSPredicate(format: "(date >= %@)", from AND "(date <= %@)", until)
        let datePredicate = NSCompoundPredicate(type: .and, subpredicates: [NSPredicate(format: "date >= %@", from as CVarArg), NSPredicate(format: "date =< %@", until as CVarArg), NSPredicate(format: "kind = %@", ofKind as CVarArg), NSPredicate(format: "note CONTAINS[cd] %@", withText as CVarArg)]) //$letter
        
        
        myRequest.predicate = datePredicate
        
        do {
            self.coredExpensesArray = try managedContext.fetch(myRequest) as! [ExpenseCore]
        } catch {
            print("Unable to fetch data:", error.localizedDescription)
        }
        
    }
    
 
    
    
    
    
    
    
    //MARK:Searching Ability
    //SEARCH======================================================================
    //The main searching function that is called in  updateSearchResul
    func filterContentForSearchText(_ searchText: String) {
        
        if  searchText == ""{
            isSearching = false
            view.endEditing(true)
            tableView.reloadData()
            
            
            self.setPickersDateAccordingToTheSelectedPeriodSegment()
            self.loadFullOrFilteredExpenses()
            print("nothing to search for")
        } else {
             isSearching = true
            
           self.filteredTable = self.tableOfExpences.filter( { (e:ExpenseCore) -> Bool in
               return (e.note?.lowercased().contains(searchText.lowercased()))!
           })
            self.tableView.reloadData()
            self.sortTheFilteredTable()
            sumFilteredExpenses()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            isSearching = true
            self.filteredTable = self.tableOfExpences.filter( { (e:ExpenseCore) -> Bool in
                return (e.note?.lowercased().contains(searchText.lowercased()))!
            })
            self.tableView.reloadData()
            sumFilteredExpenses()
        }
        //self.tableView.reloadData()
        //sumFilteredExpenses()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
       // self.tableView.reloadData()
      //  self.sortTheFilteredTable()
      //  sumFilteredExpenses()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchActive = true
        self.isSearching = true
        print("DID BEGIN")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.searchActive = false
       self.isSearching = false
         print("DID END")
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchActive = false
        self.isSearching = false
         print("CANCELED")
    }
    
    func  searchBarIsEmpty() -> Bool {
        //Returns true if the text is Empty or Nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    
    
    
    
    //SEARCH======================================================================
    
   
    //MARK: Arrange HeaderView
    
    
    func setStartingPickersDateToMonthsFirstDay(){
        
        let date = Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
       // let day = calendar.component(.day, from: date)

        let components: NSDateComponents = NSDateComponents()
        components.year = year
        components.month = month
        components.day = 1
        let defaultDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
        self.pickerOfStartingDate.date = defaultDate as Date
       
        
    }
    
    
    func setPickersDateAccordingToTheSelectedPeriodSegment(){
        //starting Date----------------
        let date = Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let weekday = calendar.component(.weekday, from: date)
        
        
        let components: NSDateComponents = NSDateComponents()
        
        
        
        
        
        if segmentOfPeriod.selectedSegmentIndex == 0 {
            
            components.year = year
            components.month = month
            components.day = day
            let defaultDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            
            
            self.pickerOfStartingDate.date = defaultDate as Date
            
            components.year = year
            components.month = month
            components.day = day
            let endingDefaultDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            
            self.pickerOfEndingDate.date = endingDefaultDate as Date
            
            print ("the ending Date is\(pickerOfEndingDate.date)")
            
            //self.navigationItem.rightBarButtonItem?.isEnabled = false
            
        } else if segmentOfPeriod.selectedSegmentIndex == 1 {
            
            //From the 1st day of the week
            components.year = year
            
            
            //The fisrt day of the month only monday keeps the same month
            
            if day == 1 {
                
                if weekday == 1 {
                    components.month = month
                    components.day = day - 6
                } else if weekday == 2  {
                    components.month = month
                    components.day = day
                } else if weekday == 3 {
                    components.month = month
                    components.day = day - 1
                } else if weekday == 4 {
                    components.month = month
                    components.day = day - 2
                } else if weekday == 5 {
                    components.month = month
                    components.day = day - 3
                    components.month = month
                } else if weekday == 6 {
                    components.month = month
                    components.day = day - 4
                } else if weekday == 7 {
                    components.month = month
                    components.day = day - 5
                }
                
                
                //The 2nd day of the month monday and Tuesday keep the same month
                
            } else if day == 2 {
                
                if weekday == 1 {
                    components.month = month
                    components.day = day - 6
                } else if weekday == 2  {
                    components.month = month
                    components.day = day
                } else if weekday == 3 {
                    components.month = month
                    components.day = day - 1
                } else if weekday == 4 {
                    components.month = month
                    components.day = day - 2
                } else if weekday == 5 {
                    components.month = month
                    components.day = day - 3
                } else if weekday == 6 {
                    components.month = month
                    components.day = day - 4
                } else if weekday == 7 {
                    components.month = month
                    components.day = day - 5
                }
                
                //The 3d day of the month monday and Tuesday and Wednesday keep the same month
            } else if day == 3 {
                
                if weekday == 1 {
                    components.month = month
                    components.day = day - 6
                } else if weekday == 2  {
                    components.month = month
                    components.day = day
                } else if weekday == 3 {
                    components.month = month
                    components.day = day - 1
                } else if weekday == 4 {
                    components.month = month
                    components.day = day - 2
                } else if weekday == 5 {
                    components.month = month
                    components.day = day - 3
                } else if weekday == 6 {
                    components.month = month
                    components.day = day - 4
                } else if weekday == 7 {
                    components.month = month
                    components.day = day - 5
                }
                //The 4th day of the month Monday,Tuesday, Wednesday and Thursday keep the same month
            }  else if day == 4 {
                
                if weekday == 1 {
                    components.month = month - 1
                    components.day = day - 6
                } else if weekday == 2  {
                    components.month = month
                    components.day = day
                } else if weekday == 3 {
                    components.month = month
                    components.day = day - 1
                } else if weekday == 4 {
                    components.month = month
                    components.day = day - 2
                } else if weekday == 5 {
                    components.month = month
                    components.day = day - 3
                } else if weekday == 6 {
                    components.month = month - 1
                    components.day = day - 4
                } else if weekday == 7 {
                    components.month = month - 1
                    components.day = day - 5
                }
                
                //The 5th day of the month Monday,Tuesday,Wednesday,Thursday and Friday keep the same month  AND SATURDAY
            } else if day == 5 {
                
                if weekday == 1 {
                    components.month = month - 1
                    components.day = day - 6
                } else if weekday == 2  {
                    components.month = month
                    components.day = day
                } else if weekday == 3 {
                    components.month = month
                    components.day = day - 1
                } else if weekday == 4 {
                    components.month = month
                    components.day = day - 2
                } else if weekday == 5 {
                    components.month = month
                    components.day = day - 3
                } else if weekday == 6 {
                    components.month = month
                    components.day = day - 4
                } else if weekday == 7 {
                    components.month = month// - 1
                    components.day = day - 5
                }
                //The 6th day of the month Monday,Tuesday,Wednesday,Thursday,Friday and Saturday keep the same month
            } else if day == 6 {
                
                if weekday == 1 {
                    components.month = month //- 1
                    components.day = day - 6
                } else if weekday == 2  {
                    components.month = month
                    components.day = day
                } else if weekday == 3 {
                    components.month = month
                    components.day = day - 1
                } else if weekday == 4 {
                    components.month = month
                    components.day = day - 2
                } else if weekday == 5 {
                    components.month = month
                    components.day = day - 3
                } else if weekday == 6 {
                    components.month = month
                    components.day = day - 4
                } else if weekday == 7 {
                    components.month = month
                    components.day = day - 5
                }
                //The 7th day of the month Monday,Tuesday,Wednesday,Thursday,Friday,Saturday and Sunday keep the same month
            } else if day >= 7 {
                
                if weekday == 1 {
                    components.month = month
                    components.day = day - 6
                } else if weekday == 2  {
                    components.month = month
                    components.day = day
                } else if weekday == 3 {
                    components.month = month
                    components.day = day - 1
                } else if weekday == 4 {
                    components.month = month
                    components.day = day - 2
                } else if weekday == 5 {
                    components.month = month
                    components.day = day - 3
                } else if weekday == 6 {
                    components.month = month
                    components.day = day - 4
                } else if weekday == 7 {
                    components.month = month
                    components.day = day - 5
                }
                
            }//and for everyday with day > 7 every weekday keeps the same month
            
            
            
            
            
            let defaultDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            //In order to load correct starting dTE WHEN IN MANUAL MODE
            
            self.pickerOfStartingDate.date = defaultDate as Date
            
            //until today
            components.month = month
            components.day = day
            let endingDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            self.pickerOfEndingDate.date = endingDate as Date
            // self.navigationItem.rightBarButtonItem?.isEnabled = false
            
            
        } else if segmentOfPeriod.selectedSegmentIndex == 2 {
            
            // self.navigationItem.rightBarButtonItem?.isEnabled = true
            //From the 1st day of the month
            components.year = year
            components.month = month
            components.day = 1
            let defaultDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            self.pickerOfStartingDate.date = defaultDate as Date
            
            //until today
            components.day = day
            let endingDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            self.pickerOfEndingDate.date = endingDate as Date
            
        } else if segmentOfPeriod.selectedSegmentIndex == 3 {
            
            // self.navigationItem.rightBarButtonItem?.isEnabled = true
            //From the 1st day of the quarter
            components.year = year
            
            
            
            if month >= 1 && month <= 3 {
                components.month = 1
            } else if month >= 4 && month <= 6 {
                components.month = 4
            }  else if month >= 7 && month <= 9 {
                components.month = 7
            } else if month >= 10 && month <= 12 {
                components.month = 10
            }
            
            
            
            
            
            components.day = 1
            let defaultDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            self.pickerOfStartingDate.date = defaultDate as Date
            
            
            //until today
            components.month = month
            components.day = day
            let endingDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            self.pickerOfEndingDate.date = endingDate as Date
            
            
            
            
        } else if segmentOfPeriod.selectedSegmentIndex == 4 {
            
            
            //  self.navigationItem.rightBarButtonItem?.isEnabled = true
            
            //From the 1st day of the year
            components.year = year
            components.month = 1
            components.day = 1
            let defaultDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            self.pickerOfStartingDate.date = defaultDate as Date
            
            //until today
            components.month = month
            components.day = day
            let endingDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
            self.pickerOfEndingDate.date = endingDate as Date
            
            
            
            
            
            
        } else if segmentOfPeriod.selectedSegmentIndex == 5 {
            
            //extemely helpfulf as it brings the pickers to the right place NO MATTER WHAT------------------------
            self.pickerOfStartingDate.date = self.selectedDStartingDate
            self.pickerOfEndingDate.date = self.selectedEndingDate
            
            
            
        }
        
        
        /*
         components.year = year
         components.month = month
         components.day = 1
         let defaultDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
         self.startingDate.date = defaultDate as Date
         
         */
        // loadExpensesForWhateverDatePickersShow()
        
        
        
        
        
        
        
        
        
        
        //and enable the report button if All Segment Index is selected
        enableOrDisableReportBarButton()
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func enableOrDisableReportBarButton(){
        if segmentOfKind.selectedSegmentIndex == 0 {
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        } else  {
             self.navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
    
    func dateOrderAlertAndReportLocker(){
        if pickerOfStartingDate.date > pickerOfEndingDate.date{
            //DisableReport
            self.navigationItem.rightBarButtonItem?.isEnabled = false
            
            //ShowAlert
            let dateOrderAlert = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                     message: LocalizedString.dateOrderAlert.localized,
                                                     preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                         style: UIAlertAction.Style.default,
                                         handler: nil)
            
            dateOrderAlert.addAction(okAction)
            
            self.present(dateOrderAlert, animated:true, completion: nil)
        }
    }
        
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: Expenses to be shown
    
    //Puts all the expenses of the range into a tableOfExpenses[OneExpense]=======WrongName==============================
    
    func showListOfExpenses(){
       
     fetchByDate(from: self.pickerOfStartingDate.date, until: self.pickerOfEndingDate.date)
        if coredExpensesArray.count > 0 {
      self.tableOfExpences = self.coredExpensesArray
        }
    }//Func
    
    
    
    
    func showListOfFilteredExpenses(){
        let date1 = self.pickerOfStartingDate.date
        let date2 = self.pickerOfEndingDate.date
        let searchText = self.textThatWasSearched
        
        fetchByDateAndSearchedText(from: date1, until: date2, withText: searchText!)
        
        if coredExpensesArray.count > 0 {
            self.filteredTable = self.coredExpensesArray
        }
        
        
        
        
        
        /*
         func showListOfFilteredExpenses(){
        fetchData {(done) in
            if done {
                print("data ready to load")
                
                if coredExpensesArray.count > 0 {
                    for e in coredExpensesArray {
                        if (e.date! as Date) >= pickerOfStartingDate.date && (e.date! as Date) <= pickerOfEndingDate.date && (e.note?.lowercased().contains(String(describing: self.searchController.searchBar.text).lowercased()))!{
                            self.filteredTable.append(e)
                        }//if
                    }//For
                }//count>1
                
            } else {
                print("data not Fetched")
            }
        }//Fetch*/
        
        
    }//Func
    
    
    
    func showListOfKindSegmentedExpenses() {
        let date1 = self.pickerOfStartingDate.date
        let date2 = self.pickerOfEndingDate.date
        
        
         if self.segmentOfKind.selectedSegmentIndex == 0 {
            fetchByDate(from: date1, until: date2)
         } else if self.segmentOfKind.selectedSegmentIndex == 1 {
           fetchByDateAndKind(from: date1, until: date2, ofKind: "Acost")
        } else if self.segmentOfKind.selectedSegmentIndex == 2 {
             fetchByDateAndKind(from: date1, until: date2, ofKind: "Bcost")
        } else if self.segmentOfKind.selectedSegmentIndex == 3 {
             fetchByDateAndKind(from: date1, until: date2, ofKind: "Ccost")
        }
            
        
    }//FUNC
    
    
    
    /*
    
    func  showListOfFilteredKindSegmentedExpenses() {
        let date1 = self.pickerOfStartingDate.date
        let date2 = self.pickerOfEndingDate.date
        let searchText = self.searchController.searchBar.text?.lowercased()
        
        
        if self.segmentOfKind.selectedSegmentIndex == 0 {
            fetchByDateAndSearchedText(from: date1, until: date2, withText: searchText!)
        } else if self.segmentOfKind.selectedSegmentIndex == 1 {
            fetchByDateKindAndSearchedText(from: date1, until: date2, ofKind: "Acost", withText: searchText!)
        } else if self.segmentOfKind.selectedSegmentIndex == 2 {
           fetchByDateKindAndSearchedText(from: date1, until: date2, ofKind: "Bcost", withText: searchText!)
        } else if self.segmentOfKind.selectedSegmentIndex == 3 {
            fetchByDateKindAndSearchedText(from: date1, until: date2, ofKind: "Ccost", withText: searchText!)
        
        }
    
    }//Func
    */
    
    
    
    
    
    
    
    
    
    
    
    
   //SUMMING-----------------------------------------------
    
    func sumExpenses(){
      
        
        let sum = self.tableOfExpences.reduce(0, {$0 + $1.size})
        
        self.sumOfAllExpenses = sum
        
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        let stringOfFormattedTotalCost = myFormatter.string(from: self.sumOfAllExpenses as NSNumber)!
        self.totalCostLabel.text = stringOfFormattedTotalCost
        
        //self.indicatorOfActivity.stopAnimating()
     //  self.totalCostLabel.text = String(total)
        // self.navigationItem.title = String(total)
        //return total
    }
    
    func sumFilteredExpenses(){
        
         let sum = self.filteredTable.reduce(0, {$0 + $1.size})
        
        self.sumOfAllExpenses = sum
        
        let myFormatter = NumberFormatter()
        myFormatter.numberStyle = .currency
        let stringOfFormattedTotalCost = myFormatter.string(from: self.sumOfAllExpenses as NSNumber)!
        self.totalCostLabel.text = stringOfFormattedTotalCost
        
    }
    
    
    
    //Sorting The Table=====================================================================================
    
    func sortTheTable(){
        
        // let sortedTable = tableOfExpences.sorted(by: { $0.date > $1.date})
        let sortedTable = tableOfExpences.sorted(by: {$0.date?.compare($1.date! as Date) == ComparisonResult.orderedDescending })
        self.tableOfExpences = sortedTable
        
        
    }
    
    
    func sortTheFilteredTable(){
        
        let sortedTable = filteredTable.sorted(by: {$0.date?.compare($1.date! as Date) == ComparisonResult.orderedDescending })
        self.filteredTable = sortedTable
        
        
    }

    
    
    
    
   
    //MARK: Actions
    
    @IBAction func actionOfStartingDate(_ sender: Any) {
        if pickerOfStartingDate.date <= pickerOfEndingDate.date {
                if isSearching{
                fetchExpensesForFilteredSegmentedDateRangeAndLoadFilteredTable()
                self.tableView.reloadData()
                sortTheFilteredTable()
                sumFilteredExpenses()
            } else {
                 fetchExpensesForSegmentedDateRangeAndLoadTableOfExpenses()
                //loadExpensesForDispatchedSegmentedDateRange()
                self.tableView.reloadData()
                sortTheTable()
                sumExpenses()
            }
            
            //ReportDateCorrection---------------------------------------
            self.selectedDStartingDate = pickerOfStartingDate.date
            self.selectedEndingDate = pickerOfEndingDate.date
            //ReportDateCorrection---------------------------------------
            
            //and enable the report button if All Segment Index is selected
            
        enableOrDisableReportBarButton()
        segmentOfPeriod.selectedSegmentIndex = 6

        } else {//dates reversed
            dateOrderAlertAndReportLocker()
        }
    
       segmentOfPeriod.selectedSegmentIndex = 5
        self.indicatorOfActivity.stopAnimating()
    }
    
    
    
    
    @IBAction func sctionOfEndingDate(_ sender: Any) {
        self.indicatorOfActivity.startAnimating()
       /* //unlock The Report Button if it was locked before (but check if segment =1)
        if segmentToLoad.selectedSegmentIndex == 0 {
           // self.navigationItem.rightBarButtonItem?.isEnabled = true
        }*/
        
    print("The ending date picked is \(pickerOfEndingDate.date)")
        
        if pickerOfStartingDate.date <= pickerOfEndingDate.date {
            // loadExpensesForDateRange()
            
           
            
            if isSearching {
                fetchExpensesForFilteredSegmentedDateRangeAndLoadFilteredTable()
                self.tableView.reloadData()
                sortTheFilteredTable()
                sumFilteredExpenses()
                
            } else {
               // loadExpensesForSegmentedDateRange()
                fetchExpensesForSegmentedDateRangeAndLoadTableOfExpenses()
               // loadExpensesForDispatchedSegmentedDateRange()
               // loadExpensesForExtraDispatchedSegmentedDateRange()
                self.tableView.reloadData()
                sortTheTable()
                sumExpenses()
                
            }
            
            
            //ReportDateCorrection---------------------------------------
            self.selectedDStartingDate = pickerOfStartingDate.date
            self.selectedEndingDate = pickerOfEndingDate.date
            //ReportDateCorrection---------------------------------------
            
            
            //and enable the report button if All Segment Index is selected
            
           enableOrDisableReportBarButton()
            
            
         print("The ending date picked is \(pickerOfEndingDate.date)")
            
        } else {
            dateOrderAlertAndReportLocker()
        }
       segmentOfPeriod.selectedSegmentIndex = 5
       self.indicatorOfActivity.stopAnimating()
        
    }
    
    
    
    @IBAction func actionOfPeriodPickersDate(_ sender: Any) {
        
        setPickersDateAccordingToTheSelectedPeriodSegment()
        loadFullOrFilteredExpenses()
       
        
    }
    
    
    
    
    @IBAction func actionOfKindSegmentChange(_ sender: Any) {
        if pickerOfStartingDate.date <= pickerOfEndingDate.date {
            // loadExpensesForDateRange()
            
            if isSearching {
                fetchExpensesForFilteredSegmentedDateRangeAndLoadFilteredTable()
                self.tableView.reloadData()
                sortTheFilteredTable()
                sumFilteredExpenses()
                
                
            } else {
               // loadExpensesForSegmentedDateRange()
                fetchExpensesForSegmentedDateRangeAndLoadTableOfExpenses()
                self.tableView.reloadData()
                sortTheTable()
                sumExpenses()
                
            }
            
            /*
            loadExpensesForSegmentedDateRange()
            self.tableView.reloadData()
            sortTheTable()
            sumExpenses()
            */
            
            enableOrDisableReportBarButton()
            
            //ReportDateCorrection---------------------------------------
            self.selectedDStartingDate = pickerOfStartingDate.date
            self.selectedEndingDate = pickerOfEndingDate.date
            //ReportDateCorrection---------------------------------------
        }
    }
    
    
    
    
    
    //MARK: Fetch&Load According to picker/segment
   
    //LOADING================================================
    
    
    func loadFullOrFilteredExpenses(){
        if pickerOfStartingDate.date <= pickerOfEndingDate.date + 1 {
            
            if isSearching {
                
                fetchExpensesForFilteredSegmentedDateRangeAndLoadFilteredTable()
                self.tableView.reloadData()
                sortTheFilteredTable()
                sumFilteredExpenses()
                
            } else {
            
                fetchExpensesForSegmentedDateRangeAndLoadTableOfExpenses()
                self.tableView.reloadData()
                sortTheTable()
                sumExpenses()
                
            }
            //ReportDateCorrection---------------------------------------
            self.selectedDStartingDate = pickerOfStartingDate.date
            self.selectedEndingDate = pickerOfEndingDate.date
            //ReportDateCorrection---------------------------------------
        }
    }
    
    //Smart Loading-------------------------------
    
    
    
    func fetchExpensesForSegmentedDateRangeAndLoadTableOfExpenses(){
       
        let date = pickerOfEndingDate.date
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        // let weekday = calendar.component(.weekday, from: date)
        
        let components: NSDateComponents = NSDateComponents()
        
        components.year = year
        components.month = month
        components.day = day + 1
        let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
        
        let date1 = pickerOfStartingDate.date
        let date2 = philleasFogDate as Date
        
        if self.segmentOfKind.selectedSegmentIndex == 0 {
              fetchByDate(from: date1, until: date2)
        } else if self.segmentOfKind.selectedSegmentIndex == 1 {
             fetchByDateAndKind(from: date1, until: date2, ofKind: "Acost")
        } else if self.segmentOfKind.selectedSegmentIndex == 2 {
             fetchByDateAndKind(from: date1, until: date2, ofKind: "Bcost")
        } else {
            fetchByDateAndKind(from: date1, until: date2, ofKind: "Ccost")
        }
        
        
        
        self.tableOfExpences = []
        if coredExpensesArray.count > 0 {
           self.tableOfExpences = coredExpensesArray
        }
    }//Func
    
    
    
    
    
    
    func fetchExpensesForFilteredSegmentedDateRangeAndLoadFilteredTable(){
 
        let date = pickerOfEndingDate.date
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        // let weekday = calendar.component(.weekday, from: date)
        
        let components: NSDateComponents = NSDateComponents()
        
        components.year = year
        components.month = month
        components.day = day + 1
        let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
        
        let date1 = pickerOfStartingDate.date
        let date2 = philleasFogDate as Date
        let searchText = self.searchController.searchBar.text?.lowercased()
        self.textThatWasSearched = searchText
        
        print("seeeeeeearch \(String(describing: self.textThatWasSearched))")
        
        // if coredExpensesArray.count > 1 {
        if self.segmentOfKind.selectedSegmentIndex == 0 {
            fetchByDateAndSearchedText(from: date1, until: date2, withText: searchText!)
        } else if self.segmentOfKind.selectedSegmentIndex == 1 {
            fetchByDateKindAndSearchedText(from: date1, until: date2, ofKind: "Acost", withText: searchText!)
        } else if self.segmentOfKind.selectedSegmentIndex == 2 {
             fetchByDateKindAndSearchedText(from: date1, until: date2, ofKind: "Bcost", withText: searchText!)
        } else {
            fetchByDateKindAndSearchedText(from: date1, until: date2, ofKind: "Ccost", withText: searchText!)
        }
        
       // }
        
        self.filteredTable = []
        if coredExpensesArray.count > 0 {
            self.filteredTable = coredExpensesArray
        }
        // print ("the text in the SEARCH BAR is \(String(describing: self.searchController.searchBar.text))")
        //  print ("and the note of the expense is \(String(describing: e.note))")
        
        
        
    }//FUNCTION END
    
    
    
    
  

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering(){
            return filteredTable.count
        } else {
            return tableOfExpences.count
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellOfExpencesTableViewCell
        
        
        
        if isFiltering(){
            
            let myOneExpense = self.filteredTable[indexPath.row]
            if myOneExpense.size != nil  {
                
                //Arrangement Of the cell
                
                //DATE
                cell.nameCellLabel?.text = String(describing: myOneExpense.note!)
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale.current
                dateFormatter.dateFormat = stringOfDate.regionize()
                cell.dateCellLabel?.text = dateFormatter.string(from: myOneExpense.date! as Date)//String(describing: myOneExpense.date)
                
                
                //COST
                let myFormatter = NumberFormatter()
                myFormatter.numberStyle = .currency
                myFormatter.locale = Locale.current
                let stringOfFormattedCostSize = myFormatter.string(from: myOneExpense.size as NSNumber)!
                cell.sizeCellLabel?.text = stringOfFormattedCostSize
                
                //COLOR the cash/card payments accordingly
                
                if myOneExpense.cash {
                    //Dark White MODE===========================
                        if #available(iOS 13.0, *) {
                        if self.traitCollection.userInterfaceStyle == .dark {
                            cell.sizeCellLabel.textColor = UIColor.white
                        } else {
                            cell.sizeCellLabel.textColor = UIColor.black
                        }
                   
                       } else { //Νο ios13
                        cell.sizeCellLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                      }
                    
                    //Dark White MODE============================
                   
                    
                    
                    
                    
                } else {//card
                    cell.sizeCellLabel?.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
                    
                }
                
                
                //allocate the right image for each segment
                
                
                if myOneExpense.kind == "Acost" {
                    
                    
                    if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
                        let picture = UIImage(data: imageData as Data)
                        cell.kindCellImage.image = picture
                    } else {
                        cell.kindCellImage.image = UIImage(named: ImagesOfCategories.icon1.rawValue)!
                    }
                    
                    
                    
                } else if myOneExpense.kind == "Bcost" {
                    
                    
                    if let imageData = UserDefaults.standard.value(forKey:"iconSelectedForB") as? NSData{
                        let picture = UIImage(data: imageData as Data)
                        cell.kindCellImage.image = picture
                    } else {
                        cell.kindCellImage.image = UIImage(named: ImagesOfCategories.icon2.rawValue)!
                    }
                    
                    
                    
                } else if myOneExpense.kind == "Ccost" {
                    
                    
                    if let imageData = UserDefaults.standard.value(forKey:"iconSelectedForC") as? NSData{
                        let picture = UIImage(data: imageData as Data)
                        cell.kindCellImage.image = picture
                    } else {
                        cell.kindCellImage.image = UIImage(named: ImagesOfCategories.icon3.rawValue)!
                    }
                    
                    
                }
                
                
            } else {
                cell.nameCellLabel?.text = "No Cost"
            }
            
            
            
            
            
            
            return cell
            
            //if is not searching
        } else {
            
            
            let myOneExpense = self.tableOfExpences[indexPath.row]
            
            
            if myOneExpense.size != nil  {
                
                
                //Arrangement Of the cell
                
                cell.nameCellLabel?.text = String(describing: myOneExpense.note!)
                
                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale.current
                dateFormatter.dateFormat = stringOfDate.regionize()
                cell.dateCellLabel?.text = dateFormatter.string(from: myOneExpense.date! as Date)//String(describing: myOneExpense.date)
                
                
                
                //Formatting CURRENCY to show----------------------
                let myFormatter = NumberFormatter()
                myFormatter.numberStyle = .currency
                //myFormatter.locale = Locale.current
                let stringOfFormattedCostSize = myFormatter.string(from: myOneExpense.size as NSNumber)!
                
                cell.sizeCellLabel?.text = stringOfFormattedCostSize
                
                
                
                //Color the cash/card payments accordingly
                if myOneExpense.cash {
                    //Dark White MODE===========================
                        if #available(iOS 13.0, *) {
                        if self.traitCollection.userInterfaceStyle == .dark {
                            cell.sizeCellLabel.textColor = UIColor.white
                        } else {
                            cell.sizeCellLabel.textColor = UIColor.black
                        }
                   
                       } else { //Νο ios13
                        cell.sizeCellLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                      }
                    
                    //Dark White MODE============================
                } else {
                    cell.sizeCellLabel?.textColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
                    
                }
                
                
                //allocate the right image for each segment
                if myOneExpense.kind == "Acost" {
                    if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
                        let picture = UIImage(data: imageData as Data)
                        cell.kindCellImage.image = picture
                    } else {
                        cell.kindCellImage.image = UIImage(named: ImagesOfCategories.icon1.rawValue)!
                    }
                    
                    
                } else if myOneExpense.kind == "Bcost" {
                    if let imageData = UserDefaults.standard.value(forKey:"iconSelectedForB") as? NSData{
                        let picture = UIImage(data: imageData as Data)
                        cell.kindCellImage.image = picture
                    } else {
                        cell.kindCellImage.image = UIImage(named: ImagesOfCategories.icon2.rawValue)!
                    }
                } else if myOneExpense.kind == "Ccost" {
                    if let imageData = UserDefaults.standard.value(forKey:"iconSelectedForC") as? NSData{
                        let picture = UIImage(data: imageData as Data)
                        cell.kindCellImage.image = picture
                    } else {
                        cell.kindCellImage.image = UIImage(named: ImagesOfCategories.icon3.rawValue)!
                    }
                    
                    
                }
                
                
            } else {
                cell.nameCellLabel?.text = "No Cost"
            }
            
            return cell
            //if tested for filter
        }
        
        
        
        
        
        // return cell
    }
    
    
    
    
    
    
    
    
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Show the POP UP VIEW>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        
        let chosenIndex = indexPath.row
        
        if isFiltering() {
            performSegue(withIdentifier: "detailSegue", sender: filteredTable[chosenIndex])
        } else {
            performSegue(withIdentifier: "detailSegue", sender: tableOfExpences[chosenIndex])
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
     //MARK: Edit the Table
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    //hiding the keyboard=========================================================
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        self.searchController.searchBar.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //hiding the keyboard=========================================================
    
   
    
    func deleteData(indexPath: IndexPath){
      guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
     managedContext.delete(tableOfExpences[indexPath.row])
        do {
            try managedContext.save()
            print("Expense Deleted")
           
        } catch {
            print("Failed to Delete", error.localizedDescription)
          
        }
    }
    
    func deleteFilteredData(indexPath: IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        managedContext.delete(filteredTable[indexPath.row])
        do {
            try managedContext.save()
            print("Expense Deleted")
            
        } catch {
            print("Failed to Delete", error.localizedDescription)
            
        }
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
   
          if !isSearching {
            
            
            //Check if it is a repeated cost
            let checkedFileNameBeforeDeletion = (tableOfExpences[indexPath.row].note?.description)
            
            //AllLanguages in case of changing Lang on the run
            //Daily
            if (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.dailyNote.localized))! ||
               (checkedFileNameBeforeDeletion?.hasPrefix(englishDaily))! ||
               (checkedFileNameBeforeDeletion?.hasPrefix(greekDaily))! ||
               (checkedFileNameBeforeDeletion?.hasPrefix(frenchDaily))! ||
               (checkedFileNameBeforeDeletion?.hasPrefix(spanishDaily))! ||
               (checkedFileNameBeforeDeletion?.hasPrefix(germanDaily))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(italianDaily))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(chineseDaily))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(russianDaily))! ||
             //Weekly
                (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.weeklyNote.localized))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(englishWeekly))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(greekWeekly))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(frenchWeekly))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(spanishWeekly))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(germanWeekly))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(italianWeekly))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(chineseWeekly))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(russianWeekly))! ||
             //Monthly
                (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.monthlyNote.localized))!  ||
                (checkedFileNameBeforeDeletion?.hasPrefix(englishMonthly))!  ||
                (checkedFileNameBeforeDeletion?.hasPrefix(greekMonthly))!  ||
                (checkedFileNameBeforeDeletion?.hasPrefix(frenchMonthly))!  ||
                (checkedFileNameBeforeDeletion?.hasPrefix(spanishMonthly))!  ||
                (checkedFileNameBeforeDeletion?.hasPrefix(germanMonthly))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(italianMonthly))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(chineseMonthly))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(russianMonthly))! ||
             //Yearly
                (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.yearlyNote.localized))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(englishYearly))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(greekYearly))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(frenchYearly))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(spanishMonthly))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(germanYearly))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(italianYearly))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(chineseYearly))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(russianYearly))!          {
                
                //Ok, it is a repeated Cost, so bring on the Alert and ask what the user want to delete
                let repeatedCostAlert = UIAlertController(title: LocalizedString.fixCostAlert.localized,
                                                          message: LocalizedString.whatFixToDelete.localized,
                                                          preferredStyle: UIAlertController.Style.actionSheet)
                
                
               
                
                //ACTION 1: delete only this occurence
                repeatedCostAlert.addAction(UIAlertAction(title: LocalizedString.justOne.localized, style: .default, handler:{(action) in
                
                    self.deleteData(indexPath: indexPath)
                    self.fetchyData()
                    self.tableOfExpences.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    self.sumExpenses()
                 }))
                
                //ACTION 2: delete all future fix costs with this name
                repeatedCostAlert.addAction(UIAlertAction(title:LocalizedString.futureFix.localized, style: .default, handler:{(action) in
                 
                    
                    guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
                    
                    let fetchToDelete = NSFetchRequest<NSFetchRequestResult>(entityName: "ExpenseCore")
                    
                    let noteOfSelectedItem = self.tableOfExpences[indexPath.row].note
                    let dateOfSelectedItem = self.tableOfExpences[indexPath.row].date
                    let predicateSameFutureNote = NSCompoundPredicate(type: .and, subpredicates: [NSPredicate(format: "note =[cd] %@", noteOfSelectedItem! as CVarArg), NSPredicate(format: "date >= %@", dateOfSelectedItem! as CVarArg)])
                    
                   
                    fetchToDelete.predicate = predicateSameFutureNote
                    
                    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchToDelete)
                    do{
                        try managedContext.execute(deleteRequest)
                        print("We Deleted Futures Massively")
                    } catch {
                        print("Failed to Delete Futures Massively", error.localizedDescription)
                    }
                    
                    
                    self.fetchyData()
                    self.tableOfExpences.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    
                    self.segmentOfPeriod.selectedSegmentIndex = 0
                    self.setPickersDateAccordingToTheSelectedPeriodSegment()
                    self.loadFullOrFilteredExpenses()
                
                    //delete the reminder
                    //let sizeOfSelectedItem = self.tableOfExpences[indexPath.row].size
                    //let reminderID = noteOfSelectedItem! + String(sizeOfSelectedItem)
                    //self.deletePendingReminder(withID: reminderID)
 
                    
                    
                    
                    
                    
                    
                 }))
 
                
                
                
                  //ACTION 3: delete all fix costs with this name from start to finish
                  repeatedCostAlert.addAction(UIAlertAction(title: LocalizedString.totalFix.localized, style: .default, handler:{(action) in
                    
                    
                guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
                
                let fetchToDelete = NSFetchRequest<NSFetchRequestResult>(entityName: "ExpenseCore")
                
                let noteOfSelectedItem = self.tableOfExpences[indexPath.row].note
                let predicateSameNote = NSPredicate(format: "note =[cd] %@", noteOfSelectedItem!)//"note == %@"
                fetchToDelete.predicate = predicateSameNote
                
                let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchToDelete)
                do{
                    try managedContext.execute(deleteRequest)
                    print("We Deleted Massively")
                } catch {
                    print("Failed to Delete Massively", error.localizedDescription)
                }
                
                
                self.fetchyData()
                //remove from table
                self.tableOfExpences.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
                //Once I delete I move to Daily
                self.segmentOfPeriod.selectedSegmentIndex = 0
                self.setPickersDateAccordingToTheSelectedPeriodSegment()
                self.loadFullOrFilteredExpenses()
 
                    //delete the reminder
                    //let sizeOfSelectedItem = self.tableOfExpences[indexPath.row].size
                    //let reminderID = noteOfSelectedItem! + String(sizeOfSelectedItem)
                    //self.deletePendingReminder(withID: reminderID)
                
                 }))
     
                //Cancel
                 repeatedCostAlert.addAction(UIAlertAction(title:LocalizedString.cancelFixDeletion.localized, style: .cancel, handler:{(action) in
                 print("Canceled ")
     
                  }))
     
     
                   //in order to present the alert
                //------------------------------------------For the iPad>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                if let popoverController = repeatedCostAlert.popoverPresentationController {
                    popoverController.sourceView = self.view
                    popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                    popoverController.permittedArrowDirections = []
                }
                //------------------------------------------For the iPad<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                
                  present(repeatedCostAlert, animated:true, completion: nil)
               
                
                
               
            } else {//deleteOneSingleCost
                
                self.deleteData(indexPath: indexPath)
                self.fetchyData()
                self.tableOfExpences.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                self.sumExpenses()
                
            }//deleteOneSingleCost
            
            
            
            
            
            
            
            
            
            } else {//if it is Searching use filteredTable
            
            //Check if it is a repeated searched cost
            let checkedFileNameBeforeDeletion = (filteredTable[indexPath.row].note?.description)
            
            //AllLanguages in case of changing Lang on the run
            //Daily
            if (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.dailyNote.localized))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(englishDaily))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(greekDaily))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(frenchDaily))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(spanishDaily))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(germanDaily))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(italianDaily))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(chineseDaily))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(russianDaily))! ||
                
                //Weekly
                (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.weeklyNote.localized))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(englishWeekly))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(greekWeekly))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(frenchWeekly))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(spanishWeekly))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(germanWeekly))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(italianWeekly))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(chineseWeekly))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(russianWeekly))! ||
                //Monthly
                (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.monthlyNote.localized))!  ||
                (checkedFileNameBeforeDeletion?.hasPrefix(englishMonthly))!  ||
                (checkedFileNameBeforeDeletion?.hasPrefix(greekMonthly))!  ||
                (checkedFileNameBeforeDeletion?.hasPrefix(frenchMonthly))!  ||
                (checkedFileNameBeforeDeletion?.hasPrefix(spanishMonthly))!  ||
                (checkedFileNameBeforeDeletion?.hasPrefix(germanMonthly))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(italianMonthly))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(chineseMonthly))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(russianMonthly))! ||
                //Yearly
                (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.yearlyNote.localized))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(englishYearly))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(greekYearly))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(frenchYearly))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(spanishMonthly))! ||
                (checkedFileNameBeforeDeletion?.hasPrefix(germanYearly))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(italianYearly))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(chineseYearly))! ||
                 (checkedFileNameBeforeDeletion?.hasPrefix(russianYearly))!     {
                
                //Ok, it is a repeated searched Cost, so bring on the Alert and ask what the user want to delete
                let repeatedCostAlert = UIAlertController(title: LocalizedString.fixCostAlert.localized,
                                                          message: LocalizedString.whatFixToDelete.localized,
                                                          preferredStyle: UIAlertController.Style.actionSheet)
                //ACTION 1: delete only this occurence of searched Cost
                repeatedCostAlert.addAction(UIAlertAction(title: LocalizedString.justOne.localized, style: .default, handler:{(action) in
                    
                    self.deleteFilteredData(indexPath: indexPath)
                    self.fetchyData()
                    self.filteredTable.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    self.sumFilteredExpenses()
                }))
                
                //ACTION 2: delete all future fix costs with this name
                repeatedCostAlert.addAction(UIAlertAction(title:LocalizedString.futureFix.localized, style: .default, handler:{(action) in
                
                    guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
                    
                    let fetchToDelete = NSFetchRequest<NSFetchRequestResult>(entityName: "ExpenseCore")
                    
                    let noteOfSelectedItem = self.filteredTable[indexPath.row].note
                    let dateOfSelectedItem = self.filteredTable[indexPath.row].date
                    let predicateSameFutureNote = NSCompoundPredicate(type: .and, subpredicates: [NSPredicate(format: "note =[cd] %@", noteOfSelectedItem! as CVarArg), NSPredicate(format: "date >= %@", dateOfSelectedItem! as CVarArg)])
                    
                    
                    fetchToDelete.predicate = predicateSameFutureNote
                    
                    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchToDelete)
                    do{
                        try managedContext.execute(deleteRequest)
                        print("We Deleted Futures Massively")
                    } catch {
                        print("Failed to Delete Futures Massively", error.localizedDescription)
                    }
                    
                    
                    
                    self.fetchyData()
                    
                    //remove from table
                    self.filteredTable.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    
                    //Once I delete I move to Daily
                    self.segmentOfPeriod.selectedSegmentIndex = 0
                    self.setPickersDateAccordingToTheSelectedPeriodSegment()
                    self.loadFullOrFilteredExpenses()
                    
                    //delete the reminder
                    //let sizeOfSelectedItem = self.tableOfExpences[indexPath.row].size
                    //let reminderID = noteOfSelectedItem! + String(sizeOfSelectedItem)
                    //self.deletePendingReminder(withID: reminderID)
                 }))
                
                  //ACTION 3: delete all fix costs with this name from start to finish
                repeatedCostAlert.addAction(UIAlertAction(title: LocalizedString.totalFix.localized, style: .default, handler:{(action) in
                    
                    guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
                    
                    let fetchToDelete = NSFetchRequest<NSFetchRequestResult>(entityName: "ExpenseCore")
                    
                    let noteOfSelectedItem = self.filteredTable[indexPath.row].note
                    let predicateSameNote = NSPredicate(format: "note =[cd] %@", noteOfSelectedItem!)//"note == %@"
                    fetchToDelete.predicate = predicateSameNote
                    
                    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchToDelete)
                    do{
                        try managedContext.execute(deleteRequest)
                        print("We Deleted Massively")
                    } catch {
                        print("Failed to Delete Massively", error.localizedDescription)
                    }
                    
                    self.fetchyData()
                    
                    //remove from table
                    self.filteredTable.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    
                    //Once I delete I move to Daily
                    self.segmentOfPeriod.selectedSegmentIndex = 0
                    self.setPickersDateAccordingToTheSelectedPeriodSegment()
                    self.loadFullOrFilteredExpenses()
                    
                    //delete the reminder
                    //let sizeOfSelectedItem = self.tableOfExpences[indexPath.row].size
                    //let reminderID = noteOfSelectedItem! + String(sizeOfSelectedItem)
                    //self.deletePendingReminder(withID: reminderID)
                    
                }))
                
                
                //Cancel
                repeatedCostAlert.addAction(UIAlertAction(title:LocalizedString.cancelFixDeletion.localized, style: .cancel, handler:{(action) in
                    print("Canceled ")
                    
                }))
                
                //------------------------------------------For the iPad>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                if let popoverController = repeatedCostAlert.popoverPresentationController {
                    popoverController.sourceView = self.view
                    popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                    popoverController.permittedArrowDirections = []
                }
                //------------------------------------------For the iPad<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                
                //in order to present the alert while in search
                if let presentedVC = presentedViewController {
                    presentedVC.present(repeatedCostAlert, animated:true, completion: nil)
                } else {
                    
                    present(repeatedCostAlert, animated:true, completion: nil)
                }
                
               
                
                
                
                
                
            } else { //deleteOneSearchedSingleCost
                
                self.deleteFilteredData(indexPath: indexPath)
                self.fetchyData()
                self.filteredTable.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                self.sumFilteredExpenses()
                
            }//deleteOneSearchedSingleCost
        }//searching
    }//FuncEnds
    
    
    
    func deletePendingReminder(withID:String){
        UNUserNotificationCenter.current().getPendingNotificationRequests { (notificationRequests) in
            var identifiers: [String] = []
            for notification:UNNotificationRequest in notificationRequests {
                if notification.identifier == withID {
                    identifiers.append(notification.identifier)
                }
            }
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
        }
    }
    
    
    
    
    // MARK: - View Load & Appear
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let myVC = storyboard?.instantiateViewController(withIdentifier: "popUpDetailID") as? PopUpViewController
        myVC!.tableDelegate = self
        
        setStartingPickersDateToMonthsFirstDay()
        
        self.navigationItem.backBarButtonItem?.title = "+"
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        self.navigationItem.rightBarButtonItem?.title = LocalizedString.navItemListRight.localized
        
        //SegmentOfKind
        self.segmentOfKind.setTitle(LocalizedString.allinListSegment.localized, forSegmentAt: 0)
        self.segmentOfKind.setTitle(LocalizedString.AInListSegment.localized, forSegmentAt: 1)
        self.segmentOfKind.setTitle(LocalizedString.BinListSegment.localized, forSegmentAt: 2)
        self.segmentOfKind.setTitle(LocalizedString.CinListSegment.localized, forSegmentAt: 3)
        //SegmentOfPeriod
        self.segmentOfPeriod.setTitle(LocalizedString.todayInPeriodSegment.localized, forSegmentAt: 0)
        self.segmentOfPeriod.setTitle(LocalizedString.weekInPeriodSegment.localized, forSegmentAt: 1)
        self.segmentOfPeriod.setTitle(LocalizedString.monthInPeriodSegment.localized, forSegmentAt: 2)
        self.segmentOfPeriod.setTitle(LocalizedString.quarterInPeriodSegment.localized, forSegmentAt: 3)
        self.segmentOfPeriod.setTitle(LocalizedString.yearInPeriodSegment.localized, forSegmentAt: 4)
        self.segmentOfPeriod.setTitle(LocalizedString.manuallyInPeriodSegment.localized, forSegmentAt: 5)
        
        
        
        //SEARCH BAR proudly presented in the code below========================
        self.searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = self.searchController
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.obscuresBackgroundDuringPresentation = false
        //self.searchController.searchBar.becomeFirstResponder()
        self.definesPresentationContext = true
        
        
        //SEARCH BAR proudly presented in the code above========================
        
        self.totalCostLabel.layer.cornerRadius = 7
        self.segmentOfPeriod.selectedSegmentIndex = 2
        
        //==========================Effort to have the right date on Report==================================
        //=========because if load is not pressed the date label shows wrong dates on report=================
        self.selectedDStartingDate = pickerOfStartingDate.date
        self.selectedEndingDate = pickerOfEndingDate.date
        //=====================================================================================================
        
        sortTheTable()
        sumExpenses()
        self.indicatorOfActivity.stopAnimating()
        
      
        
    }
    
    
    
    
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
       updateTable()
      
        
       // if self.searchController.searchBar.text == "" {
            if !isFiltering() {
        showListOfExpenses()
        fetchExpensesForSegmentedDateRangeAndLoadTableOfExpenses()
        sortTheTable()
        sumExpenses()
          } else {
         showListOfFilteredExpenses()
         fetchExpensesForFilteredSegmentedDateRangeAndLoadFilteredTable()
         sortTheFilteredTable()
         sumFilteredExpenses()
         }
        
       
        
        //==========================Effort to have the right date on Report==================================
        //=========because if load is not pressed the date label shows wrong dates on report=================
        self.selectedDStartingDate = pickerOfStartingDate.date
        self.selectedEndingDate = pickerOfEndingDate.date
        //=====================================================================================================
        /*
        self.showListOfExpenses()
        self.fetchExpensesForSegmentedDateRangeAndLoadTableOfExpenses()
        self.sortTheTable()
        self.sumExpenses()
        */
        self.setPickersDateAccordingToTheSelectedPeriodSegment()
        self.loadFullOrFilteredExpenses()
        self.tableView.reloadData()
 
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        updateTable()
        
        // if self.searchController.searchBar.text == "" {
        showListOfExpenses()
        //loadExpensesForSegmentedDateRange()
        fetchExpensesForSegmentedDateRangeAndLoadTableOfExpenses()
        sortTheTable()
        sumExpenses()
        /*   } else {
         showListOfFilteredExpenses()
         loadCoredExpensesForFilteredSegmentedDateRange()
         sortTheFilteredTable()
         sumFilteredExpenses()
         }*/
        
        //  loadTheArrayWithallTheStoredFilenames()
        
        //==========================Effort to have the right date on Report==================================
        //=========because if load is not pressed the date label shows wrong dates on report=================
        
        self.selectedDStartingDate = pickerOfStartingDate.date
        self.selectedEndingDate = pickerOfEndingDate.date
        
        
        //=====================================================================================================
        // sumExpenses()
        self.setPickersDateAccordingToTheSelectedPeriodSegment()
        self.loadFullOrFilteredExpenses()
        self.tableView.reloadData()
 
    }
    
    
   
    
    
    // MARK: - Navigation
    
    
    @IBAction func unwindToList(segue: UIStoryboardSegue){
        if segue.identifier == "unwindToList" {
        self.loadFullOrFilteredExpenses()
        tableView.reloadData()
        print("I unwinded ok")
        }
    }//unwind
    
    
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
  if  segue.identifier == "reportSegue" {
    
    let aNiceDestination = segue.destination as! ReportViewController
   
       aNiceDestination.tableOfExpenses = self.tableOfExpences
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
        
        
        
        //==========================Effort to have the right date on Report==================================
        //=========because if load is not pressed the date label shows wrong dates on report=================
        
        
        let strDate = dateFormatter.string(from: selectedDStartingDate)     //dateFormatter.string(from: startingDate.date)
        let fnsDate = dateFormatter.string(from: selectedEndingDate)        //dateFormatter.string(from: endingDate.date)
        
        //ensure that the ending date is later than starting date==================================
        if self.pickerOfStartingDate.date <= self.pickerOfEndingDate.date {
        aNiceDestination.reportStartingDate = strDate
        aNiceDestination.reportEndingDate = fnsDate
        } else {
            aNiceDestination.reportStartingDate = LocalizedString.attentionAlert.localized
            aNiceDestination.reportEndingDate = "Date Order!!!"
        }
        
  } else if segue.identifier  == "detailSegue" {
    let detailView = segue.destination as! PopUpViewController
    
    //--===
    //==========================Effort to have the right date on Report==================================
    //=========because if load is not pressed the date label shows wrong dates on report=================
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale.current
    dateFormatter.locale = Locale.current
    dateFormatter.dateFormat = stringOfDate.regionizeWithoutHours()
    
    
    
    let strDate = dateFormatter.string(from: selectedDStartingDate)     //dateFormatter.string(from: startingDate.date)
    let fnsDate = dateFormatter.string(from: selectedEndingDate)        //dateFormatter.string(from: endingDate.date)
    
    //ensure that the ending date is later than starting date==================================
    if self.pickerOfStartingDate.date <= self.pickerOfEndingDate.date {
        detailView.loadedStartingDate = strDate
        detailView.loadedEndingDate = fnsDate
    } else {
        detailView.loadedStartingDate = "Attention!!!"
        detailView.loadedEndingDate = "Date Order!!!"
    }
    
    //--===
    
    
    
    
    
    
    let myIndexPath = self.tableView.indexPathForSelectedRow!
    let row = myIndexPath.row
    
   
    
    if isSearching{
        detailView.receivedSizeOfCost = filteredTable[row].size
        //detailView.receivedExpenseID = filteredTable[row].expenseID!
        detailView.receivedNoteOfTheCost = filteredTable[row].note!
        detailView.receivedCashCardState = filteredTable[row].cash
        
        if filteredTable[row].kind! == "Acost"{
            detailView.receivedSegment = 0
        } else if filteredTable[row].kind! == "Bcost" {
            detailView.receivedSegment = 1
        } else {
            detailView.receivedSegment = 2
        }
        
        detailView.receivedDate = filteredTable[row].date! as Date
       // detailView.receivedFilePath = filteredTable[row].filePath!
        
    } else {
    
        detailView.receivedSizeOfCost = tableOfExpences[row].size
       // detailView.receivedExpenseID = tableOfExpences[row].expenseID!
        detailView.receivedNoteOfTheCost = tableOfExpences[row].note ?? "ψοστ"
        detailView.receivedCashCardState = tableOfExpences[row].cash
        
        if tableOfExpences[row].kind! == "Acost"{
            detailView.receivedSegment = 0
        } else if tableOfExpences[row].kind! == "Bcost" {
            detailView.receivedSegment = 1
        } else {
            detailView.receivedSegment = 2
        }
        
        detailView.receivedDate = tableOfExpences[row].date! as Date
      //  detailView.receivedFilePath = tableOfExpences[row].filePath!
        
    }
        }//we are in detail segue
    }//FuncEnds

    
    
    //============================================================
    //============================================================
    //============================================================
    //============================================================
    //============================================================

    
    
    

    
    
//This is the last and crucial Parenthesis======================================================================
}

//============================================================
//============================================================
//============================================================
//============================================================
//============================================================



extension ListOfExpences: UpdateTableDelegate {

    
    func updateTable() {
        print("Delegate serves")
        self.loadFullOrFilteredExpenses()
        self.tableView.reloadData()
    }
    
  
    
    
    
    
    
}//ext













/*
 
 let nf = NumberFormatter()
 nf.locale = Locale.current
 let numberLocalized = nf.number(from: txtAlcool.text!)
 
 
 */

/*
 func loadTheArrayWithallTheStoredFilenames(){
 
 self.arrayOfStoredFileNames = []
 let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
 let paths:[String] = Bundle.paths(forResourcesOfType: "dat", inDirectory: documentsPath)
 for path in paths{
 
 print("loading expense \(path)")
 if !path.hasSuffix("expenseID.dat") && !path.hasSuffix("salary.dat") && !path.hasSuffix("mode.dat") {
 let e:OneExpense = NSKeyedUnarchiver.unarchiveObject(withFile: path) as! OneExpense
 let nameOfTheFile = e.expenseID
 arrayOfStoredFileNames.append(nameOfTheFile!)
 }
 }
 print("The array with the stored nameof the files is \(arrayOfStoredFileNames)")
 for (index, value) in arrayOfStoredFileNames.enumerated() {
 print("In position \(index) we find \(value) " )
 }
 
 
 
 
 
 }
 //let filename = URL(fileURLWithPath: #file).lastPathComponent
 */

//==============================================================


/*
 func loadArrayWithAllTheStoredExpenses(){
 self.arrayWithAllStoredExpenses = []
 let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
 let paths:[String] = Bundle.paths(forResourcesOfType: "dat", inDirectory: documentsPath)
 for path in paths{
 
 print("loading expense \(path)")
 if !path.hasSuffix("expenseID.dat") && !path.hasSuffix("salary.dat") && !path.hasSuffix("mode.dat") {
 let e:OneExpense = NSKeyedUnarchiver.unarchiveObject(withFile: path) as! OneExpense
 
 arrayWithAllStoredExpenses.append(e)
 }
 
 //Loop Ends
 }
 
 //func Ends
 }*/


//==========================Effort to have the right data on DetailPopUp==================================

//var chosenCell: Int = 0
//var chosenPath: String = ""
// var chosenSize: Float = 0.0
//var chosenID: Int = 0







//=========================
/*
func loadArrayWithAllTheStoredCoredExpenses(){
    
    fetchData {(done) in
        if done {
            print("data ready to load")
            
        } else {
            print("data not Fetched")
        }
    }
}//func Ends

*/

/*
 func showListOfFilteredExpenses(){
 fetchData {(done) in
 if done {
 print("data ready to load")
 
 if coredExpensesArray.count > 0 {
 for e in coredExpensesArray {
 if (e.date! as Date) >= pickerOfStartingDate.date && (e.date! as Date) <= pickerOfEndingDate.date && (e.note?.lowercased().contains(String(describing: self.searchController.searchBar.text).lowercased()))!{
 self.filteredTable.append(e)
 }//if
 }//For
 }//count>1
 
 } else {
 print("data not Fetched")
 }
 }//Fetch*/


/*
 
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
 
 tableView.beginUpdates()
 if editingStyle == .delete {
 
 
 if isSearching {
 
 //REMOVING FROM THE STORED VALUES=====================for the ZERO item and the Rest=========================
 
 if indexPath.row > 0 {
 //FIRST FOR THE NON ZERO ITEMS--------------
 
 
 
 //Check if it is a repeated cost
 let checkedFileNameBeforeDeletion = (filteredTable[indexPath.row].note?.description)
 
 if (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.dailyNote.localized))! || (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.weeklyNote.localized))! || (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.monthlyNote.localized))!  || (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.yearlyNote.localized))!{
 
 //Ok, it is a repeated Cost, so bring on the Alert and ask what the user want to delete
 
 
 
 let repeatedCostAlert = UIAlertController(title: LocalizedString.fixCostAlert.localized,
 message: LocalizedString.whatFixToDelete.localized,
 preferredStyle: UIAlertControllerStyle.actionSheet)
 
 
 
 
 
 
 //ACTION 1: delete only this occurence
 repeatedCostAlert.addAction(UIAlertAction(title: LocalizedString.justOne.localized, style: .default, handler:{(action) in
 
 
 print("I delete just This")
 let fileNameToBeDeleted = (self.filteredTable[indexPath.row].expenseID?.description)! + ".dat"
 print("The name of the file to be deleted is \(fileNameToBeDeleted)")
 var pathOfTheFile = (self.filteredTable[indexPath.row].filePath)
 //print("The name of the path with the file to be deleted is \(String(describing: pathOfTheFile))")
 // We find the document directory on the device
 
 let documentPathOfDirectoriesForTheFile : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
 if documentPathOfDirectoriesForTheFile.count > 0 {
 let onePathOfDirectories = documentPathOfDirectoriesForTheFile[0]
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
 
 
 
 
 
 
 // Delete the row from the data source===================== for the NON ZERO item =====================
 
 self.filteredTable.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 print("the removed from the table expence is the \(String(describing: self.filteredTable[indexPath.row-1].expenseID))")
 print("We had bought a \(String(describing: self.filteredTable[indexPath.row-1].note))")
 
 
 // End of Delete the row from the data source===================== for the NON ZERO item =====================
 
 
 
 
 }))
 
 
 
 
 //ACTION 2: delete all future fix costs with this name
 repeatedCostAlert.addAction(UIAlertAction(title:LocalizedString.futureFix.localized, style: .default, handler:{(action) in
 print("I delete all the future costs")
 
 
 self.loadArrayWithAllTheStoredCoredExpenses()
 
 
 
 
 
 let arrayOfExpensesWithFutureDates = self.arrayWithAllStoredExpenses.filter {($0.date! as Date) >= (self.filteredTable[indexPath.row].date as! Date) }
 
 let arrayOfExpensesToBeDeleted = arrayOfExpensesWithFutureDates.filter {$0.note == self.filteredTable[indexPath.row].note}
 
 
 
 
 
 
 
 //print("*****You choose to delete all with name: \(String(describing: self.tableOfExpences[indexPath.row].note))")
 
 
 //for (i,item) in arrayDelete.enumerated() {
 for i in 0...arrayOfExpensesToBeDeleted.count - 1 {
 
 
 // print ("************\(String(describing: item.note)) will be deleted--------------- ")
 
 
 
 
 ////=======================================
 let fileNameToBeDeleted = (arrayOfExpensesToBeDeleted[i].expenseID?.description)! + ".dat"
 print("The name of the file to be deleted is \(fileNameToBeDeleted)")
 var pathOfTheFile = (arrayOfExpensesToBeDeleted[i].filePath)
 print("The name of the path with the file to be deleted is \(String(describing: pathOfTheFile))")
 // We find the document directory on the device
 
 let documentPathOfDirectoriesForTheFile : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
 if documentPathOfDirectoriesForTheFile.count > 0 {
 let onePathOfDirectories = documentPathOfDirectoriesForTheFile[0]
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
 
 ////=======================================
 
 }
 //Loop Ends
 
 
 //  let arrayOfCommonItems = arrayOfExpensesToBeDeleted.filter {(OneExpense) -> Bool in
 //      return self.tableOfExpences.contains(OneExpense)}
 
 
 self.filteredTable.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 
 self.segmentOfPeriod.selectedSegmentIndex = 0
 
 self.setPickersDateAccordingToTheSelectedPeriodSegment()
 self.loadExpensesForWhateverDatePickersShow()
 
 
 
 
 
 
 
 
 
 }))
 
 
 
 //ACTION 3: delete all fix costs with this name from start to finish
 
 
 
 repeatedCostAlert.addAction(UIAlertAction(title: LocalizedString.totalFix.localized, style: .default, handler:{(action) in
 print("I delete all ")
 
 
 self.loadArrayWithAllTheStoredCoredExpenses()
 
 //var arrayOfExpensesToBeDeleted = [OneExpense]()
 let arrayOfExpensesToBeDeleted = self.arrayWithAllStoredExpenses.filter {$0.note == self.filteredTable[indexPath.row].note}
 
 print("*****You choose to delete all with name: \(String(describing: self.filteredTable[indexPath.row].note))")
 
 
 //for (i,item) in arrayDelete.enumerated() {
 for i in 0...arrayOfExpensesToBeDeleted.count - 1 {
 
 
 // print ("************\(String(describing: item.note)) will be deleted--------------- ")
 
 
 
 
 ////=======================================
 let fileNameToBeDeleted = (arrayOfExpensesToBeDeleted[i].expenseID?.description)! + ".dat"
 print("The name of the file to be deleted is \(fileNameToBeDeleted)")
 var pathOfTheFile = (arrayOfExpensesToBeDeleted[i].filePath)
 print("The name of the path with the file to be deleted is \(String(describing: pathOfTheFile))")
 // We find the document directory on the device
 
 let documentPathOfDirectoriesForTheFile : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
 if documentPathOfDirectoriesForTheFile.count > 0 {
 let onePathOfDirectories = documentPathOfDirectoriesForTheFile[0]
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
 
 ////=======================================
 
 }
 //Loop Ends
 
 
 //  let arrayOfCommonItems = arrayOfExpensesToBeDeleted.filter {(OneExpense) -> Bool in
 //      return self.tableOfExpences.contains(OneExpense)}
 
 
 self.filteredTable.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 
 self.segmentOfPeriod.selectedSegmentIndex = 0
 
 self.setPickersDateAccordingToTheSelectedPeriodSegment()
 self.loadExpensesForWhateverDatePickersShow()
 
 
 
 
 
 
 
 
 }))
 
 repeatedCostAlert.addAction(UIAlertAction(title:LocalizedString.cancelFixDeletion.localized, style: .cancel, handler:{(action) in
 print("Canceled ")
 
 }))
 
 
 //in order to present the alert while in search
 if let presentedVC = presentedViewController {
 presentedVC.present(repeatedCostAlert, animated:true, completion: nil)
 } else {
 present(repeatedCostAlert, animated:true, completion: nil)
 }
 
 
 
 // self.present(repeatedCostAlert, animated:true, completion: nil)
 
 // I checked if it is a repeated cost
 //for this non zero item I checked and here ends the code for a Repeated cost
 
 } else {
 //and it is not a repeated cost so
 //If it is not a repeated cost do what you do well fo this non zero item-------------
 //Non ZERO Index>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 
 
 
 
 
 
 
 
 
 
 
 
 //-----------------------------------------------------------------------------------------------------------------------------------------------------------
 
 
 let fileNameToBeDeleted = (filteredTable[indexPath.row].expenseID?.description)! + ".dat"
 print("The name of the file to be deleted is \(fileNameToBeDeleted)")
 var pathOfTheFile = (filteredTable[indexPath.row].filePath)
 print("The name of the path with the file to be deleted is \(String(describing: pathOfTheFile))")
 // We find the document directory on the device
 
 let documentPathOfDirectoriesForTheFile : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
 if documentPathOfDirectoriesForTheFile.count > 0 {
 let onePathOfDirectories = documentPathOfDirectoriesForTheFile[0]
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
 
 //Non ZERO<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 
 
 // Delete the row from the data source===================== for the NON ZERO item =====================
 
 self.filteredTable.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 print("the removed from the table expence is the \(String(describing: self.filteredTable[indexPath.row-1].expenseID))")
 print("We had bought a \(String(describing: self.filteredTable[indexPath.row-1].note))")
 
 
 // End of Delete the row from the data source===================== for the NON ZERO item =====================
 
 
 
 
 
 
 //for the non zero item I checked and here ends the code for a non repeated cost
 }
 
 
 
 
 
 
 
 
 //-----------------------------------------------------------------------------------------------------------------------------------------------------------
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 //HERE ENDS THE CODE FOR THE NON ZERO ITEMS
 } else {
 //AND IT STARTS FOR THE ZERO ITEM
 
 
 
 
 
 
 
 
 
 
 
 
 //ZERO Index>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 
 //Check if it is a repeated cost
 let checkedFileNameBeforeDeletion = (filteredTable[indexPath.row].note?.description)
 
 if (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.dailyNote.localized))! || (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.weeklyNote.localized))! || (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.monthlyNote.localized))!  || (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.yearlyNote.localized))! {
 
 let repeatedCostAlert = UIAlertController(title: LocalizedString.fixCostAlert.localized,
 message: LocalizedString.whatFixToDelete.localized,
 preferredStyle: UIAlertControllerStyle.actionSheet)
 
 
 
 
 //ACTION 1: DETELE ONLY THIS OCCURENCE
 repeatedCostAlert.addAction(UIAlertAction(title: LocalizedString.justOne.localized, style: .default, handler:{(action) in
 print("I delete just This ZERO ITEM")
 
 //Do what you do well fo this ZERO item-------------
 let fileNameToBeDeleted = (self.filteredTable[indexPath.row].expenseID?.description)! + ".dat"
 print("The name of the file to be deleted is \(fileNameToBeDeleted)")
 var pathOfTheFile = (self.filteredTable[indexPath.row].filePath)
 print("The name of the path with the file to be deleted is \(String(describing: pathOfTheFile))")
 // We find the document directory on the device
 
 let documentPathOfDirectoriesForTheFile : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
 if documentPathOfDirectoriesForTheFile.count > 0 {
 let onePathOfDirectories = documentPathOfDirectoriesForTheFile[0]
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
 
 //ZERO<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 
 
 self.filteredTable.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 
 
 
 
 
 
 }))
 
 
 
 
 //ACTION 1: DETELE ALL FUTURE COSTS
 repeatedCostAlert.addAction(UIAlertAction(title: LocalizedString.futureFix.localized, style: .default, handler:{(action) in
 print("I delete all the future costs")
 
 self.loadArrayWithAllTheStoredCoredExpenses()
 
 
 
 
 
 let arrayOfExpensesWithFutureDates = self.arrayWithAllStoredExpenses.filter {$0.date >= self.filteredTable[indexPath.row].date }
 
 let arrayOfExpensesToBeDeleted = arrayOfExpensesWithFutureDates.filter {$0.note == self.filteredTable[indexPath.row].note}
 
 
 
 
 
 
 
 //print("*****You choose to delete all with name: \(String(describing: self.tableOfExpences[indexPath.row].note))")
 
 
 //for (i,item) in arrayDelete.enumerated() {
 for i in 0...arrayOfExpensesToBeDeleted.count - 1 {
 
 
 // print ("************\(String(describing: item.note)) will be deleted--------------- ")
 
 
 
 
 ////=======================================
 let fileNameToBeDeleted = (arrayOfExpensesToBeDeleted[i].expenseID?.description)! + ".dat"
 print("The name of the file to be deleted is \(fileNameToBeDeleted)")
 var pathOfTheFile = (arrayOfExpensesToBeDeleted[i].filePath)
 print("The name of the path with the file to be deleted is \(String(describing: pathOfTheFile))")
 // We find the document directory on the device
 
 let documentPathOfDirectoriesForTheFile : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
 if documentPathOfDirectoriesForTheFile.count > 0 {
 let onePathOfDirectories = documentPathOfDirectoriesForTheFile[0]
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
 
 //ZERO<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 
 
 
 
 }
 //Loop Ends
 
 
 //  let arrayOfCommonItems = arrayOfExpensesToBeDeleted.filter {(OneExpense) -> Bool in
 //      return self.tableOfExpences.contains(OneExpense)}
 
 
 self.filteredTable.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 
 self.segmentOfPeriod.selectedSegmentIndex = 0
 
 self.setPickersDateAccordingToTheSelectedPeriodSegment()
 self.loadExpensesForWhateverDatePickersShow()
 
 
 }))
 
 
 
 //ACTION 1: DETELE EVERYTHING REGARDING THIS COST
 repeatedCostAlert.addAction(UIAlertAction(title:LocalizedString.totalFix.localized, style: .default, handler:{(action) in
 print("I delete all ")
 
 self.loadArrayWithAllTheStoredCoredExpenses()
 
 
 
 
 
 // let arrayOfExpensesWithFutureDates = self.arrayWithAllStoredExpenses.filter {$0.date >= self.tableOfExpences[indexPath.row].date }
 
 let arrayOfExpensesToBeDeleted = self.arrayWithAllStoredExpenses.filter {$0.note == self.filteredTable[indexPath.row].note}
 
 
 
 
 
 
 
 //print("*****You choose to delete all with name: \(String(describing: self.tableOfExpences[indexPath.row].note))")
 
 
 //for (i,item) in arrayDelete.enumerated() {
 for i in 0...arrayOfExpensesToBeDeleted.count - 1 {
 
 
 // print ("************\(String(describing: item.note)) will be deleted--------------- ")
 
 
 
 
 ////=======================================
 let fileNameToBeDeleted = (arrayOfExpensesToBeDeleted[i].expenseID?.description)! + ".dat"
 print("The name of the file to be deleted is \(fileNameToBeDeleted)")
 var pathOfTheFile = (arrayOfExpensesToBeDeleted[i].filePath)
 print("The name of the path with the file to be deleted is \(String(describing: pathOfTheFile))")
 // We find the document directory on the device
 
 let documentPathOfDirectoriesForTheFile : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
 if documentPathOfDirectoriesForTheFile.count > 0 {
 let onePathOfDirectories = documentPathOfDirectoriesForTheFile[0]
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
 
 //ZERO<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 
 
 
 
 }
 //Loop Ends
 
 
 //  let arrayOfCommonItems = arrayOfExpensesToBeDeleted.filter {(OneExpense) -> Bool in
 //      return self.tableOfExpences.contains(OneExpense)}
 
 
 self.filteredTable.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 
 self.segmentOfPeriod.selectedSegmentIndex = 0
 
 self.setPickersDateAccordingToTheSelectedPeriodSegment()
 self.loadExpensesForWhateverDatePickersShow()
 
 
 }))
 
 
 
 
 
 //ACTION CANCELED
 repeatedCostAlert.addAction(UIAlertAction(title:LocalizedString.cancelFixDeletion.localized, style: .cancel, handler:{(action) in
 print("Canceled ")
 
 }))
 
 
 
 //in order to present the alert while in search
 if let presentedVC = presentedViewController {
 presentedVC.present(repeatedCostAlert, animated:true, completion: nil)
 } else {
 present(repeatedCostAlert, animated:true, completion: nil)
 }
 
 //self.present(repeatedCostAlert, animated:true, completion: nil)
 
 // I checked if it is a repeated cost<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 //for this non zero item I checked and here ends the code for a Repeated cost
 
 } else {
 //and it is not so
 //If it is not a repeated cost do what you do well fo this ZERO item-------------
 let fileNameToBeDeleted = (filteredTable[indexPath.row].expenseID?.description)! + ".dat"
 print("The name of the file to be deleted is \(fileNameToBeDeleted)")
 var pathOfTheFile = (filteredTable[indexPath.row].filePath)
 print("The name of the path with the file to be deleted is \(String(describing: pathOfTheFile))")
 // We find the document directory on the device
 
 let documentPathOfDirectoriesForTheFile : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
 if documentPathOfDirectoriesForTheFile.count > 0 {
 let onePathOfDirectories = documentPathOfDirectoriesForTheFile[0]
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
 
 //ZERO<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 
 
 self.filteredTable.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 
 
 }
 
 
 
 
 
 
 
 //here ends the IF ZERO/NON ZERO
 }
 //here ends the IF ZERO/NON ZERO
 
 
 
 
 //ATTENTION
 
 
 /*
 // Delete the row from the data source===================== for the ZERO item and the Rest=====================
 if indexPath.row == 0 {
 
 self.tableOfExpences.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 
 } else {
 self.tableOfExpences.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 print("the removed from the table expence is the \(String(describing: tableOfExpences[indexPath.row-1].expenseID))")
 print("We had bought a \(String(describing: tableOfExpences[indexPath.row-1].note))")
 
 }
 // End of Delete the row from the data source===================== for the ZERO item and the Rest=====================
 */
 
 self.tableView.reloadData()
 sortTheFilteredTable()
 sumFilteredExpenses()
 //sortTheTable()
 // sumExpenses()
 
 
 
 
 
 
 
 
 // ==========================================================
 // ==========================================================
 // ==========================================================
 // ==========================================================
 
 
 //if we are not searching=========================================================================
 } else {
 //if we are not searching============================================================================
 
 // ==========================================================
 // ==========================================================
 // ==========================================================
 // ==========================================================
 
 
 
 
 
 
 
 
 
 
 //REMOVING FROM THE STORED VALUES=====================for the ZERO item and the Rest=========================
 
 if indexPath.row > 0 {
 //FIRST FOR THE NON ZERO ITEMS--------------
 
 
 
 //Check if it is a repeated cost
 let checkedFileNameBeforeDeletion = (tableOfExpences[indexPath.row].note?.description)
 
 if (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.dailyNote.localized))! || (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.weeklyNote.localized))! || (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.monthlyNote.localized))!  || (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.yearlyNote.localized))!{
 
 //Ok, it is a repeated Cost, so bring on the Alert and ask what the user want to delete
 
 let repeatedCostAlert = UIAlertController(title: LocalizedString.fixCostAlert.localized,
 message: LocalizedString.whatFixToDelete.localized,
 preferredStyle: UIAlertControllerStyle.actionSheet)
 
 
 //ACTION 1: delete only this occurence
 repeatedCostAlert.addAction(UIAlertAction(title:LocalizedString.justOne.localized, style: .default, handler:{(action) in
 
 
 print("I delete just This")
 let fileNameToBeDeleted = (self.tableOfExpences[indexPath.row].expenseID?.description)! + ".dat"
 print("The name of the file to be deleted is \(fileNameToBeDeleted)")
 var pathOfTheFile = (self.tableOfExpences[indexPath.row].filePath)
 print("The name of the path with the file to be deleted is \(String(describing: pathOfTheFile))")
 // We find the document directory on the device
 
 let documentPathOfDirectoriesForTheFile : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
 if documentPathOfDirectoriesForTheFile.count > 0 {
 let onePathOfDirectories = documentPathOfDirectoriesForTheFile[0]
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
 
 
 
 
 
 
 // Delete the row from the data source===================== for the NON ZERO item =====================
 
 self.tableOfExpences.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 print("the removed from the table expence is the \(String(describing: self.tableOfExpences[indexPath.row-1].expenseID))")
 print("We had bought a \(String(describing: self.tableOfExpences[indexPath.row-1].note))")
 
 
 // End of Delete the row from the data source===================== for the NON ZERO item =====================
 
 
 
 
 }))
 
 
 
 
 //ACTION 2: delete all future fix costs with this name
 repeatedCostAlert.addAction(UIAlertAction(title:LocalizedString.futureFix.localized, style: .default, handler:{(action) in
 print("I delete all the future costs")
 
 
 self.loadArrayWithAllTheStoredCoredExpenses()
 
 
 
 
 
 let arrayOfExpensesWithFutureDates = self.arrayWithAllStoredExpenses.filter {$0.date >= self.tableOfExpences[indexPath.row].date }
 
 let arrayOfExpensesToBeDeleted = arrayOfExpensesWithFutureDates.filter {$0.note == self.tableOfExpences[indexPath.row].note}
 
 
 
 
 
 
 
 //print("*****You choose to delete all with name: \(String(describing: self.tableOfExpences[indexPath.row].note))")
 
 
 //for (i,item) in arrayDelete.enumerated() {
 for i in 0...arrayOfExpensesToBeDeleted.count - 1 {
 
 
 // print ("************\(String(describing: item.note)) will be deleted--------------- ")
 
 
 
 
 ////=======================================
 let fileNameToBeDeleted = (arrayOfExpensesToBeDeleted[i].expenseID?.description)! + ".dat"
 print("The name of the file to be deleted is \(fileNameToBeDeleted)")
 var pathOfTheFile = (arrayOfExpensesToBeDeleted[i].filePath)
 print("The name of the path with the file to be deleted is \(String(describing: pathOfTheFile))")
 // We find the document directory on the device
 
 let documentPathOfDirectoriesForTheFile : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
 if documentPathOfDirectoriesForTheFile.count > 0 {
 let onePathOfDirectories = documentPathOfDirectoriesForTheFile[0]
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
 
 ////=======================================
 
 }
 //Loop Ends
 
 
 //  let arrayOfCommonItems = arrayOfExpensesToBeDeleted.filter {(OneExpense) -> Bool in
 //      return self.tableOfExpences.contains(OneExpense)}
 
 
 self.tableOfExpences.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 
 self.segmentOfPeriod.selectedSegmentIndex = 0
 
 self.setPickersDateAccordingToTheSelectedPeriodSegment()
 self.loadExpensesForWhateverDatePickersShow()
 
 
 
 
 
 
 
 
 
 }))
 
 
 
 //ACTION 3: delete all fix costs with this name from start to finish
 
 
 
 repeatedCostAlert.addAction(UIAlertAction(title:LocalizedString.totalFix.localized, style: .default, handler:{(action) in
 print("I delete all ")
 
 
 self.loadArrayWithAllTheStoredCoredExpenses()
 
 //var arrayOfExpensesToBeDeleted = [OneExpense]()
 let arrayOfExpensesToBeDeleted = self.arrayWithAllStoredExpenses.filter {$0.note == self.tableOfExpences[indexPath.row].note}
 
 print("*****You choose to delete all with name: \(String(describing: self.tableOfExpences[indexPath.row].note))")
 
 
 //for (i,item) in arrayDelete.enumerated() {
 for i in 0...arrayOfExpensesToBeDeleted.count - 1 {
 
 
 // print ("************\(String(describing: item.note)) will be deleted--------------- ")
 
 
 
 
 ////=======================================
 let fileNameToBeDeleted = (arrayOfExpensesToBeDeleted[i].expenseID?.description)! + ".dat"
 print("The name of the file to be deleted is \(fileNameToBeDeleted)")
 var pathOfTheFile = (arrayOfExpensesToBeDeleted[i].filePath)
 print("The name of the path with the file to be deleted is \(String(describing: pathOfTheFile))")
 // We find the document directory on the device
 
 let documentPathOfDirectoriesForTheFile : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
 if documentPathOfDirectoriesForTheFile.count > 0 {
 let onePathOfDirectories = documentPathOfDirectoriesForTheFile[0]
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
 
 ////=======================================
 
 }
 //Loop Ends
 
 
 //  let arrayOfCommonItems = arrayOfExpensesToBeDeleted.filter {(OneExpense) -> Bool in
 //      return self.tableOfExpences.contains(OneExpense)}
 
 
 self.tableOfExpences.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 
 self.segmentOfPeriod.selectedSegmentIndex = 0
 
 self.setPickersDateAccordingToTheSelectedPeriodSegment()
 self.loadExpensesForWhateverDatePickersShow()
 
 
 
 
 
 
 
 
 }))
 
 repeatedCostAlert.addAction(UIAlertAction(title:LocalizedString.cancelFixDeletion.localized, style: .cancel, handler:{(action) in
 print("Canceled ")
 
 }))
 
 
 
 
 self.present(repeatedCostAlert, animated:true, completion: nil)
 
 // I checked if it is a repeated cost
 //for this non zero item I checked and here ends the code for a Repeated cost
 
 } else {
 //and it is not a repeated cost so
 //If it is not a repeated cost do what you do well fo this non zero item-------------
 //Non ZERO Index>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 
 let fileNameToBeDeleted = (tableOfExpences[indexPath.row].expenseID?.description)! + ".dat"
 print("The name of the file to be deleted is \(fileNameToBeDeleted)")
 var pathOfTheFile = (tableOfExpences[indexPath.row].filePath)
 print("The name of the path with the file to be deleted is \(String(describing: pathOfTheFile))")
 // We find the document directory on the device
 
 let documentPathOfDirectoriesForTheFile : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
 if documentPathOfDirectoriesForTheFile.count > 0 {
 let onePathOfDirectories = documentPathOfDirectoriesForTheFile[0]
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
 
 //Non ZERO<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 
 
 // Delete the row from the data source===================== for the NON ZERO item =====================
 
 self.tableOfExpences.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 print("the removed from the table expence is the \(String(describing: self.tableOfExpences[indexPath.row-1].expenseID))")
 print("We had bought a \(String(describing: self.tableOfExpences[indexPath.row-1].note))")
 
 
 // End of Delete the row from the data source===================== for the NON ZERO item =====================
 
 
 
 
 
 
 //for the non zero item I checked and here ends the code for a non repeated cost
 }
 
 
 
 
 
 
 
 
 
 
 //HERE ENDS THE CODE FOR THE NON ZERO ITEMS
 } else {
 //AND IT STARTS FOR THE ZERO ITEM
 
 
 
 
 
 
 
 
 
 
 
 
 //ZERO Index>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 
 //Check if it is a repeated cost
 let checkedFileNameBeforeDeletion = (tableOfExpences[indexPath.row].note?.description)
 
 if (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.dailyNote.localized))! || (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.weeklyNote.localized))! || (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.monthlyNote.localized))!  || (checkedFileNameBeforeDeletion?.hasPrefix(LocalizedString.yearlyNote.localized))! {
 
 let repeatedCostAlert = UIAlertController(title: LocalizedString.fixCostAlert.localized,
 message: LocalizedString.whatFixToDelete.localized,
 preferredStyle: UIAlertControllerStyle.actionSheet)
 
 
 
 
 //ACTION 1: DETELE ONLY THIS OCCURENCE
 repeatedCostAlert.addAction(UIAlertAction(title:LocalizedString.justOne.localized, style: .default, handler:{(action) in
 print("I delete just This ZERO ITEM")
 
 //Do what you do well fo this ZERO item-------------
 let fileNameToBeDeleted = (self.tableOfExpences[indexPath.row].expenseID?.description)! + ".dat"
 print("The name of the file to be deleted is \(fileNameToBeDeleted)")
 var pathOfTheFile = (self.tableOfExpences[indexPath.row].filePath)
 print("The name of the path with the file to be deleted is \(String(describing: pathOfTheFile))")
 // We find the document directory on the device
 
 let documentPathOfDirectoriesForTheFile : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
 if documentPathOfDirectoriesForTheFile.count > 0 {
 let onePathOfDirectories = documentPathOfDirectoriesForTheFile[0]
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
 
 //ZERO<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 
 
 self.tableOfExpences.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 
 
 
 
 
 
 }))
 
 
 
 
 //ACTION 1: DETELE ALL FUTURE COSTS
 repeatedCostAlert.addAction(UIAlertAction(title:LocalizedString.futureFix.localized, style: .default, handler:{(action) in
 print("I delete all the future costs")
 
 self.loadArrayWithAllTheStoredCoredExpenses()
 
 
 
 
 
 let arrayOfExpensesWithFutureDates = self.arrayWithAllStoredExpenses.filter {$0.date >= self.tableOfExpences[indexPath.row].date }
 
 let arrayOfExpensesToBeDeleted = arrayOfExpensesWithFutureDates.filter {$0.note == self.tableOfExpences[indexPath.row].note}
 
 
 
 
 
 
 
 //print("*****You choose to delete all with name: \(String(describing: self.tableOfExpences[indexPath.row].note))")
 
 
 //for (i,item) in arrayDelete.enumerated() {
 for i in 0...arrayOfExpensesToBeDeleted.count - 1 {
 
 
 // print ("************\(String(describing: item.note)) will be deleted--------------- ")
 
 
 
 
 ////=======================================
 let fileNameToBeDeleted = (arrayOfExpensesToBeDeleted[i].expenseID?.description)! + ".dat"
 print("The name of the file to be deleted is \(fileNameToBeDeleted)")
 var pathOfTheFile = (arrayOfExpensesToBeDeleted[i].filePath)
 print("The name of the path with the file to be deleted is \(String(describing: pathOfTheFile))")
 // We find the document directory on the device
 
 let documentPathOfDirectoriesForTheFile : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
 if documentPathOfDirectoriesForTheFile.count > 0 {
 let onePathOfDirectories = documentPathOfDirectoriesForTheFile[0]
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
 
 //ZERO<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 
 
 
 
 }
 //Loop Ends
 
 
 //  let arrayOfCommonItems = arrayOfExpensesToBeDeleted.filter {(OneExpense) -> Bool in
 //      return self.tableOfExpences.contains(OneExpense)}
 
 
 self.tableOfExpences.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 
 self.segmentOfPeriod.selectedSegmentIndex = 0
 
 self.setPickersDateAccordingToTheSelectedPeriodSegment()
 self.loadExpensesForWhateverDatePickersShow()
 
 
 }))
 
 
 
 //ACTION 1: DETELE EVERYTHING REGARDING THIS COST
 repeatedCostAlert.addAction(UIAlertAction(title:LocalizedString.totalFix.localized, style: .default, handler:{(action) in
 print("I delete all ")
 
 self.loadArrayWithAllTheStoredCoredExpenses()
 
 
 
 
 
 // let arrayOfExpensesWithFutureDates = self.arrayWithAllStoredExpenses.filter {$0.date >= self.tableOfExpences[indexPath.row].date }
 
 let arrayOfExpensesToBeDeleted = self.arrayWithAllStoredExpenses.filter {$0.note == self.tableOfExpences[indexPath.row].note}
 
 
 
 
 
 
 
 //print("*****You choose to delete all with name: \(String(describing: self.tableOfExpences[indexPath.row].note))")
 
 
 //for (i,item) in arrayDelete.enumerated() {
 for i in 0...arrayOfExpensesToBeDeleted.count - 1 {
 
 
 // print ("************\(String(describing: item.note)) will be deleted--------------- ")
 
 
 
 
 ////=======================================
 let fileNameToBeDeleted = (arrayOfExpensesToBeDeleted[i].expenseID?.description)! + ".dat"
 print("The name of the file to be deleted is \(fileNameToBeDeleted)")
 var pathOfTheFile = (arrayOfExpensesToBeDeleted[i].filePath)
 print("The name of the path with the file to be deleted is \(String(describing: pathOfTheFile))")
 // We find the document directory on the device
 
 let documentPathOfDirectoriesForTheFile : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
 if documentPathOfDirectoriesForTheFile.count > 0 {
 let onePathOfDirectories = documentPathOfDirectoriesForTheFile[0]
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
 
 //ZERO<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 
 
 
 
 }
 //Loop Ends
 
 
 //  let arrayOfCommonItems = arrayOfExpensesToBeDeleted.filter {(OneExpense) -> Bool in
 //      return self.tableOfExpences.contains(OneExpense)}
 
 
 self.tableOfExpences.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 
 self.segmentOfPeriod.selectedSegmentIndex = 0
 
 self.setPickersDateAccordingToTheSelectedPeriodSegment()
 self.loadExpensesForWhateverDatePickersShow()
 
 
 }))
 
 
 
 
 
 //ACTION CANCELED
 repeatedCostAlert.addAction(UIAlertAction(title:LocalizedString.cancelFixDeletion.localized, style: .cancel, handler:{(action) in
 print("Canceled ")
 
 }))
 
 
 
 
 
 self.present(repeatedCostAlert, animated:true, completion: nil)
 
 // I checked if it is a repeated cost<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 //for this non zero item I checked and here ends the code for a Repeated cost
 
 } else {
 //and it is not so
 //If it is not a repeated cost do what you do well fo this ZERO item-------------
 let fileNameToBeDeleted = (tableOfExpences[indexPath.row].expenseID?.description)! + ".dat"
 print("The name of the file to be deleted is \(fileNameToBeDeleted)")
 var pathOfTheFile = (tableOfExpences[indexPath.row].filePath)
 print("The name of the path with the file to be deleted is \(String(describing: pathOfTheFile))")
 // We find the document directory on the device
 
 let documentPathOfDirectoriesForTheFile : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
 if documentPathOfDirectoriesForTheFile.count > 0 {
 let onePathOfDirectories = documentPathOfDirectoriesForTheFile[0]
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
 
 //ZERO<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 
 
 self.tableOfExpences.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 
 
 }
 
 
 
 
 
 
 
 //here ends the IF ZERO/NON ZERO
 }
 //here ends the IF ZERO/NON ZERO
 
 
 
 
 //ATTENTION
 
 
 /*
 // Delete the row from the data source===================== for the ZERO item and the Rest=====================
 if indexPath.row == 0 {
 
 self.tableOfExpences.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 
 } else {
 self.tableOfExpences.remove(at: indexPath.row)
 tableView.deleteRows(at: [indexPath], with: .fade)
 print("the removed from the table expence is the \(String(describing: tableOfExpences[indexPath.row-1].expenseID))")
 print("We had bought a \(String(describing: tableOfExpences[indexPath.row-1].note))")
 
 }
 // End of Delete the row from the data source===================== for the ZERO item and the Rest=====================
 */
 
 self.tableView.reloadData()
 sortTheTable()
 sumExpenses()
 
 
 
 
 
 }//end of delete if app is  not searching
 
 
 
 
 
 
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 
 
 // self.tableView.reloadData()
 // sortTheTable()
 // sumExpenses()
 tableView.endUpdates()
 
 }//commitEndsHere
 
 */

/*
 
 func loadExpensesForFilteredSegmentedDateRange(){
 
 
 
 
 self.filteredTable.removeAll()
 fetchMyData()
 
 let date = pickerOfEndingDate.date
 let calendar = Calendar.current
 
 let year = calendar.component(.year, from: date)
 let month = calendar.component(.month, from: date)
 let day = calendar.component(.day, from: date)
 //let weekday = calendar.component(.weekday, from: date)
 
 
 
 let components: NSDateComponents = NSDateComponents()
 
 components.year = year
 components.month = month
 components.day = day + 1
 let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
 
 
 
 //so that in the calculations today will be present
 
 // filterContentForSearchText(self.searchController.searchBar.text!)
 let searchText = self.searchController.searchBar.text?.lowercased()
 
 if coredExpensesArray.count > 1 {
 for e in coredExpensesArray {
 if self.segmentOfKind.selectedSegmentIndex == 0 {
 if (e.date! as Date) >= pickerOfStartingDate.date && (e.date! as Date) <= philleasFogDate as Date && (String(describing: e.note).lowercased().contains(String(searchText!))) {
 self.filteredTable.append(e)}
 //if Survive show water----------------------------------
 } else if self.segmentOfKind.selectedSegmentIndex == 1 {
 if (e.date! as Date) >= pickerOfStartingDate.date && (e.date! as Date) <= philleasFogDate as Date && e.kind == "Acost"  && (String(describing: e.note).lowercased().contains(String(searchText!))) {
 self.filteredTable.append(e)}
 //if grow show books------------------------------------------
 } else if self.segmentOfKind.selectedSegmentIndex == 2 {
 if (e.date! as Date) >= pickerOfStartingDate.date && (e.date! as Date) <= philleasFogDate as Date && e.kind == "Bcost"  && (String(describing: e.note).lowercased().contains(String(searchText!))){
 self.filteredTable.append(e)}
 
 //if glow show Diamond-----------------------------------------
 } else {
 if (e.date! as Date) >= pickerOfStartingDate.date && (e.date! as Date) <= philleasFogDate as Date && e.kind == "Ccost"  && (String(describing: e.note).lowercased().contains(String(searchText!))) {
 self.filteredTable.append(e)}
 }
 
 
 } //For
 }//count
 
 
 // print ("the text in the SEARCH BAR is \(String(describing: self.searchController.searchBar.text))")
 //  print ("and the note of the expense is \(String(describing: e.note))")
 
 
 
 }//FUNCTION END
 
 */










//DISPATCH ------------------------------------------------------------------------------------------------------------------


/*
 
 func loadExpensesForDispatchedSegmentedDateRange(){
 // self.tableOfExpences = []
 let date = pickerOfEndingDate.date
 let dateStart = pickerOfStartingDate.date
 let indexOfKind = self.segmentOfKind.selectedSegmentIndex
 var dispatchedTable = [OneExpense]()
 
 DispatchQueue.global(qos:.background).async {
 let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
 let paths:[String] = Bundle.paths(forResourcesOfType: "dat", inDirectory: documentsPath)
 for path in paths {
 print("Dispatched expense \(path)")
 if !path.hasSuffix("expenseID.dat")  && !path.hasSuffix("salary.dat") && !path.hasSuffix("mode.dat") {
 let e:OneExpense = NSKeyedUnarchiver.unarchiveObject(withFile: path) as! OneExpense
 let calendar = Calendar.current
 
 let year = calendar.component(.year, from: date)
 let month = calendar.component(.month, from: date)
 let day = calendar.component(.day, from: date)
 //  let weekday = calendar.component(.weekday, from: date)
 
 
 let components: NSDateComponents = NSDateComponents()
 
 components.year = year
 components.month = month
 components.day = day + 1
 let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
 
 
 //if All show everything----------------------------------
 if indexOfKind == 0 {
 if e.date >= dateStart && e.date <= philleasFogDate as Date {
 dispatchedTable.append(e)}
 //if Survive show water----------------------------------
 } else if indexOfKind == 1 {
 if e.date >= dateStart && e.date <= philleasFogDate as Date && e.kind == "Acost"  {
 dispatchedTable.append(e)}
 //if grow show books------------------------------------------
 } else if indexOfKind == 2 {
 if e.date >= dateStart && e.date <= philleasFogDate as Date && e.kind == "Bcost"  {
 dispatchedTable.append(e)}
 
 //if glow show Diamond-----------------------------------------
 } else {
 if e.date >= dateStart && e.date <= philleasFogDate as Date && e.kind == "Ccost"  {
 dispatchedTable.append(e)}
 }
 }
 }
 DispatchQueue.main.async {
 print("Dispatched Done")
 self.tableOfExpences = dispatchedTable
 
 
 }
 }
 self.tableView.reloadData()
 sortTheTable()
 self.indicatorOfActivity.stopAnimating()
 }
 
 
 func loadExpensesForExtraDispatchedSegmentedDateRange(){
 self.tableOfExpences = []
 let date = pickerOfEndingDate.date
 let dateStart = pickerOfStartingDate.date
 let indexOfKind = self.segmentOfKind.selectedSegmentIndex
 var dispatchedTable = [OneExpense]()
 
 let darkQueue = DispatchQueue(label: "com.app.cost", qos: .background)
 darkQueue.async {
 
 // DispatchQueue.global(qos:.background).async {
 let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
 let paths:[String] = Bundle.paths(forResourcesOfType: "dat", inDirectory: documentsPath)
 for path in paths {
 //  print("loading expense \(path)")
 if !path.hasSuffix("expenseID.dat")  && !path.hasSuffix("salary.dat") && !path.hasSuffix("mode.dat") {
 let e:OneExpense = NSKeyedUnarchiver.unarchiveObject(withFile: path) as! OneExpense
 
 //We create a date that is ending DATE + 1 Day the philleasFogDate
 
 // let date = Date()
 //PhileasFog date will not be only fot today but for whatever the picker shows
 // let date = pickerOfEndingDate.date
 let calendar = Calendar.current
 
 let year = calendar.component(.year, from: date)
 let month = calendar.component(.month, from: date)
 let day = calendar.component(.day, from: date)
 //  let weekday = calendar.component(.weekday, from: date)
 
 
 let components: NSDateComponents = NSDateComponents()
 
 components.year = year
 components.month = month
 components.day = day + 1
 let philleasFogDate: NSDate = calendar.date(from: components as DateComponents)! as NSDate
 
 
 //if All show everything----------------------------------
 if indexOfKind == 0 {
 if e.date >= dateStart && e.date <= philleasFogDate as Date {
 dispatchedTable.append(e)}
 //if Survive show water----------------------------------
 } else if indexOfKind == 1 {
 if e.date >= dateStart && e.date <= philleasFogDate as Date && e.kind == "Acost"  {
 dispatchedTable.append(e)}
 //if grow show books------------------------------------------
 } else if indexOfKind == 2 {
 if e.date >= dateStart && e.date <= philleasFogDate as Date && e.kind == "Bcost"  {
 dispatchedTable.append(e)}
 
 //if glow show Diamond-----------------------------------------
 } else {
 if e.date >= dateStart && e.date <= philleasFogDate as Date && e.kind == "Ccost"  {
 dispatchedTable.append(e)}
 }
 }
 }
 //  DispatchQueue.main.async {
 //       self.tableOfExpences = dispatchedTable
 // }
 }
 
 
 }
 
 
 
 
 */

















