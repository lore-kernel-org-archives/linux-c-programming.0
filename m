From: Ron Michael Khu <ronkhu@ntsp.nec.co.jp>
Subject: Re: how to link mqueue library
Date: Thu, 16 Dec 2004 16:02:55 +0800
Message-ID: <41C1412F.9020909@hq.ntsp.nec.co.jp>
References: <1438051141@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1438051141@web.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Camillo Dell'mour <c.dellmour@web.de>
Cc: linux-c-programming@vger.kernel.org

Thanks camillo.

I already found the library;
it's librt.....


Camillo Dell'mour wrote:

>Hi Ron
>the math lib is named libm and the curses lib  libcurses
>
>so the by the -l option in gcc you do not have to write "lib..."
>
>I don't  who the mqueue libary is named, But I think libqueue so you shoult write -lqueue
>
>ron wrots --
>  
>
>>Hello.
>>
>>I seem to have a problem linking the mqueue library....
>>What's the library name to be added to the "-l" option of cc/gcc?
>>If -lm is for the math library... -lcurses for ncurses,
>>what's the library name for mqueue? -lmqueue??
>>
>>-Ron.
>>
>>    
>>
>
>
>__________________________________________________________
>Mit WEB.DE FreePhone mit hoechster Qualitaet ab 0 Ct./Min.
>weltweit telefonieren! http://freephone.web.de/?mc=021201
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>


