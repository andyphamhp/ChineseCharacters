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
            ChineseWord(character: "学", pinyin: "xué", vietnameseMeaning: "học", englishMeaning: "to learn; to study",
                       example: "我学中文 (Tôi học tiếng Trung)"),
            ChineseWord(character: "英语", pinyin: "Yīngyǔ", vietnameseMeaning: "tiếng Anh", englishMeaning: "English",
                       example: "我会说英语 (Tôi biết nói tiếng Anh)"),
            ChineseWord(character: "阿拉伯语", pinyin: "Ālābóyǔ", vietnameseMeaning: "tiếng Ả Rập", englishMeaning: "Arabic",
                       example: "阿拉伯语很难 (Tiếng Ả Rập rất khó)"),
            ChineseWord(character: "德语", pinyin: "Déyǔ", vietnameseMeaning: "tiếng Đức", englishMeaning: "German",
                       example: "我想学德语 (Tôi muốn học tiếng Đức)"),
            ChineseWord(character: "俄语", pinyin: "Éyǔ", vietnameseMeaning: "tiếng Nga", englishMeaning: "Russian",
                       example: "你会说俄语吗？ (Bạn có biết nói tiếng Nga không?)"),
            ChineseWord(character: "法语", pinyin: "Fǎyǔ", vietnameseMeaning: "tiếng Pháp", englishMeaning: "French",
                       example: "法语很优美 (Tiếng Pháp rất đẹp)"),
            ChineseWord(character: "韩国语", pinyin: "Hánguóyǔ", vietnameseMeaning: "tiếng Hàn Quốc", englishMeaning: "Korean",
                       example: "我喜欢韩国语 (Tôi thích tiếng Hàn)"),
            ChineseWord(character: "日语", pinyin: "Rìyǔ", vietnameseMeaning: "tiếng Nhật", englishMeaning: "Japanese",
                       example: "日语不难 (Tiếng Nhật không khó)"),
            ChineseWord(character: "西班牙语", pinyin: "Xībānyáyǔ", vietnameseMeaning: "tiếng Tây Ban Nha", englishMeaning: "Spanish",
                       example: "西班牙语很流行 (Tiếng Tây Ban Nha rất phổ biến)"),
            
            // Basic Conversation and Actions
            ChineseWord(character: "对", pinyin: "duì", vietnameseMeaning: "đúng, chính xác", englishMeaning: "right; correct",
                       example: "你说得对 (Bạn nói đúng)"),
            ChineseWord(character: "明天", pinyin: "míngtiān", vietnameseMeaning: "ngày mai", englishMeaning: "tomorrow",
                       example: "明天见 (Hẹn gặp ngày mai)"),
            ChineseWord(character: "见", pinyin: "jiàn", vietnameseMeaning: "gặp, thấy", englishMeaning: "to see",
                       example: "再见 (Tạm biệt)"),
            ChineseWord(character: "去", pinyin: "qù", vietnameseMeaning: "đi, đến", englishMeaning: "to go",
                       example: "我去学校 (Tôi đi học)"),
            ChineseWord(character: "北京", pinyin: "Běijīng", vietnameseMeaning: "Bắc Kinh", englishMeaning: "Beijing",
                       example: "北京很漂亮 (Bắc Kinh rất đẹp)"),
            
            // Post Office and Banking
            ChineseWord(character: "邮局", pinyin: "yóujú", vietnameseMeaning: "bưu điện", englishMeaning: "post office",
                       example: "邮局在哪儿？ (Bưu điện ở đâu?)"),
            ChineseWord(character: "寄", pinyin: "jì", vietnameseMeaning: "gửi", englishMeaning: "to post; to mail",
                       example: "我要寄信 (Tôi muốn gửi thư)"),
            ChineseWord(character: "信", pinyin: "xìn", vietnameseMeaning: "thư", englishMeaning: "letter; mail",
                       example: "我收到一封信 (Tôi nhận được một lá thư)"),
            ChineseWord(character: "银行", pinyin: "yínháng", vietnameseMeaning: "ngân hàng", englishMeaning: "bank",
                       example: "银行在那边 (Ngân hàng ở đằng kia)"),
            ChineseWord(character: "取", pinyin: "qǔ", vietnameseMeaning: "rút, cử, nhắc", englishMeaning: "to withdraw",
                       example: "我要取钱 (Tôi muốn rút tiền)"),
            ChineseWord(character: "钱", pinyin: "qián", vietnameseMeaning: "tiền", englishMeaning: "money",
                       example: "你有钱吗？ (Bạn có tiền không?)"),
            
            // Numbers
            ChineseWord(character: "六", pinyin: "liù", vietnameseMeaning: "sáu", englishMeaning: "six",
                       example: "六个人 (Sáu người)"),
            ChineseWord(character: "七", pinyin: "qī", vietnameseMeaning: "bảy", englishMeaning: "seven",
                       example: "七点钟 (Bảy giờ)"),
            ChineseWord(character: "九", pinyin: "jiǔ", vietnameseMeaning: "chín", englishMeaning: "nine",
                       example: "九块钱 (Chín đồng)")
        ]),
        Lesson(number: 4, title: "你去哪儿 - Bạn đi đâu đấy", words: [
            // Time-related words
            ChineseWord(character: "今天", pinyin: "jīntiān", vietnameseMeaning: "hôm nay", englishMeaning: "today",
                       example: "今天天气很好 (Hôm nay thời tiết đẹp)"),
            ChineseWord(character: "天", pinyin: "tiān", vietnameseMeaning: "ngày", englishMeaning: "day",
                       example: "今天是个好天 (Hôm nay là một ngày đẹp)"),
            ChineseWord(character: "昨天", pinyin: "zuótiān", vietnameseMeaning: "hôm qua", englishMeaning: "yesterday",
                       example: "昨天我去了学校 (Hôm qua tôi đã đi học)"),
            ChineseWord(character: "星期", pinyin: "xīngqī", vietnameseMeaning: "tuần", englishMeaning: "week",
                       example: "这个星期我很忙 (Tuần này tôi rất bận)"),
            ChineseWord(character: "星期一", pinyin: "xīngqīyī", vietnameseMeaning: "thứ hai", englishMeaning: "Monday",
                       example: "星期一我要上班 (Thứ hai tôi phải đi làm)"),
            ChineseWord(character: "星期二", pinyin: "xīngqī'èr", vietnameseMeaning: "thứ ba", englishMeaning: "Tuesday",
                       example: "星期二有课 (Thứ ba có lớp học)"),
            ChineseWord(character: "星期三", pinyin: "xīngqīsān", vietnameseMeaning: "thứ tư", englishMeaning: "Wednesday",
                       example: "星期三下午 (Chiều thứ tư)"),
            ChineseWord(character: "星期四", pinyin: "xīngqīsì", vietnameseMeaning: "thứ năm", englishMeaning: "Thursday",
                       example: "星期四晚上 (Tối thứ năm)"),
            ChineseWord(character: "星期五", pinyin: "xīngqīwǔ", vietnameseMeaning: "thứ sáu", englishMeaning: "Friday",
                       example: "星期五放假 (Thứ sáu được nghỉ)"),
            ChineseWord(character: "星期六", pinyin: "xīngqīliù", vietnameseMeaning: "thứ bảy", englishMeaning: "Saturday",
                       example: "星期六去玩 (Thứ bảy đi chơi)"),
            ChineseWord(character: "星期天", pinyin: "xīngqītiān", vietnameseMeaning: "chủ nhật", englishMeaning: "Sunday",
                       example: "星期天休息 (Chủ nhật nghỉ ngơi)"),
            
            // Numbers and question words
            ChineseWord(character: "几", pinyin: "jǐ", vietnameseMeaning: "mấy, vài", englishMeaning: "how many; what; several",
                       example: "几点了？ (Mấy giờ rồi?)"),
            ChineseWord(character: "二", pinyin: "èr", vietnameseMeaning: "hai", englishMeaning: "two",
                       example: "二个人 (Hai người)"),
            ChineseWord(character: "三", pinyin: "sān", vietnameseMeaning: "ba", englishMeaning: "three",
                       example: "三块钱 (Ba đồng)"),
            ChineseWord(character: "四", pinyin: "sì", vietnameseMeaning: "bốn", englishMeaning: "four",
                       example: "四点钟 (Bốn giờ)"),
            
            // Location and pronouns
            ChineseWord(character: "哪儿", pinyin: "nǎr", vietnameseMeaning: "ở đâu", englishMeaning: "where",
                       example: "你去哪儿？ (Bạn đi đâu?)"),
            ChineseWord(character: "那儿", pinyin: "nàr", vietnameseMeaning: "ở đó, nơi đó, chỗ kia", englishMeaning: "there",
                       example: "在那儿 (Ở đó)"),
            ChineseWord(character: "我", pinyin: "wǒ", vietnameseMeaning: "tôi, tao, ta", englishMeaning: "I; me",
                       example: "我是学生 (Tôi là học sinh)"),
            
            // Actions and places
            ChineseWord(character: "回", pinyin: "huí", vietnameseMeaning: "về, trở về, quay về", englishMeaning: "to go back (to)",
                       example: "我要回家 (Tôi muốn về nhà)"),
            ChineseWord(character: "学校", pinyin: "xuéxiào", vietnameseMeaning: "trường học", englishMeaning: "school",
                       example: "学校在那边 (Trường học ở đằng kia)"),
            
            // Common phrases
            ChineseWord(character: "再见", pinyin: "zàijiàn", vietnameseMeaning: "tạm biệt", englishMeaning: "goodbye",
                       example: "再见，明天见 (Tạm biệt, hẹn gặp ngày mai)"),
            ChineseWord(character: "对不起", pinyin: "duì bù qǐ", vietnameseMeaning: "xin lỗi", englishMeaning: "I'm sorry; sorry; excuse me",
                       example: "对不起，我迟到了 (Xin lỗi, tôi đến muộn)"),
            ChineseWord(character: "没关系", pinyin: "méi guānxi", vietnameseMeaning: "không có gì", englishMeaning: "doesn't matter; don't mind; that's all right",
                       example: "没关系，下次见 (Không sao, hẹn gặp lần sau)"),
            
            // Proper name
            ChineseWord(character: "天安门", pinyin: "Tiān'ānmén", vietnameseMeaning: "Thiên An Môn", englishMeaning: "Tiananmen Square",
                       example: "天安门在北京 (Thiên An Môn ở Bắc Kinh)")
        ]),
        Lesson(number: 5, title: "这是王老师 - Đây là thầy giáo Vương", words: [
            // Pronouns and Demonstratives
            ChineseWord(character: "这", pinyin: "zhè", vietnameseMeaning: "đây này", englishMeaning: "this",
                       example: "这是我的书 (Đây là sách của tôi)"),
            ChineseWord(character: "是", pinyin: "shì", vietnameseMeaning: "là, thị", englishMeaning: "to be; is/am/are",
                       example: "我是学生 (Tôi là học sinh)"),
            ChineseWord(character: "王", pinyin: "Wáng", vietnameseMeaning: "Họ Vương", englishMeaning: "Wang (a family name of Chinese)",
                       example: "这是王老师 (Đây là thầy Vương)"),
            ChineseWord(character: "老师", pinyin: "lǎoshī", vietnameseMeaning: "thầy giáo, cô giáo", englishMeaning: "teacher",
                       example: "他是老师 (Anh ấy là giáo viên)"),
            ChineseWord(character: "您", pinyin: "nín", vietnameseMeaning: "ngài", englishMeaning: "honorific you",
                       example: "您好 (Xin chào ngài)"),
            
            // Actions and Polite Words
            ChineseWord(character: "请", pinyin: "qǐng", vietnameseMeaning: "mời", englishMeaning: "please",
                       example: "请进 (Mời vào)"),
            ChineseWord(character: "进", pinyin: "jìn", vietnameseMeaning: "vào", englishMeaning: "to enter; to come in",
                       example: "请进来 (Mời vào)"),
            ChineseWord(character: "坐", pinyin: "zuò", vietnameseMeaning: "ngồi", englishMeaning: "to sit",
                       example: "请坐 (Mời ngồi)"),
            ChineseWord(character: "喝", pinyin: "hē", vietnameseMeaning: "uống", englishMeaning: "to drink",
                       example: "喝茶 (Uống trà)"),
            ChineseWord(character: "茶", pinyin: "chá", vietnameseMeaning: "trà, chè", englishMeaning: "tea",
                       example: "请喝茶 (Mời uống trà)"),
            ChineseWord(character: "谢谢", pinyin: "xièxie", vietnameseMeaning: "cảm ơn", englishMeaning: "to thank",
                       example: "谢谢您 (Cảm ơn ngài)"),
            
            // Expressions and States
            ChineseWord(character: "不客气", pinyin: "bú kèqi", vietnameseMeaning: "không có gì", englishMeaning: "You're welcome",
                       example: "不客气，这是我应该做的 (Không có gì, đó là việc tôi nên làm)"),
            ChineseWord(character: "客气", pinyin: "kèqi", vietnameseMeaning: "khách khí, lịch sự", englishMeaning: "polite; courteous",
                       example: "您太客气了 (Ngài khách khí quá)"),
            ChineseWord(character: "工作", pinyin: "gōngzuò", vietnameseMeaning: "công việc, làm việc", englishMeaning: "work; to work",
                       example: "我在学校工作 (Tôi làm việc ở trường)"),
            ChineseWord(character: "身体", pinyin: "shēntǐ", vietnameseMeaning: "sức khỏe, thân thể", englishMeaning: "health; body",
                       example: "身体好吗？(Sức khỏe tốt chứ?)"),
            
            // Numbers and Time
            ChineseWord(character: "十", pinyin: "shí", vietnameseMeaning: "mười", englishMeaning: "ten",
                       example: "十个学生 (Mười học sinh)"),
            ChineseWord(character: "日", pinyin: "rì", vietnameseMeaning: "ngày", englishMeaning: "sun; day",
                       example: "星期日 (Chủ nhật)")
        ])
    ]
} 
