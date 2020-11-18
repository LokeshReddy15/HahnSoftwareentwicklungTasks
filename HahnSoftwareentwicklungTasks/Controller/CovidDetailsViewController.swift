//
//  CovidDetailsViewController.swift
//  Task
//
//  Created by LokeshReddy on 10/11/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import UIKit

class CovidDetailsViewController: UIViewController {
    
    @IBOutlet weak var covidCompulsoryLab: UILabel!
    var cases7Per100K = Double()
    @IBOutlet weak var rulesToFollow: UILabel!
    @IBOutlet weak var rulesMustFollow: UILabel!
    @IBOutlet weak var rulesMustAndShouldFollow: UILabel!
    var ViewModel = CovidDetailViewModel()
    @IBOutlet weak var ruleLabel: UILabel!
    @IBOutlet weak var tafficSignalImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
         ViewModel.forCheckingTheStatusOfCovid(cases7Per100K: cases7Per100K)
          updateUI()
    }
    func updateUI()
    {
        tafficSignalImage.image = UIImage(named:ViewModel.trafficSignal)
        ruleLabel.text = ViewModel.descriptionString.localizedString()
        rulesToFollow.text = ViewModel.rulesFollowString.localizedString()
        rulesMustFollow.text = ViewModel.rulesMustFollowString.localizedString()
        rulesMustAndShouldFollow.text = ViewModel.rulesMustAndShouldFollowString.localizedString()
        covidCompulsoryLab.text = ViewModel.covidCompulsoryString.localizedString()
    
    }
}
extension String{
    func localizedString()-> String{
        return NSLocalizedString(self, tableName: "GermanSupport", bundle: .main, value: self, comment: self)
    }
}
