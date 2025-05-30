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
        // Lesson 1: Basic Greetings
        Conversation(
            number: 1,
            title: "第一次见面",
            titlePinyin: "Dì yī cì jiànmiàn",
            titleEnglish: "First Meeting",
            dialogue: [
                DialogueLine(
                    speaker: "A",
                    chinese: "你好！",
                    pinyin: "Nǐ hǎo!",
                    english: "Hello!"
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "你好！",
                    pinyin: "Nǐ hǎo!",
                    english: "Hello!"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "早上好！",
                    pinyin: "Zǎo shang hǎo!",
                    english: "Good morning!"
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "早上好！谢谢！",
                    pinyin: "Zǎo shang hǎo! Xièxiè!",
                    english: "Good morning! Thank you!"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "再见！",
                    pinyin: "Zàijiàn!",
                    english: "Goodbye!"
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "再见！",
                    pinyin: "Zàijiàn!",
                    english: "Goodbye!"
                )
            ]
        ),
        
        // Lesson 2: Numbers
        Conversation(
            number: 2,
            title: "买东西",
            titlePinyin: "Mǎi dōngxi",
            titleEnglish: "Shopping",
            dialogue: [
                DialogueLine(
                    speaker: "A",
                    chinese: "你好！",
                    pinyin: "Nǐ hǎo!",
                    english: "Hello!"
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "你好！要几个？",
                    pinyin: "Nǐ hǎo! Yào jǐ gè?",
                    english: "Hello! How many do you want?"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "三个。",
                    pinyin: "Sān gè.",
                    english: "Three."
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "还要吗？",
                    pinyin: "Hái yào ma?",
                    english: "Do you want more?"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "再要两个，一共五个。",
                    pinyin: "Zài yào liǎng gè, yīgòng wǔ gè.",
                    english: "I want two more, five in total."
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "好的。谢谢！",
                    pinyin: "Hǎo de. Xièxiè!",
                    english: "Okay. Thank you!"
                )
            ]
        ),
        
        // Lesson 3: Languages
        Conversation(
            number: 3,
            title: "学习语言",
            titlePinyin: "Xuéxí yǔyán",
            titleEnglish: "Learning Languages",
            dialogue: [
                DialogueLine(
                    speaker: "A",
                    chinese: "你好！你学什么？",
                    pinyin: "Nǐ hǎo! Nǐ xué shénme?",
                    english: "Hello! What are you studying?"
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "我学英语。你呢？",
                    pinyin: "Wǒ xué Yīngyǔ. Nǐ ne?",
                    english: "I'm studying English. How about you?"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "我学中文和日语。",
                    pinyin: "Wǒ xué Zhōngwén hé Rìyǔ.",
                    english: "I'm studying Chinese and Japanese."
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "法语难吗？",
                    pinyin: "Fǎyǔ nán ma?",
                    english: "Is French difficult?"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "不太难。德语很难。",
                    pinyin: "Bù tài nán. Déyǔ hěn nán.",
                    english: "Not too difficult. German is very difficult."
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "明天见！",
                    pinyin: "Míngtiān jiàn!",
                    english: "See you tomorrow!"
                )
            ]
        ),
        
        // Lesson 4: Going Places
        Conversation(
            number: 4,
            title: "去银行",
            titlePinyin: "Qù yínháng",
            titleEnglish: "Going to the Bank",
            dialogue: [
                DialogueLine(
                    speaker: "A",
                    chinese: "你好！你今天去哪儿？",
                    pinyin: "Nǐ hǎo! Nǐ jīntiān qù nǎr?",
                    english: "Hello! Where are you going today?"
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "我去银行取钱。",
                    pinyin: "Wǒ qù yínháng qǔ qián.",
                    english: "I'm going to the bank to withdraw money."
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "我去邮局寄信。",
                    pinyin: "Wǒ qù yóujú jì xìn.",
                    english: "I'm going to the post office to mail a letter."
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "昨天我去了北京。",
                    pinyin: "Zuótiān wǒ qùle Běijīng.",
                    english: "Yesterday I went to Beijing."
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "对！上海也很好。",
                    pinyin: "Duì! Shànghǎi yě hěn hǎo.",
                    english: "Right! Shanghai is also very good."
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "明天见！",
                    pinyin: "Míngtiān jiàn!",
                    english: "See you tomorrow!"
                )
            ]
        ),
        
        // Lesson 5: Politeness
        Conversation(
            number: 5,
            title: "拜访老师",
            titlePinyin: "Bàifǎng lǎoshī",
            titleEnglish: "Visiting the Teacher",
            dialogue: [
                DialogueLine(
                    speaker: "学生",
                    chinese: "老师，您好！",
                    pinyin: "Lǎoshī, nín hǎo!",
                    english: "Teacher, hello!"
                ),
                DialogueLine(
                    speaker: "老师",
                    chinese: "你好！请进，请坐。",
                    pinyin: "Nǐ hǎo! Qǐng jìn, qǐng zuò.",
                    english: "Hello! Please come in, please sit."
                ),
                DialogueLine(
                    speaker: "学生",
                    chinese: "谢谢您！",
                    pinyin: "Xièxiè nín!",
                    english: "Thank you!"
                ),
                DialogueLine(
                    speaker: "老师",
                    chinese: "请喝茶。",
                    pinyin: "Qǐng hē chá.",
                    english: "Please have some tea."
                ),
                DialogueLine(
                    speaker: "学生",
                    chinese: "谢谢！您身体好吗？",
                    pinyin: "Xièxiè! Nín shēntǐ hǎo ma?",
                    english: "Thank you! How is your health?"
                ),
                DialogueLine(
                    speaker: "老师",
                    chinese: "很好，谢谢！工作怎么样？",
                    pinyin: "Hěn hǎo, xièxiè! Gōngzuò zěnmeyàng?",
                    english: "Very good, thank you! How is work?"
                ),
                DialogueLine(
                    speaker: "学生",
                    chinese: "工作很好。不客气！",
                    pinyin: "Gōngzuò hěn hǎo. Bù kèqi!",
                    english: "Work is good. You're welcome!"
                )
            ]
        ),
        
        // Lesson 6: Introductions and Countries
        Conversation(
            number: 6,
            title: "认识新朋友",
            titlePinyin: "Rènshi xīn péngyou",
            titleEnglish: "Meeting New Friends",
            dialogue: [
                DialogueLine(
                    speaker: "A",
                    chinese: "请问，您贵姓？",
                    pinyin: "Qǐngwèn, nín guìxìng?",
                    english: "May I ask your honorable surname?"
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "我姓王，叫王明。你呢？",
                    pinyin: "Wǒ xìng Wáng, jiào Wáng Míng. Nǐ ne?",
                    english: "My surname is Wang, I'm called Wang Ming. And you?"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "我的名字是李华。你是哪国人？",
                    pinyin: "Wǒ de míngzi shì Lǐ Huá. Nǐ shì nǎ guó rén?",
                    english: "My name is Li Hua. What nationality are you?"
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "我是中国人。你是美国人吗？",
                    pinyin: "Wǒ shì Zhōngguó rén. Nǐ shì Měiguó rén ma?",
                    english: "I'm Chinese. Are you American?"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "不是，我是法国人。我学习中文。",
                    pinyin: "Bù shì, wǒ shì Fǎguó rén. Wǒ xuéxí Zhōngwén.",
                    english: "No, I'm French. I'm studying Chinese."
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "你的中文发音很好！这是谁的书？",
                    pinyin: "Nǐ de Zhōngwén fāyīn hěn hǎo! Zhè shì shéi de shū?",
                    english: "Your Chinese pronunciation is very good! Whose book is this?"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "那是我朋友的汉字词典。",
                    pinyin: "Nà shì wǒ péngyou de Hànzì cídiǎn.",
                    english: "That is my friend's Chinese character dictionary."
                )
            ]
        ),
        
        // Lesson 7: Food
        Conversation(
            number: 7,
            title: "在食堂吃饭",
            titlePinyin: "Zài shítáng chīfàn",
            titleEnglish: "Eating at the Cafeteria",
            dialogue: [
                DialogueLine(
                    speaker: "A",
                    chinese: "中午好！你吃什么？",
                    pinyin: "Zhōngwǔ hǎo! Nǐ chī shénme?",
                    english: "Good noon! What are you eating?"
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "我要一碗米饭和一些饺子。",
                    pinyin: "Wǒ yào yī wǎn mǐfàn hé yīxiē jiǎozi.",
                    english: "I want a bowl of rice and some dumplings."
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "这些面条好吃吗？",
                    pinyin: "Zhèxiē miàntiáo hǎochī ma?",
                    english: "Are these noodles delicious?"
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "很好吃！那些包子也很香。",
                    pinyin: "Hěn hǎochī! Nàxiē bāozi yě hěn xiāng.",
                    english: "Very delicious! Those steamed buns are also very fragrant."
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "我要一个馒头和鸡蛋汤。",
                    pinyin: "Wǒ yào yī gè mántou hé jīdàn tāng.",
                    english: "I want a steamed bun and egg soup."
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "你用筷子吃饭吗？",
                    pinyin: "Nǐ yòng kuàizi chīfàn ma?",
                    english: "Do you eat with chopsticks?"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "是的，我用我的手机查词典。",
                    pinyin: "Shì de, wǒ yòng wǒ de shǒujī chá cídiǎn.",
                    english: "Yes, I use my phone to look up the dictionary."
                )
            ]
        ),
        
        // Lesson 8: Shopping for Fruits
        Conversation(
            number: 8,
            title: "买水果",
            titlePinyin: "Mǎi shuǐguǒ",
            titleEnglish: "Buying Fruits",
            dialogue: [
                DialogueLine(
                    speaker: "顾客",
                    chinese: "我想买水果。苹果一斤多少钱？",
                    pinyin: "Wǒ xiǎng mǎi shuǐguǒ. Píngguǒ yī jīn duōshao qián?",
                    english: "I want to buy fruit. How much is one jin of apples?"
                ),
                DialogueLine(
                    speaker: "老板",
                    chinese: "苹果三块五一斤。很甜！",
                    pinyin: "Píngguǒ sān kuài wǔ yī jīn. Hěn tián!",
                    english: "Apples are 3.5 yuan per jin. Very sweet!"
                ),
                DialogueLine(
                    speaker: "顾客",
                    chinese: "有点贵。香蕉怎么卖？",
                    pinyin: "Yǒudiǎn guì. Xiāngjiāo zěnme mài?",
                    english: "A bit expensive. How do you sell bananas?"
                ),
                DialogueLine(
                    speaker: "老板",
                    chinese: "香蕉两块钱一斤。还要别的吗？",
                    pinyin: "Xiāngjiāo liǎng kuài qián yī jīn. Hái yào biéde ma?",
                    english: "Bananas are 2 yuan per jin. Do you want anything else?"
                ),
                DialogueLine(
                    speaker: "顾客",
                    chinese: "我还要一公斤橘子和一些葡萄。",
                    pinyin: "Wǒ hái yào yī gōngjīn júzi hé yīxiē pútao.",
                    english: "I also want one kilogram of oranges and some grapes."
                ),
                DialogueLine(
                    speaker: "老板",
                    chinese: "一共二十八块钱。",
                    pinyin: "Yīgòng èrshíbā kuài qián.",
                    english: "Altogether 28 yuan."
                ),
                DialogueLine(
                    speaker: "顾客",
                    chinese: "我给你三十，找我两块吧。",
                    pinyin: "Wǒ gěi nǐ sānshí, zhǎo wǒ liǎng kuài ba.",
                    english: "I'll give you 30, please give me 2 yuan change."
                )
            ]
        ),
        
        // Lesson 9: Currency Exchange
        Conversation(
            number: 9,
            title: "换钱",
            titlePinyin: "Huàn qián",
            titleEnglish: "Currency Exchange",
            dialogue: [
                DialogueLine(
                    speaker: "顾客",
                    chinese: "下午好！我要换人民币。",
                    pinyin: "Xiàwǔ hǎo! Wǒ yào huàn rénmínbì.",
                    english: "Good afternoon! I want to exchange for RMB."
                ),
                DialogueLine(
                    speaker: "营业员",
                    chinese: "您好，先生！您有什么？",
                    pinyin: "Nín hǎo, xiānsheng! Nín yǒu shénme?",
                    english: "Hello, sir! What do you have?"
                ),
                DialogueLine(
                    speaker: "顾客",
                    chinese: "我有一千美元。",
                    pinyin: "Wǒ yǒu yīqiān měiyuán.",
                    english: "I have one thousand US dollars."
                ),
                DialogueLine(
                    speaker: "营业员",
                    chinese: "请等一会儿。一共六千八百元人民币。",
                    pinyin: "Qǐng děng yīhuìr. Yīgòng liùqiān bābǎi yuán rénmínbì.",
                    english: "Please wait a moment. Altogether 6,800 yuan RMB."
                ),
                DialogueLine(
                    speaker: "顾客",
                    chinese: "还可以换日元吗？",
                    pinyin: "Hái kěyǐ huàn rìyuán ma?",
                    english: "Can I also exchange for Japanese yen?"
                ),
                DialogueLine(
                    speaker: "营业员",
                    chinese: "可以。我们也有欧元和港币。请数一数。",
                    pinyin: "Kěyǐ. Wǒmen yě yǒu ōuyuán hé gǎngbì. Qǐng shǔ yīshǔ.",
                    english: "Yes. We also have euros and Hong Kong dollars. Please count."
                ),
                DialogueLine(
                    speaker: "顾客",
                    chinese: "谢谢小姐！上午我去图书馆学习。",
                    pinyin: "Xièxiè xiǎojiě! Shàngwǔ wǒ qù túshūguǎn xuéxí.",
                    english: "Thank you, miss! In the morning I go to the library to study."
                )
            ]
        ),
        
        // Lesson 10: Where People Live
        Conversation(
            number: 10,
            title: "找朋友",
            titlePinyin: "Zhǎo péngyou",
            titleEnglish: "Looking for Friends",
            dialogue: [
                DialogueLine(
                    speaker: "A",
                    chinese: "请问，王老师在吗？",
                    pinyin: "Qǐngwèn, Wáng lǎoshī zài ma?",
                    english: "Excuse me, is Teacher Wang in?"
                ),
                DialogueLine(
                    speaker: "职员",
                    chinese: "他不在办公室。他住在哪儿？",
                    pinyin: "Tā bù zài bàngōngshì. Tā zhù zài nǎr?",
                    english: "He's not in the office. Where does he live?"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "他家在五楼，房间号是五零一。",
                    pinyin: "Tā jiā zài wǔ lóu, fángjiān hào shì wǔ líng yī.",
                    english: "His home is on the 5th floor, room number is 501."
                ),
                DialogueLine(
                    speaker: "职员",
                    chinese: "你知道他的电话号码吗？",
                    pinyin: "Nǐ zhīdào tā de diànhuà hàomǎ ma?",
                    english: "Do you know his phone number?"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "我有他的手机号码。",
                    pinyin: "Wǒ yǒu tā de shǒujī hàomǎ.",
                    english: "I have his mobile phone number."
                ),
                DialogueLine(
                    speaker: "职员",
                    chinese: "那很好。请给他打电话。",
                    pinyin: "Nà hěn hǎo. Qǐng gěi tā dǎ diànhuà.",
                    english: "That's good. Please call him."
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "好的，谢谢！你呢？你住在哪儿？",
                    pinyin: "Hǎo de, xièxiè! Nǐ ne? Nǐ zhù zài nǎr?",
                    english: "Okay, thank you! How about you? Where do you live?"
                )
            ]
        ),
        
        // Lesson 11: Students
        Conversation(
            number: 11,
            title: "新同学",
            titlePinyin: "Xīn tóngxué",
            titleEnglish: "New Classmates",
            dialogue: [
                DialogueLine(
                    speaker: "A",
                    chinese: "我们都是留学生。你是哪个专业的？",
                    pinyin: "Wǒmen dōu shì liúxuéshēng. Nǐ shì nǎge zhuānyè de?",
                    english: "We are all international students. What's your major?"
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "我是语言学院的学生。我们在同一个班吗？",
                    pinyin: "Wǒ shì yǔyán xuéyuàn de xuéshēng. Wǒmen zài tóng yīge bān ma?",
                    english: "I'm a student at the Language Institute. Are we in the same class?"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "是的！我是一年级大学生。你认识王教授吗？",
                    pinyin: "Shì de! Wǒ shì yī niánjí dàxuéshēng. Nǐ rènshi Wáng jiàoshòu ma?",
                    english: "Yes! I'm a first-year university student. Do you know Professor Wang?"
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "认识。我介绍一下自己：我叫李明。",
                    pinyin: "Rènshi. Wǒ jièshào yīxià zìjǐ: wǒ jiào Lǐ Míng.",
                    english: "Yes. Let me introduce myself: I'm called Li Ming."
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "很高兴认识你！明天上课在哪个教室？",
                    pinyin: "Hěn gāoxìng rènshi nǐ! Míngtiān shàngkè zài nǎge jiàoshì?",
                    english: "Nice to meet you! Which classroom is tomorrow's class in?"
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "在二零一教室。你做作业了吗？",
                    pinyin: "Zài èr líng yī jiàoshì. Nǐ zuò zuòyè le ma?",
                    english: "In classroom 201. Did you do your homework?"
                ),
                DialogueLine(
                    speaker: "A",
                    chinese: "做了。我努力学习，希望成绩有进步。",
                    pinyin: "Zuò le. Wǒ nǔlì xuéxí, xīwàng chéngjì yǒu jìnbù.",
                    english: "Yes. I study hard, hoping my grades will improve."
                ),
                DialogueLine(
                    speaker: "B",
                    chinese: "下课以后我们一起去图书馆吧！",
                    pinyin: "Xiàkè yǐhòu wǒmen yīqǐ qù túshūguǎn ba!",
                    english: "After class, let's go to the library together!"
                )
            ]
        )
    ]
}