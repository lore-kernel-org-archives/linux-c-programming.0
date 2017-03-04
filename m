From: Carsten Peter Rasmussen <mail@cprasmussen.dk>
Subject: Re: Where to start C-programming open source?
Date: Sat, 4 Mar 2017 10:42:08 +0100
Message-ID: <d1155cda-f074-7e84-fd01-981e39ed6885@cprasmussen.dk>
References: <ba6df9f8-661a-e935-2e81-c998fe4a4aa6@cprasmussen.dk>
 <CADWT_cPQRtoGc2zF-CDqX5HQvZvQARbi2FDgBdtGwdoTBhGy-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gnusys.onmicrosoft.com; s=selector1-gnusys-dk;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wzUS9LNACaXAcM9syxPaC9QStIoUrhVXX9FNrE+sa8Q=;
 b=eG/BmKGSLrDXTi4bF2+RJGfem3MwaKbbNMPyf1SbVEH1QNuFnMUVbDnlPfEBLh0eOOVn3wDzMvTBmH1hCkIWNqeaCzPocZyFC39glC2eATtgW3IV8VgvCUS+p2Lx5UZivv9PeMijp112c9a+Z9adTsCO8mQv2D5eTa+jeG3R3ao=
In-Reply-To: <CADWT_cPQRtoGc2zF-CDqX5HQvZvQARbi2FDgBdtGwdoTBhGy-Q@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jon Mayo <jon.mayo@gmail.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

Thanks for the replies!
Both the Fuzix and xv6 projects look like a lot of fun, think I'll start 
there. The problem with for instance Samba is that it feels like jumping 
on a high speed train because the project is so old and well maintained.

Den 03-03-2017 kl. 20:48 skrev Jon Mayo:
> Find a project that you use every day that you think you could improve
> or has a bug that you are able to reproduce. Go to the project and fix
> one of their bugs, submit the patch, and you're in.
>
> If you want to do OS dev, there are lots of sites for that. osdev.org
> has lots of tutorials and guides on their wiki. Writing an OS from
> scratch can be a good way to improve your skills, but it takes a lot
> of work before the OS is substantial enough to be of any use. Most OS
> projects are learning projects that are abandoned after the creator
> has gotten what they wanted out of the experience.
>
> Finding an OS project and seeing if you can get it up and running and
> maybe add to it can be rewarding. Linux of course is one that can be
> fun. But there are others like Prex (a real-time OS), xv6 (a minimal
> unix kernel for learning & experimentation, very good docs), Fuzix (a
> unix-like for really low-end CPUs without MMUs, including 8-bit
> systems), and there are hundreds of other possibilities.
>
> For me, writing something for xv6, like a VGA driver, or porting xv6
> to Raspberry Pi seems like fun.
>
> For totally gonzo sort of projects, something more challenging would
> be to port Fuzix to a new piece of hardware. Dragonball68K(Palm IIIx/V
> & Alphasmart Dana) could use some love for example.
>
> (ps - sorry, I accidentally sent this out in HTML mode, resending a
> cleaned up version for plaintext)
>
> On Fri, Mar 3, 2017 at 8:05 AM, Carsten Peter Rasmussen
> <mail@cprasmussen.dk> wrote:
>> Hi C-programming list
>>
>> It's awfully quite here, I wonder if I'm even in the right place!?
>> I have been a programmer for many year, and dabbled in many different
>> development areas, but I really want for participate in a open source
>> project by developing C. I have looked over a number of mailing lists like
>> Git, Samba, Vim etc. And every time I think "Wow, these guys are really
>> smart, this is out of my league" - so how does one start?
>>
>> Any comments and advice on getting started in OS with C is greatly
>> appreciated.
>>
>> - Carsten
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>

-- 
KH
Carsten
