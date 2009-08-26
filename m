From: Randi Botse <nightdecoder@gmail.com>
Subject: Help on bit operation
Date: Thu, 27 Aug 2009 06:02:19 +0700
Message-ID: <34e1241d0908261602k4d07d422o7ea69b606210701a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=6NDj1FmITgOLymeQbbPGybAtO1jaZ2R9v6W8VQkMMuo=;
        b=j3cI5H4jTd1mj6CzNceYs1H1qhuLKMfVE52xVumHmNqZUG/+VBrPNzIwg3ZCDmR3bV
         PXdKKzx7qYKr9Fo9Kr+XFjTi3xo32xpjHCIab1uzmQgM6hcodvykvAj5EmaKSrZlSoRN
         lKks6VgFRD9siiqG6O0M/wgW3QaKl3+MjTbt4=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Hi, I'm beginner C programmer, i have a problem, i want to store some
information in a integer, a integer will be 32 bit on my machine, i
want to have as follow:

6 bit (information 1) =A0 MSB
4 bit (information 2)
8 bit (information 3)
5 bit (information 4)
9 bit (information 5)   LSB

=46or example i set the informations as follow (in decimal):

information 1 =3D 43        or 101011
information 2 =3D 11        or 1011
information 3 =3D 120      or 1111000
information 3 =3D 30        or 11110
information 4 =3D 418      or 110100010

if i join all informations i should get a 32 bit integer valued
2935782212 or 01010111011111100011110110100010, then my problem is how
to retrieve these informations on bit operation? i want to know what's
the value of information-2 or information-3, etc directly.  And, is
there any good way to join these informations to be an 32 bit integer?

at this time i convert the 32bit integer into binary string, process
it's with array segment to get all informations then convert them to
integer,
to build the 32bit integer, i join all information value into binary
string (yes, 32 bit of char ;p) join all of them then convert to
integer.

I know my way is sucks and too far away from COOL thing ;p,  i think
there are cool way to do this!.

Thanks before!
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
