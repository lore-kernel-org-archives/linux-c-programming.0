From: Balachandar <bala1486@gmail.com>
Subject: Re: Use of double pointer in linux kernel Hash list implementation
Date: Thu, 17 Jun 2010 10:34:46 -0400
Message-ID: <AANLkTinj8yacrvasccTNM9CtF9pny0U3QX47wtRT-Abq@mail.gmail.com>
References: <AANLkTilGln3yZRl1muugML4Qg_1rcTXTf3UeAIzLTOJT@mail.gmail.com>
	<1276745545.1712.8.camel@leonhard>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary=001636137a787a2a6c04893abd6a
Return-path: <kernelnewbies-bounce@nl.linux.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=PF5dImrKZQujGm2nT1zPH1f3qVeZYPtJ/CNLjKeTRAY=;
        b=bw0TsaM4vBsKYkFWO+1CN8Al5OgDtOvSK/mJxVjPJg3Ca8f16oEHdyWq3QlJzH8RrB
         FbQ6ySSKSR7c4XpGVa9lmklInNs1iTFe1VlvcXotA4Sxdz9zQmRXu9CQmdQCeZQV3QJJ
         YYIE1W/xE0NYlZne6+Cqb9yvzAFdfawGqvo4k=
In-Reply-To: <1276745545.1712.8.camel@leonhard>
Sender: kernelnewbies-bounce@nl.linux.org
Errors-to: kernelnewbies-bounce@nl.linux.org
List-help: <mailto:ecartis@nl.linux.org?Subject=help>
List-unsubscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=unsubscribe>
List-software: Ecartis version 1.0.0
List-Id: <linux-c-programming.vger.kernel.org>
List-subscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=subscribe>
List-owner: <mailto:ecartis-owner@nl.linux.org>
List-post: <mailto:kernelnewbies@nl.linux.org>
List-archive: <http://mail.nl.linux.org/kernelnewbies/>
To: Namhyung Kim <namhyung@gmail.com>
Cc: kernelnewbies@nl.linux.org, linux-c-programming@vger.kernel.org

--001636137a787a2a6c04893abd6a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 16, 2010 at 11:32 PM, Namhyung Kim <namhyung@gmail.com> wrote:

> 2010-06-16 (=EC=88=98), 22:50 -0400, Balachandar:
> > Hi,
> >   I am trying to understand Linux Kernel implementation of linked list
> > and hash table. A link to the implementation is here. I understood the
> > linked list implementation. But i am little confused of why double
> > pointers is being used in hlist (**pprev). Link for hlist is here. I
> > understand that hlist is used in implementation of hash table since
> > head of the list requires only one pointer and it saves space. Why
> > cant it be done using single pointer (just *prev like the linked
> > list)? Please help me.
> >
> >
> > Thanks,
> > Bala
>
>
> IMHO **pprev is only needed for fast deletion and/or insertion.
>
>
>
>
My doubt is why not use *prev as it is used in list_head implementation
rather than **pprev.

--001636137a787a2a6c04893abd6a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Wed, Jun 16, 2010 at 11:32 PM, Namhyu=
ng Kim <span dir=3D"ltr">&lt;<a href=3D"mailto:namhyung@gmail.com">namhyung=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
2010-06-16 (=EC=88=98), 22:50 -0400, Balachandar:<br>
<div><div></div><div class=3D"h5">&gt; Hi,<br>
&gt; =C2=A0 I am trying to understand Linux Kernel implementation of linked=
 list<br>
&gt; and hash table. A link to the implementation is here. I understood the=
<br>
&gt; linked list implementation. But i am little confused of why double<br>
&gt; pointers is being used in hlist (**pprev). Link for hlist is here. I<b=
r>
&gt; understand that hlist is used in implementation of hash table since<br=
>
&gt; head of the list requires only one pointer and it saves space. Why<br>
&gt; cant it be done using single pointer (just *prev like the linked<br>
&gt; list)? Please help me.<br>
&gt;<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Bala<br>
<br>
<br>
</div></div>IMHO **pprev is only needed for fast deletion and/or insertion.=
<br>
<br>
<br><font color=3D"#888888"><font class=3D"Apple-style-span" color=3D"#0000=
00"><font class=3D"Apple-style-span" color=3D"#888888"><br></font></font></=
font></blockquote><div><br></div><div>My doubt is why not use *prev as it i=
s used in list_head implementation rather than **pprev. =C2=A0</div>
</div>

--001636137a787a2a6c04893abd6a--

--
To unsubscribe from this list: send an email with
"unsubscribe kernelnewbies" to ecartis@nl.linux.org
Please read the FAQ at http://kernelnewbies.org/FAQ

