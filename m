From: "Pedro de Medeiros" <pedrovmm@gmail.com>
Subject: Re: Using operator ! twice
Date: Sat, 30 Jun 2007 00:24:51 -0300
Message-ID: <38511efb0706292024q6463200s11d4dca1754e93ca@mail.gmail.com>
References: <1b2aacd80706291734y55b6e654i956767ae2a6f5e46@mail.gmail.com>
	 <1b2aacd80706291736s18563893q83a19d0ae5662514@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=tZ79aYffR7vKq5QUbYw2ITZZKzHEJIh8dEMf17LQc7W1yYH/N4Y+JYjw4f5qW0fjd8KDrpJ6IO8GP1fOia5D24IhPuERkFuvqvadw9bmXkUATh97YdaXhTenRvnxqg3/ShYeFgY6z9uI5c8Eo3WUItBSl02HHg4b9CBXECOJJFs=
In-Reply-To: <1b2aacd80706291736s18563893q83a19d0ae5662514@mail.gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Luong Ngo <luong.ngo@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On 6/29/07, Luong Ngo <luong.ngo@gmail.com> wrote:
> Hello,
>
> I came across several times codes that use ! operator on an integer
> variable. I am curious what is the purpose of using it twice.
> For example:
>
> int flag;
>                if( !! flag) {
>                    //do something
>                }
>
>
> The first ! operator will make !flag to be true if flag is 0, and if
> we not again it become false, which is just exactly the same if we
> just left it as
>    if(flag), since 0 is the same as false. Similar logic for non-0
> value of flag. Then why do we need to use ! operator twice to get bac=
k
> the same value as if we don't use at all? this seems to be the same
> for me if we do this in math:  -(-( -8)) =3D -8;


The reason for using double !s is to evaluate something as a
boolean value. I don't know why use it alone in "if ( !! num )",
but consider this code instead:

char *options[] =3D { "off" , "on" };

printf("Option is %s.\n", options[!!num]);

Since !!num always evaluates to 0 or 1, you don't have to
test it.


Cheers,
Pedro.

--=20
Pedro de Medeiros - Ci=EAncia da Computa=E7=E3o - Universidade de Bras=ED=
lia
Home Page: http://www.nonseq.net - Linux User No.: 234250
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
