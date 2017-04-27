//
//  Event.swift
//  ManagerEvent_Quan
//
//  Created by quanmacos on 4/28/17.
//  Copyright © 2017 quanmacos. All rights reserved.
//

import Foundation
import UIKit

class Event
{
    //Bien luu ten Event
    var title: String
    
    //Bien luu chi tiet su kien
    var description: String
    
    init(titled: String, description: String)
    {
        self.title = titled
        self.description = description
    }
}
