From: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <mariani.dario@gmail.com>
Subject: Re: Errors with ->*
Date: Tue, 2 Aug 2011 14:47:37 -0300
Message-ID: <CAPHC=MBpmL2GCRYYuRt_U5OY5nCGsESKLkvPVcXk9Qe4pq9NgA@mail.gmail.com>
References: <4E382646.7060903@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=1KRwzyTZFJlNzNKuM73Aqd6G7QM3wpbYVaTnAniuw/s=;
        b=Lt6G4XQtA+Nky6Oj4PLi6E/hLG0hhsTP9xWtgTo1sTtS5xZhJqxnhDeysrFK8cEOXV
         Uyv+YUB0cQGerdgRwuvZfdx/Y+WxxDb1tsbtsdm+GdhyUzxG0dz3hEY/GDyIXegW8XOD
         XsTJd17m8g2TTF2+zpzB63Vn+MQnYtGdFw0hw=
In-Reply-To: <4E382646.7060903@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Shriramana Sharma <samjnaa@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Line 9 should be:
int * xptr, * yptr ;
You forgot a '*'. About the rest, you are using the pointer to members
incorrectly, look at
http://www.google.com/search?q=3Dpointer+to+member for examples and usa=
ge.
Dar=EDo

On Tue, Aug 2, 2011 at 13:31, Shriramana Sharma <samjnaa@gmail.com> wro=
te:
> Hello -- long time since I posted on this list.
>
> I'm trying to understand the use of ->* but in compiling the attached
> program which I thought was straightforward I am getting the followin=
g
> errors:
>
> foo.cpp: In constructor =91mystruct::mystruct()=92:
> foo.cpp:9:12: error: invalid conversion from =91int*=92 to =91int=92
> foo.cpp: In function =91int main()=92:
> foo.cpp:21:7: error: =91xptr=92 was not declared in this scope
> foo.cpp:22:7: error: =91yptr=92 was not declared in this scope
>
> Please help.
>
> --
> Shriramana Sharma
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
