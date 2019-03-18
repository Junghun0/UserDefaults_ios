//
//  ListViewController.swift
//  UserDefaults_ios
//
//  Created by 박정훈 on 18/03/2019.
//  Copyright © 2019 swift. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController{
    
    @IBOutlet var name: UILabel!
    @IBOutlet var gender: UISegmentedControl!
    @IBOutlet var married: UISwitch!
    
    @IBOutlet var edit: UITapGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plist = UserDefaults.standard
        //저장된 값을 꺼내어 각 컨트롤에 설정한다.
        self.name.text = plist.string(forKey: "name")
        self.married.isOn = plist.bool(forKey: "married")
        self.gender.selectedSegmentIndex = plist.integer(forKey: "gender")
    }
    
    @IBAction func edit_name(_ sender: UITapGestureRecognizer) {
        
        let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
        
        alert.addTextField(){
            $0.text = self.name.text
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default){
            (_) in
            let value = alert.textFields?[0].text
            
            let plist = UserDefaults.standard
            plist.setValue(value, forKey: "name")
            plist.synchronize()
            
            self.name.text = value
        })
        self.present(alert,animated: false)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return super.numberOfSections(in: tableView)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return super.tableView(tableView, numberOfRowsInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*if indexPath.row == 0{
            //입력이 가능한 알림창을 띄워 이름을 수정할 수 있도록한다.
            let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
            
            //입력 필드 추가
            alert.addTextField(){
                $0.text = self.name.text
            }
            
            //버튼 및 액션 추가
            alert.addAction(UIAlertAction(title: "OK", style: .default){(_) in
                //사용자가 ok 버튼을 누르면 입력 필드에 입력된 값을 저장한다.
                let value = alert.textFields?[0].text
                
                let plist = UserDefaults.standard //기본 저장소를 가져온다.
                plist.setValue(value, forKey: "name")
                plist.synchronize()//동기화 처리
                
                self.name.text = value
            })
            
            self.present(alert,animated: false)
        }*/
    }
    
    @IBAction func changeGender(_ sender: UISegmentedControl) {
        let value = sender.selectedSegmentIndex // 0남자 1여자
        
        let plist = UserDefaults.standard// 기본 저장소 객체를 가져옴
        plist.set(value, forKey: "gender")//"gender" 키값으로 저장
        plist.synchronize()//동기화처리
    }
    
    @IBAction func changeMarried(_ sender: UISwitch) {
        let value = sender.isOn
        
        let plist = UserDefaults.standard //기본 저장소 객체를 가져옴
        plist.set(value, forKey: "married")//"married" 키값으로 저장
        plist.synchronize()//동기화처리
    }
    
}
