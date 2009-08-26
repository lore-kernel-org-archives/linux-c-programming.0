From: Ben Rosenberg <scdlbx@gmail.com>
Subject: Re: Help on bit operation
Date: Wed, 26 Aug 2009 16:45:22 -0700
Message-ID: <ca4725240908261645xff91d02nfa52ae22a5190c17@mail.gmail.com>
References: <34e1241d0908261602k4d07d422o7ea69b606210701a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=o5gVDlx/uTmzGMezjB1jhovuG3x1HQmBRaUy9ww12Oo=;
        b=bWoZhCyZqY9QKpHe5/pkM0gVHC2kZ6ZceAftZmq+TsV44AqugkFEM9blKnIQ1wjTZ1
         7W8t6t/8A6FriWa1JRFjHu1SAZXpouv/tS1Z/rixhcg0jErR1cX9U68CszUsmeqQei3o
         nobEMMvedMKxnhN1xPzmQiy1W2MUUkmD42sP0=
In-Reply-To: <34e1241d0908261602k4d07d422o7ea69b606210701a@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Randi Botse <nightdecoder@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On Wed, Aug 26, 2009 at 4:02 PM, Randi Botse<nightdecoder@gmail.com> wr=
ote:
> Hi, I'm beginner C programmer, i have a problem, i want to store some
> information in a integer, a integer will be 32 bit on my machine, i
> want to have as follow:
>
> 6 bit (information 1) =A0 MSB
> 4 bit (information 2)
> 8 bit (information 3)
> 5 bit (information 4)
> 9 bit (information 5) =A0 LSB
>
> For example i set the informations as follow (in decimal):
>
> information 1 =3D 43 =A0 =A0 =A0 =A0or 101011
> information 2 =3D 11 =A0 =A0 =A0 =A0or 1011
> information 3 =3D 120 =A0 =A0 =A0or 1111000
> information 3 =3D 30 =A0 =A0 =A0 =A0or 11110
> information 4 =3D 418 =A0 =A0 =A0or 110100010
>
> if i join all informations i should get a 32 bit integer valued
> 2935782212 or 01010111011111100011110110100010, then my problem is ho=
w
> to retrieve these informations on bit operation? i want to know what'=
s
> the value of information-2 or information-3, etc directly. =A0And, is
> there any good way to join these informations to be an 32 bit integer=
?
>
> at this time i convert the 32bit integer into binary string, process
> it's with array segment to get all informations then convert them to
> integer,
> to build the 32bit integer, i join all information value into binary
> string (yes, 32 bit of char ;p) join all of them then convert to
> integer.
>
> I know my way is sucks and too far away from COOL thing ;p, =A0i thin=
k
> there are cool way to do this!.
>
> Thanks before!
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

A quick, dirty way of doing it without structs:

#include <stdio.h>

void store_in_int( unsigned int *target, unsigned int offset, size_t
field_sz, unsigned int value ) {
    unsigned int mask =3D ((1<<(field_sz))-1)<<offset;
    /* Clear field */
    *target |=3D mask;
    *target ^=3D mask;
    /* Load field */
    *target |=3D value<<offset;
}

unsigned int retrieve_from_int( unsigned int target, unsigned int
offset, size_t field_sz ) {
    unsigned int mask =3D ((1<<(field_sz))-1);
    return (target>>offset)&mask;
}

int main ( void ) {
    unsigned int info=3D0;
    store_in_int(&info, 0, 6, 43);
    store_in_int(&info, 6, 4, 11);
    store_in_int(&info,10, 8,120);
    store_in_int(&info,18, 5, 30);
    store_in_int(&info,23, 9,418);
    printf("info1: %u\n",retrieve_from_int( info, 0, 6 ));
    printf("info2: %u\n",retrieve_from_int( info, 6, 4 ));
    printf("info3: %u\n",retrieve_from_int( info,10, 8 ));
    printf("info4: %u\n",retrieve_from_int( info,18, 5 ));
    printf("info5: %u\n",retrieve_from_int( info,23, 9 ));
    return 0;
}
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
