From: "Daniel." <danielhilst@gmail.com>
Subject: Re: Hiding inter-library dependencies.
Date: Tue, 16 Aug 2016 13:43:14 -0300
Message-ID: <CAF3SDA50AbpQL_fgW8R0tNtT7_BonZ=RJONcszYsifFTJ8fz-w@mail.gmail.com>
References: <CAF3SDA7nNWNCrfY3MT8PfU6kU7E8JjLnPXcohJL896_o3hGWcQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=+RKMNoArFbKFnlgpSgKq+40X0fQf21kUYiseIouhf10=;
        b=YjR8Cn5PE9q877Bv7Kl/wg0FTjSuuyhRu9fokaEoUB8Z/22sOMHMFJD4NhqybtNFoW
         ZlZqkX91B8hUEVNwczj+IkVS5OHtklfrDRAd1Bcj6chh3gktm5on8uhJ55qClDVTbCJK
         zxe9q/pzLQ8xK/AV45ZaAUkZy85j/vbMlRiPpsSgBD/CmxA+BPAgMDruS+syD/vyAmiS
         Mxekwqweo0NAKEpb4M8NFIduSfymzLW2DkhTb5SzqukeXc04oUb7GQW+jkxfL8iaudg+
         T8oGMET5M5//ims279bExVGzyAOmJwa0xk9N+LWcQ7EGscS06OdtZ01HR77v/1ygrpPh
         LnUg==
In-Reply-To: <CAF3SDA7nNWNCrfY3MT8PfU6kU7E8JjLnPXcohJL896_o3hGWcQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

Hey everybody again,

I'm using --allow-shlib-undefined to achieve this. Does anybody knows
what kind of headaches I may face in future when using this!?

Bye!

2016-08-16 11:14 GMT-03:00 Daniel. <danielhilst@gmail.com>:
> Hi everybody!
>
> Suppose that I have 3 shared files,
> and two target machines M1 and M2.
>
> libA.so, libB.so and libC.so.
>
> libB.so is linked against libA.so only when compiled
> to M1, but not in M2.
>
> libC.so is aways linked against libB.so
>
> So we have:
>
> M1: libA.so <- libB.so <- libC.so <- executable.
> M2:                   libB.so <- libC.so <-executable
>
> I want to hide libA.so need while linking libB,
> so that libC has not to pass -lA to linker depending
> on machine. And to
> hide libB and libA while linking to libC, so that
> the user need to pass only -lC. Is that possible?
>
> For example, linking in M1 would be:
> cc -fPIC -shared -o libA.so libA.c
> cc -fPIC -shared -o libB.so libB.c -lA
> cc -fPIC -shared -o libC.so libC.c -lB (no need to -lA is the point here)
> cc -o executable executable.c -lC (no need to -lB -lA is the point here)
>
> And for M2 would be:
> cc -fPIC -shared -o libB.so libB.c
> cc -fPIC -shared -o libC.so -lB
> cc -o executable executable.c -lC
>
> In both cases (machines) the compilation of executable and libC
> is done by the same command line.
>
>
> Cheers,
>
>
> --
> "Do or do not. There is no try"
>   Yoda Master



-- 
"Do or do not. There is no try"
  Yoda Master
