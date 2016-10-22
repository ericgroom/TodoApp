//
//  AddTodoItemController.swift
//  TodoList
//
//  Created by Eric Groom on 10/21/16.
//  Copyright © 2016 Eric Groom. All rights reserved.
//

import UIKit

protocol AddTodoItemControllerDelegate: class {
    func addTodoItemToList(text:String)
}

class AddTodoItemController: UIViewController {
    

    @IBOutlet weak var TodoItemField: UITextField!
    
    weak var delegate: AddTodoItemControllerDelegate?
    
    @IBAction func CancelBarButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SaveBarButtonPressed(_ sender: AnyObject) {
        delegate?.addTodoItemToList(text: TodoItemField.text!)
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
