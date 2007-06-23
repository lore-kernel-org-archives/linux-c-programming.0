From: "=?ISO-8859-1?Q?Dar=EDo_Mariani?=" <mariani.dario@gmail.com>
Subject: Re: various meanings of static
Date: Sat, 23 Jun 2007 09:55:16 -0300
Message-ID: <84bd26ef0706230555x35fdceber20d5788370b602ee@mail.gmail.com>
References: <467CB8EC.8080209@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=t2QbdOSck3lJgovcrHnQcjS86faGnLRLG3wlrzn6qw/uLLX8iysLt7o0XT/PCoankqDoJ96sPh2I0kjDnFJArtT5WwcOR1A1EUCn1LNtnX9xNooWa86bMEigvGXO9w6xrZ8YKmxeLS6W19gJEm7hd7jWqHBLWkU1LE5yZ1SojSA=
In-Reply-To: <467CB8EC.8080209@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

On 6/23/07, Shriramana Sharma <samjnaa@gmail.com> wrote:
> Hello.
>
> ...
>
> I am thinking of using # define-s to use these four words:
>
> local, sticky, classwide, nothis
>
> instead of static in my C++ programs to make them more meaningful. I
> believe that the above four are mutually distinct purposes of the sin=
gle
> static keyword and whether a future C++ standard disambiguates these
> purposes or not (where I prefer it would) I can even now use these ne=
w
> clearer keywords.

IMHO, I think it's not a good idea to add your own keywords to your
code. This will make it harder for anyone else to read it.
Dar=EDo
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
