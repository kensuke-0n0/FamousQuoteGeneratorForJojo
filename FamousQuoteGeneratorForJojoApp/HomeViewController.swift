//
//  ViewController.swift
//  FamousQuoteGeneratorForJojoApp
//
//  Created by にしいけんすけ on 2024/05/13.
//

import UIKit

/// ホーム画面
class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    let dataArray = ["jojo_1", "jojo_2", "jojo_3","jojo_4",
                     "jojo_5", "jojo_6", "jojo_7", "jojo_8", "favorite"]
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
    }
    
    // MARK: - Other Methods
    
    func configureCollectionView() {
        // データソースを適用します
        collectionView.dataSource = self
        // デリゲートを適用します
        collectionView.delegate = self
        // カスタムセルを登録
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: "Cell")
    }
}

// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
    /// セルのタップを伝えるメソッド
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        // タップされた時の処理を記述
        switch indexPath.row {
        case 0:
            print("１部")
        case 1:
            print("２部")
        case 2:
            print("３部")
        case 3:
            print("４部")
        case 4:
            print("５部")
        case 5:
            print("６部")
        case 6:
            print("７部")
        case 7:
            print("８部")
        case 8:
            print("お気に入り")
        default:
            break
        }
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    /// セルの数を決めるメソッド
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    /// セルの内容設定メソッド
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",
                                                      for: indexPath)as! HomeCollectionViewCell
        cell.imageView.image = UIImage(named: dataArray[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    /// セルのサイズを指定するメソッド
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 横方向のスペース調整
        let horizontalSpace: CGFloat = 5
        
        //セルのサイズを指定。画面上にセルを3つ表示させたいのであれば、デバイスの横幅を3分割した横幅　- セル間のスペース*2（セル間のスペースが二つあるため）
        let cellSize: CGFloat = self.view.bounds.width / 3 - horizontalSpace * 2
        
        // 正方形で返すためにwidth,heightを同じにする
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 30.0 // 行間
    }
}
