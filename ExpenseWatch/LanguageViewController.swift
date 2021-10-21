//
//  LanguageViewController.swift
//  ExpenseWatch
//
//  Created by planB on 29/9/18.
//  Copyright © 2018 Ioannis. All rights reserved.
//

import UIKit

class LanguageViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  
    let myLanguages = ["Ελληνικά", "English", "Espanol", "Francais", "Deutch", "Italiano","Pусский","中文"]

    var pickedLanguage: String?
    var cancelTaped: Bool?
    var saveTaped: Bool?
  
    
    @IBOutlet weak var smallView: UIView!
    @IBOutlet weak var languagePicker: UIPickerView!
    
    
    
    @IBOutlet weak var buttonToCancelLangSelection: UIButton!
    @IBOutlet weak var buttonToSaveLangSelection: UIButton!
    @IBOutlet weak var labelWarning: UILabel!
    
    
    @IBAction func cancelAndClose(_ sender: Any) {
       self.cancelTaped = true
        self.performSegue(withIdentifier: "unwindToSettings", sender: self)
    }
    

    @IBAction func saveNewLanguageAndClose(_ sender: Any) {
        
       
        
      
        
        
        
        
        
       self.performSegue(withIdentifier: "unwindToSettings", sender: self)
    }
    
  

    func languageChanged(strLan:String){
        // self.button.text = "someKey".localizableString(local: strLan)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.smallView.layer.cornerRadius = 10
        self.smallView.layer.masksToBounds = true
        
        self.buttonToSaveLangSelection.setTitle(LocalizedString.saveLanguage.localized, for: .normal)
        self.buttonToCancelLangSelection.setTitle(LocalizedString.cancelLanguage.localized, for: .normal)
        self.labelWarning.text = LocalizedString.NoteToRestartApp.localized
        
        
      
        self.languagePicker.delegate = self
        self.languagePicker.dataSource = self
        
        let indexOfSelectedLanguage = self.myLanguages.firstIndex(of: self.pickedLanguage!)
        self.languagePicker.selectRow(indexOfSelectedLanguage!, inComponent: 0, animated: true)

        self.cancelTaped = false
        
        
       
        
         
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myLanguages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myLanguages[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pickedLanguage = myLanguages[row]
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-Regular", size: 17)
        
        label.text = myLanguages[row]
        
        return label
    }
    
    
    
    
    
    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier  == "unwindToSettings" {
            
            
            if let destinationVC = segue.destination as? SelectViewController {
                if cancelTaped == true {
                } else {
                    destinationVC.selectedLanguage = self.pickedLanguage!
                }
                
               
            }
        }
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}





/*
extension String {
    func localizableString(local:String) -> String {
        let path = Bundle.main.path(forResource: local, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle:bundle!, value: "",   comment: "")
    }
}*/
