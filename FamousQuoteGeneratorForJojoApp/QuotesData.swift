//
//  QuotesData.swift
//  FamousQuoteGeneratorForJojoApp
//
//  Created by にしいけんすけ on 2024/05/26.
//

import Foundation

struct Quote {
    let quote: String
    let characterName: String
}

struct QuotesData {
    static let quote1 = [
        Quote(quote: "ふるえるぞハート!\n燃えつきるほどヒート!!\nおおおおおっ\n刻むぞ血液のビート!", characterName: "ジョナサン・ジョースター"),
        Quote(quote: "なっ!\n何をするんだァーーーーーーッ\nゆるさんッ!", characterName: "ジョナサン・ジョースター"),
        Quote(quote: "歴史の\n闇に\n永遠に\n沈め!", characterName: "ジョナサン・ジョースター"),
        Quote(quote: "ぼくは\n本当の紳士を\nめざしているからだ!", characterName: "ジョナサン・ジョースター"),
        Quote(quote: "「策」ではないッ!\n「勇気」だッ!!", characterName: "ジョナサン・ジョースター"),
        Quote(quote: "ぼくの青春は\nディオとの青春!\nこれからその青春に\n決着をつけてやるッ!", characterName: "ジョナサン・ジョースター"),
        Quote(quote: "ぼくには指4本など\n失ってもいい理由がある!\nそれは父を守るため!\nジョースター家を守るため!\n君らとは戦う動機の\n「格」が違うんだ!", characterName: "ジョナサン・ジョースター"),
        Quote(quote: "ぼくは……\n父のためにここに来た……\nだから蹴る瞬間!\n君にも父や母や兄弟が\nいるはずだと思った……\n君の父親が悲しむことは\nしたくないッ!", characterName: "ジョナサン・ジョースター"),
        Quote(quote: "あんな\nクズに\n名誉など\nあるものかァーーーッ!!", characterName: "ジョナサン・ジョースター"),
        Quote(quote: "さびしいよ\n…………ああ\nぼくは　こうして\n悲しみのまま\n涙でずぶぬれになって\n死んでいくんだ", characterName: "ジョナサン・ジョースター"),
        Quote(quote: "君がッ\n泣くまで\n殴るのをやめないッ!", characterName: "ジョナサン・ジョースター"),
        Quote(quote: "信念さえあれば\n人間に不可能はない!\n人間は成長するのだ!", characterName: "ジョナサン・ジョースター"),
        Quote(quote: "貧弱!\n貧弱ゥ!", characterName: "ディオ・ブランドー"),
        Quote(quote: "おまえは今まで\n食ったパンの枚数を\nおぼえているのか？", characterName: "ディオ・ブランドー"),
        Quote(quote: "UREEYYY!!", characterName: "ディオ・ブランドー"),
        Quote(quote: "孤独は\n人間をカラッポにするからな!\nヤツを無気力な\nフヌケにしてやる!", characterName: "ディオ・ブランドー"),
        Quote(quote: "ジョジョ!\nその薬を調べるという事は\n我われの友情を疑う事!\n友情を失うぞッ!", characterName: "ディオ・ブランドー"),
        Quote(quote: "モンキーが人間に\n追いつけるかーッ\nおまえは\nこのディオにとっての\nモンキーなんだよ\nジョジョォォォォ\nーーーーーッ!!", characterName: "ディオ・ブランドー"),
        Quote(quote: "ファンファーレ\nでも吹いているのが\n似あっているぞッ!", characterName: "ディオ・ブランドー"),
        Quote(quote: "おれは人間をやめるぞ!\nジョジョーーーッ!!\nおれは\n人間を\n超越するッ!", characterName: "ディオ・ブランドー"),
        Quote(quote: "酒!\n飲まずには\nいられないッ!", characterName: "ディオ・ブランドー"),
        Quote(quote: "あの父親の精神は…………………\n息子のジョナサン・ジョースターが\n立派に受け継いでいる!\nそれは彼の強い意志となり\n誇りとなり\n未来となるだろうぜッ!!", characterName: "スピードワゴン"),
        Quote(quote: "こいつはくせえッー!\nゲロ以下のにおいが\nプンプンするぜッーーーーッ!!", characterName: "スピードワゴン"),
        Quote(quote: "心だ!\nあの人には今\n心が必要なんだッ!!", characterName: "スピードワゴン"),
        Quote(quote: "スピードワゴンはクールに去るぜ", characterName: "スピードワゴン"),
        Quote(quote: "ねーちゃん!\nあしたって\nいまさッ!", characterName: "ポコ"),
        Quote(quote: "この言葉をおまえに捧げよう!\nLuck!(幸運を)\nそして\n君の未来へこれを持って行けッ!\nPLUCK(勇気をッ!)", characterName: "ブラフォード"),
        Quote(quote: "なにジョジョ？\nダニーがおもちゃの鉄砲を\nくわえてはなさない？\nジョジョ　それは無理矢理\n引き離そうとするからだよ\n逆に考えるんだ\n「あげちゃってもいいさ」と\n考えるんだ", characterName: "ジョージ・ジョースター"),
        Quote(quote: "エリナ・ジョースターは…\nあなたと伴に死にます", characterName: "エリナ・ジョースター"),
        Quote(quote: "「勇気」とは\n「怖さ」を知ることッ!\n「恐怖」を我が物とする\nことじゃあッ!", characterName: "ウィル・A・ツェペリ"),
        Quote(quote: "ジョジョは\n悲しすぎる過去と\n重すぎる未来への責任を\n背負っているから\nできるのだ", characterName: "ウィル・A・ツェペリ"),
        Quote(quote: "これが運命なら\nあるがまま\n受け入れよう!", characterName: "ウィル・A・ツェペリ"),
        Quote(quote: "ある人間の不幸ってのは\nある人間を幸福にする\nウワッハハハハーーーッ", characterName: "ダリオ・ブランドー"),
        Quote(quote: "まあ!\nジョジョったらいけないひとッ!", characterName: "エリナ・ベンドルトン"),
        Quote(quote: "さすがディオ!\nおれたちができない事を\n平然とやってのけるッ\nそこにシビれる!\nあこがれるゥ!", characterName: "ディオの友人"),
        Quote(quote: "フフフ…\nこの「痛み」こそ「生」のあかし\nこの「痛み」あればこそ\n「喜び」も感じることができる\nこれが人間か…………", characterName: "ブラフォード"),
        Quote(quote: "わたしは最後に\n自分の全てを伝えた\n……………\nジョジョ…おまえはわしの希望だ!\nまるで親友と息子を同時に\n持ったような気持ちだぞ\nそして　わしはこれから\nお前の中で生きるんじゃ…", characterName: "ウィル・A・ツェペリ"),
        Quote(quote: "わたしも\n貧困の中に生まれたなら\n同じことをしていたかもしれない………\n……………指輪を売って\n家族になにか買ってやってください…\nそしてもう悪の人ではなく\n善の人になるのです", characterName: "ジョージ・ジョースター"),
        Quote(quote: "人間讃歌は「勇気」の讃歌ッ!!\n人間のすばらしさは勇気のすばらしさ!!", characterName: "ウィル・A・ツェペリ")
    ]
    
    static let quote2 = [
        Quote(quote: "", characterName: "")
    ]
}
