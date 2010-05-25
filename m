From: Xiaotian Feng <xtfeng@gmail.com>
Subject: Re: C Question
Date: Tue, 25 May 2010 18:19:59 +0800
Message-ID: <AANLkTinLnlZjmZ4bm78hWiOElWaqEQP0aJbmQ6k7lvw0@mail.gmail.com>
References: <AANLkTimNataepVFhtn4kSv_kGv1wTBHMAOgeZTK0hgW-@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=QB/pSDbeb/+5eyRqZ/u+b63cSTpMsP6EbcneK/EhE/0=;
        b=alYo6f0q+TYA8yB1PfylWwoUdqc7WWsjVOcLJgHceh96QdrTWyeQdQbE/zgT9FU2pZ
         76rkzMBvQi2/jW8/TsMVD+ShTfUAGNp36yrSWPqzMSan1FksvBlgka7j+yMrkdYcZOps
         s2yCB+pmsB4Dvv/OnHU2yZPhZoQD+DYn1xqUs=
In-Reply-To: <AANLkTimNataepVFhtn4kSv_kGv1wTBHMAOgeZTK0hgW-@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Tue, May 25, 2010 at 6:08 PM, Randi Botse <nightdecoder@gmail.com> w=
rote:
> Hi All,
>
> Im looking at lscpu.c shipped by util-linux-ng-2.17, can you explain
> me how the *vir_types[] declared, is this valid C declaration?
>

N_(blah) must be defined in some include files

> /* virtualization types */
> enum {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0VIRT_NONE =C2=A0 =C2=A0 =C2=A0 =3D 0,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0VIRT_PARA,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0VIRT_FULL
> };
> const char *virt_types[] =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[VIRT_NONE] =C2=A0 =C2=A0 =3D N_("none"),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[VIRT_PARA] =C2=A0 =C2=A0 =3D N_("para"),
> =C2=A0 =C2=A0 =C2=A0 =C2=A0[VIRT_FULL] =C2=A0 =C2=A0 =3D N_("full")
> };
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
