From: "Wen Guangcheng" <wen.guangcheng@cnt.sp.qnes.nec.co.jp>
Subject: Re: How to execute a process in background by exec functions?
Date: Thu, 8 Apr 2004 18:31:55 +0900
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <004501c41d4c$5503f820$de01a8c0@qnessmphibiki>
References: <3AA03342E913FA4BA6D8BD0732BFC74B05530BA8@pdsmsx402.pd.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Zhang, Yanmin" <yanmin.zhang@intel.com>, linux-c-programming@vger.kernel.org

Hi,
Thanks a lot for your help.
Yes, I have tired this way. The daemon started, but I hope its PPID
is 1. We can do it by calling system("/home/wen/daemon &").
How can I do it by fork&exec way?

Best regards,

--Wen

----- Original Message -----=20
=46rom: "Zhang, Yanmin" <yanmin.zhang@intel.com>
To: "Wen Guangcheng" <wen.guangcheng@cnt.sp.qnes.nec.co.jp>;
<linux-c-programming@vger.kernel.org>
Sent: Thursday, April 08, 2004 3:00 PM
Subject: RE: How to execute a process in background by exec functions?


> It doesn't work in this approach. Try this:
>
> pid=3Dfork();
> if(pid =3D=3D 0) {
> execv("/home/wen/daemon", NULL);
> exit(-1);
> }
>
> ... do parent process.
>
> Yanmin
>
>
> >-----Original Message-----
> >From: linux-c-programming-owner@vger.kernel.org [mailto:linux-c-
> >programming-owner@vger.kernel.org] On Behalf Of Wen Guangcheng
> >Sent: 2004=C3=84=C3=AA4=C3=94=C3=828=C3=88=C4=A0 13:41
> >To: linux-c-programming@vger.kernel.org
> >Subject: How to execute a process in background by exec functions?
> >
> >Hello All,
> >I am trying to execute a process in background by exec functions.
> >But it failed when I call the function of execv by
> >execv("/home/wen/daemon &", NULL);
> >The error is ENOENT(No such file or directory).
> >Would anyone tell me how to do it?
> >Thanks in advance.
> >
> >Best regards,
> >
> >--Wen
> >-
> >To unsubscribe from this list: send the line "unsubscribe linux-c-
> >programming" in
> >the body of a message to majordomo@vger.kernel.org
> >More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
