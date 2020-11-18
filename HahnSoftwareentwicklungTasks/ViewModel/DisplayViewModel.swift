//
//  DisplayViewModel.swift
//  Task
//
//  Created by LokeshReddy on 09/11/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import Foundation
class DisplayListViewModel{
    
     let url = Urls()

     func fetchData(Complection:@escaping([DisplayViewModel])->()){
    WebService().parsingJSON(forResource: "RKI_Corona_Landkreise", ofType: "json") { [unowned self]
        displayLists in
        DispatchQueue.main.async {
            
             Complection(displayLists.map(DisplayViewModel.init)) 
          
            
        }
       
    }
    }
    
    func getAllData(Complection:@escaping([DataResponseViewModel])->())
    {
        guard let url = URL(string: url.getData)else{return}
        WebService().getApiData(requestUrl: url, resultType: DataToGet.self) { [unowned self] requiredData in
            print(requiredData ?? [DataToGet].self )
            
            Complection(requiredData?.features.map(DataResponseViewModel.init) ?? [DataResponseViewModel]())
            
            
            
            
        }
    }
    }
    

struct DisplayViewModel {
    var display:Display
    init(display:Display) {
        self.display = display
    }
    var RS:Double{
        return Double(self.display.rs)
    }
    var GEN:String{
        return self.display.gen ?? ""
    }
    
}
struct DataResponseViewModel {
    var features:Feature
    init(features:Feature) {
        self.features = features
    }
    
    var cases7Per100K:Double
    {
        return Double(self.features.attributes.cases7Per100K)
    }
    var rs:String{
        return self.features.attributes.rs
    }
    
}
