//
//  PopUpViewController.swift
//  ExpenseWatch
//
//  Created by Ioannis Karagogos on 30/4/18.
//  Copyright © 2018 Ioannis. All rights reserved.
//

import UIKit
import CoreData

protocol UpdateTableDelegate: AnyObject {
        func updateTable()
      // func updateCell(size: Double, cash: Bool, date: Date, kind: String, note: String)
    }





class PopUpViewController: UIViewController, UITextFieldDelegate  {
    
    weak var tableDelegate: UpdateTableDelegate?

   //var willingToChangeCost: OneExpense?
    var willingToChangeCost: ExpenseCore?
    var arrayOfWilling = [ExpenseCore]()
    
   // var receivedExpenseID: Int = 0
    var receivedSizeOfCost: Double = 0.00
    var receivedNoteOfTheCost: String = ""
    var receivedCashCardState: Bool = true
    var receivedDate = Date()
    var receivedSegment: Int = 0
    var receivedFilePath: String = ""
    
    
    var returnedSize: Double = 0.00
    var returnedCash: Bool = true
    var returnedDate = Date()
    var returnedSegment: Int = 0
    var returnedNote: String = ""
    var returnedKind: String = ""
    
    
    
    
    
    
    var loadedStartingDate: String? = ""
    var loadedEndingDate: String? = ""
    
    
    @IBOutlet weak var buttonToCancelPopUp: UIButton!
    @IBOutlet weak var buttonToSavePopUp: UIButton!
    
    
    
    
    @IBOutlet weak var popUpCost: UITextField!
    @IBOutlet weak var popUpDescription: UITextField!
    @IBOutlet weak var popUpSwitch: UISwitch!
    @IBOutlet weak var popUpDatePicker: UIDatePicker!
    
    
    
    
    
    @IBOutlet weak var segmentPopUpBroad: UISegmentedControl!
    @IBOutlet weak var buttonCostA: UIButton!
    @IBOutlet weak var buttonCostB: UIButton!
    @IBOutlet weak var buttonCostC: UIButton!
    @IBOutlet weak var labelPopUpCostA: UILabel!
    @IBOutlet weak var labelPopUpCostB: UILabel!
    @IBOutlet weak var labelPopUpCostC: UILabel!
    
    
    
    
    
    @IBOutlet weak var popUpCardlabel: UILabel!
    
   
    
    @IBOutlet weak var popUpRectanle: UIView!
    
    @IBAction func popUpCashToCardChanging(_ sender: Any) {
        popUpCardlabel.text = popUpSwitch.isOn ? LocalizedString.cashInPopUp.localized : LocalizedString.cardInPopUp.localized
        popUpCardlabel.textColor = popUpSwitch.isOn ?  UIColor.black : UIColor.red
        self.popUpCost.textColor = popUpSwitch.isOn ?  UIColor.black : UIColor.red
        
        self.willingToChangeCost?.cash = popUpSwitch.isOn ? true : false
        
    }
    
    //MARK: Segment Issues
    
    //Position the Segment
    
    func positionSegmentButtons(){
        let  widthOfIOSDevice = UIScreen.main.bounds.size.width
        let  heightOfIOSDevice = UIScreen.main.bounds.size.height
        
        
        let lengthOfSegmentControl = widthOfIOSDevice - 16
        let lengthOfOneSegment = lengthOfSegmentControl/3
        let halfSegment = lengthOfOneSegment/2
        
        
        //Only iphoneX is different-------------------------------------------------------------
        
        
        if widthOfIOSDevice < 350 && heightOfIOSDevice < 800{
            //small iphone
            print("the device has width \(widthOfIOSDevice) so its smaller than 350")
            
            buttonCostA.frame = CGRect(x: 8 + halfSegment - 45/2 - 3, y:60, width: 45, height: 45)
            labelPopUpCostA.frame = CGRect(x: 8 + halfSegment - 50 - 3, y: 106, width: 100, height: 17)
            
            buttonCostC.frame = CGRect(x: lengthOfSegmentControl - halfSegment - 45/2 - 17, y: 60, width: 45, height: 45)
            labelPopUpCostC.frame = CGRect(x: lengthOfSegmentControl - halfSegment - 50 - 17, y: 106, width: 100, height: 17)
            
            
            
        } else if widthOfIOSDevice > 350 && widthOfIOSDevice < 700 && heightOfIOSDevice < 800 {
            //iphone
            print("the device has width \(widthOfIOSDevice) so its bigger than 350 but its not an ipad")
            
            buttonCostA.frame = CGRect(x: 8 + halfSegment - 45/2 - 3, y:60, width: 45, height: 45)
            labelPopUpCostA.frame = CGRect(x: 8 + halfSegment - 50 - 3, y: 106, width: 100, height: 17)
            
            buttonCostC.frame = CGRect(x: 8 + lengthOfSegmentControl - halfSegment - 45/2 - 26, y: 60, width: 45, height: 45)
            labelPopUpCostC.frame = CGRect(x: 8 + lengthOfSegmentControl - halfSegment - 50 - 26, y: 106, width: 100, height: 17)
            
            //The only different------------------------------------------------------->>>>>>>>>>>>>>>>>>>>
        } else if widthOfIOSDevice > 350 && widthOfIOSDevice < 700 && heightOfIOSDevice > 800 {
            //iphone X
            print("the device has heght \(heightOfIOSDevice) so its bigger than 800 so yoy have an X")
            
            
            buttonCostA.frame = CGRect(x: 8 + halfSegment - 45/2 - 3, y:60, width: 45, height: 45)
            labelPopUpCostA.frame = CGRect(x: 8 + halfSegment - 50 - 3, y: 106, width: 100, height: 17)
            
            buttonCostC.frame = CGRect(x: 8 + lengthOfSegmentControl - halfSegment - 45/2 - 26, y: 60, width: 45, height: 45)
            labelPopUpCostC.frame = CGRect(x: 8 + lengthOfSegmentControl - halfSegment - 50 - 26, y: 106, width: 100, height: 17)
            
            
            
            //The only different-------------------------------------------------------<<<<<<<<<<<<<<<<<
            
        }  else  {
            //ipad
            print("the device has width \(widthOfIOSDevice) so its an ipad")
            buttonCostA.frame = CGRect(x: 8 + halfSegment - 45/2 - 13, y:60, width: 45, height: 45)
            labelPopUpCostA.frame = CGRect(x: 8 + halfSegment - 50 - 13, y: 106, width: 100, height: 17)
            
            buttonCostC.frame = CGRect(x: 8 + lengthOfSegmentControl - halfSegment - 45/2 - 34, y: 60, width: 45, height: 45)
            labelPopUpCostC.frame = CGRect(x: 8 + lengthOfSegmentControl - halfSegment - 50 - 34, y: 106, width: 100, height: 17)
            
           
            
            
        }
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    //Segment Wired ACTIONS---------------------------------->
    
    
    @IBAction func arrangeTheLabelsOfThePopUpButtons(_ sender: Any) {
        let chosenSegment = self.segmentPopUpBroad.selectedSegmentIndex
        if chosenSegment == 0 {
            self.labelPopUpCostA.textColor = UIColor.white
            self.labelPopUpCostB.textColor = UIColor.blue
            self.labelPopUpCostC.textColor = UIColor.blue
            
        } else if chosenSegment == 1 {
            self.labelPopUpCostA.textColor = UIColor.blue
            self.labelPopUpCostB.textColor = UIColor.white
            self.labelPopUpCostC.textColor = UIColor.blue
            
        } else {
            self.labelPopUpCostA.textColor = UIColor.blue
            self.labelPopUpCostB.textColor = UIColor.blue
            self.labelPopUpCostC.textColor = UIColor.white
        }
    }
    
    
    
    
    
    
    
    @IBAction func buttonPopUpCostAPressedForSegment(_ sender: Any) {
        self.segmentPopUpBroad.selectedSegmentIndex = 0
        self.labelPopUpCostA.textColor = UIColor.white
        self.labelPopUpCostB.textColor = UIColor.blue
        self.labelPopUpCostC.textColor = UIColor.blue
    }
    
    
    
    
    
    
    @IBAction func buttonPopUpCostBPressedForSegment(_ sender: Any) {
        self.segmentPopUpBroad.selectedSegmentIndex = 1
        self.labelPopUpCostA.textColor = UIColor.blue
        self.labelPopUpCostB.textColor = UIColor.white
        self.labelPopUpCostC.textColor = UIColor.blue
    }
    
    
    
    
    
    @IBAction func buttonPopUpCostCPressedForSegment(_ sender: Any) {
        self.segmentPopUpBroad.selectedSegmentIndex = 2
        self.labelPopUpCostA.textColor = UIColor.blue
        self.labelPopUpCostB.textColor = UIColor.blue
        self.labelPopUpCostC.textColor = UIColor.white
    }
    
    
  //Segment Wired ACTIONS----------------------------------<
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  
    @IBAction func saveChangesAndClosePopUp(_ sender: Any) {
        
        if !(popUpCost.text?.isEmpty)!  {
            if !(popUpDescription.text?.isEmpty)! {
              //=================================================The code to save with cost and description full====================================
                deleteThePreviousCoreItem()
               saveTheNewCoreItemWithDescriptionFull()
              
                
                
               self.performSegue(withIdentifier: "unwindToList", sender: self)
            } else {
            //=================================================The code to save only with cost full and description Empty=============================
                deleteThePreviousCoreItem()
                saveTheNewCoreItemWithSegmentName()
                self.performSegue(withIdentifier: "unwindToList", sender: self)
            }
            
            tableDelegate?.updateTable()
            /*tableDelegate?.updateCell(size: returnedSize,
                                      cash: returnedCash,
                                      date: returnedDate,
                                      kind: returnedKind,
                                      note: returnedNote)*/
            
            
         
        } else {
            //=================================================The code to Alert with cost Empty====================================================
            
            let emptyFieldsAlert = UIAlertController(title: LocalizedString.attentionAlert.localized,
                                                     message: LocalizedString.theFieldOfCostInPopUp.localized,
                                                     preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: LocalizedString.okInAlert.localized,
                                         style: UIAlertAction.Style.default,
                                         handler: nil)
            
            emptyFieldsAlert.addAction(okAction)
            
            self.present(emptyFieldsAlert, animated:true, completion: nil)
            
        }
    }
    
    
    
    
  //  func fetchOneSpecificExpense(size: Double, cash: Bool, date: Date, kind: String, note: String){
    func fetchOneSpecificExpense( date: Date, note: String /* cash: Bool*/){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let myRequestedExpense = NSFetchRequest<NSFetchRequestResult>(entityName: "ExpenseCore")
        myRequestedExpense.fetchLimit = 1
        
      //  let specificPredicate = NSCompoundPredicate(type: .and, subpredicates: [NSPredicate(format: "size = %@", size as CVarArg), NSPredicate(format: "cash = %@", cash as CVarArg), NSPredicate(format: "date = %@", date as CVarArg), NSPredicate(format: "kind = %@", kind as CVarArg), NSPredicate(format: "note = %@", note as CVarArg)])
        
        let specificPredicate = NSCompoundPredicate(type: .and, subpredicates: [NSPredicate(format: "date = %@", date as CVarArg), NSPredicate(format: "note = %@", note as CVarArg)])
        
        
        
        
        myRequestedExpense.predicate = specificPredicate
        
        do {
            self.arrayOfWilling = try (managedContext.fetch(myRequestedExpense) as? [ExpenseCore])!
          //  print("The object to be deleted : \(String(describing: self.arrayOfWilling[0].note))")
        } catch {
            print("Unable to fetch data:", error.localizedDescription)
        }
        
        
    }//Func

    
    func deleteThePreviousCoreItem(){
          
        //initiate your number Formatter
        let nf = NumberFormatter()
        nf.locale = Locale.current
        
      
        let dateLoaded = self.receivedDate as NSDate
        let noteLoaded = self.receivedNoteOfTheCost
        
        
    
        fetchOneSpecificExpense(date: dateLoaded as Date, note: noteLoaded)
            
          guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        if let itemToDelete = arrayOfWilling.first {
          managedContext.delete(itemToDelete)
        }
    
        
        
        /*
            for object in arrayOfWilling {
                managedContext.delete(object)
            }
            */
            do {
                try managedContext.save()
                print("TABLEVIEW-EDIT: saved!")
            } catch {
                print("TABLEVIEW-EDIT: Not saved!")
            }
            
            
    }//Func
    
    
   
    func updateExpense(date: Date, note: String ){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let myRequestedExpense = NSFetchRequest<NSFetchRequestResult>(entityName: "ExpenseCore")
        myRequestedExpense.fetchLimit = 1
        
        let specificPredicate = NSCompoundPredicate(type: .and, subpredicates: [NSPredicate(format: "date = %@", date as CVarArg), NSPredicate(format: "note = %@", note as CVarArg)])
        
        
        
        
        myRequestedExpense.predicate = specificPredicate
        
      
        let sizeLoaded = Double(self.popUpCost!.text!)! as NSNumber
        let cashLoaded = self.popUpSwitch.isOn
        let dateLoaded = self.popUpDatePicker.date as NSDate
        let kindLoaded = "Acost"
        let noteLoaded = self.popUpDescription.text
        
        
        
        do {
            self.arrayOfWilling = try (managedContext.fetch(myRequestedExpense) as? [ExpenseCore])!
            
            self.arrayOfWilling.first?.note = noteLoaded
            self.arrayOfWilling.first!.date = dateLoaded
            self.arrayOfWilling.first!.size = Double(truncating: sizeLoaded)
            self.arrayOfWilling.first?.cash = cashLoaded
           // self.arrayOfWilling.first!.date = dateLoaded
            self.arrayOfWilling.first!.kind = kindLoaded
           // self.arrayOfWilling.first?.note = noteLoaded
            
              print("The object that was updated : \(String(describing: self.arrayOfWilling[0].note))")
        } catch {
            print("Unable to fetch data:", error.localizedDescription)
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    //Create a new cost and Save New file withe the same expenseID===================================>>>>>>>>>>>>>
    
    //1. With description Full
    func saveTheNewCoreItemWithDescriptionFull() {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let expense = ExpenseCore(context: managedContext)
        
        //initiate your number Formatter
        let nf = NumberFormatter()
        nf.locale = Locale.current
        
        if segmentPopUpBroad.selectedSegmentIndex == 0 {
            expense.size =  nf.number(from: self.popUpCost.text!) as? Double ?? 1
            expense.cash =  self.popUpSwitch.isOn
            expense.date =  self.popUpDatePicker.date as NSDate
            expense.kind =  "Acost"
            expense.note =  self.popUpDescription.text
            
        }  else if segmentPopUpBroad.selectedSegmentIndex == 1 {
            expense.size =  nf.number(from: self.popUpCost.text!) as? Double ?? 1
            expense.cash =  self.popUpSwitch.isOn
            expense.date =  self.popUpDatePicker.date as NSDate
            expense.kind =  "Bcost"
            expense.note =  self.popUpDescription.text
            
        }  else {
            expense.size =  nf.number(from: self.popUpCost.text!) as? Double ?? 1
            expense.cash =  self.popUpSwitch.isOn
            expense.date =  self.popUpDatePicker.date as NSDate
            expense.kind =  "Ccost"
            expense.note =  self.popUpDescription.text
        }
        
        //UpdateEffort---------------------
        self.returnedSize = expense.size
        self.returnedCash = expense.cash
        self.returnedDate = expense.date! as Date
        self.returnedKind = expense.kind!
        self.returnedNote = expense.note!
        //UpdateEffort---------------------
        
        
        
        
        
        
        do {
            try managedContext.save()
            print("Expense saved with note filled")
            
        } catch {
            print("Failed to save with note filled", error.localizedDescription)
            
        }
      
        
    }
    
    
    
    //2. With description Empty
    func saveTheNewCoreItemWithSegmentName(){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let expense = ExpenseCore(context: managedContext)
        
        //initiate your number Formatter
        let nf = NumberFormatter()
        nf.locale = Locale.current
       
        if segmentPopUpBroad.selectedSegmentIndex == 0 {
            expense.size =  nf.number(from: self.popUpCost.text!) as? Double ?? 1
            expense.cash =  self.popUpSwitch.isOn
            expense.date =  self.popUpDatePicker.date as NSDate
            expense.kind =  "Acost"
            expense.note =  self.labelPopUpCostA.text
            
        } else if segmentPopUpBroad.selectedSegmentIndex == 1 {
            expense.size =  nf.number(from: self.popUpCost.text!) as? Double ?? 1
            expense.cash =  self.popUpSwitch.isOn
            expense.date =  self.popUpDatePicker.date as NSDate
            expense.kind =  "Bcost"
            expense.note =  self.labelPopUpCostB.text
           
            
        } else {
            expense.size =  nf.number(from: self.popUpCost.text!) as? Double ?? 1
            expense.cash =  self.popUpSwitch.isOn
            expense.date =  self.popUpDatePicker.date as NSDate
            expense.kind =  "Ccost"
            expense.note =  self.labelPopUpCostC.text
           
    }
        do {
            try managedContext.save()
            print("Expense saved with note filled")
            
        } catch {
            print("Failed to save with note filled", error.localizedDescription)
            
        }
    
    }//FUNC
    
    
    //Create a new cost and Save New file withe the same expenseID===================================<<<<<<<<<<
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func cancelAndClosePopUp(_ sender: Any) {
        
        self.performSegue(withIdentifier: "unwindToList", sender: self)
       
    }
    
    
    //Animations for Showing And Hiding the pop up with animation>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
               self.view.removeFromSuperview()
            
            }
        });
    }
    
     //Animations for Showing And Hiding the pop up with animation<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<.
    
    func loadDeafaultsForPopUp(){
        
        //userDefautls
        if let categoryA = UserDefaults.standard.value(forKey: "categoryA") as? String {
            labelPopUpCostA.text = categoryA
        }
        
        if let categoryB = UserDefaults.standard.value(forKey: "categoryB") as? String {
            labelPopUpCostB.text = categoryB
        }
        
        if let categoryC = UserDefaults.standard.value(forKey: "categoryC") as? String {
            labelPopUpCostC.text = categoryC
        }
        
        
        
        //userDefautls---------------BUTTONS-----------------------------
        if let imageData = UserDefaults.standard.value(forKey: "iconSelectedForA") as? NSData{
            
            let picture = UIImage(data: imageData as Data)
            buttonCostA.setImage(picture, for: .normal)
        }
        
        if let imageBData = UserDefaults.standard.value(forKey: "iconSelectedForB") as? NSData{
            
            let pictureB = UIImage(data: imageBData as Data)
            buttonCostB.setImage(pictureB, for: .normal)
        }
        
        if let imageCData = UserDefaults.standard.value(forKey: "iconSelectedForC") as? NSData{
            
            let pictureC = UIImage(data: imageCData as Data)
            buttonCostC.setImage(pictureC, for: .normal)
        }
       
    }
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.buttonToSavePopUp.setTitle(LocalizedString.savePopUp.localized, for: .normal)
        self.buttonToCancelPopUp.setTitle(LocalizedString.cancelPopUp.localized, for: .normal)
        
          self.showAnimate()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.popUpRectanle.layer.cornerRadius = 10
        self.popUpRectanle.layer.masksToBounds = true
        
        loadDeafaultsForPopUp()
        positionSegmentButtons()
        
        //for  shouldChangeCharactersInRangeFunction to work properly
        
        self.popUpCost.tag = 0
        self.popUpDescription.tag = 1
        //=================================
        
        
        
        //The data
        let myFormatter = NumberFormatter()
        //myFormatter.numberStyle = .currency
        myFormatter.locale = Locale.current
        myFormatter.maximumFractionDigits = 2
        let stringOfFormattedPopUpCost = myFormatter.string(from: self.receivedSizeOfCost as NSNumber)!
        self.popUpCost.text = stringOfFormattedPopUpCost
        
        
        
        //self.popUpCost.text = String(receivedSizeOfCost)
        
        
        
        
        self.popUpDescription.text = receivedNoteOfTheCost
        self.popUpDatePicker.date = receivedDate
        
        if receivedCashCardState {
            self.popUpSwitch.isOn = true
            self.popUpCardlabel.text = LocalizedString.cashInPopUp.localized
            self.popUpCardlabel.textColor = UIColor.black
        } else {
            self.popUpSwitch.isOn = false
            self.popUpCardlabel.text = LocalizedString.cardInPopUp.localized
            self.popUpCardlabel.textColor = UIColor.red
            self.popUpCost.textColor = UIColor.red
        }
        
        if receivedSegment == 0 {
            segmentPopUpBroad.selectedSegmentIndex = 0
            labelPopUpCostA.textColor = UIColor.white
            labelPopUpCostB.textColor = UIColor.blue
            labelPopUpCostC.textColor = UIColor.blue
            
        } else if receivedSegment == 1 {
            segmentPopUpBroad.selectedSegmentIndex = 1
            labelPopUpCostB.textColor = UIColor.white
            labelPopUpCostA.textColor = UIColor.blue
            labelPopUpCostC.textColor = UIColor.blue
        } else {
            segmentPopUpBroad.selectedSegmentIndex = 2
            labelPopUpCostC.textColor = UIColor.white
            labelPopUpCostA.textColor = UIColor.blue
            labelPopUpCostB.textColor = UIColor.blue
        }
        
        
        
        //print("The PopViewControllerLoads the  ID:\(receivedExpenseID)")
        print("The PopViewControllerLoads Expense of size:\(receivedSizeOfCost)")
         print("The PopViewControllerLoads Expense of FilePath:\(receivedFilePath)")
        
        //for keyboard hiding==============
        self.popUpCost.delegate = self
        self.popUpDescription.delegate = self
        //=================================
        
         //for  shouldChangeCharactersInRangeFunction to work properly
        
        self.popUpCost.tag = 0
        self.popUpDescription.tag = 1
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadTheExpenseOfTheReceivedId(){
        
    }
    
    
    //hiding the keyboard=========================================================
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        popUpCost.resignFirstResponder()
        popUpDescription.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //costTextField.resignFirstResponder()
        // nameTextField.resignFirstResponder()
        self.view.endEditing(true)
        
    }
    
    //==================================================
    
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
