//
//  CompletedTodoItemsController.swift
//  TodoList
//
//  Created by Eric Groom on 10/22/16.
//  Copyright © 2016 Eric Groom. All rights reserved.
//

import UIKit

class CompletedTodoItemsController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var completedTodoList: [Int:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completedTodoList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "completedTodoItemCell", for: indexPath)
        cell.textLabel?.text = completedTodoList[indexPath.row]
        return cell
    }
    

   
}
