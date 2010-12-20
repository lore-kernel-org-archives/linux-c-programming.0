From: "Reza Hoorfar" <rhoorfar@gmail.com>
Subject: RE: union to get parts of integer
Date: Mon, 20 Dec 2010 15:33:06 +0330
Message-ID: <000601cba03d$e10b1440$a3213cc0$@gmail.com>
References: <AANLkTikAB_-kO_cmD5VQRtztx=4V9NDcmU4uWBDE=ON8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language;
        bh=KLhLg8EP85+YU13zvi0Ahlz8pTRHakCz9qAwczk6Wjc=;
        b=MOoqdLRUblfeueMge2hg20Ob4WZRX+vy/edTmuPWBrJbMt2Uc2nARl0fu01T/JeYVs
         jVCw7vYFhljFRrHv6fxwNakJgKkjxo6ZymSl4tl3+uY6FuvdBnflZeZuEInGR9lcAhTB
         q00B06Nqwkt/b3UfijNvqC3EKdRYhj8rhHtfM=
In-Reply-To: <AANLkTikAB_-kO_cmD5VQRtztx=4V9NDcmU4uWBDE=ON8@mail.gmail.com>
Content-Language: en-us
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

union MyUnion{
	int myInt;
	char myChar[sizeof(int)];
};

void main()
{
	MyUnion m;
	m.myInt = 0x01020304;
	printf("value :%d\n",m.myChar[0]); // -> value : 4
	printf("value :%d\n",m.myChar[1]); // -> value : 3
	printf("value :%d\n",m.myChar[2]); // -> value : 2
	printf("value :%d\n",m.myChar[3]); // -> value : 1
}

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of ratheesh k
Sent: Monday, December 20, 2010 2:10 PM
To: linux-c-programming@vger.kernel.org
Subject: union to get parts of integer

typedef struct {
char parts[4];
} node ;

int i=0x12345678

((node *)&i)->parts[0];
((node *)&i)->parts[1];
((node *)&i)->parts[2];
((node *)&i)->parts[3];

Is there any mechanism to split into bytes using the power of union ?

-Ratheesh
--
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

