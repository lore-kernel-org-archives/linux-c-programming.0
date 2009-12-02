From: Manish Katiyar <mkatiyar@gmail.com>
Subject: Re: Dynamic make target
Date: Wed, 2 Dec 2009 23:50:43 +0530
Message-ID: <ea11fea30912021020tc720492i498d316482500ab9@mail.gmail.com>
References: <ffb2c0280912020949i3db06e02i118df36e13aaaf41@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=9gkmqdjlQ+Tc1Ml4HEiwBSE33TNtFVdpHoJ30VCz0B0=;
        b=jQCErc7wWTsWzL2pjxQyZfEmuY9Nshk6JT3KEyzTVBRkYpinb+UWCAFa6QyJNI6lbZ
         xYVFe/WYTMx8oFOvi4qOtmi0EkoQkhyJ+VuetH44sxKbvTFEofD7CDLeomuxN2rGuGIr
         Niusoke2C9glRa2vW2Tlyv0nwSuLnfD/6FBPw=
In-Reply-To: <ffb2c0280912020949i3db06e02i118df36e13aaaf41@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Toan Pham <tpham3783@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Wed, Dec 2, 2009 at 11:19 PM, Toan Pham <tpham3783@gmail.com> wrote:
> hi all,
>
> I do not know where to ask this question perhaps this mailing list is
> best because it had to do with c complilation.
>
> I would like to set up a make target dynamicly. =A0for example
>
> when one issue command: =A0make sda1
> it auto compile and install to a mount point @ /mnt/sda1
>
> similiarly: make sda2 would compile and install to /mnt/sda2
>
>
> i know that in a makefile one can accomplish this by setting up two t=
argets, ie.
>
> sda1:
> =A0 =A0 =A0 make all
> =A0 =A0 =A0 mount /dev/sda1 /mnt/sda1
> =A0 =A0 =A0 cp releases/* /mnt/sda1
> =A0 =A0 =A0 umount /mnt/sda1
>
> sda2:
> =A0 =A0 =A0 make all
> =A0 =A0 =A0 mount /dev/sda1 /mnt/sda2
> =A0 =A0 =A0 cp releases/* /mnt/sda2
> =A0 =A0 =A0 umount /mnt/sda2
>
>
> i am curious if we can simplify everything by having a make target
> like this when no matches found


Will something like this help ?

/tmp/test> make
echo "Making defaults"
Making defaults

/tmp/test> make TARGET=3Dmanish
echo manish is target;
manish is target

/tmp/test> cat Makefile
ifeq ("$(origin TARGET)", "command line")
$(TARGET):
	echo $@ is target;
else
all:
	echo "Making defaults"
endif



>
> $param1:
> =A0 =A0 =A0 make all
> =A0 =A0 =A0 mount /dev/sda1 /mnt/$param1
> =A0 =A0 =A0 cp releases/* /mnt/$param1
> =A0 =A0 =A0 umount /mnt/$param1
>
> thank you,
>
> Toan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Thanks -
Manish
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[$\*.^ -- I miss being one of them
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
