//
//  CovidDetailsViewModel.swift
//  Task
//
//  Created by LokeshReddy on 10/11/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import Foundation

class CovidDetailViewModel
{
   
    var covidCompulsoryString = "Keep your distance, wear a mask, wash your hands, air rooms regularly"
    var descriptionString = ""
    var trafficSignal = ""
  
    var rulesFollowString = ""
    var rulesMustFollowString = ""
    var rulesMustAndShouldFollowString = ""
    func forCheckingTheStatusOfCovid(cases7Per100K:Double) {
       // print(cases7Per100K )
       
        if cases7Per100K  <= 35.0{
         descriptionString = "These rules apply"
        rulesFollowString = "- Limitations of face-to-face contact in public spaces"
        rulesMustFollowString = "- Private events ( i.e. weddings etc. ) with a maximum of 100 participants in closed spaces and a maximum of 200 participants in the open"
            trafficSignal = "green"
            rulesMustAndShouldFollowString = "- Wearing a mask is mandatory when ( including, but not limited to)using public transportation,going shopping,eating and drinking in restaurants,bars, etc.and in case minimum distance (1.5m )cannot be kept"
        }else if cases7Per100K  > 35 && cases7Per100K <= 50 {
            descriptionString = "These rules apply"
            rulesFollowString = "- Private parties and contacts: no more than two households or ten people"
            rulesMustFollowString = "- Wearing a mask is mandatory in heavily frequented spaces, in pedestrian zones, in public buildings,in secondary schools during class, in universities, for attendees of ( sports ) events, etc."
            rulesMustAndShouldFollowString = "- Curfew and ban on selling as well as consuming alcohol in public spaces from 23:00 on"
            trafficSignal = "YELLOW"
        }else if cases7Per100K  > 50 && cases7Per100K  <= 100  {
            trafficSignal = "Red"
            descriptionString = "These rules apply"
            rulesMustFollowString = "- Wearing a mask is mandatory in heavily frequented spaces, in pedestrian zones, in public buildings,for all grades during class, in universities, for attendees of ( sports ) events, etc."
            rulesFollowString = "- Private parties and contacts: no more than 5 households or five people"
            rulesMustAndShouldFollowString = "- Curfew and ban on selling as well as consuming alcohol in public spaces from 22:00 on The ADDITONAL Signal for Bavaria"
        }else if cases7Per100K  > 100{
            trafficSignal = "DarkRed"
            descriptionString = "These rules apply"
            rulesFollowString = "- Events ( e.g. club meetings, sporting events, cultural events, etc. ) must not exceed 50 persons"
            rulesMustFollowString = "- Closing time for food / gastronomy outlets, ban on alcohol sales and alcohol consumption sales in specific public places form 21:00"
            rulesMustAndShouldFollowString = ""
        }
    }
   
        
    }

