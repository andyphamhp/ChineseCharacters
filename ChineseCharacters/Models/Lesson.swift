import Foundation

struct Lesson: Identifiable {
    let id = UUID()
    let number: Int
    let title: String
    let words: [ChineseWord]
    
    init(number: Int, title: String, words: [ChineseWord]) {
        self.number = number
        self.title = title
        self.words = words
    }
    
    static let sampleLessons: [Lesson] = [
        Lesson(number: 1, title: "你好 - Xin chào", words: [
            ChineseWord(character: "你好", pinyin: "nǐ hǎo", vietnameseMeaning: "Xin chào", englishMeaning: "Hello",
                       chineseExample: "你好，我是小明", vietnameseExample: "Xin chào, tôi là Tiểu Minh"),
            ChineseWord(character: "早上好", pinyin: "zǎo shang hǎo", vietnameseMeaning: "Chào buổi sáng", englishMeaning: "Good morning",
                       chineseExample: "早上好，今天天气很好", vietnameseExample: "Chào buổi sáng, hôm nay thời tiết đẹp"),
            ChineseWord(character: "晚上好", pinyin: "wǎn shang hǎo", vietnameseMeaning: "Chào buổi tối", englishMeaning: "Good evening",
                       chineseExample: "晚上好，吃饭了吗？", vietnameseExample: "Chào buổi tối, đã ăn cơm chưa?"),
            ChineseWord(character: "再见", pinyin: "zài jiàn", vietnameseMeaning: "Tạm biệt", englishMeaning: "Goodbye",
                       chineseExample: "再见，明天见", vietnameseExample: "Tạm biệt, hẹn gặp ngày mai"),
            ChineseWord(character: "谢谢", pinyin: "xiè xiè", vietnameseMeaning: "Cảm ơn", englishMeaning: "Thank you",
                       chineseExample: "谢谢你的帮助", vietnameseExample: "Cảm ơn sự giúp đỡ của bạn")
        ]),
        Lesson(number: 2, title: "汉语不太难 - Tiếng Hán không khó lắm", words: [
            ChineseWord(character: "一", pinyin: "yī", vietnameseMeaning: "Một", englishMeaning: "One",
                       chineseExample: "一个人", vietnameseExample: "Một người"),
            ChineseWord(character: "二", pinyin: "èr", vietnameseMeaning: "Hai", englishMeaning: "Two",
                       chineseExample: "二十块钱", vietnameseExample: "Hai mươi đồng"),
            ChineseWord(character: "三", pinyin: "sān", vietnameseMeaning: "Ba", englishMeaning: "Three",
                       chineseExample: "三本书", vietnameseExample: "Ba quyển sách"),
            ChineseWord(character: "四", pinyin: "sì", vietnameseMeaning: "Bốn", englishMeaning: "Four",
                       chineseExample: "四点钟", vietnameseExample: "Bốn giờ"),
            ChineseWord(character: "五", pinyin: "wǔ", vietnameseMeaning: "Năm", englishMeaning: "Five",
                       chineseExample: "五个学生", vietnameseExample: "Năm học sinh"),
            ChineseWord(character: "六", pinyin: "liù", vietnameseMeaning: "Sáu", englishMeaning: "Six",
                       chineseExample: "六天", vietnameseExample: "Sáu ngày")
        ]),
        Lesson(number: 3, title: "明天见 - Ngày mai gặp lại", words: [
            ChineseWord(character: "学", pinyin: "xué", vietnameseMeaning: "học", englishMeaning: "to learn; to study",
                       chineseExample: "我学中文", vietnameseExample: "Tôi học tiếng Trung"),
            ChineseWord(character: "英语", pinyin: "Yīngyǔ", vietnameseMeaning: "tiếng Anh", englishMeaning: "English",
                       chineseExample: "我会说英语", vietnameseExample: "Tôi biết nói tiếng Anh"),
            ChineseWord(character: "阿拉伯语", pinyin: "Ālābóyǔ", vietnameseMeaning: "tiếng Ả Rập", englishMeaning: "Arabic",
                       chineseExample: "阿拉伯语很难", vietnameseExample: "Tiếng Ả Rập rất khó"),
            ChineseWord(character: "德语", pinyin: "Déyǔ", vietnameseMeaning: "tiếng Đức", englishMeaning: "German",
                       chineseExample: "我想学德语", vietnameseExample: "Tôi muốn học tiếng Đức"),
            ChineseWord(character: "俄语", pinyin: "Éyǔ", vietnameseMeaning: "tiếng Nga", englishMeaning: "Russian",
                       chineseExample: "你会说俄语吗？", vietnameseExample: "Bạn có biết nói tiếng Nga không?"),
            ChineseWord(character: "法语", pinyin: "Fǎyǔ", vietnameseMeaning: "tiếng Pháp", englishMeaning: "French",
                       chineseExample: "法语很优美", vietnameseExample: "Tiếng Pháp rất đẹp"),
            ChineseWord(character: "韩国语", pinyin: "Hánguóyǔ", vietnameseMeaning: "tiếng Hàn Quốc", englishMeaning: "Korean",
                       chineseExample: "我喜欢韩国语", vietnameseExample: "Tôi thích tiếng Hàn"),
            ChineseWord(character: "日语", pinyin: "Rìyǔ", vietnameseMeaning: "tiếng Nhật", englishMeaning: "Japanese",
                       chineseExample: "日语不难", vietnameseExample: "Tiếng Nhật không khó"),
            ChineseWord(character: "西班牙语", pinyin: "Xībānyáyǔ", vietnameseMeaning: "tiếng Tây Ban Nha", englishMeaning: "Spanish",
                       chineseExample: "西班牙语很流行", vietnameseExample: "Tiếng Tây Ban Nha rất phổ biến")
        ]),
        Lesson(number: 4, title: "你去哪儿 - Bạn đi đâu đấy", words: [
            ChineseWord(character: "今天", pinyin: "jīntiān", vietnameseMeaning: "hôm nay", englishMeaning: "today",
                       chineseExample: "今天天气很好", vietnameseExample: "Hôm nay thời tiết đẹp"),
            ChineseWord(character: "天", pinyin: "tiān", vietnameseMeaning: "ngày", englishMeaning: "day",
                       chineseExample: "今天是个好天", vietnameseExample: "Hôm nay là một ngày đẹp"),
            ChineseWord(character: "昨天", pinyin: "zuótiān", vietnameseMeaning: "hôm qua", englishMeaning: "yesterday",
                       chineseExample: "昨天我去了学校", vietnameseExample: "Hôm qua tôi đã đi học"),
            ChineseWord(character: "对", pinyin: "duì", vietnameseMeaning: "đúng, chính xác", englishMeaning: "right; correct",
                       chineseExample: "你说得对", vietnameseExample: "Bạn nói đúng"),
            ChineseWord(character: "北京", pinyin: "Běijīng", vietnameseMeaning: "Bắc Kinh", englishMeaning: "Beijing",
                       chineseExample: "北京很漂亮", vietnameseExample: "Bắc Kinh rất đẹp"),
            ChineseWord(character: "上海", pinyin: "Shànghǎi", vietnameseMeaning: "Thượng Hải", englishMeaning: "Shanghai",
                       chineseExample: "上海是大城市", vietnameseExample: "Thượng Hải là thành phố lớn"),
            ChineseWord(character: "明天", pinyin: "míngtiān", vietnameseMeaning: "ngày mai", englishMeaning: "tomorrow",
                       chineseExample: "明天见", vietnameseExample: "Hẹn gặp ngày mai"),
            ChineseWord(character: "见", pinyin: "jiàn", vietnameseMeaning: "gặp, thấy", englishMeaning: "to see",
                       chineseExample: "很高兴见到你", vietnameseExample: "Rất vui được gặp bạn"),
            ChineseWord(character: "再见", pinyin: "zàijiàn", vietnameseMeaning: "tạm biệt", englishMeaning: "goodbye",
                       chineseExample: "明天再见", vietnameseExample: "Hẹn gặp lại ngày mai"),
            ChineseWord(character: "去", pinyin: "qù", vietnameseMeaning: "đi, đến", englishMeaning: "to go",
                       chineseExample: "我去学校", vietnameseExample: "Tôi đi học"),
            ChineseWord(character: "邮局", pinyin: "yóujú", vietnameseMeaning: "bưu điện", englishMeaning: "post office",
                       chineseExample: "邮局在哪儿？", vietnameseExample: "Bưu điện ở đâu?"),
            ChineseWord(character: "寄", pinyin: "jì", vietnameseMeaning: "gửi", englishMeaning: "to post; to mail",
                       chineseExample: "我要寄信", vietnameseExample: "Tôi muốn gửi thư"),
            ChineseWord(character: "信", pinyin: "xìn", vietnameseMeaning: "thư", englishMeaning: "letter; mail",
                       chineseExample: "我收到一封信", vietnameseExample: "Tôi nhận được một lá thư"),
            ChineseWord(character: "银行", pinyin: "yínháng", vietnameseMeaning: "ngân hàng", englishMeaning: "bank",
                       chineseExample: "银行在那边", vietnameseExample: "Ngân hàng ở đằng kia"),
            ChineseWord(character: "取", pinyin: "qǔ", vietnameseMeaning: "rút, cử, nhắc", englishMeaning: "to withdraw",
                       chineseExample: "我要取钱", vietnameseExample: "Tôi muốn rút tiền"),
            ChineseWord(character: "钱", pinyin: "qián", vietnameseMeaning: "tiền", englishMeaning: "money",
                       chineseExample: "你有钱吗？", vietnameseExample: "Bạn có tiền không?")
        ])
    ]
}
