From: Aneesh Bhasin <contact.aneesh@gmail.com>
Subject: Re: memory address represented as a string
Date: Sun, 26 Jul 2009 13:29:48 +0530
Message-ID: <f662f0210907260059l36076e16rb29f75640445bc7a@mail.gmail.com>
References: <2a46ebd60907260039g290268b7i3183ee785994b86@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=wEwrEbxXwUjYBcQEXoW6ey0hr/q3Ih9b/WchbZjHJ0s=;
        b=teGgGs+jRWnZoKTSokkFwgkNx7eOyeZ2nTCwQ73C2M15Y7IfqIs+BozzEEhFUuWleB
         3opaabdahTXh95k2ARgXOPMHWRVVAslNkqykfrdBR39EuLq28F1l0wGvoKh//3z9EeZA
         65Tip8iEol27+SDkAxkdTRS9bTECkhK+G9yUU=
In-Reply-To: <2a46ebd60907260039g290268b7i3183ee785994b86@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Saurabh Sehgal <saurabh.r.s@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Hi Saurabh,

On Sun, Jul 26, 2009 at 1:09 PM, Saurabh Sehgal <saurabh.r.s@gmail.com>=
 wrote:
>
> Hi all,
>
> I had a quick question:
>
> Let's say I design a function with the signature:
>
> void * foo( char * addr ) ; ,
>
> where addr is a string that represents a valid memory address =A0...
> so the way someone can call this function is ...
>
> char * addr =3D "0xae456778" // assume this is a valid memory address=
 on
> the machine

This=A0means that addr points to a memory location where the string
stored is "0xae456778"


>
> foo( addr ) ;
>
> Is it possible to take this address in string form, and assign it to
> an actual pointer of void * type ?

Yes, you can parse each individual character of the hex-format string
and convert it to its integral equivalent (you can find many samples
of this on internet...) and assing this value to a void * and then
return it back..

Hope that helps..
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
