import Foundation

struct Lesson: Identifiable {
    let id = UUID()
    let number: Int
    let title: String
    let words: [ChineseWord]
    
    static let sampleLessons: [Lesson] = [
        Lesson(number: 1, title: "你好 - Xin chào", words: [
            ChineseWord(character: "你好", pinyin: "nǐ hǎo", vietnameseMeaning: "Xin chào", englishMeaning: "Hello"),
            ChineseWord(character: "早上好", pinyin: "zǎo shang hǎo", vietnameseMeaning: "Chào buổi sáng", englishMeaning: "Good morning"),
            ChineseWord(character: "晚上好", pinyin: "wǎn shang hǎo", vietnameseMeaning: "Chào buổi tối", englishMeaning: "Good evening"),
            ChineseWord(character: "再见", pinyin: "zài jiàn", vietnameseMeaning: "Tạm biệt", englishMeaning: "Goodbye"),
            ChineseWord(character: "谢谢", pinyin: "xiè xiè", vietnameseMeaning: "Cảm ơn", englishMeaning: "Thank you")
        ]),
        Lesson(number: 2, title: "汉语不太难 - Tiếng Hán không khó lắm", words: [
            ChineseWord(character: "一", pinyin: "yī", vietnameseMeaning: "Một", englishMeaning: "One"),
            ChineseWord(character: "二", pinyin: "èr", vietnameseMeaning: "Hai", englishMeaning: "Two"),
            ChineseWord(character: "三", pinyin: "sān", vietnameseMeaning: "Ba", englishMeaning: "Three"),
            ChineseWord(character: "四", pinyin: "sì", vietnameseMeaning: "Bốn", englishMeaning: "Four"),
            ChineseWord(character: "五", pinyin: "wǔ", vietnameseMeaning: "Năm", englishMeaning: "Five"),
            ChineseWord(character: "六", pinyin: "liù", vietnameseMeaning: "Sáu", englishMeaning: "Six")
        ]),
        Lesson(number: 3, title: "明天见 - Ngày mai gặp lại", words: [
            // Languages
            ChineseWord(character: "学", pinyin: "xué", vietnameseMeaning: "học", englishMeaning: "to learn; to study"),
            ChineseWord(character: "英语", pinyin: "Yīngyǔ", vietnameseMeaning: "tiếng Anh", englishMeaning: "English"),
            ChineseWord(character: "阿拉伯语", pinyin: "Ālābóyǔ", vietnameseMeaning: "tiếng Ả Rập", englishMeaning: "Arabic"),
            ChineseWord(character: "德语", pinyin: "Déyǔ", vietnameseMeaning: "tiếng Đức", englishMeaning: "German"),
            ChineseWord(character: "俄语", pinyin: "Éyǔ", vietnameseMeaning: "tiếng Nga", englishMeaning: "Russian"),
            ChineseWord(character: "法语", pinyin: "Fǎyǔ", vietnameseMeaning: "tiếng Pháp", englishMeaning: "French"),
            ChineseWord(character: "韩语", pinyin: "Hányǔ", vietnameseMeaning: "tiếng Hàn Quốc", englishMeaning: "Korean"),
            ChineseWord(character: "日语", pinyin: "Rìyǔ", vietnameseMeaning: "tiếng Nhật", englishMeaning: "Japanese"),
            ChineseWord(character: "西班牙语", pinyin: "Xībānyáyǔ", vietnameseMeaning: "tiếng Tây Ban Nha", englishMeaning: "Spanish"),
            
            // Basic Conversation and Actions
            ChineseWord(character: "对", pinyin: "duì", vietnameseMeaning: "đúng, chính xác", englishMeaning: "right; correct"),
            ChineseWord(character: "明天", pinyin: "míngtiān", vietnameseMeaning: "ngày mai", englishMeaning: "tomorrow"),
            ChineseWord(character: "见", pinyin: "jiàn", vietnameseMeaning: "gặp, thấy", englishMeaning: "to see"),
            ChineseWord(character: "去", pinyin: "qù", vietnameseMeaning: "đi, đến", englishMeaning: "to go"),
            ChineseWord(character: "北京", pinyin: "Běijīng", vietnameseMeaning: "Bắc Kinh", englishMeaning: "Beijing"),
            
            // Post Office and Banking
            ChineseWord(character: "邮局", pinyin: "yóujú", vietnameseMeaning: "bưu điện", englishMeaning: "post office"),
            ChineseWord(character: "寄", pinyin: "jì", vietnameseMeaning: "gửi", englishMeaning: "to post; to mail"),
            ChineseWord(character: "信", pinyin: "xìn", vietnameseMeaning: "thư", englishMeaning: "letter; mail"),
            ChineseWord(character: "银行", pinyin: "yínháng", vietnameseMeaning: "ngân hàng", englishMeaning: "bank"),
            ChineseWord(character: "取", pinyin: "qǔ", vietnameseMeaning: "rút, cử, nhắc", englishMeaning: "to withdraw"),
            ChineseWord(character: "钱", pinyin: "qián", vietnameseMeaning: "tiền", englishMeaning: "money"),
            
            // Numbers
            ChineseWord(character: "六", pinyin: "liù", vietnameseMeaning: "sáu", englishMeaning: "six"),
            ChineseWord(character: "七", pinyin: "qī", vietnameseMeaning: "bảy", englishMeaning: "seven"),
            ChineseWord(character: "九", pinyin: "jiǔ", vietnameseMeaning: "chín", englishMeaning: "nine")
        ])
    ]
} 