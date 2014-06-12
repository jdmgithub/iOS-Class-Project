//
//  RootViewController.swift
//  SwiftToDo
//
//  Created by Jeffery Moulds on 6/12/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

import UIKit


class RootViewController: UITableViewController, UITextFieldDelegate {

    var dinosaurs = ["Stegosaurus", "T-Rex", "Velociraptor"]
    var inputField = UITextField(frame:CGRectMake(10, 10, 200, 40))
    

    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        
//        self.tableView.editing = true
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        var inputForm = UIView(frame:CGRectMake(0, 0, 320, 60))
    
        inputField.delegate = self
        inputField.placeholder = "New Input"
        
        
        inputForm.addSubview(inputField)
        
        
        
        var inputButton = UIButton(frame:CGRectMake(220, 10, 90, 40))
        
        inputButton.setTitle("Add New", forState: UIControlState.Normal)
        inputButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        inputButton.addTarget(self, action: "addNew", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        inputForm.addSubview(inputButton)
        
        self.tableView.tableHeaderView = inputForm
    
    }
    
    func addNew()
    {
        println(inputField.text)

        if inputField.text == ""{
            return
        }
        
        // Insert at End
//         dinosaurs += inputField.text
        
        dinosaurs.insert(inputField.text, atIndex: 0)
        
        inputField.text = ""

        self.tableView.reloadData()
        
        inputField.resignFirstResponder()
        
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool
    {
//        textField.resignFirstResponder()
        
        addNew()
        
        return true
    
    }
    
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
//        self.dinosaurs += "Longneck"  // wont add b/c let used instead of var
        return dinosaurs.count
    }
    
    
    
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
    
        var cell = UITableViewCell()
        cell.contentView.backgroundColor = UIColor.greenColor()
        cell.textLabel.text = dinosaurs[indexPath.row]
        
        return cell
        
    }

// Delete Swipe...
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!)
    {
    
        if editingStyle == UITableViewCellEditingStyle.Delete{
            
            dinosaurs.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            
        }
    
    }
    
    override func tableView(tableView: UITableView!, moveRowAtIndexPath sourceIndexPath: NSIndexPath!, toIndexPath destinationIndexPath: NSIndexPath!)
    {
        
        var movedItem = dinosaurs[sourceIndexPath.row]
        dinosaurs.removeAtIndex(sourceIndexPath.row)
        dinosaurs.insert(movedItem, atIndex: destinationIndexPath.row)
    
    }
    
    
    override func prefersStatusBarHidden() -> Bool  {return true}
}
