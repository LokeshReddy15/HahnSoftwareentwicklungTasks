//
//  DisplayViewController.swift
//  Task
//
//  Created by LokeshReddy on 09/11/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import UIKit
import CoreLocation
class DisplayViewController: UIViewController
{
   
private var displayListVM = DisplayListViewModel()

    
    //var didTab:((Double)-> Void)?
    @IBOutlet weak var displayLocationTable: UITableView!
    var displayList = [DisplayViewModel]()
    var displayDataInRS = [DataResponseViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Places in Germany".localized()
     // print("Lokesh",LocationSingleton.sharedInstance.lastLocation?.altitude)
        LocationSingleton.sharedInstance.delegate = self
        displayLocationTable.delegate = self
        displayLocationTable.dataSource = self
        getData()
        LocationSingleton.sharedInstance.startUpdatingLocation()
        displayListVM.fetchData {[weak self] displayData in
            self?.displayList = displayData
            print(displayData)
            DispatchQueue.main.async
                {
                self?.displayLocationTable.reloadData()
                }
        }
      //  print(displayListVM.displayList)
        // Do any additional setup after loading the view.
    }
    func getData(){
        displayListVM.getAllData{[weak self] data in
            print(data.count)
            self?.displayDataInRS = data
        }
    }
    
}
extension String{
    func localized()-> String
    {
        return NSLocalizedString(self, tableName: "GermanSupport", bundle: .main, value: self, comment: self)
    }
}
extension DisplayViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DisplayCell", for: indexPath)as!DisplayCell
        cell.selectionStyle = .none
        tableView.separatorStyle = .none
        cell.displayLabel.text = displayList[indexPath.row].GEN.localized()
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(displayDataInRS[indexPath.row])
        performSegue(withIdentifier:"ShowCovidDetails", sender: displayDataInRS[indexPath.row].cases7Per100K)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    override func prepare(for segue:UIStoryboardSegue,sender: Any?){
        if segue.identifier == "ShowCovidDetails"{
            
            let locationDetailTVC = segue.destination as! CovidDetailsViewController
          
            locationDetailTVC.cases7Per100K = sender as! Double
            
        }
    }
}
extension DisplayViewController:LocationServiceDelegate{
    func distanceBetweenTwoLocations(distance: CLLocationDistance) {
        print(distance)
        if Double(distance) <= 1000
        {
          
            print("Here we can do remoteNotification")
        }
    }
    
    func tracingLocation(currentLocation: CLLocation) {
        print(currentLocation)
       }
       
       func tracingLocationDidFailWithError(error: NSError) {
           print(error)
       }
       
}
