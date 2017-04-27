//
//  EventLine.swift
//  ManagerEvent_Quan
//
//  Created by quanmacos on 4/28/17.
//  Copyright © 2017 quanmacos. All rights reserved.
//

import Foundation
import UIKit
class EventLine
{
    
    //Khai bao bien cac ngay trong tuan
    var dates: String
    //Khai bao cac su kien trong ngay
    var events: [Event]
    //Hinh cho tung ngay
    var dateImages: UIImage
    
    init(dateOfWeek: String, includeEvents: [Event], dateImage: UIImage)
    {
        dates = dateOfWeek
        events = includeEvents
        dateImages = dateImage
    }
    
    class func eventLines() -> [EventLine]
    {
        return [self.cn(), self.t2(), self.t3(), self.t4(), self.t5(), self.t6(), self.t7()]
    }
    
    //Cac su kien trong ngay chu nhat
    private class func cn() -> EventLine {
        
        var events = [Event]()
        
        events.append(Event(titled: "Thuc day", description: "Buoi sang thuc day thoi nao 6:00"))
        events.append(Event(titled: "Di hoc", description: "Toi gio di hoc roi 7:00"))
        events.append(Event(titled: "Vao hoc buoi chieu", description: "Vao hoc tiep thoi 13:00"))
        events.append(Event(titled: "Lam bai tap", description: "Toi roi lam bai tap thoi 20:00"))
        
        return EventLine(dateOfWeek: "Chủ Nhật", includeEvents: events, dateImage: #imageLiteral(resourceName: "Sunday"))
    }
    
    
    //Cac su kien trong ngay thu 2
    private class func t2() -> EventLine {
        
        var events = [Event]()
        
        events.append(Event(titled: "Ve sinh ca nhan", description: "6:00 roi day ve sinh ca nhan thoi"))
        events.append(Event(titled: "Di hoc", description: "Toi gio di hoc roi 7:00"))
        events.append(Event(titled: "Danh bong chuyen", description: "Toi gio danh bong chuyen roi 17:00"))
        events.append(Event(titled: "Lam bai tap", description: "Toi roi lam bai tap thoi 20:00"))
        
        return EventLine(dateOfWeek: "Thứ 2", includeEvents: events, dateImage: #imageLiteral(resourceName: "Monday"))
    }
    
    
    //Cac su kien trong ngay thu 3
    private class func t3() -> EventLine {
        
        var events = [Event]()
        
        events.append(Event(titled: "Doc sach", description: "Thuc day doc sach thoi 7:00"))
        events.append(Event(titled: "Di hoc", description: "Toi lop thoi 13:00"))
        
        return EventLine(dateOfWeek: "Thứ 3", includeEvents: events, dateImage: #imageLiteral(resourceName: "Tuesday"))
    }
    
    
    //Cac su kien trong ngay thu 4
    private class func t4() -> EventLine {
        
        var events = [Event]()
        
        events.append(Event(titled: "Tham nha ban", description: "Chay qua Quan 9 tham ban thoi"))
        events.append(Event(titled: "An trua", description: "Gio an den roi"))
        events.append(Event(titled: "Lam bai tap", description: "13:00 hoc bai thoi"))
        events.append(Event(titled: "Di ngu", description: "Len giuong dap chan thoi"))
        
        return EventLine(dateOfWeek: "Thứ 4", includeEvents: events, dateImage: #imageLiteral(resourceName: "Wednesday"))
    }
    
    
    //Cac su kien trong ngay thu 5
    private class func t5() -> EventLine {
        
        var events = [Event]()
        
        events.append(Event(titled: "An sang", description: "6:00 An sang tap the duc thoi"))
        events.append(Event(titled: "Di hoc", description: "7:00 roi di hoc thoi"))
        events.append(Event(titled: "Lam bai tap", description: "20:00 Lam bai tap thoi"))
        
        return EventLine(dateOfWeek: "Thứ 5", includeEvents: events, dateImage: #imageLiteral(resourceName: "Thusday"))
    }
    
    
    //Cac su kien trong ngay thu 6
    private class func t6() -> EventLine {
        
        var events = [Event]()
        
        events.append(Event(titled: "Di hoc", description: "7:00 roi di hoc thoi"))
        events.append(Event(titled: "An sinh nhat", description: "Vao thanh pho an sinh nhat thoi"))
        
        return EventLine(dateOfWeek: "Thứ 6", includeEvents: events, dateImage: #imageLiteral(resourceName: "Friday"))
    }
    
    
    //Cac su kien trong ngay thu 7
    private class func t7() -> EventLine {
        
        var events = [Event]()
        
        events.append(Event(titled: "Di hoc", description: "7:00 ngay cuoi tuan di hoc vui ve"))
        events.append(Event(titled: "Uong cafe", description: "Co hen Co hen voi ban nhe"))
        events.append(Event(titled: "Di coi phim", description: "Vincom Thu Duc thang tien"))
        
        return EventLine(dateOfWeek: "Thứ 7", includeEvents: events, dateImage: #imageLiteral(resourceName: "Satuday"))
    }
}
