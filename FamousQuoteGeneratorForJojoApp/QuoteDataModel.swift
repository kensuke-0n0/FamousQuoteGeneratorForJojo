//
//  QuoteDataModel.swift
//  FamousQuoteGeneratorForJojoApp
//
//  Created by にしいけんすけ on 2024/06/14.
//

import RealmSwift

final class QuoteDataModel: Object {
    @Persisted var id: String = UUID().uuidString // データを一意に識別するための識別子
    @Persisted var quote: String = ""
    @Persisted var part: Int = 0
    @Persisted var characterName: String = ""
}
