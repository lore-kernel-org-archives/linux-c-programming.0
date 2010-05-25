From: Uriel Corfa <uriel@corfa.fr>
Subject: Re: C Question
Date: Tue, 25 May 2010 13:18:48 +0200
Message-ID: <AANLkTimyPhCRO-g2i1keSaZqiEcJz1L4SwsPuHuiV5RP@mail.gmail.com>
References: <AANLkTimNataepVFhtn4kSv_kGv1wTBHMAOgeZTK0hgW-@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:sender:received
         :in-reply-to:references:from:date:x-google-sender-auth:message-id
         :subject:to:cc:content-type:content-transfer-encoding;
        bh=amDL/rypVxG+1UqbkQPgArWetQXW7ceVBFAAbNGbP6M=;
        b=PNr5KwDtzYQMm1HVS9vVKTfGgYf8nnPo6C2eh81cgOdI5EAKhwThx6QuvL066TcgyF
         smfGAKvxe70FpIfo1HDXP80Dnpak0sjO/54uzOlM/gsywrjzwZL2mLslIyurqbBFxc1P
         gXGNQvcHgHWFkOmY3bP5GC/HbShbXYPAx/Fl4=
In-Reply-To: <AANLkTimNataepVFhtn4kSv_kGv1wTBHMAOgeZTK0hgW-@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

That's "designated initializers". It's C99.

It allows you to initialize some members to a specific value without
specifying the default value manually for the other ones.

Refs :
http://www.open-std.org/jtc1/sc22/WG14/www/docs/n1256.pdf  chapter 6.7.=
8.6
http://publib.boulder.ibm.com/infocenter/comphelp/v8v101/index.jsp?topi=
c=3D/com.ibm.xlcpp8a.doc/language/ref/designators.htm

On Tue, May 25, 2010 at 12:08 PM, Randi Botse <nightdecoder@gmail.com> =
wrote:
> Hi All,
>
> Im looking at lscpu.c shipped by util-linux-ng-2.17, can you explain
> me how the *vir_types[] declared, is this valid C declaration?
>
> /* virtualization types */
> enum {
> =A0 =A0 =A0 =A0VIRT_NONE =A0 =A0 =A0 =3D 0,
> =A0 =A0 =A0 =A0VIRT_PARA,
> =A0 =A0 =A0 =A0VIRT_FULL
> };
> const char *virt_types[] =3D {
> =A0 =A0 =A0 =A0[VIRT_NONE] =A0 =A0 =3D N_("none"),
> =A0 =A0 =A0 =A0[VIRT_PARA] =A0 =A0 =3D N_("para"),
> =A0 =A0 =A0 =A0[VIRT_FULL] =A0 =A0 =3D N_("full")
> };
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Uriel Corfa
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
