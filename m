From: mojtaba mahdavi <mahdavi110@gmail.com>
Subject: Re: Windows can use cpp in c code but in linux ?? I dont know how .
Date: Sat, 2 Oct 2004 10:10:17 +0330
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <36a2bb3d0410012340224f71ba@mail.gmail.com>
References: <E3E30069B061524E90BCEE4417E3066113853D@monm207.monmouth.army.mil>
Reply-To: mojtaba mahdavi <mahdavi110@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <E3E30069B061524E90BCEE4417E3066113853D@monm207.monmouth.army.mil>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Huber, George K RDECOM CERDEC STCD SRI" <george.k.huber@us.army.mil>
Cc: linux-c-programming@vger.kernel.org

Thanks to all 

My problem has been solved. 

yours sincerely. 

mahdavi. 



On Thu, 30 Sep 2004 13:12:16 -0400, Huber, George K RDECOM CERDEC STCD
SRI <george.k.huber@us.army.mil> wrote:
> Suciu wrote:
> 
> >To solve this is easy, link with the c++ library: -lstdc++
> 
> >gcc a.c mylib.a -lstdc++
> 
> Or you could use g++ (the GNU C++ compiler)  It should handle
> C files as well.
> 
> George
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
