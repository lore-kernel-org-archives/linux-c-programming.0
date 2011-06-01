From: Zhongye Jia <jia.zhongye@gmail.com>
Subject: Re: macro to print filename
Date: Thu, 2 Jun 2011 02:08:50 +0800
Message-ID: <BANLkTinbg1RRpGFFYhge6D5YxRyGnxmT6w@mail.gmail.com>
References: <BANLkTi=TrKOcaQ4QcEHKOsqLaAPxL9f9Kw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=6ra/Qrf1vdmSOPdrEs6O27israFwXInzbpdpMOB05W4=;
        b=BM3Ay61PWZ1aMCiNXxudJ9rXq+k/NqStZwZ367TrQyP8692URHyGo3VXIy+pl0Pf8X
         r62qFKhRV1Nr6Cb704+ugVsb6WvK8N401AUWImtqcF9J1G8vp3e3R1jV2rL06SgfV+wd
         MJUqAJEUVeY+KRaidBbKheXJNhbRqEeFmdVHw=
In-Reply-To: <BANLkTi=TrKOcaQ4QcEHKOsqLaAPxL9f9Kw@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org

no need for an array, just a pointer is enough.

#include <stdio.h>

int main()
{
        char filename[] =3D __FILE__, *basename;
        basename =3D filename + sizeof(filename) - 2;
        while( basename+1 !=3D filename && *basename !=3D '/' ) {
                basename--;
        }
        basename++;
        printf("%s\n%s\n", filename, basename);
        return 0;
}

On Thu, Jun 2, 2011 at 00:07, ratheesh kannoth <ratheesh.ksz@gmail.com>=
 wrote:
> __FILE__ macro prints relative path name of the file. I need only
> filename. How to extract this ?
>
> I dont want to use any string library - since it includes more
> Processing and needs to store the character array in executable. IS
> there any method at preprocessing level to do this .
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
