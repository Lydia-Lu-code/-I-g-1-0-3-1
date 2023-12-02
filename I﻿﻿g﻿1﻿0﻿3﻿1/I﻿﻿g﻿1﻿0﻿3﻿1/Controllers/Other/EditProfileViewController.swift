// EditProfileViewController.swift 是用來編輯個人檔案的視圖控制器
// 這個視圖控制器包含一個 UITableView 用於顯示不同的編輯項目
// 每個項目都有一個 label、placeholder 和可編輯的 value

import UIKit

// 表單模型，包含 label、placeholder 和 value
struct EditProfileFormModel {
    let label: String
    let placeholder: String
    var value: String?
}

// EditProfileViewController 類別繼承自 UIViewController 並實現 UITableViewDataSource 協定
final class EditProfileViewController: UIViewController, UITableViewDataSource {
    
    // UITableView 用於顯示編輯項目
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FormTableViewCell.self, forCellReuseIdentifier: FormTableViewCell.identifier)
        return tableView
    }()
    
    // 表單模型的二維陣列，每個陣列代表一個 section
    private var models = [[EditProfileFormModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 設定初始模型
        configureModel()
        
        // 將表頭設置為圖片的區塊
        tableView.tableHeaderView = createTableHeaderView()
        
        // 設定 UITableView 的數據源為自身
        tableView.dataSource = self
        
        // 將 UITableView 加入視圖
        view.addSubview(tableView)
        
        // 設定背景顏色
        view.backgroundColor = .systemBackground
        
        // 設定導覽列按鈕
        let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapCancel))
        navigationItem.leftBarButtonItems = [cancelButton]
        navigationItem.rightBarButtonItems = [saveButton]
        
        // ﻿正確註冊 cell
        
    }
    
    // 配置表單模型
    private func configureModel() {
        /// 第一個 section 包含 name、username、bio
        let section1Labels = ["Name", "Username", "Bio"]
        var section1 = [EditProfileFormModel]()
        for label in section1Labels {
            let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)...", value: nil)
            section1.append(model)
        }
        models.append(section1)
        
        // 第二個 section 包含 email、phone、gender
        let section2Labels = ["Email", "Phone", "Gender"]
        var section2 = [EditProfileFormModel]()
        for label in section2Labels {
            let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)...", value: nil)
            section2.append(model)
        }
        models.append(section2)
        
    }
    
    // 覆寫 viewDidLayoutSubviews 方法，設定 UITableView 的 frame
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    // MARK: - Tableview
    // 創建 UITableView 表頭的圖片區塊
    private func createTableHeaderView() -> UIView {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height/4).integral)
        let size = header.height/1.5
        let profilePhotoButton = UIButton(frame: CGRect(x: (view.width - size)/2, y: (header.height - size)/2, width: size, height: size))
        
        header.addSubview(profilePhotoButton)
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.layer.cornerRadius = size/2.0
        profilePhotoButton.tintColor = .label
        profilePhotoButton.addTarget(self, action: #selector(didTapProfileButton), for: .touchUpInside)
        profilePhotoButton.setBackgroundImage(UIImage(systemName: "person.circle"), for: .normal)
        
        profilePhotoButton.layer.borderWidth = 1
        profilePhotoButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        return header
    }
    
    // 當點擊圖片區塊時的動作
    @objc func didTapProfileButton() {
        // TODO: 實現點擊圖片區塊的相應操作
    }
    

    @objc private func didTapProfilePhotoButton() {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count // ﻿返回﻿﻿ tableView ﻿的﻿儲存格數量
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.identifier, for: indexPath) as! FormTableViewCell
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 1 else {
            return nil
        }
        return "Private Information"
    }
    
    
    
    // MARK: - Action
    
    // 處理點擊保存按鈕的動作
    @objc private func didTapSave() {
        // TODO: 將信息保存到數據庫
        dismiss(animated: true, completion: nil)
        
    }
    
    // 處理點擊取消按鈕的動作
    @objc private func didTapCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    // 處理點擊更改頭像按鈕的動作
    @objc private func didTapChangeProfilePicture() {
        
        // 彈出選擇更改頭像方式的操作表
        let actionSheet = UIAlertController(title: "Profile Picture", message: "Change profile picture", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            // TODO: 實現拍照操作
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose from Lirbrary", style: .default, handler: { _ in
            // TODO: 實現從相冊中選擇照片的操作
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // 在 iPad 上設置操作表的彈出位置
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        // 顯示操作表
        present(actionSheet, animated: true)
    }
}

// 額外實現 FormTableViewCellDelegate 協定的擴展
extension EditProfileViewController: FormTableViewCellDelegate {
    // 表單儲存格數據更新時的回調
    func formTableViewcell(_ cell: FormTableViewCell, didUpdateField updatedModel: EditProfileFormModel?) {
        // TODO: 處理表單數據更新
    }
    
    
}
