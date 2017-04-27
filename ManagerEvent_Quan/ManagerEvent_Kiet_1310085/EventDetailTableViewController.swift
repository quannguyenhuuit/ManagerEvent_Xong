//
//  EventDetailTableViewController.swift
//  ManagerEvent_Kiet_1310085
//
//  Created by Kiet Nguyen on 4/23/17.
//  Copyright © 2017 Kiet Nguyen. All rights reserved.
//

import UIKit

class EventDetailTableViewController: UITableViewController, UITextViewDelegate, UITextFieldDelegate{

    //Model
    var event: Event?
    var dateEvent: String?
    var dateImages: UIImage?
    
    @IBOutlet weak var dateImageView: UIImageView!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var eventDesciptionTextView: UITextView!
    
    /*@IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var eventDescriptionTextView: UITextView!*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateImageView.image = dateImages
        eventTitle.text = event?.title
        eventDesciptionTextView.text = event?.description
        dateLable.text = dateEvent
        
    }
    
    
    // This will call when user go back ( this view will disappear )
    
    override func viewWillDisappear(_ animated: Bool) {
        event?.title = eventTitle.text!
        event?.description = eventDesciptionTextView.text!
    }
    
    // UITextFieldDelegate ( Keyboard will  disable when press return )
    // User must set delegate from this textfield to this view
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    // UIScrollViewDelegate ( Keyboard will disable when scroll the UIView )
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        eventDesciptionTextView.resignFirstResponder()
        eventTitle.resignFirstResponder()
    }
}
