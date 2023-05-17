import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shayriapp/thirdpage.dart';

class secondpage extends StatefulWidget {
  List cat;
  int index;

  secondpage(this.cat, this.index);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  List blank = [];
  List Love = ["""हकीकत कहो तो उन्हें ख्वाब लगता है,
शिकवा करो तो उन्हें मज़ाक लगता है,
कितनी शिद्दत से हम उन्हें याद करते हैं,
और एक वो हैं जिन्हें ये सब मजाक लगता है।""",
    """तेरी मोहब्बत ने हमे बेनाम कर दिया,
हमे हर ख़ुशी से अंजान कर दिया,
हमने तो कभी नही चाहा था हमे मोहब्बत हो,
लेकिन उसकी पहली नज़र ने हमे नीलाम कर दिया।""",
    """इस नजर ने उस नजर से बात करली,
रहे खामोश मगर फिर भी बात करली,
जब मोहब्बत की फ़िज़ा को खुश पाया,
तो दोनों निगाहों ने रो रो कर बरसात करली।""",
    """तुझे देख कर ये जहाँ रंगीन नजर आता है,
तेरे बिना दिल को चैन कहां आता है,
तू ही है मेरे इस दिल की धड़कन,
तेरे बिना ये जहां बेकार नज़र आता है।""",
    """तू तोड़ दे वो कसम जो तूने खाई है,
कभी कभी याद करने में क्या बुराई है,
तुझे याद किये बिना रहा भी तो नही जाता,
तूने दिल में जगह जो ऐसी बनाई है।""",
    """इश्क सभी को जीना सीखा देता है,
वफ़ा के नाम पर मरना सीखा देता है,
इश्क नही किया तो करके देखना,
ज़ालिम हर दर्द सहना सिखा देता है।""",
    """आपकी परछाई हमारे दिल में है,
आपकी यादें हमारी आँखों में हैं,
आपको हम भुलाएं भी कैसे,
आपकी मोहब्बत हमारी सांसो में हैं।""",
    """तेरी झील सी आँखों में डूब जाने का दिल चाहता है,
वफ़ा पर तेरी बर्बाद हो जाने का दिल चाहता है,
कोई सम्भाले हमे, बहक रहे हैं कदम,
तेरे इश्क में मर जाने का दिल चाहता है।""",
    """ये तुमसे किसने कहा तुम इश्क का तमाशा करना,
अगर मोहब्बत करते हो हमसे तो बस हल्का सा इशारा करना।""",
  """किसी न किसी को किसी पर एतवार हो जाता है,
एक अजनबी सा चेहरा ही यार हो जाता है,
खूबियों से ही नही होती मोहब्बत सदा,
किसी की कमियों से भी कभी प्यार हो जाता है।""",
    """दिल का हाल बताना नही आता,
हमे ऐसे किसी को तड़पाना नही आता,
सुनना तो चाहतें हैं हम उनकी आवाज़ को,
पर हमे कोई बात करने का बहाना नही आता।""",
    """हर कदम हर पल हम आपके साथ है,
भले ही आपसे दूर सही, लेकिन आपके पास हैं,
जिंदगी में हम कभी आपके हो या न हों,
लेकिन हमे आपकी कमी का हर पल एहसास हैं।""",
    """इश्क करती हूँ तुझसे अपनी जिंदगी से ज्यादा,
मैं डरतीं हूँ मौत से नही तेरी जुदाई से ज्यादा,
चाहे तो हमे आज़मा कर देख किसी और से ज्यादा,
मेरी जिंदगी में कुछ नही तेरी आवाज़ से ज्यादा।""",
    """जब खामोश निगाहों से बात होती है,
तो ऐसे ही मोहब्बत की शुरुआत होती है,
हमतो बस खोये ही रहतें हैं उनके ख्यालों में,
पता ही नही चलता कब दिन कब रात होती है।""",
    """आग लगी दिल में जब वो खफ़ा हुए,
एहसास हुआ तब, जब वो जुदा हुए,
करके वफ़ा वो हमे कुछ दे न सके,
लेकिन दे गये बहुत कुछ जब वो वेबफा हुए।""",
    """जिंदगी में कोई प्यार से प्यारा नही मिलता,
जिंदगी में कोई प्यार से प्यारा नही मिलता,
जो है पास आपके उसको सम्भाल कर रखना,
क्योंकि एक बार खोकर प्यार दोबारा नही मिलता।""",
    """बहुत सुकून मिलता है जब उनसे हमारी बात होती है,
वो हजारो रातों में वो एक रात होती है,
जब निगाहें उठा कर देखते हैं वो मेरी तरफ,
तब वो ही पल मेरे लीये पूरी कायनात होती है।""",
    """Tumhe Dekhte Hi Ye Dil
Bekarar Hone Laga Hai
Teri Chaahat Par Mujhe
Iqrar Hone Laga Hai..""",
    """Teri Aankhon Mein Mujhe
Ishq Najar Aata Hai
mera yeh Dil Tujhe
Beintehaan Chahta Hai..""",
    """Haskar Dard Ko
Seene Se Lagana hai
Tere Palkon Ke Ashkoon Se
Yun Hi Bheeg Jana Hai..""",
    """Ishq Ka Junoon Jab
Kisi Ko Chadhta hai
tab yeh Dil Pyar ki
nayi Kahani likhta Hai..""",
    """Deedar Ko Tere miloo
SaFar Karke aaya hoon
bus Tere Naino Ke Sagar mein
khone es Dil Ko Laya hoon.."""
  ];
  List Sad = ["""Mujhe Kismat Se Shiqwa To Nahi Lekin Ai Khuda,
Wo Zindagi Mein Kyun Aaya Jo Kismat Mein Nahi Tha.""",
    """Mohabbat Haar Ke Jeena Bahut Mushkil Hota Hai,
Usey Bas Itna Bata Dena Bharam Toda Nahi Karte.""",
    """Roj Dhhalti Hui Shaam Se Darr Lagta Hai,
Ab Mujhe Ishq Ke Anjaam Se Darr Lagta Hai,
Jab Se Mila Hai Dhokha Iss Ishq Mein,
Tab Se Ishq Ke Naam Se Bhi Darr Lagta Hai.""",
    """Jiske Naseeb Mein Hon Zamane Ki Thhokarein,
Uss BadNaseeb Se Na Sahaaron Ki Baat Kar.""",
    """Bula Raha Hai Kaun MujhKo Uss Taraf,
Mere Liye Bhi Kya Koi Udaas BeKaraar Hai.""",
    """Wo Tere Khat Teri Tasvir Aur Sookhe Phool,
Udaas Karti Hain Mujh Ko Nishaniyan Teri.""",
    """Woh Mera Sab Kuchh Hai Par Muqaddar Nahi,
Kaash Wo Mera Kuchh Na Hota Par Muqaddar Hota.""",
    """Mil Bhi Jate Hain Toh Katra Ke Nikal Jate Hain,
Hain Mausam Ki Tarah Log.... Badal Jaate Hain,
Hum Abhi Tak Hain Giraftar-e-Mohabbat Yaaro,
Thokarein Kha Ke Suna Tha Ke Sambhal Jate Hain.""",
    """Bewaqt Bewajah Besabab Si Berukhi Teri,
Phir Bhi Beinteha Chahne Ki Bebasi Meri.""",
    """Dekhi Hai Berukhi Ki Aaj Humne Intehaan,
Hum Pe Najar Padi Toh Mehfil Se Uthh Gaye.""",
    """Ek Najar Bhi Dekhna Ganwaara Nahi Usey,
Jara Sa Bhi Ehsaas Hamaara Nahi Usey,
Wo Sahil Se Dekhte Rahe Doobna Hamara,
Hum Bhi Khuddar They Pukara Nahi Usey.""",
    """Ja Kabhi Fursat Mile Mere Dil Ka Bojh Utaar Do,
Main Bahut Dino Se Udaas Hoon Mujhe Koi Shaam Udhhar Do.""",
    """Hamne to aik sakhs par chahat khatam kardi.
Ab mohabbat kise kahte hain hamen maloom nahin..""",
    """Zindagi ke kuch lamhe yaadgar hote hain, 
Yadoon mein kuch log khass hote hain, 
Yun to wo door hote hain nazaron se, 
Par unke ahsaas dil ke paas hote hain..""",
    """Jab Dhadkano Ko Tham Leta Hai Koi,
Jab Khayalo Mein Naam Hamara Leta Hai koi, 
Yaade Tab aur Yaadgar Ban Jaati Hai, 
Jab Hume Humse Behtar Jaan Leta Hai Koi.""",
    """Kisi Ko Bhi Nahi Chaha Maine, 
Jaan Ek Tujhe Chahne Ke Baad.""",
    """Ek Naam Ek Zikar 
Ek Tum Aur Ek Tumhari Fiqar
Bas Yahi Hai Chhoti Si Zindagi Meri."""
  ];
  List Funny = ["""Raat Ko Kitab Meri Mujhe Dekhti Rahi,
Neend Mujhe Apni Orr Kheenchti Rahi,
Neend Ka Jhonka Mera Mann Moh Gayaa,
Aur Fir Ek Genius Bina Padhe So Gaya.""",
    """Rehta Hai Ibaadat Mein Humein Maut Ka Khatka,
Hum Yaad Khuda Karte Hain Kar Le Na Khuda Yaad.""",
    """Mayyat Pe Aaye Hain Kuchh Iss Adaa Se Woh,
Sab Unn Pe Mar Mite Hain Mujhe Tanha Chhod Ke.""",
    """Iss Duniya Mein Lakhon Log Rahte Hain,
Koi Hansta Hai Toh Koi Rota Hai,
Par Sabse Sukhi Wahi Hota Hai,
Jo Shaam Ko Do Peg Maar Ke Sota Hai.""",
    """Kis Kis Ka Naam Lein Apni Barbadi Mein,
Bahut Log Aaye The Duayein Dene Shaadi Mein.
किस किस का नाम लें अपनी बरबादी में,
बहुत लोग आये थे दुआएं देने शादी में।""",
    """NoteBandi Ka Ek Yeh Bhi Asar Najar Aaya,
Woh Bewafa Fir Se Mere Dar Pe Najar Aaya,""",
    """Kuchh Aise Haadse Bhi Hote Hain Zindgi Mein Dost,
Hajaar Ka Note Rakhne Wale Sau Rupaye Mangte Hain.""",
    """Dosti Buri Ho Toh Use Hone Mat Do,
Agar Ho Gayi Toh Use Khone Mat Do,
Aur Agar Dost Ho Sabse Pyara Toh,
Use Chain Ki Neend Sone Mat Do.""",
    """Mera Dost Mujhse Yeh Kah Kar Dur Chala Gaya Faraz,
Ke Dosti Dur Ki Achhi Roti Tandoor Ki Achhi.""",
    """Ishq Ko Sar Ka Dard Kahne Wale Sunn,
Humne Toh Yeh Dard Apne Sar Le Liya,
Humari Nigahon Se BachKar Woh Kahan Jayenge,
Humne Unke Mohalle Mein Hi Ghar Le Liya.""",
    """Tere Ishq Ka Bukhar Hain Mujhko,
Aur Har Cheej Khane Ki Manaahi Hai,
Ek Ishq Ke Hakeem Ne Sirf,
Tere Chaman Ki Mausami Batayi Hai.""",
    """Hum DilPhenk Aashiq Har Kaam Mein Kamaal Kar Dein,
Jo Vaada Kare Woh Pura Har Haal Mein Kar Dein,
Kya Zarurat Hai Ladkiyo Ko Lipistic Lagane Ki,
Hum Chum-Chum Ke Hi Honth Laal Kar Dein.""",
    """Kala Na Kaho Mere Mahboob Ko,
Kala Na Kaho Mere Mahboob Ko,
Khuda Toh Til Bana Raha Tha,
Syaahi Ka Pyala Lurhak Gaya.""",
    """Aaj Tum Pe Aansuo Ki Barsat Hogi,
Fir Wahi Kadkti Kali Raat Hogi,
Sms Na Kar Ke Tune Dil Dukhaya Hai Mera,
Ja Tere Badan Mein Khujli Sari Raat Hogi.""",
    """Apni Surat Ka Kabhi Toh Deedar De,
Tadap Raha Hun Ab Aur Intezaar Na De,
Apni Aawaj Nahi Sunani Toh Mat Suna,
Kam Se Kam Ek Miss Call Hi Maar De.""",
    """Pehli Najar Mein Laga Woh Meri Hai,
Aankhein Uski Jheel Si Gehri Hain,
Propose Kar Kar Ke Thak Gaye Hum,
Ab Pata Chala Woh Toh Behri Hai.""",
    """Achchey dost takiye ki trah hote hain,
Museebat me seene se laga lo,
Tnhai me sar rakhkar ro lo,
aur gussey me laat bhi maar sakte ho.""",
    """Begairat to bahot dekhe hain,
Tumhara aik apna he makaam hai.""",
    """Kuch dost to khazane ki trah hote hain,
Dil karta hai zameen me gaad dun."""
  ];
  List Attitude = ["""Chamak Yoon Hi Nahi Aati Hai Khuddari Ke Chehre Par,
Anaa Ho Humne Do-Do Waqt Ka Faaka Karaya Hai.""",
    """Wo Manzil Hi Badnaseeb Thi Jo Humko Paa Na Saki,
Varna Jeet Ki Kya Aukaat Jo Humein Thhukra De.""",
    """Maine Kab Kaha Ki Tum Keemat Samjho Humari,
Humein Bikna Hi Agar Hota To Yoon Tanha Nahi Hote.""",
    """Haq Se Do Toh Tumhari Nafrat Bhi Qabool Humein,
Khairat Mein Toh Hum Tumhari Mohabbat Bhi Na Lein.""",
    """Humare Baad Nahi Aayega Tumhein Chaahat Mein Maza,
Tum Sabse Kehte Firoge Humein Chaaho Uski Tarah.""",
    """Kee Mohabbat Toh Siyasat Ka Chalan Chhod Diya,
Hum Agar Pyar Na Karte Toh Hukoomat Karte.""",
    """Paanv Phailaye Toh Fir Na Dekhi Chaadar Humne,
Tujh Ko Chaaha To Aukaat Se Barh Kar Chaaha.""",
    """Zarron Mein RahGujar Ke Chamak Chhod Jaaunga,
Pehchan Apni Dur Talak Chhod Jaaunga.
Khamoshiyon Ki Maut Ganwara Nahi Mujhe,
Sheesha Hoon Toot Kar Bhi Khanak Chhod Jaunga.""",
    """Mizaaj Mein Thodi Sakhti Lazimi Hai Huzoor,
Log Pee Jaate Samandar Agar Khara Na Hota.""",
    """Sahaare Dhhoondhne Ki Aadat Nahi Humari,
Hum Akele Poori Mehfil Ke Barabar Hain.""",
    """Hum Ne Kirdaar Ko Kapdon Ki Tarah Pahena Hai,
Tum Ne Kapdon Hi Ko Kirdaar Samajh Rakha Hai.""",
    """Tum Bahete Paani Se Ho Har Shakl Mein Dhal Jaate Ho,
Main Ret Sa Hoon Mujhse Kachche Ghar Bhi Nahi Bante.""",
    """Dil Hai Kadmon Pe Kisi Ke Sar Jhuka Ho Ya Na Ho,
Bandgi Toh Apni Fitrat Hai Khuda Ho Ya Na Ho.""",
    """Bas Deewangi Ki Khatir Teri Gali Mein Aate Hain,
Varna Aawargi Ke Liye Toh Saara Shahar Pada Hai.""",
    """Main Logon Se Mulakato Ke Lamhe Yaad Rakhta Hoon,
Baatein Bhool Bhi Jaaun Par Lahje Yaad Rakhta Hoon.""",
    """Na Main Gira Na Meri Umeedon Ke Meenar Gire,
Par Kuchh Log Mujhe Giraane Mein Kayi Baar Gire.""",
    """Ehsaan Yeh Raha Tohmat Lagane Walon Ka Mujh Par,
UthhTi Ungliyon Ne Mujhe MashHoor Kar Diya.""",
    """Apni nazar me bahot achchchi hun mai,
Duniyan ki nazar ka theka nahin le rakha maine.""",
    """Jeet hi jeet hun maat he maat hoon, 
Main tere akhtiyar se aage ki baat hoon.""","""Chhod Di Hai Ab Humne Wo Fankaari Varna,
Tujh Jaise Haseen Toh Hum Kalam Se Bana Dete The.""",
    """Gumaan Itna Nahi Achha Tu Sunn Le Pehle Jaane Ke,
Paltne Par Mukar Sakta Hun Tujhko JanNe Se Bhi.""",
    """Samandar Baha Dene Ka Jigar Toh Rakhte Hain Lekin,
Humein Aashiqi Ki Numaish Ki Aadat Nahi Hai Dost.""",
    """Mere Baare Mein Apni Soch Ko Thhoda Badal Ke Dekh,
Mujhse Bhi Bure Hain Log Tu Ghar Se Nikal Ke Dekh."""
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.index == 0) {
        blank = Love;
      } else if (widget.index == 1) {
        blank = Sad;
      } else if (widget.index == 2) {
        blank = Funny;
      } else if (widget.index == 3) {
        blank = Attitude;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.cat[widget.index]),
            backgroundColor: Colors.blue.shade900),
        body: ListView.builder(
          itemCount: blank.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(5),
              elevation: 5,
              //color: Colors.blue.shade200,
              color: Colors.primaries[Random().nextInt(widget.cat.length)].withOpacity(0.8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                title: Text("${blank[index]}", maxLines: 1),
                hoverColor: Colors.blue,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      var appbarcopy = widget.cat[widget.index];
                      return thirdpage(blank, index, widget.cat, appbarcopy);

                    },
                  ));
                },
              ),
            );
          },
        ));
  }
}
