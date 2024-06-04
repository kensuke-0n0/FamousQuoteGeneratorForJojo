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
    
    private let dataArray = ["jojo_1", "jojo_2", "jojo_3","jojo_4",
                             "jojo_5", "jojo_6", "jojo_7", "jojo_8", "favorite"]
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
    }
    
    // MARK: - Other Methods
    
    private func configureCollectionView() {
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
            let quote1VC = Quote1ViewController()
            navigationController?.pushViewController(quote1VC, animated: true)
        case 1:
            let quote2VC = Quote2ViewController()
            navigationController?.pushViewController(quote2VC, animated: true)
        case 2:
            let quote3VC = Quote3ViewController()
            navigationController?.pushViewController(quote3VC, animated: true)
        case 3:
            let quote4VC = Quote4ViewController()
            navigationController?.pushViewController(quote4VC, animated: true)
        case 4:
            let quote5VC = Quote5ViewController()
            navigationController?.pushViewController(quote5VC, animated: true)
        case 5:
            let quote6VC = Quote6ViewController()
            navigationController?.pushViewController(quote6VC, animated: true)
        case 6:
            let quote7VC = Quote7ViewController()
            navigationController?.pushViewController(quote7VC, animated: true)
        case 7:
            let quote8VC = Quote8ViewController()
            navigationController?.pushViewController(quote8VC, animated: true)
        case 8:
            let favoriteVC = FavoriteViewController()
            navigationController?.pushViewController(favoriteVC, animated: true)
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
        
        //セルのサイズを指定。画面上にセルを3つ表示させたいのであれば、デバイスの横幅を3分割した横幅　- セル間のスペース*2（セル間のスペースが2つあるため）
        let cellSize: CGFloat = collectionView.frame.width / 3 - horizontalSpace * 2
        
        // 正方形で返すためにwidth,heightを同じにする
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0 // 行間
    }
}
