import Foundation

enum GrammarLibrary {

    static func points(for category: GrammarCategory) -> [GrammarPoint] {
        all.filter { $0.category == category }
    }

    static let all: [GrammarPoint] = [

        // MARK: - Ability & Possibility

        GrammarPoint(
            title: "～ことができる",
            simplifiedRule: "Verb (dictionary form) + ことができる",
            englishExplanation: "ことができる is used to express the ability or possibility to do something. It turns an action into a noun phrase using こと, then adds できる. It's a more formal way to say 'can' than using the potential form of a verb.",
            japaneseExplanation: "「ことができる」は、何かをする能力や可能性があることを表す表現です。動詞を名詞化する「こと」に、「できる」をつけることで、「〜することができる」という意味になります。",
            examples: [
                GrammarExample(japanese: "私は日本語を読むことができる。", english: "I can read Japanese.", register: nil),
                GrammarExample(japanese: "彼はピアノを弾くことができる。", english: "He can play the piano.", register: nil),
                GrammarExample(japanese: "この図書館では静かに話すことができる。", english: "You can talk quietly in this library.", register: nil),
                GrammarExample(japanese: "明日なら手伝うことができる。", english: "I can help you tomorrow.", register: nil)
            ],
            nuanceNotes: nil,
            category: .abilityPossibility
        ),

        GrammarPoint(
            title: "～かもしれない",
            simplifiedRule: "Verb (dictionary form or ない-form) + かもしれない",
            englishExplanation: "Used to express uncertainty or possibility, similar to 'might' or 'may' in English. It indicates that something is not certain but is possible. It can attach to both positive and negative forms.",
            japaneseExplanation: "「～かもしれない」は、何かが起こる可能性があるが、確実ではないという気持ちを表します。肯定にも否定にも使えます。丁寧に言いたいときは「かもしれません」にします。",
            examples: [
                GrammarExample(japanese: "彼はもう寝ているかもしれない。", english: "He might already be asleep.", register: .casual),
                GrammarExample(japanese: "来週、雪が降るかもしれません。", english: "It might snow next week.", register: .polite),
                GrammarExample(japanese: "バスが遅れるかもしれない。", english: "The bus might be late.", register: .casual),
                GrammarExample(japanese: "その店は今日は開いていないかもしれません。", english: "That store might not be open today.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .abilityPossibility
        ),

        GrammarPoint(
            title: "～ようになる",
            simplifiedRule: "Verb (plain form) + ようになる / ないようになる",
            englishExplanation: "Use ～ようになる to express a change in ability, habit, or state — something that wasn't possible or habitual before but now is. Use the negative form to indicate becoming unable to do something.",
            japaneseExplanation: "「～ようになる」は、能力や習慣などが変化することを表します。前はできなかったことができるようになる、あるいはその逆にできなくなるという意味です。",
            examples: [
                GrammarExample(japanese: "最近、早く起きるようになった。", english: "Lately, I've started waking up early.", register: .casual),
                GrammarExample(japanese: "毎日運動するようになりました。", english: "I've started exercising every day.", register: .polite),
                GrammarExample(japanese: "年をとって、お酒が飲めないようになった。", english: "As I got older, I became unable to drink alcohol.", register: .casual),
                GrammarExample(japanese: "環境の変化で外で遊ばないようになりました。", english: "Due to changes in the environment, I no longer play outside.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .abilityPossibility
        ),

        GrammarPoint(
            title: "～わけではない",
            simplifiedRule: "[Plain form] + わけではない (な-adjectives and nouns: use な before わけではない)",
            englishExplanation: "Use ～わけではない to clarify that something is not always or not entirely true. It's often used to soften a denial, clarify nuance, or reject an assumption without completely negating it.",
            japaneseExplanation: "「～わけではない」は、「必ずしも〜とは言えない」「全部そうではない」という意味を表します。誤解を解いたり、部分的に否定したりする時によく使われます。",
            examples: [
                GrammarExample(japanese: "嫌いなわけではないけど、あまり食べたくない。", english: "It's not that I hate it, but I just don't really want to eat it.", register: .casual),
                GrammarExample(japanese: "忙しいわけではありませんが、今日は行けません。", english: "It's not that I'm busy, but I can't go today.", register: .polite),
                GrammarExample(japanese: "全部理解したわけではない。", english: "It's not like I understood everything.", register: .casual),
                GrammarExample(japanese: "高い料理が好きなわけではありません。", english: "It's not that I like expensive food.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .abilityPossibility
        ),

        GrammarPoint(
            title: "～こともある",
            simplifiedRule: "Verb (plain form) / い-adjective / な-adjective・noun (だ) + こともある",
            englishExplanation: "Used to say that something sometimes happens or there are occasions when it is true, even if it is not the usual case. It often implies low frequency or an exception rather than a regular habit.",
            japaneseExplanation: "「～こともある」は、「いつもではないが、時々そういう場合がある」という意味です。普通は起こらないこと、一般的ではないことについて、「例外として起こることがある」と言いたいときに使います。",
            examples: [
                GrammarExample(japanese: "雨が降らない日でも、突然嵐になることもある。", english: "Even on days when it doesn't rain, it can sometimes suddenly become stormy.", register: nil),
                GrammarExample(japanese: "彼は普段は静かだが、冗談を言うこともある。", english: "He's usually quiet, but he does joke sometimes.", register: nil),
                GrammarExample(japanese: "忙しくて、朝ごはんを食べないこともあります。", english: "Because I'm busy, there are times when I don't eat breakfast.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .abilityPossibility
        ),

        GrammarPoint(
            title: "～はずです",
            simplifiedRule: "Verb (plain form) / い-adjective / な-adjective・noun (だ) + はずです",
            englishExplanation: "Expresses a logical expectation or strong belief that something is true, based on evidence, knowledge, or common sense. Often translates as 'should be,' 'is supposed to,' or 'I expect that.'",
            japaneseExplanation: "「～はずです」は、理由や根拠があって「当然そうなる」「そうであるはずだ」と考えるときに使います。単なる推測ではなく、論理的な判断・期待を表します。",
            examples: [
                GrammarExample(japanese: "もう家に着いているはずです。", english: "He should have arrived home already.", register: nil),
                GrammarExample(japanese: "この店は10時に開くはずです。", english: "This shop is supposed to open at 10.", register: nil),
                GrammarExample(japanese: "彼は今日来ないはずです。", english: "He shouldn't be coming today.", register: nil)
            ],
            nuanceNotes: "Related forms: ～はずがない (there's no way / impossible), ～はずだった (was supposed to but didn't happen).",
            category: .abilityPossibility
        ),

        GrammarPoint(
            title: "～のに慣れている",
            simplifiedRule: "Verb (dictionary form) + のに慣れている / Noun + に慣れている",
            englishExplanation: "Means 'to be used to doing' or 'to be accustomed to.' It expresses that through repetition or experience, the action or situation now feels normal or easy.",
            japaneseExplanation: "「～のに慣れている」は、同じことを何度も経験して、その行動や状況が普通に感じられる状態を表します。",
            examples: [
                GrammarExample(japanese: "日本で生活するのに慣れています。", english: "I'm used to living in Japan.", register: nil),
                GrammarExample(japanese: "朝早く起きるのに慣れました。", english: "I got used to waking up early.", register: nil),
                GrammarExample(japanese: "人前で話すのに慣れていない。", english: "I'm not used to speaking in front of people.", register: nil)
            ],
            nuanceNotes: "～に慣れる = become used to (change/process). ～に慣れている = be used to (current state).",
            category: .abilityPossibility
        ),

        // MARK: - Desire & Intention

        GrammarPoint(
            title: "～たい",
            simplifiedRule: "Verb (ます-stem) + たい",
            englishExplanation: "たい is attached to the ます-stem of a verb to express what the speaker wants to do. This form only applies to the speaker's desires or those of people whose inner feelings the speaker can reasonably know.",
            japaneseExplanation: "「たい」は、動詞のます形の語幹につけて、何かをしたいという気持ち・欲求を表します。自分の希望を表すのが基本で、他人の希望を言うときには注意が必要です。",
            examples: [
                GrammarExample(japanese: "日本へ行きたいです。", english: "I want to go to Japan.", register: nil),
                GrammarExample(japanese: "何か甘いものが食べたい。", english: "I want to eat something sweet.", register: nil),
                GrammarExample(japanese: "その話、もっと聞きたいな。", english: "I want to hear more about that story.", register: nil)
            ],
            nuanceNotes: nil,
            category: .desireIntention
        ),

        GrammarPoint(
            title: "～がほしい",
            simplifiedRule: "Noun + がほしい / がほしくない",
            englishExplanation: "Use ～がほしい to express wanting a physical object or tangible item. This pattern is used when the speaker wants something for themselves. To say you don't want it, use ～がほしくない.",
            japaneseExplanation: "「～がほしい」は、自分が物や具体的なものを欲しがっているときに使います。形容詞「ほしい」を使い、否定は「ほしくない」となります。",
            examples: [
                GrammarExample(japanese: "新しいカバンがほしいなあ。", english: "I really want a new bag.", register: .casual),
                GrammarExample(japanese: "もっと時間がほしいです。", english: "I want more time.", register: .polite),
                GrammarExample(japanese: "高いプレゼントはほしくないです。", english: "I don't want an expensive gift.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .desireIntention
        ),

        GrammarPoint(
            title: "～てほしい",
            simplifiedRule: "Person + に + Verb (て-form) + ほしい / ほしくない",
            englishExplanation: "Use ～てほしい to express a desire for someone else to do something. For things you don't want them to do, use ～ないでほしい.",
            japaneseExplanation: "「～てほしい」は、他人に何かをしてもらいたいという願望を表します。「～ないでほしい」は、その人に何かをしないでほしいという気持ちを表します。",
            examples: [
                GrammarExample(japanese: "先生にもっとゆっくり話してほしい。", english: "I want the teacher to speak more slowly.", register: .casual),
                GrammarExample(japanese: "子どもたちに静かにしてほしいです。", english: "I want the children to be quiet.", register: .polite),
                GrammarExample(japanese: "彼に約束を忘れないでほしい。", english: "I don't want him to forget the promise.", register: .casual)
            ],
            nuanceNotes: nil,
            category: .desireIntention
        ),

        GrammarPoint(
            title: "～つもり",
            simplifiedRule: "Verb (dictionary form or ない-form) + つもり",
            englishExplanation: "Used to express one's intention or plan to do (or not do) something. It shows a decision has been made by the speaker about their own actions.",
            japaneseExplanation: "「～つもり」は、自分の意志や予定を表すときに使います。動詞の辞書形で肯定、ない形で否定の意思や計画を伝えます。",
            examples: [
                GrammarExample(japanese: "来年、日本に留学するつもりだ。", english: "I plan to study abroad in Japan next year.", register: .casual),
                GrammarExample(japanese: "週末に映画を見るつもりです。", english: "I plan to watch a movie this weekend.", register: .polite),
                GrammarExample(japanese: "今回は参加しないつもりです。", english: "I don't intend to participate this time.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .desireIntention
        ),

        GrammarPoint(
            title: "～つもりはない",
            simplifiedRule: "Verb (dictionary form) + つもりはない",
            englishExplanation: "Means 'I have no intention of doing.' It clearly denies intent and is often used to correct a misunderstanding or firmly state one's stance.",
            japaneseExplanation: "「～つもりはない」は、「～する考え・予定・意志がない」という意味です。相手に誤解されているときや、「その気はありません」とはっきり伝えたいときによく使います。",
            examples: [
                GrammarExample(japanese: "行くつもりはありません。", english: "I have no intention of going.", register: nil),
                GrammarExample(japanese: "彼を傷つけるつもりはなかった。", english: "I didn't intend to hurt him.", register: nil),
                GrammarExample(japanese: "辞めるつもりはまったくない。", english: "I have absolutely no intention of quitting.", register: nil)
            ],
            nuanceNotes: "～つもりだ = intention/plan. ～つもりはない = clear denial of intention. Past form ～つもりはなかった = denies intent in the past.",
            category: .desireIntention
        ),

        GrammarPoint(
            title: "～てもらえますか",
            simplifiedRule: "Verb (て-form) + もらえますか",
            englishExplanation: "Use ～てもらえますか to politely ask someone to do something for you. It literally means 'can I receive the favor of you doing...?' and is softer than direct commands.",
            japaneseExplanation: "「～てもらえますか」は、相手に何かをしてもらいたいときの丁寧な頼み方です。",
            examples: [
                GrammarExample(japanese: "ちょっと待ってもらえる？", english: "Could you wait a moment?", register: .casual),
                GrammarExample(japanese: "窓を閉めてもらえますか？", english: "Could you close the window?", register: .polite),
                GrammarExample(japanese: "ここでは電話しないでもらえますか？", english: "Could you please not make phone calls here?", register: .polite)
            ],
            nuanceNotes: nil,
            category: .desireIntention
        ),

        GrammarPoint(
            title: "Volitional + とする",
            simplifiedRule: "[Volitional form of verb] + とする",
            englishExplanation: "Used when someone tries to do something, is about to do something, or makes an effort to do it. Often describes an attempt that may or may not succeed.",
            japaneseExplanation: "自分や他人が何かをしようと「試みる」「しようとする瞬間」を表す。実際に成功したかどうかは分からない。",
            examples: [
                GrammarExample(japanese: "ドアを開けようとしたけど、開かなかった。", english: "I tried to open the door, but it wouldn't open.", register: .casual),
                GrammarExample(japanese: "犬が外に出ようとしています。", english: "The dog is trying to go outside.", register: .polite),
                GrammarExample(japanese: "先生に質問しようとしましたが、忘れました。", english: "I tried to ask the teacher a question, but I forgot.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .desireIntention
        ),

        GrammarPoint(
            title: "Volitional + と思っています",
            simplifiedRule: "(Verb volitional form) + と思っています",
            englishExplanation: "Expresses a plan or intention that the speaker has been thinking about for some time. Compared with volitional + と思います (a decision made at the moment of speaking), this shows that the intention already exists and continues now.",
            japaneseExplanation: "「〜（よ）うと思っています」は、以前から考えている意志・予定が現在も続いていることを表します。「〜（よ）うと思います」はその場で決めた意志ですが、「〜（よ）うと思っています」は前からそうしようと考えているニュアンスになります。",
            examples: [
                GrammarExample(japanese: "来月、引っ越そうと思っています。", english: "I've been thinking about moving next month.", register: nil),
                GrammarExample(japanese: "大学で日本語を専攻しようと思っています。", english: "I've been planning to major in Japanese at university.", register: nil),
                GrammarExample(japanese: "今年は運動を続けようと思っています。", english: "I've been intending to continue exercising this year.", register: nil)
            ],
            nuanceNotes: nil,
            category: .desireIntention
        ),

        // MARK: - Obligation & Permission

        GrammarPoint(
            title: "～必要がある",
            simplifiedRule: "Verb (dictionary form) + 必要がある / 必要はない",
            englishExplanation: "Use ～必要がある to state that something must be done — it's necessary. To express that it's not necessary, use ～必要はない. This structure focuses on external or logical necessity rather than obligation from rules.",
            japaneseExplanation: "「～必要がある」は、何かをすることが必要・重要であるという意味を表します。逆に「～必要はない」は、それをする必要がないことを表します。",
            examples: [
                GrammarExample(japanese: "もう一度説明する必要があるね。", english: "It's necessary to explain it again.", register: .casual),
                GrammarExample(japanese: "その問題について考える必要があります。", english: "There's a need to think about that issue.", register: .polite),
                GrammarExample(japanese: "この書類を提出する必要はありません。", english: "There's no need to submit this document.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .obligationPermission
        ),

        GrammarPoint(
            title: "～なければならない",
            simplifiedRule: "Verb (ない-form) → ない → なければならない",
            englishExplanation: "Expresses strong obligation or necessity. It means that something must be done and that not doing it is unacceptable or problematic. Often used for rules, duties, laws, or socially expected actions.",
            japaneseExplanation: "〜なければならないは、「そうしなければいけない」「義務がある」という強い必要性を表します。ルール・法律・責任・常識的に必要な行動について使われることが多く、話し手には選択の余地がほとんどありません。",
            examples: [
                GrammarExample(japanese: "宿題を今日出さなければならない。", english: "I must turn in the homework today.", register: nil),
                GrammarExample(japanese: "明日は早く起きなければならない。", english: "I have to wake up early tomorrow.", register: nil),
                GrammarExample(japanese: "もう行かなきゃ。", english: "I have to go now.", register: .casual)
            ],
            nuanceNotes: "In conversation, shorter forms like ～なきゃならない or ～なきゃ are commonly used.",
            category: .obligationPermission
        ),

        GrammarPoint(
            title: "～なくてもいい",
            simplifiedRule: "Verb (ない-form) + なくてもいい",
            englishExplanation: "Used to say that something is not necessary. It means that even if the action is not done, it is acceptable. Often used to reduce pressure or reassure someone.",
            japaneseExplanation: "〜なくてもいいは、「その行動をしなくても問題ない」「する必要はない」という意味を表します。相手に対して許可を与えたり、安心させたりするときによく使われます。",
            examples: [
                GrammarExample(japanese: "今日は来なくてもいい。", english: "You don't have to come today.", register: nil),
                GrammarExample(japanese: "宿題は全部やらなくてもいいです。", english: "You don't need to do all the homework.", register: .polite),
                GrammarExample(japanese: "無理しなくてもいい。", english: "You don't have to push yourself.", register: nil)
            ],
            nuanceNotes: nil,
            category: .obligationPermission
        ),

        GrammarPoint(
            title: "～てもいい",
            simplifiedRule: "Verb (て-form) + もいい",
            englishExplanation: "Used to give permission or say that an action is acceptable. It means 'it's okay to do' or 'you may do.' Commonly used when responding to requests or offering allowance.",
            japaneseExplanation: "〜て + もいいは、「その行動をしても問題ない」「してもかまわない」という許可を表す文型です。",
            examples: [
                GrammarExample(japanese: "ここに座ってもいい。", english: "You may sit here.", register: nil),
                GrammarExample(japanese: "今、帰ってもいいですか。", english: "May I go home now?", register: .polite),
                GrammarExample(japanese: "もう食べてもいいよ。", english: "You can eat now.", register: .casual)
            ],
            nuanceNotes: nil,
            category: .obligationPermission
        ),

        GrammarPoint(
            title: "～てはだめ",
            simplifiedRule: "Verb (て-form) + はだめ",
            englishExplanation: "Used to prohibit an action. It means 'you must not do' or 'it's not allowed to do.' Common in rules, warnings, and everyday instructions.",
            japaneseExplanation: "〜てはだめは、「その行動をしてはいけない」「禁止されている」という意味を表します。",
            examples: [
                GrammarExample(japanese: "ここでタバコを吸ってはだめ。", english: "You must not smoke here.", register: nil),
                GrammarExample(japanese: "授業中にスマホを使ってはだめです。", english: "You're not allowed to use your phone during class.", register: .polite),
                GrammarExample(japanese: "まだ入ってはだめだよ。", english: "You can't go in yet.", register: .casual)
            ],
            nuanceNotes: nil,
            category: .obligationPermission
        ),

        GrammarPoint(
            title: "～ざるを得ない",
            simplifiedRule: "Verb (dictionary form) + ざるを得ない (Exception: する → せざるを得ない)",
            englishExplanation: "Used when you're compelled to do something, even if you don't want to. Expresses strong necessity or lack of alternatives — 'can't avoid doing' or 'have no choice but to.' Formal, often used in writing or polite speech.",
            japaneseExplanation: "「～ざるを得ない」は、避けられずに何かをしなければならない状況を表します。やむを得ず行動するニュアンスがあり、やや硬い表現です。",
            examples: [
                GrammarExample(japanese: "大事な会議があるから、早く帰らざるを得なかった。", english: "Because I had an important meeting, I had no choice but to go home early.", register: .casual),
                GrammarExample(japanese: "経費削減のため、一部のサービスを停止せざるを得ませんでした。", english: "Due to budget cuts, we had no choice but to suspend some services.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .obligationPermission
        ),

        // MARK: - Reasons & Explanations

        GrammarPoint(
            title: "～から",
            simplifiedRule: "Clause 1 (Reason) + から + Clause 2 (Outcome)",
            englishExplanation: "から is used in two main ways: (1) to express a reason or cause ('because'), (2) to indicate a starting point in time, space, or sequence ('from'). In causal sentences, the reason comes before から and the result comes after.",
            japaneseExplanation: "「から」には主に2つの使い方があります：(1) 理由・原因を表す：「〜だから」、(2) 出発点・起点を表す：「〜から」。",
            examples: [
                GrammarExample(japanese: "今日は雨だから、出かけたくない。", english: "Because it's raining today, I don't want to go out.", register: nil),
                GrammarExample(japanese: "疲れたから、早く寝るね。", english: "Because I'm tired, I'm going to bed early.", register: nil),
                GrammarExample(japanese: "授業は9時から始まります。", english: "The class starts from 9 o'clock.", register: nil)
            ],
            nuanceNotes: nil,
            category: .reasonsExplanations
        ),

        GrammarPoint(
            title: "～ので",
            simplifiedRule: "Clause + ので + Result",
            englishExplanation: "Used to give a reason or cause in a polite, objective, or softer-sounding way. Compared with から, it often sounds less direct and is commonly used in formal situations.",
            japaneseExplanation: "「ので」は、理由・原因を表す接続助詞で、「から」より丁寧・客観的な響きがあります。やわらかく理由を述べたいときや、改まった場面でよく使われます。",
            examples: [
                GrammarExample(japanese: "雨が降っているので、家にいます。", english: "It's raining, so I'm staying home.", register: nil),
                GrammarExample(japanese: "時間がないので、急ぎましょう。", english: "We don't have time, so let's hurry.", register: nil),
                GrammarExample(japanese: "静かなので、この部屋が好きです。", english: "I like this room because it's quiet.", register: nil)
            ],
            nuanceNotes: nil,
            category: .reasonsExplanations
        ),

        GrammarPoint(
            title: "～ために",
            simplifiedRule: "Verb (dictionary form) or noun + ために",
            englishExplanation: "Use ～ために to show either a purpose ('in order to') or a cause ('because of'). When attached to a verb, it usually expresses purpose. When attached to a noun, it often expresses cause or reason.",
            japaneseExplanation: "「～ために」は目的や原因・理由を表すときに使います。動詞に付くと「〜するために」で目的、名詞に付くと「〜のために」で原因・理由になることが多いです。",
            examples: [
                GrammarExample(japanese: "健康のために、毎日走っている。", english: "I run every day for my health.", register: .casual),
                GrammarExample(japanese: "留学するためにアルバイトを始めました。", english: "I started a part-time job to study abroad.", register: .polite),
                GrammarExample(japanese: "事故のために電車が遅れた。", english: "The train was delayed because of an accident.", register: .casual)
            ],
            nuanceNotes: nil,
            category: .reasonsExplanations
        ),

        GrammarPoint(
            title: "～んだ / ～のだ",
            simplifiedRule: "Plain form + んだ (casual) / のだ (polite)",
            englishExplanation: "Use ～んだ or ～のだ to explain or emphasize the reason for something. It adds clarity, background, or justification. In conversation, it often answers 'why?' even if the question wasn't asked aloud.",
            japaneseExplanation: "「～んだ」や「～のだ」は、理由や状況の説明・強調をするときに使います。話し手の思いや背景を伝えたいときによく使われます。",
            examples: [
                GrammarExample(japanese: "疲れてるんだ。", english: "It's because I'm tired.", register: .casual),
                GrammarExample(japanese: "行きたくないんだ。", english: "It's that I don't want to go.", register: .casual),
                GrammarExample(japanese: "時間がないのです。", english: "It's because I don't have time.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .reasonsExplanations
        ),

        GrammarPoint(
            title: "～ように",
            simplifiedRule: "[Verb dictionary form / negative form] + ように",
            englishExplanation: "Used to express purpose or aim ('so that / in order to'), or to convey instructions ('make sure to'). Often appears in reported requests or advice.",
            japaneseExplanation: "目的や結果を表す表現。「～するように頼む／言う」で「～するようにしてください」という依頼の意味になる。意志ではなく「～できるように」という目標や配慮を表す。",
            examples: [
                GrammarExample(japanese: "忘れないようにメモした。", english: "I wrote a note so I wouldn't forget.", register: .casual),
                GrammarExample(japanese: "医者に薬を毎日飲むように言われました。", english: "The doctor told me to make sure to take the medicine every day.", register: .polite),
                GrammarExample(japanese: "会議に遅れないようにご注意ください。", english: "Please make sure not to be late for the meeting.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .reasonsExplanations
        ),

        GrammarPoint(
            title: "〜による / 〜によって",
            simplifiedRule: "Noun + による + Noun / Noun + によって + Verb",
            englishExplanation: "Indicates cause, reason, or the agent of an action. Formal style, often used in writing or news. Can mean 'due to,' 'because of,' 'caused by,' or 'done by.'",
            japaneseExplanation: "原因や理由、または行為者を表す表現。ニュースや公式文書でよく使われ、口語の「〜の」より堅い響きがある。",
            examples: [
                GrammarExample(japanese: "台風による停電があった。", english: "There was a power outage due to the typhoon.", register: .casual),
                GrammarExample(japanese: "火事はガス漏れによって起こりました。", english: "The fire occurred because of a gas leak.", register: .polite),
                GrammarExample(japanese: "この橋は有名な建築家によって設計された。", english: "This bridge was designed by a famous architect.", register: .casual)
            ],
            nuanceNotes: nil,
            category: .reasonsExplanations
        ),

        GrammarPoint(
            title: "〜はずなのに",
            simplifiedRule: "[Plain form] + はずなのに + [contradictory result]",
            englishExplanation: "Used when something was expected to be true, but the actual result is contradictory. Emphasizes surprise or frustration that reality does not match the expectation.",
            japaneseExplanation: "「～はず」＝当然だと思われること。「なのに」＝逆の結果。組み合わせて、期待と現実の食い違いを表す。",
            examples: [
                GrammarExample(japanese: "勉強したはずなのに、テストが難しかった。", english: "Even though I studied, the test was hard.", register: .casual),
                GrammarExample(japanese: "雨が降らないはずなのに、降ってきました。", english: "It wasn't supposed to rain, but it did.", register: .polite),
                GrammarExample(japanese: "鍵を持っているはずなのに、見つからない。", english: "I should have my keys, but I can't find them.", register: .casual)
            ],
            nuanceNotes: nil,
            category: .reasonsExplanations
        ),

        GrammarPoint(
            title: "～ことで",
            simplifiedRule: "Verb (plain form) + ことで",
            englishExplanation: "Used to express a means, method, or cause by which a result is achieved. Often answers 'how?' or 'by doing what?', emphasizing that the action in the first clause leads to the result in the second.",
            japaneseExplanation: "「～ことで」は、「〜することによって」「〜という方法で」という意味を表します。前の動作や行為が、後ろの結果を生み出す原因・手段になっていることを示します。",
            examples: [
                GrammarExample(japanese: "毎日練習することで、日本語が上達しました。", english: "By practicing every day, my Japanese improved.", register: nil),
                GrammarExample(japanese: "電車を使うことで、時間を節約できます。", english: "By using the train, you can save time.", register: nil),
                GrammarExample(japanese: "話し合うことで、問題が解決した。", english: "By discussing it, the problem was solved.", register: nil)
            ],
            nuanceNotes: "～ことで is not usually used with natural, uncontrollable events. In those cases, ～ため（に） is often preferred.",
            category: .reasonsExplanations
        ),

        // MARK: - Comparisons & Recommendations

        GrammarPoint(
            title: "～より + のほうが",
            simplifiedRule: "Y + より + X + のほうが + adjective/verb",
            englishExplanation: "Used to compare two things. 'X のほうが' shows which is preferred or has more of a certain quality, while 'Y より' sets the baseline for comparison.",
            japaneseExplanation: "「～より」と「～のほうが」は、二つのものを比べるときに使います。「X のほうが」は「Xの方が優れている」ことを、「Y より」は比較の対象を示します。",
            examples: [
                GrammarExample(japanese: "冬より春のほうが気持ちいい。", english: "Spring feels nicer than winter.", register: .casual),
                GrammarExample(japanese: "この店よりあの店のほうが安いです。", english: "That store is cheaper than this one.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .comparisons
        ),

        GrammarPoint(
            title: "～ほうがいい",
            simplifiedRule: "Verb (past tense for positive / negative plain form for negative) + ほうがいい",
            englishExplanation: "Used to give advice, similar to 'It's better to...' in English. For positive advice, use the past tense of the verb. For negative advice, use the plain negative form.",
            japaneseExplanation: "「～ほうがいい」は、助言やおすすめを伝えるときに使う表現です。肯定のアドバイスでは動詞の過去形を、否定のアドバイスでは否定の普通形を使います。",
            examples: [
                GrammarExample(japanese: "明日は早いから、早く寝たほうがいい。", english: "It's better to sleep early since tomorrow is a busy day.", register: .casual),
                GrammarExample(japanese: "体調が悪いなら、病院に行ったほうがいいです。", english: "If you're feeling sick, it's better to go to the hospital.", register: .polite),
                GrammarExample(japanese: "風邪のときは、冷たい飲み物を飲まないほうがいい。", english: "When you have a cold, it's better not to drink cold beverages.", register: .casual)
            ],
            nuanceNotes: nil,
            category: .comparisons
        ),

        GrammarPoint(
            title: "～にとって",
            simplifiedRule: "Noun + にとって + Judgment / Evaluation",
            englishExplanation: "Used to express how something is perceived, valued, or affects someone. It means 'for (someone)' or 'from (someone's) point of view.' Often used with words like 大切, 難しい, うれしい.",
            japaneseExplanation: "ある人や立場から見た判断・評価を表す表現。「〜にとって」は「〜の立場から見ると」という意味で使う。",
            examples: [
                GrammarExample(japanese: "このニュースは私にとってうれしい。", english: "For me, this news is happy.", register: .casual),
                GrammarExample(japanese: "日本にとって環境問題は大きな課題です。", english: "For Japan, environmental issues are a major challenge.", register: .polite),
                GrammarExample(japanese: "あなたにとって一番大切なものは何ですか。", english: "What is the most important thing for you?", register: .polite)
            ],
            nuanceNotes: nil,
            category: .comparisons
        ),

        GrammarPoint(
            title: "～といい",
            simplifiedRule: "Verb (dictionary form) + といい",
            englishExplanation: "Used to make a gentle suggestion or recommendation. It means 'it would be good if you...' or 'you might want to...' The tone is soft and non-pushy.",
            japaneseExplanation: "「～といい」は、相手に対して「～したらいいと思いますよ」というやわらかい勧めを表します。命令や強い助言ではなく、相手の判断に任せるニュアンスがあります。",
            examples: [
                GrammarExample(japanese: "疲れているなら、少し休むといいよ。", english: "If you're tired, it'd be good to rest a bit.", register: .casual),
                GrammarExample(japanese: "分からなかったら、もう一度聞くといいです。", english: "If you don't understand, it would be good to ask again.", register: .polite),
                GrammarExample(japanese: "心配なら、病院に行くといいと思う。", english: "If you're worried, you might want to go to the hospital.", register: .casual)
            ],
            nuanceNotes: "～ほうがいい = clearer/more direct advice. ～といい = softer, more considerate suggestion.",
            category: .comparisons
        ),

        GrammarPoint(
            title: "～にあたる",
            simplifiedRule: "Noun + にあたる",
            englishExplanation: "Indicates that something corresponds to, is equivalent to, or matches something else in role, position, or meaning. It can also mean that something 'falls on' a certain time or event.",
            japaneseExplanation: "あるものが他のものに対応・相当すること、または特定の時期・出来事に当たることを表す。",
            examples: [
                GrammarExample(japanese: "一ドルは百五十円にあたる。", english: "One dollar equals 150 yen.", register: .casual),
                GrammarExample(japanese: "この単語は英語の \"teacher\" にあたります。", english: "This word corresponds to 'teacher' in English.", register: .polite),
                GrammarExample(japanese: "その日は祭りの日にあたります。", english: "That day falls on the festival day.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .comparisons
        ),

        GrammarPoint(
            title: "～あんなふうに",
            simplifiedRule: "あんなふうに + [動詞/表現]",
            englishExplanation: "Means 'like that' or 'in that manner,' referring to how something is done, often pointing to a way observed in others or in a situation.",
            japaneseExplanation: "「あんなふうに」は「そのように」「あのようなやり方で」という意味で、他人や状況の様子を指して使う。",
            examples: [
                GrammarExample(japanese: "あんなふうに走りたくない。", english: "I don't want to run like that.", register: .casual),
                GrammarExample(japanese: "あんなふうに説明できますか。", english: "Can you explain it like that?", register: .polite)
            ],
            nuanceNotes: nil,
            category: .comparisons
        ),

        // MARK: - Hearsay & Appearance

        GrammarPoint(
            title: "～そうだ (Hearsay)",
            simplifiedRule: "Verb (dictionary form or ない-form) + そうだ",
            englishExplanation: "Conveys information you heard from someone else. It does not express appearance or conjecture. Can also be used to express when something may appear to be true as a result of visual cues.",
            japaneseExplanation: "「～そうだ」は、人から聞いた情報を伝えるときに使います。肯定文には動詞の辞書形、否定文にはない形を使います。話し手の推測ではなく、他人から聞いた事実の伝達です。",
            examples: [
                GrammarExample(japanese: "来月、彼は日本に引っ越すそうだ。", english: "I heard he's moving to Japan next month.", register: .casual),
                GrammarExample(japanese: "この映画はとても感動するそうです。", english: "I heard this movie is very moving.", register: .polite),
                GrammarExample(japanese: "今日はお店が開いていないそうです。", english: "I heard the shop isn't open today.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .hearsayAppearance
        ),

        GrammarPoint(
            title: "〜ようです",
            simplifiedRule: "Plain form (verbs, い-adjectives, な-adjectives + な, nouns + の) + ようです",
            englishExplanation: "Used when making a guess or impression based on some evidence. More objective or neutral than 〜そうだ, often based on indirect clues rather than direct observation.",
            japaneseExplanation: "「〜ようだ」は、話し手が何かの状況や情報から判断して、「〜のように見える」「〜のように感じる」と推測するときに使います。",
            examples: [
                GrammarExample(japanese: "彼は疲れているようです。", english: "He seems to be tired.", register: nil),
                GrammarExample(japanese: "あの店は人気があるようですね。", english: "That shop appears to be popular.", register: nil)
            ],
            nuanceNotes: "In casual speech, 〜ようだ often becomes 〜ようです (polite) or 〜みたい (informal).",
            category: .hearsayAppearance
        ),

        GrammarPoint(
            title: "～ように / ～みたいに",
            simplifiedRule: "Noun + のように / のみたいに + verb/adjective",
            englishExplanation: "Use ～ように for formal or written comparisons, and ～みたいに for casual or spoken ones. Both mean 'like' or 'as if' and describe actions or conditions resembling something else.",
            japaneseExplanation: "「～ように」は丁寧で書き言葉に多く使われ、「～みたいに」はカジュアルで会話によく使われます。どちらも「〜のような様子で」という意味で、動作や状態の比喩を表します。",
            examples: [
                GrammarExample(japanese: "彼はロボットみたいに歩くね。", english: "He walks like a robot.", register: .casual),
                GrammarExample(japanese: "彼女は天使のようにやさしいです。", english: "She is as kind as an angel.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .hearsayAppearance
        ),

        GrammarPoint(
            title: "～まるで〜ようだ",
            simplifiedRule: "まるで + [phrase] + ようだ",
            englishExplanation: "Used to emphasize that something seems or looks just like something else. まるで adds the nuance of 'as if' or 'just like.'",
            japaneseExplanation: "ある状況や様子が別のものに強く似ていることを表す。「まるで」で比喩を強調し、「ようだ」で現在の印象を述べる。",
            examples: [
                GrammarExample(japanese: "彼はまるで子どものようだ。", english: "He is just like a child.", register: .casual),
                GrammarExample(japanese: "彼女の笑顔はまるで太陽のようです。", english: "Her smile is just like the sun.", register: .polite),
                GrammarExample(japanese: "ここからの景色はまるで絵のようです。", english: "The view from here is just like a painting.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .hearsayAppearance
        ),

        GrammarPoint(
            title: "～そうになる",
            simplifiedRule: "Verb (ます-form) + そうになる",
            englishExplanation: "Means 'to almost do something' or 'to be on the verge of doing something.' Describes a situation where something nearly happened but did not actually occur.",
            japaneseExplanation: "「～そうになる」は、「もう少しで〜するところだった」「〜しそうだった」という意味です。実際には起こらなかったが、起こりかけた状態を表します。",
            examples: [
                GrammarExample(japanese: "転びそうになった。", english: "I almost fell.", register: nil),
                GrammarExample(japanese: "怒りそうになったが、我慢した。", english: "I almost got angry, but I held it in.", register: nil),
                GrammarExample(japanese: "事故を起こしそうになって、怖かった。", english: "I almost got into an accident, and it was scary.", register: nil)
            ],
            nuanceNotes: "～そうだ = looks like/seems (appearance). ～そうになる = came close to happening (but didn't).",
            category: .hearsayAppearance
        ),

        // MARK: - Time & Sequence

        GrammarPoint(
            title: "～間に / 間",
            simplifiedRule: "Verb (ている form) + 間 (ongoing) / 間に (occurs at a point within)",
            englishExplanation: "Use ～間 when two actions happen simultaneously over a duration. Use ～間に when one action occurs at a specific point during the span of another. The subjects can be different.",
            japaneseExplanation: "「～間」は、二つの動作が同じ時間に継続して起こっているときに使います。「～間に」は、ある動作の最中に別の一回の動作が起こるときに使います。",
            examples: [
                GrammarExample(japanese: "友達が話している間、私はメモを取っていた。", english: "While my friend was talking, I was taking notes.", register: .casual),
                GrammarExample(japanese: "雨が降っている間、外に出ませんでした。", english: "I didn't go outside while it was raining.", register: .polite),
                GrammarExample(japanese: "母が出かけている間に、部屋を片付けた。", english: "I cleaned my room while my mom was out.", register: .casual)
            ],
            nuanceNotes: nil,
            category: .timeSequence
        ),

        GrammarPoint(
            title: "～ながら",
            simplifiedRule: "Verb (ます-stem of background action) + ながら + main action",
            englishExplanation: "Shows two actions done at the same time by the same person. The verb before ながら is the background or secondary action, while the main action comes afterward.",
            japaneseExplanation: "「～ながら」は、一人の人が同時に二つの行動をすることを表します。「ながら」の前は動詞のます形から「ます」を取った形を使い、後ろに主な動作を続けます。",
            examples: [
                GrammarExample(japanese: "スマホを見ながら歩くのは危ないよ。", english: "It's dangerous to walk while looking at your phone.", register: .casual),
                GrammarExample(japanese: "テレビを見ながら晩ごはんを食べます。", english: "I eat dinner while watching TV.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .timeSequence
        ),

        GrammarPoint(
            title: "～ながらも",
            simplifiedRule: "Verb (ます-stem) / い-adjective / な-adjective / noun + ながらも",
            englishExplanation: "Used to show contrast while acknowledging that two states or facts exist at the same time. Similar to 'although' or 'even though,' but highlights that something is true despite another condition.",
            japaneseExplanation: "「～ながらも」は、ある状態や事実を認めつつ、それとは対照的なことも同時に成り立っていることを表します。「～けれども」に近い意味ですが、より文語的・強調的です。",
            examples: [
                GrammarExample(japanese: "失敗しながらも、あきらめなかった。", english: "Although I failed, I didn't give up.", register: .casual),
                GrammarExample(japanese: "緊張しながらも、プレゼンをうまくやりました。", english: "Although I was nervous, I did the presentation well.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .timeSequence
        ),

        GrammarPoint(
            title: "〜てから",
            simplifiedRule: "Verb (て-form) + から + next action",
            englishExplanation: "Used to show that one action is completed before another begins. Emphasizes the order of actions, similar to 'after doing [something], [do something else]' in English.",
            japaneseExplanation: "ある動作が終わってから、次の動作が始まることを表します。「〜てから」は、行動の順番をはっきりさせたいときに使います。",
            examples: [
                GrammarExample(japanese: "図書館で本を返してから、カフェに行きました。", english: "After returning the book at the library, I went to a café.", register: nil),
                GrammarExample(japanese: "夜ごはんを作ってから、映画を見ようと思います。", english: "I plan to watch a movie after making dinner.", register: nil)
            ],
            nuanceNotes: nil,
            category: .timeSequence
        ),

        GrammarPoint(
            title: "～たばかり",
            simplifiedRule: "Verb (た-form) + ばかり",
            englishExplanation: "Used to express that something has just been done or just happened. Emphasizes the recency of the action.",
            japaneseExplanation: "「～たばかり」は、動作が終わってからあまり時間がたっていないことを表します。",
            examples: [
                GrammarExample(japanese: "駅に着いたばかりだよ。", english: "I just arrived at the station.", register: .casual),
                GrammarExample(japanese: "先生は今、授業を終えたばかりです。", english: "The teacher just finished the lesson.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .timeSequence
        ),

        GrammarPoint(
            title: "～たことがある",
            simplifiedRule: "Verb (た-form) + ことがある / ことがない",
            englishExplanation: "Use ～たことがある to talk about something you've experienced at least once in the past. Use ～たことがない to say you've never had that experience.",
            japaneseExplanation: "「～たことがある」は、過去に一度でもその経験があることを表します。「～たことがない」は、その経験が一度もないことを示します。",
            examples: [
                GrammarExample(japanese: "富士山に登ったことがあるよ。", english: "I've climbed Mt. Fuji.", register: .casual),
                GrammarExample(japanese: "この映画を見たことがあります。", english: "I've seen this movie.", register: .polite),
                GrammarExample(japanese: "彼と話したことがありません。", english: "I've never spoken with him.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .timeSequence
        ),

        GrammarPoint(
            title: "～ことがある (Sometimes)",
            simplifiedRule: "Verb (dictionary form / ない-form) + ことがある",
            englishExplanation: "When used with non-past verbs, it means an action occasionally happens. Expresses irregular habits or situations.",
            japaneseExplanation: "現在形で使うと「時々～する／～しないことがある」という意味になり、不定期に起こる行動を表す。",
            examples: [
                GrammarExample(japanese: "雨の日にバスが遅れることがある。", english: "Sometimes the bus is late on rainy days.", register: .casual),
                GrammarExample(japanese: "会議が長くなることがあります。", english: "Sometimes meetings become long.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .timeSequence
        ),

        GrammarPoint(
            title: "～まで",
            simplifiedRule: "Noun / Verb (dictionary form) + まで",
            englishExplanation: "Indicates the limit or endpoint of time, space, or action. It means 'until,' 'up to,' or 'as far as.'",
            japaneseExplanation: "動作・時間・範囲の終わりを示す助詞。「〜まで」で「〜の終わりまで」「〜の限界まで」という意味になる。",
            examples: [
                GrammarExample(japanese: "駅まで歩いた。", english: "I walked to the station.", register: .casual),
                GrammarExample(japanese: "夜中までゲームしてた。", english: "I played games until midnight.", register: .casual),
                GrammarExample(japanese: "午後五時まで仕事をします。", english: "I'll work until 5 p.m.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .timeSequence
        ),

        // MARK: - Action Patterns

        GrammarPoint(
            title: "～てみる",
            simplifiedRule: "Verb (て-form) + みる",
            englishExplanation: "Use ～てみる to express trying something to see what it's like or what happens. It implies doing something experimentally or for the first time.",
            japaneseExplanation: "「～てみる」は、何かを試しにやってみる、経験してみるという意味を表します。",
            examples: [
                GrammarExample(japanese: "新しいゲームをやってみるよ。", english: "I'll try playing the new game.", register: .casual),
                GrammarExample(japanese: "この着物を着てみます。", english: "I'll try wearing this kimono.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .actionPatterns
        ),

        GrammarPoint(
            title: "～ておく",
            simplifiedRule: "Verb (て-form) + おく / おかない",
            englishExplanation: "Use ～ておく to describe doing something in advance for a future purpose or convenience. Often used in planning, preparation, or prevention.",
            japaneseExplanation: "「～ておく」は、将来のために事前に何かをしておくという意味です。準備や予防、段取りなどによく使われます。",
            examples: [
                GrammarExample(japanese: "旅行の前にホテルを予約しておく。", english: "I'll book the hotel before the trip.", register: .casual),
                GrammarExample(japanese: "会議の資料を準備しておきます。", english: "I'll prepare the meeting documents in advance.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .actionPatterns
        ),

        GrammarPoint(
            title: "～続ける",
            simplifiedRule: "Verb (ます-stem) + 続ける / 続けない",
            englishExplanation: "Use ～続ける to show that an action continues over time. Emphasizes ongoing effort or repetition.",
            japaneseExplanation: "「～続ける」は、ある行動を途切れずに続けていることを表します。長期的な努力や習慣的な行為に使われることが多いです。",
            examples: [
                GrammarExample(japanese: "彼は黙って本を読み続けた。", english: "He kept reading the book silently.", register: .casual),
                GrammarExample(japanese: "勉強をあきらめずに続けます。", english: "I will continue studying without giving up.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .actionPatterns
        ),

        GrammarPoint(
            title: "～ことにする",
            simplifiedRule: "Verb (dictionary form or ない-form) + ことにする",
            englishExplanation: "Use ～ことにする when you've made a personal decision after some thought. Emphasizes the act of choosing or determining a course of action.",
            japaneseExplanation: "「～ことにする」は、話し手が自分の意志で何かをする（またはしない）と決めたことを表します。",
            examples: [
                GrammarExample(japanese: "週末は家でゆっくりすることにした。", english: "I decided to relax at home over the weekend.", register: .casual),
                GrammarExample(japanese: "このプロジェクトを引き受けることにします。", english: "I've decided to take on this project.", register: .polite),
                GrammarExample(japanese: "彼にはもう連絡しないことにする。", english: "I've decided not to contact him anymore.", register: .casual)
            ],
            nuanceNotes: nil,
            category: .actionPatterns
        ),

        GrammarPoint(
            title: "～ようにする",
            simplifiedRule: "Verb (dictionary form or ない-form) + ようにする",
            englishExplanation: "Use ～ようにする to express trying to build or maintain a habit, or to make a conscious effort to do or avoid something. Reflects intention and self-control.",
            japaneseExplanation: "「～ようにする」は、習慣をつけるよう努力すること、または何かを避けるよう意識して行動することを表します。",
            examples: [
                GrammarExample(japanese: "寝る前にスマホを見ないようにする。", english: "I try not to look at my phone before bed.", register: .casual),
                GrammarExample(japanese: "朝ごはんを毎日食べるようにします。", english: "I'll make an effort to eat breakfast every day.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .actionPatterns
        ),

        GrammarPoint(
            title: "～てしまう",
            simplifiedRule: "Verb (て-form) + しまう",
            englishExplanation: "Has three main uses: (1) accidentally/unintentionally doing something, (2) expressing regret about an unfortunate result, (3) completing something entirely.",
            japaneseExplanation: "「〜てしまう」には3つの主な使い方があります：(1) 偶然・意図せずに、(2) 後悔や残念な結果、(3) 完全に終わらせる。",
            examples: [
                GrammarExample(japanese: "財布をなくしてしまった。", english: "I accidentally lost my wallet.", register: nil),
                GrammarExample(japanese: "彼を怒らせてしまった。", english: "I ended up making him angry.", register: nil),
                GrammarExample(japanese: "宿題をやってしまった。", english: "I finished all my homework.", register: nil)
            ],
            nuanceNotes: nil,
            category: .actionPatterns
        ),

        GrammarPoint(
            title: "～ことになる",
            simplifiedRule: "Verb (dictionary form) + ことになる",
            englishExplanation: "Expresses that something has been decided or will end up happening, usually not by the speaker's direct intention. Often indicates a decision made by outside factors or a natural/unavoidable result. Contrasts with ことにする (speaker's own decision).",
            japaneseExplanation: "「ことになる」は、自分の意志ではなく、周囲の状況・他人の判断・流れによって決まったことや、結果的にそうなる状況を表します。",
            examples: [
                GrammarExample(japanese: "来月、転勤することになりました。", english: "It has been decided that I will be transferred next month.", register: nil),
                GrammarExample(japanese: "会議は来週に延期することになった。", english: "The meeting ended up being postponed to next week.", register: nil),
                GrammarExample(japanese: "このプロジェクトには私が参加することになっています。", english: "It has been decided I am scheduled to participate in this project.", register: nil)
            ],
            nuanceNotes: "ことにする = speaker's own decision. ことになる = decision by external factors/circumstances.",
            category: .actionPatterns
        ),

        // MARK: - Conditionals & Consequences

        GrammarPoint(
            title: "～と",
            simplifiedRule: "Clause 1 (plain form) + と + Clause 2 (inevitable result)",
            englishExplanation: "Used to show that when one thing happens, another naturally follows. Used for consistent, predictable outcomes — often in nature, daily habits, or mechanical functions.",
            japaneseExplanation: "「～と」は、あることが起きると必ず次のことが続いて起こる、という因果関係や習慣的な流れを表します。",
            examples: [
                GrammarExample(japanese: "ボタンを押すと、音が鳴る。", english: "When you press the button, it makes a sound.", register: .casual),
                GrammarExample(japanese: "夜になると、気温が下がります。", english: "When night comes, the temperature drops.", register: .polite),
                GrammarExample(japanese: "この道をまっすぐ行くと、駅に着きます。", english: "If you go straight on this road, you'll arrive at the station.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .conditionals
        ),

        GrammarPoint(
            title: "～ても",
            simplifiedRule: "Verb / adjective / noun (て-form or equivalent) + も",
            englishExplanation: "Used to express a concession — something that will (or won't) happen regardless of a condition. Works like 'even if' or 'even though' in English.",
            japaneseExplanation: "「～ても」は、ある条件に関係なく結果が変わらないことを表します。「たとえ〜でも〜する／しない」というニュアンスで、逆接の意味を含みます。",
            examples: [
                GrammarExample(japanese: "高くても、これを買う。", english: "Even if it's expensive, I'll buy this.", register: .casual),
                GrammarExample(japanese: "疲れていても、練習に行きます。", english: "Even if I'm tired, I'll go to practice.", register: .polite),
                GrammarExample(japanese: "彼が来なくても始めます。", english: "Even if he doesn't come, we'll start.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .conditionals
        ),

        GrammarPoint(
            title: "～まま",
            simplifiedRule: "Verb (た-form or ない-form) / adjective / noun + まま",
            englishExplanation: "Used to describe doing something while leaving a previous action or state unchanged. Emphasizes that no change or interruption occurred before the next action happened.",
            japaneseExplanation: "「～まま」は、ある状態を変えずに次の動作や状態が続くことを表します。「そのままの状態で」という意味で、無意識やうっかりした行動にもよく使われます。",
            examples: [
                GrammarExample(japanese: "テレビをつけたまま出かけた。", english: "I went out with the TV still on.", register: .casual),
                GrammarExample(japanese: "傘を持たないまま来ました。", english: "I came without bringing an umbrella.", register: .polite),
                GrammarExample(japanese: "電気をつけたまま寝ないでください。", english: "Please don't sleep with the lights on.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .conditionals
        ),

        GrammarPoint(
            title: "～なければよかった",
            simplifiedRule: "[Negative ば-form of verb] + よかった",
            englishExplanation: "Used to express regret about something that happened, meaning 'I wish (someone) hadn't done ~' or 'It would have been better if ~ hadn't happened.'",
            japaneseExplanation: "過去に起こったことを後悔するときに使う表現。「〜しなければよかった」は「〜しなかったほうがよかった」という意味になる。",
            examples: [
                GrammarExample(japanese: "あんなこと言わなければよかった。", english: "I wish I hadn't said that.", register: .casual),
                GrammarExample(japanese: "あの店に行かなければよかったです。", english: "It would've been better if I hadn't gone to that restaurant.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .conditionals
        ),

        GrammarPoint(
            title: "～危うく + ところだった",
            simplifiedRule: "危うく + Verb (dictionary form) + ところだった",
            englishExplanation: "Means 'I almost did... (and it would have been bad).' Describes a near miss: something dangerous or undesirable nearly happened but did not, often thanks to luck or quick action.",
            japaneseExplanation: "「危うく～ところだった」は、「もう少しで悪い結果になるところだった」という意味です。実際には起こらなかったが、非常に危険・深刻だった状況を振り返って言う表現です。",
            examples: [
                GrammarExample(japanese: "危うく事故に遭うところだった。", english: "I almost got into an accident.", register: nil),
                GrammarExample(japanese: "パスポートを忘れて、危うく飛行機に乗れないところだった。", english: "I almost couldn't board the plane after forgetting my passport.", register: nil)
            ],
            nuanceNotes: "～そうになった = almost happened (neutral). ～ところだった = came very close (clear cutoff). 危うく～ところだった = almost happened and it was dangerous/bad.",
            category: .conditionals
        ),

        GrammarPoint(
            title: "～ていればよかった",
            simplifiedRule: "Verb (て-form) + いればよかった",
            englishExplanation: "Means 'I wish I had done...' or 'It would have been better if I had...' Expresses regret about a past situation, imagining a different action that did not happen.",
            japaneseExplanation: "「～ていればよかった」は、過去について「そうしていなかったが、そうしていたらよかったのに」という後悔・反省の気持ちを表します。",
            examples: [
                GrammarExample(japanese: "もっと早く出発していればよかった。", english: "I wish I had left earlier.", register: nil),
                GrammarExample(japanese: "彼に本当のことを話していればよかった。", english: "I wish I had told him the truth.", register: nil)
            ],
            nuanceNotes: "～ほうがよかった = hindsight/advice about a better option. ～ていればよかった = stronger personal regret, imagining an unreal past condition.",
            category: .conditionals
        ),

        // MARK: - Feelings & Expectations

        GrammarPoint(
            title: "～のが好きです",
            simplifiedRule: "Verb (dictionary form) + のが好き / のが好きじゃない",
            englishExplanation: "Used to say you like or dislike doing a certain activity. The verb is turned into a noun phrase using ～の, and 好き describes your preference.",
            japaneseExplanation: "「～のが好き」は、ある行動や習慣が好き・嫌いであることを表します。",
            examples: [
                GrammarExample(japanese: "音楽を聞くのが好き。", english: "I like listening to music.", register: .casual),
                GrammarExample(japanese: "朝早く起きるのが好きです。", english: "I like waking up early.", register: .polite),
                GrammarExample(japanese: "運動するのが好きじゃない。", english: "I don't like exercising.", register: .casual)
            ],
            nuanceNotes: nil,
            category: .feelings
        ),

        GrammarPoint(
            title: "～を楽しみにしています",
            simplifiedRule: "Noun / Verb (dictionary form + の) + を楽しみにしている",
            englishExplanation: "Used to express anticipation or excitement about a future event or activity.",
            japaneseExplanation: "「～を楽しみにしています」は、未来の出来事を心待ちにしていることを表します。",
            examples: [
                GrammarExample(japanese: "旅行に行くのを楽しみにしてるよ。", english: "I'm looking forward to going on the trip.", register: .casual),
                GrammarExample(japanese: "あなたに会えるのを楽しみにしています。", english: "I'm looking forward to seeing you.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .feelings
        ),

        GrammarPoint(
            title: "～と思う",
            simplifiedRule: "(Verb / い-adj / な-adj + だ / Noun + だ) + と思う",
            englishExplanation: "Used to express the speaker's thoughts, opinions, beliefs, or guesses. Often used when giving personal opinions.",
            japaneseExplanation: "動詞の辞書形や普通形に「と思う」をつけて、自分の考え・意見・推測を述べる表現です。",
            examples: [
                GrammarExample(japanese: "明日は雨が降ると思う。", english: "I think it will rain tomorrow.", register: nil),
                GrammarExample(japanese: "この映画はとても面白いと思う。", english: "I think this movie is very interesting.", register: nil),
                GrammarExample(japanese: "田中さんは来ないと思う。", english: "I don't think Tanaka will come.", register: nil)
            ],
            nuanceNotes: nil,
            category: .feelings
        ),

        GrammarPoint(
            title: "よかった",
            simplifiedRule: "よかった / ～てよかった / ～なくてよかった",
            englishExplanation: "The past form of いい, commonly used to express relief, happiness, or satisfaction about a situation or outcome. Often means 'I'm glad (that...)' or 'That turned out well.'",
            japaneseExplanation: "「よかった」は、結果を聞いたり、状況が分かったあとで、安心・喜び・満足の気持ちを表す言い方です。",
            examples: [
                GrammarExample(japanese: "無事に着いてよかった。", english: "I'm glad you arrived safely.", register: nil),
                GrammarExample(japanese: "試験に合格できてよかった。", english: "I'm glad I passed the exam.", register: nil),
                GrammarExample(japanese: "雨が降らなくてよかった。", english: "I'm glad it didn't rain.", register: nil)
            ],
            nuanceNotes: "～てよかった = glad something happened. ～なくてよかった = glad something did not happen. よかったね = 'I'm happy for you' (said to someone else).",
            category: .feelings
        ),

        GrammarPoint(
            title: "〜んだけどなあ",
            simplifiedRule: "Sentence + んだけどなあ",
            englishExplanation: "Adds a soft, reflective, or slightly frustrated tone. Often implies that something is not as expected, or that the speaker wishes for a different outcome. Commonly used when hinting at a complaint or desire without stating it directly.",
            japaneseExplanation: "「〜んだけどなあ」は、自分の気持ちや不満、期待と現実のギャップをやわらかく表す表現です。「なあ」が付くことで、独り言のような響きや、少し感情を込めたニュアンスになります。",
            examples: [
                GrammarExample(japanese: "もっと時間があればいいんだけどなあ。", english: "I wish I had more time though.", register: nil),
                GrammarExample(japanese: "彼、来ると思ったんだけどなあ。", english: "I thought he would come, though...", register: nil),
                GrammarExample(japanese: "もう少し安ければ買うんだけどなあ。", english: "I'd buy it if it were a bit cheaper, though.", register: nil)
            ],
            nuanceNotes: nil,
            category: .feelings
        ),

        // MARK: - Process Evaluation

        GrammarPoint(
            title: "～にくい",
            simplifiedRule: "Verb (ます-form stem) + にくい",
            englishExplanation: "Used to express that an action is difficult to do because of the nature of the action or object, not because of the speaker's ability. Often implies physical, practical, or situational difficulty.",
            japaneseExplanation: "〜にくいは、「その動作や物の性質のために、するのが難しい」という意味を表します。話し手の能力よりも、状況・構造・特徴によるやりにくさを表すのが特徴です。",
            examples: [
                GrammarExample(japanese: "このペンは書きにくい。", english: "This pen is hard to write with.", register: nil),
                GrammarExample(japanese: "彼の字は読みにくい。", english: "His handwriting is hard to read.", register: nil),
                GrammarExample(japanese: "この説明は少し分かりにくい。", english: "This explanation is a bit hard to understand.", register: nil)
            ],
            nuanceNotes: nil,
            category: .processEvaluation
        ),

        GrammarPoint(
            title: "～がたい",
            simplifiedRule: "Verb (ます-form stem) + がたい",
            englishExplanation: "Expresses that something is very difficult or almost impossible to do, often emotionally, psychologically, or morally. Stronger and more formal than ～にくい, frequently seen in written language.",
            japaneseExplanation: "〜がたいは、「気持ちや考えの面で、するのが非常に難しい、ほとんど不可能だ」という意味を表します。身体的・技術的な難しさではなく、心理的・倫理的・抽象的な行為によく使われます。",
            examples: [
                GrammarExample(japanese: "彼の行動は理解しがたい。", english: "His behavior is hard to understand.", register: nil),
                GrammarExample(japanese: "この結果は受け入れがたい。", english: "This result is difficult to accept.", register: nil),
                GrammarExample(japanese: "彼女の苦しみは想像しがたい。", english: "Her suffering is hard to imagine.", register: nil)
            ],
            nuanceNotes: nil,
            category: .processEvaluation
        ),

        GrammarPoint(
            title: "～がちだ",
            simplifiedRule: "Verb (ます-stem) + がちだ / Noun + がちだ",
            englishExplanation: "Used to describe a tendency or inclination that happens often, usually unintentionally. Commonly carries a negative nuance, suggesting something undesirable happens frequently.",
            japaneseExplanation: "〜がちだは、「よくそうなる傾向がある」という意味で使われます。話し手の意志とは関係なく、自然に起こりやすいことを表し、好ましくない結果について使われることが多いです。",
            examples: [
                GrammarExample(japanese: "忙しいと、食事を抜きがちだ。", english: "When I'm busy, I tend to skip meals.", register: nil),
                GrammarExample(japanese: "彼は一人で問題を抱え込みがちだ。", english: "He tends to keep his problems to himself.", register: nil),
                GrammarExample(japanese: "雨の日は気分が落ち込みがちになる。", english: "On rainy days, I tend to feel down.", register: nil)
            ],
            nuanceNotes: nil,
            category: .processEvaluation
        ),

        GrammarPoint(
            title: "〜てきちゃう",
            simplifiedRule: "Verb (て-form) + きちゃう (= きてしまう)",
            englishExplanation: "A casual contraction of 〜てきてしまう. Expresses that something happens naturally, unintentionally, or without much control. Carries a nuance of 'it just ends up happening' or 'I can't help but do it.'",
            japaneseExplanation: "「〜てきちゃう」は「〜てきてしまう」のくだけた言い方で、自然にそうなってしまう、ついそうしてしまう、というニュアンスを表します。",
            examples: [
                GrammarExample(japanese: "夜になると眠くなってきちゃう。", english: "I just end up getting sleepy at night.", register: nil),
                GrammarExample(japanese: "つい甘いものを食べてきちゃう。", english: "I can't help but end up eating sweets.", register: nil),
                GrammarExample(japanese: "緊張すると早口になってきちゃう。", english: "When I get nervous, I end up speaking fast.", register: nil)
            ],
            nuanceNotes: nil,
            category: .processEvaluation
        ),

        GrammarPoint(
            title: "～こんなに",
            simplifiedRule: "こんなに + Adj / V (plain form)",
            englishExplanation: "Means 'this much' or 'to such an extent.' Emphasizes a surprisingly high degree of a state or action. Often carries the speaker's surprise or contrast with expectations.",
            japaneseExplanation: "「こんなに」は、程度がとても高いことを強調する言い方です。話し手の驚き・意外さ・気持ちがこもることが多く、「思っていた以上に〜だ」というニュアンスがあります。",
            examples: [
                GrammarExample(japanese: "こんなに寒いとは思わなかった。", english: "I didn't think it would be this cold.", register: nil),
                GrammarExample(japanese: "こんなに頑張ったのに、結果が出なかった。", english: "Even though I worked this hard, I didn't get results.", register: nil),
                GrammarExample(japanese: "どうしてこんなに泣いているの？", english: "Why are you crying this much?", register: nil)
            ],
            nuanceNotes: nil,
            category: .processEvaluation
        ),

        GrammarPoint(
            title: "～自分なり",
            simplifiedRule: "自分なりの + Noun / 自分なりに + Verb",
            englishExplanation: "Means 'in one's own way' or 'according to one's own understanding/standards.' Shows something is done or judged based on the speaker's personal perspective, often with a humble nuance.",
            japaneseExplanation: "「自分なり」は、「自分の考え・経験・立場に基づいて」という意味を表します。完璧さや客観性よりも、個人的なやり方・解釈を大切にしていることを示します。",
            examples: [
                GrammarExample(japanese: "自分なりの意見をまとめました。", english: "I put together my own opinion (in my own way).", register: nil),
                GrammarExample(japanese: "自分なりに一生懸命考えました。", english: "I thought about it as hard as I could, in my own way.", register: nil),
                GrammarExample(japanese: "完璧ではないけど、自分なりにやってみます。", english: "It's not perfect, but I'll try to do it my way.", register: nil)
            ],
            nuanceNotes: "自分なりの modifies a noun. 自分なりに modifies a verb.",
            category: .processEvaluation
        ),

        // MARK: - Formal & Stylistic

        GrammarPoint(
            title: "～つつ",
            simplifiedRule: "Verb (ます-stem) + つつ",
            englishExplanation: "Used to describe two actions occurring at the same time, like ～ながら but in formal or written contexts. Often conveys a thoughtful or reflective tone.",
            japaneseExplanation: "「～つつ」は、二つの動作が同時に行われていることを表し、「～ながら」と同じ意味ですが、より硬い表現で、文章やフォーマルな場面で使われます。",
            examples: [
                GrammarExample(japanese: "景色を楽しみつつ、写真を撮りました。", english: "I took photos while enjoying the scenery.", register: .polite),
                GrammarExample(japanese: "反省しつつも、前に進む必要があります。", english: "Though reflecting on it, I still need to move forward.", register: .polite),
                GrammarExample(japanese: "焦りを感じつつ、冷静に対応しました。", english: "While feeling anxious, I responded calmly.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .formalStylistic
        ),

        GrammarPoint(
            title: "～において",
            simplifiedRule: "Noun + において",
            englishExplanation: "A formal expression meaning 'in,' 'at,' or 'with respect to' a place, time, situation, or field. Mainly used in written language, speeches, reports, and academic or official contexts.",
            japaneseExplanation: "「において」は、「〜の場で」「〜に関して」「〜という状況で」という意味を表す、硬い表現です。日常会話ではあまり使われず、論文・ニュース・公的文書・スピーチなどでよく使われます。",
            examples: [
                GrammarExample(japanese: "会議は東京において開催されます。", english: "The meeting will be held in Tokyo.", register: nil),
                GrammarExample(japanese: "この問題は教育の分野において重要です。", english: "This issue is important in the field of education.", register: nil),
                GrammarExample(japanese: "現代社会において、情報は非常に重要だ。", english: "In modern society, information is extremely important.", register: nil)
            ],
            nuanceNotes: nil,
            category: .formalStylistic
        ),

        GrammarPoint(
            title: "～として",
            simplifiedRule: "Noun + として",
            englishExplanation: "Indicates someone's role, function, or standpoint. It means 'as (a role)' or 'in the capacity of.' Common in formal writing, speeches, and introductions.",
            japaneseExplanation: "立場や役割、資格を表す表現。「〜として」は「〜の立場で／〜の役割で」という意味で、特にフォーマルな場面でよく使われる。",
            examples: [
                GrammarExample(japanese: "彼を友達として信じている。", english: "As a friend, I trust him.", register: .casual),
                GrammarExample(japanese: "この経験は教師としてとても役に立ちました。", english: "This experience was very useful as a teacher.", register: .polite),
                GrammarExample(japanese: "社長として責任を取ります。", english: "I will take responsibility as the company president.", register: .polite)
            ],
            nuanceNotes: nil,
            category: .formalStylistic
        ),

        GrammarPoint(
            title: "～こうした",
            simplifiedRule: "こうした + Noun",
            englishExplanation: "A demonstrative modifier meaning 'such' or 'this kind of.' Refers to things close to the speaker or mentioned in context. More formal than こういう, mainly used in written language or formal speech.",
            japaneseExplanation: "〜こうしたは、「このような」「この種の」という意味で、直前の内容や文脈で示された事柄を受けて名詞を修飾します。「こういう」よりも硬い言い方です。",
            examples: [
                GrammarExample(japanese: "こうした問題を解決する必要がある。", english: "We need to solve problems like these.", register: nil),
                GrammarExample(japanese: "こうした経験が成長につながる。", english: "Such experiences lead to growth.", register: nil)
            ],
            nuanceNotes: nil,
            category: .formalStylistic
        ),

        GrammarPoint(
            title: "～そうした",
            simplifiedRule: "そうした + Noun",
            englishExplanation: "A demonstrative modifier meaning 'such' or 'that kind of.' Refers to things not close to the speaker, often previously mentioned or known from context. More formal than そういう.",
            japaneseExplanation: "〜そうしたは、「そのような」「そういう種類の」という意味で、文脈や前に述べた内容を受けて名詞を修飾します。「そういう」よりも改まった表現です。",
            examples: [
                GrammarExample(japanese: "そうした意見には賛成できない。", english: "I can't agree with that kind of opinion.", register: nil),
                GrammarExample(japanese: "そうした問題が社会で議論されている。", english: "Such issues are being discussed in society.", register: nil)
            ],
            nuanceNotes: nil,
            category: .formalStylistic
        ),

        GrammarPoint(
            title: "～ああした",
            simplifiedRule: "ああした + Noun",
            englishExplanation: "A demonstrative modifier meaning 'such' or 'that kind of,' referring to things far from both the speaker and the listener, or psychologically distant. Often used in formal writing or criticism.",
            japaneseExplanation: "〜ああしたは、「あのような」「ああいう種類の」という意味で、話し手・聞き手のどちらからも距離のある事柄や、一般化された内容を指します。「ああいう」よりも硬い表現です。",
            examples: [
                GrammarExample(japanese: "ああした行動は社会的に問題だ。", english: "That kind of behavior is socially problematic.", register: nil),
                GrammarExample(japanese: "ああした事件が二度と起きてはならない。", english: "Incidents like that must never happen again.", register: nil)
            ],
            nuanceNotes: nil,
            category: .formalStylistic
        ),

        // MARK: - Connectors

        GrammarPoint(
            title: "Cause & Reason Connectors",
            simplifiedRule: "だから / それで / そのため / なぜなら",
            englishExplanation: "だから: So (direct causal conclusion). それで: So (natural continuation). そのため: Therefore (formal, frames result as logical consequence). なぜなら: Because (introduces an explicit explanation).",
            japaneseExplanation: "だから：直接的な因果関係。それで：自然な流れで結果に続く。そのため：より正式で、論理的な結果を示す。なぜなら：明示的な説明や理由を導入する。",
            examples: [
                GrammarExample(japanese: "雨が降っている。だから、出かけたくない。", english: "It's raining. So I don't want to go out.", register: nil),
                GrammarExample(japanese: "財布を忘れた。それで、買えなかった。", english: "I forgot my wallet. So I couldn't buy it.", register: nil),
                GrammarExample(japanese: "道が混んでいた。そのため、遅刻した。", english: "The road was congested. Therefore, I was late.", register: nil),
                GrammarExample(japanese: "行けない。なぜなら、用事があるからだ。", english: "I can't go. Because I have something to do.", register: nil)
            ],
            nuanceNotes: nil,
            category: .connectors
        ),

        GrammarPoint(
            title: "Contrast Connectors",
            simplifiedRule: "でも / しかし / けれども / ところが / 一方 / 逆に / なのに / ではなく",
            englishExplanation: "でも: But (casual). しかし: However (formal). けれども: But (neutral, softens disagreement). ところが: Unexpectedly (contradicts expectations). 一方: Meanwhile (contrasts two sides). 逆に: Conversely. なのに: Despite (emotional frustration). ではなく: Instead (rejects one option).",
            japaneseExplanation: "でも：カジュアルな逆接。しかし：フォーマルな逆接。けれども：中立的でやわらかい逆接。ところが：期待と反する結果。一方：二つの側面の対比。逆に：逆の関係。なのに：感情的な矛盾。ではなく：一方を否定して別のものを示す。",
            examples: [
                GrammarExample(japanese: "行きたい。でも、お金がない。", english: "I want to go. But I don't have money.", register: nil),
                GrammarExample(japanese: "勉強した。しかし、試験は難しかった。", english: "I studied. However, the exam was difficult.", register: nil),
                GrammarExample(japanese: "急いだ。ところが、間に合わなかった。", english: "I hurried. Unexpectedly, I didn't make it in time.", register: nil)
            ],
            nuanceNotes: nil,
            category: .connectors
        ),

        GrammarPoint(
            title: "Addition Connectors",
            simplifiedRule: "そして / それから / さらに / また",
            englishExplanation: "そして: And (neutral, forward-moving). それから: Then (step-by-step progression). さらに: Furthermore (strengthens or extends the previous point). また: Also (adds another item, often returning to a related idea).",
            japaneseExplanation: "そして：中立的に情報を追加。それから：順番を示しながら追加。さらに：前の点を強化・拡張。また：関連する別の点を追加。",
            examples: [
                GrammarExample(japanese: "コーヒーを飲んだ。そして、本を読んだ。", english: "I drank coffee. And I read a book.", register: nil),
                GrammarExample(japanese: "宿題をした。それから、テレビを見た。", english: "I did my homework. Then I watched TV.", register: nil),
                GrammarExample(japanese: "彼は頭がいい。さらに、努力家だ。", english: "He is smart. Furthermore, he works hard.", register: nil)
            ],
            nuanceNotes: nil,
            category: .connectors
        ),

        GrammarPoint(
            title: "Conclusion Connectors",
            simplifiedRule: "ですから / したがって / 要するに / つまり",
            englishExplanation: "ですから: So (polite/formal causal conclusion). したがって: Therefore (formal, logical consequence, often written/academic). 要するに: In short (summarizes the essence). つまり: In short (rephrases or summarizes to clarify the main point).",
            japaneseExplanation: "ですから：丁寧・フォーマルな因果関係の結論。したがって：フォーマルで論理的な結論、書き言葉でよく使われる。要するに：本質をまとめる。つまり：言い換えや要約で要点を明確にする。",
            examples: [
                GrammarExample(japanese: "遅れます。ですから、先に始めてください。", english: "I'll be late. So please start without me.", register: .polite),
                GrammarExample(japanese: "証拠がない。したがって、断言できない。", english: "There is no evidence. Therefore, I can't say for certain.", register: nil),
                GrammarExample(japanese: "要するに、彼は来ないということだ。", english: "In short, what it means is that he won't come.", register: nil)
            ],
            nuanceNotes: nil,
            category: .connectors
        )
    ]
}
