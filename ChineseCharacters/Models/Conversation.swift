import Foundation

struct DialogueLine: Identifiable {
    let id = UUID()
    let speaker: String
    let chinese: String
    let pinyin: String
    let english: String
}

struct Conversation: Identifiable {
    let id = UUID()
    let number: Int
    let title: String
    let titlePinyin: String
    let titleEnglish: String
    let dialogue: [DialogueLine]
    
    static let sampleConversations: [Conversation] = [
        Conversation(
            number: 1,
            title: "自我介绍",
            titlePinyin: "Zìwǒ jièshào",
            titleEnglish: "Self Introduction",
            dialogue: [
                DialogueLine(
                    speaker: "A",
                    chinese: "你好！",
                    pinyin: "Nǐ hǎo!",
                    english: "Hello!"
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "你好！请问，你叫什么名字？",
                    pinyin: "Nǐ hǎo! Qǐngwèn, nǐ jiào shénme míngzi?",
                    english: "Hello! May I ask, what's your name?"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "我叫Andy Pham。",
                    pinyin: "Wǒ jiào Andy Pham.",
                    english: "My name is Andy Pham."
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "很高兴认识你！你是做什么工作的？",
                    pinyin: "Hěn gāoxìng rènshi nǐ! Nǐ shì zuò shénme gōngzuò de?",
                    english: "Nice to meet you! What do you do for work?"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "我是一个软件开发者。",
                    pinyin: "Wǒ shì yīgè ruǎnjiàn kāifā zhě.",
                    english: "I am a software developer."
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "哦，很好！你在学中文吗？",
                    pinyin: "Ó, hěn hǎo! Nǐ zài xué zhōngwén ma?",
                    english: "Oh, very good! Are you learning Chinese?"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "是的，我正在学习中文。",
                    pinyin: "Shì de, wǒ zhèngzài xuéxí zhōngwén.",
                    english: "Yes, I am currently learning Chinese."
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "你为什么学中文？",
                    pinyin: "Nǐ wèishéme xué zhōngwén?",
                    english: "Why are you learning Chinese?"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "我喜欢编程和学习新的语言。",
                    pinyin: "Wǒ xǐhuān biānchéng hé xuéxí xīn de yǔyán.",
                    english: "I like programming and learning new languages."
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "太好了！希望你学习进步！",
                    pinyin: "Tài hǎo le! Xīwàng nǐ xuéxí jìnbù!",
                    english: "That's great! I hope you make progress in your studies!"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "谢谢！很高兴认识你！",
                    pinyin: "Xièxiè! Hěn gāoxìng rènshi nǐ!",
                    english: "Thank you! Nice to meet you!"
                )
            ]
        )
    ]
}