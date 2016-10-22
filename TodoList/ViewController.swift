//
//  ViewController.swift
//  TodoList
//
//  Created by Eric Groom on 10/21/16.
//  Copyright © 2016 Eric Groom. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTodoItemControllerDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    var todoList: NSMutableArray = ["Go get groceries", "Walk the dog", "Watch a movie", "Do your homework"]
    
    var completedTodoList: [Int:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resetAccessoryType()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count 
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        cell.textLabel?.text = todoList[indexPath.row] as! String
        return cell
    }
    
    func addTodoItemToList(text:String) {
        todoList[todoList.count] = text
        
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func resetAccessoryType () {
        for row in 0..<todoList.count {
            if let cell = tableView.cellForRow(at: NSIndexPath(row: row, section: 0) as IndexPath) {
                cell.accessoryType = .none
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
                completedTodoList[completedTodoList.count] = todoList[indexPath.row] as! String
                todoList.removeObject(at: indexPath.row)
            } else {
                cell.accessoryType = .none
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "AddTodoItemSegue") {
            let navigationController = segue.destination as! UINavigationController
            let addTodoItemViewController = navigationController.topViewController as! AddTodoItemController
            
            addTodoItemViewController.delegate = self
        } else if (segue.identifier == "CompletedTodoItemsSegue"){
            let CompletedTodoItemsController = segue.destination as! CompletedTodoItemsController
            CompletedTodoItemsController.completedTodoList = completedTodoList as! [Int:String]
        }
        
    }


}

