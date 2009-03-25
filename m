From: =?ISO-2022-JP?B?GyRCTEBOPBsoQg==?= <longapple@gmail.com>
Subject: pass a local variable to a function
Date: Wed, 25 Mar 2009 08:21:48 -0800
Message-ID: <56b13acf0903250921w1934942bma7280055c97a9db3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=p2NDt1cfdcgBDTsbdUbeOx66JVIP/lq4TfEEGs+MAOk=;
        b=hW4gEPGhHxycEVxjse2xAilSJJtRlW/wVBSmKKQfcuSGA+PumHHkjSxSgWUvZns+5s
         JyZPxrXqnSr19gn6ZTyyeDNZXigiK86+i1et8r+rRNIBexgCFs4wV4d2ciu3YXQB3OEe
         Jl2Q13iRGXYBXWe1p5r4HwcGRmpIn8hJiE0w4=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: linux-c-programming@vger.kernel.org

Hi guys,

This is my first email in this list, any help is much appreciated.
As I know, it's not allowed to pass a local variable to a function,
because the stack where local variable resides will be reused by other
functions.
eg:
=A0=A0=A0=A0 1=A0 #include <stdio.h>
=A0=A0=A0=A0 2
=A0=A0=A0=A0 3=A0 char *fetch();
=A0=A0=A0=A0 4
=A0=A0=A0=A0 5=A0 int main(int argc, char *argv[]){
=A0=A0=A0=A0 6=A0=A0=A0=A0=A0=A0=A0=A0=A0 char *string;
=A0=A0=A0=A0 7=A0=A0=A0=A0=A0=A0=A0=A0=A0 string =3D fetch();
=A0=A0=A0=A0 8=A0=A0=A0=A0=A0=A0=A0=A0=A0 printf("%s\n", string);
=A0=A0=A0=A0 9=A0=A0=A0=A0=A0=A0=A0=A0=A0 exit(0);
=A0=A0=A0 10=A0 }
=A0=A0=A0 11
=A0=A0=A0 12=A0 char *fetch(){
=A0=A0=A0 13=A0=A0=A0=A0=A0=A0=A0=A0=A0 char string[10];
=A0=A0=A0 14 =A0=A0=A0=A0=A0=A0=A0=A0 scanf("%s", string);
=A0=A0=A0 15 =A0=A0=A0=A0=A0=A0=A0=A0 return string;
=A0=A0=A0 16=A0 }

When the application is executed, after input "a", it will produce
unknown characters, like "8=8A=E8=BF=F4=FFO". Which is like what I expe=
ct

However, if I change line 13 to:
=A0=A0=A0 13=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 char string[1024];

When I type "a", it echos "a", which is out of my expectation

Why does it behave like this?

Thanks in advance,
longapple
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
