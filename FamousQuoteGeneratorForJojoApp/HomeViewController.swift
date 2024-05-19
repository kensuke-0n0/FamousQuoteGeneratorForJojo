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
        collectionView.register(UINib(nibName: "QuoteCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: "Cell1")
    }
}



// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    /// セルの数を決めるメソッド
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    /// セルの内容設定メソッド
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1",
                                                      for: indexPath)as! QuoteCollectionViewCell
        cell.backgroundColor = UIColor.lightGray
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
}
