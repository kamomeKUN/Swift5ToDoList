//
//  ViewController.swift
//  Swift5TableViewBasic
//
//  Created by kamomeKUN on 2020/02/15.
// Copyright ©︎ 2020 kamomeKUN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var todoTextField: UITextField!
    
    // テキストフィールドからん入力されたタスクを保持する配列(ToDoList)
    var todoArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        todoTextField.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        
        //　ハイライトの解除
        if let indexPathForSelectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
        
    }
    
    
    /*
     テキストフィールド、キーボードに関するメソッド
     */
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // テキストフィールドに入力があったら、todoArrayに文字列を追加する
        if let todo = todoTextField.text {
            
            // テキストフィールドに入力されているときのみ追加する
            if todo != "" {
                todoArray.append(todo)
                todoTextField.text = ""
                
                tableView.reloadData()
            }
            
        }
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    /*
     テーブルビューに関するメソッド
     */
    
    // セクションの数を設定するメソッド -> セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // セクションの中のセル数を指定する（必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }
    
    // セルの中身を構築する（必須）
    // セルの数分だけコールされる。その情報はIndexPathが保持してる。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // セルをタップした時のハイライトをOFFにする
//        cell.selectionStyle = .none
        cell.textLabel?.text = todoArray[indexPath.row]
        cell.imageView?.image = UIImage(named: "checkImage")
        
        return cell
    }
    
    // セルがタップされた時にコールされるメソッド
    // タップされたセルに紐づく配列の情報を取り出して、情報を渡して画面遷移する
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC =
        storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        
        detailVC.todoString = todoArray[indexPath.row]
        
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    // セルの高さを設定するメソッド（ストーリーボードの設定よりも優先される）
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height / 6
    }


}

