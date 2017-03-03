From: Jon Mayo <jon.mayo@gmail.com>
Subject: Re: Where to start C-programming open source?
Date: Fri, 3 Mar 2017 11:48:46 -0800
Message-ID: <CADWT_cPQRtoGc2zF-CDqX5HQvZvQARbi2FDgBdtGwdoTBhGy-Q@mail.gmail.com>
References: <ba6df9f8-661a-e935-2e81-c998fe4a4aa6@cprasmussen.dk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rm-f-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=/UBT2ygBACFYnXz1HUsnlWXifBw/QVTNr+HyeE9Cvkk=;
        b=gtiRoZEiTmTdyhEOII1NlLihjSgU3ubCu6vFO63mQfvHU02QJFVpco0YhBmjj6r5hn
         eV9yRLk5uIqozDiiJf/6yQiWqO4VlEghek0Qx1XaPs5kal7SgkeXBZojxKmm07OSIlXw
         nWUQmoRcOoHaXPk4mfws8VObJ4kXZx6SFT/oZ4Z2HbwxPJoRUxsVVYBJBZKnxmHkQ1/1
         qN/heUeKFuUwaNCKvowYBQkYM3+X+PoT2zi7u2T4LdMGnsIbyoJq715HUk4SoUbd6gu1
         ZUwIIxcbii1mJNrR9mDkBvtDmjz840XAsAVQVb862kdMzTLWv1BUa4qQIZZeeACORIQM
         rP1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=/UBT2ygBACFYnXz1HUsnlWXifBw/QVTNr+HyeE9Cvkk=;
        b=KljJQmMcwfYChCwPuJOvc1Q+ZshJDvME3481i18aWdeVNeirX0styZHc9fOVlYtsVl
         U50QOqHfC3to4hYSpn4Xyi+AKnSE4UKwwgiZ6VX2LSH1SCvaMmKx+gX5LP+f06qhokBU
         d2b2ujE6IvalfcrJkphhiQd9SVwgzU3gpvyxrhG1j06fU00SUkSrq2JWd1kGOXEZN7To
         xw8+IXvE94eI4TWYagL90SpWlyx48nVZYLAtIaLvQQpdcB0Z77pn2JxSGAHjGCcCPp/P
         jZ8qt7kCFGUOLXH6BWBeTpcOKTDoDL43jNzWL1vP8py6HOpkRbgLNOqt0e3BZy2SziBR
         MZpg==
In-Reply-To: <ba6df9f8-661a-e935-2e81-c998fe4a4aa6@cprasmussen.dk>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carsten Peter Rasmussen <mail@cprasmussen.dk>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

Find a project that you use every day that you think you could improve
or has a bug that you are able to reproduce. Go to the project and fix
one of their bugs, submit the patch, and you're in.

If you want to do OS dev, there are lots of sites for that. osdev.org
has lots of tutorials and guides on their wiki. Writing an OS from
scratch can be a good way to improve your skills, but it takes a lot
of work before the OS is substantial enough to be of any use. Most OS
projects are learning projects that are abandoned after the creator
has gotten what they wanted out of the experience.

Finding an OS project and seeing if you can get it up and running and
maybe add to it can be rewarding. Linux of course is one that can be
fun. But there are others like Prex (a real-time OS), xv6 (a minimal
unix kernel for learning & experimentation, very good docs), Fuzix (a
unix-like for really low-end CPUs without MMUs, including 8-bit
systems), and there are hundreds of other possibilities.

For me, writing something for xv6, like a VGA driver, or porting xv6
to Raspberry Pi seems like fun.

For totally gonzo sort of projects, something more challenging would
be to port Fuzix to a new piece of hardware. Dragonball68K(Palm IIIx/V
& Alphasmart Dana) could use some love for example.

(ps - sorry, I accidentally sent this out in HTML mode, resending a
cleaned up version for plaintext)

On Fri, Mar 3, 2017 at 8:05 AM, Carsten Peter Rasmussen
<mail@cprasmussen.dk> wrote:
> Hi C-programming list
>
> It's awfully quite here, I wonder if I'm even in the right place!?
> I have been a programmer for many year, and dabbled in many different
> development areas, but I really want for participate in a open source
> project by developing C. I have looked over a number of mailing lists like
> Git, Samba, Vim etc. And every time I think "Wow, these guys are really
> smart, this is out of my league" - so how does one start?
>
> Any comments and advice on getting started in OS with C is greatly
> appreciated.
>
> - Carsten
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
-- Jon
