From: "Ranga Reddy M - CTD ,Chennai." <rangareddym@ctd.hcltech.com>
Subject: RE: Some question about one method.
Date: Fri, 21 May 2004 16:24:23 +0530
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <53BBBB3235C2C74583722B212B36CA0D61F909@vishnu.ctd.hcltech.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alphex Kaanoken <alphex@crew.org.ru>, Linux devellist <linux-c-programming@vger.kernel.org>

Hi,

char ch[1];
ch[0]=(char) sym;
ch[1]='\0';

strcat(tmp,ch);

usage of the strcat as you mentioned.
But, how fast this is going to be I have no idea.

Cheers,
Ranga

-----Original Message-----
From: Alphex Kaanoken [mailto:alphex@crew.org.ru]
Sent: Friday, May 21, 2004 3:55 PM
To: Linux devellist
Subject: Some question about one method.


Hi guys,
I'm have a some question
how I can change the:
sprintf(tmp,"%s%c",tmp,sym);
where - char *tmp;int sym;
may I use strcat or another method.
I need a fast and better method for do it.

Thanx.

-- 
Senior Developer of Crew IT research labs
Alphex Kaanoken <alphex@crew.org.ru>
Web: http://crew.org.ru
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
