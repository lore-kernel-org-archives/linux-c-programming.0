From: Aniruddha Bhattacharyya <aniruddha.aot@gmail.com>
Subject: Fwd: message queue for two processes.
Date: Sat, 14 May 2011 22:00:58 +0530
Message-ID: <BANLkTimATKw7to=-YWKco0tVuErZpQZEzg@mail.gmail.com>
References: <BANLkTi=qk90bwxyG-_CKpqpfzz-Y5PMXMQ@mail.gmail.com> <BANLkTimt9L4ZUS2--Cp7D5u+L6V6ZyjcbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:content-type:content-transfer-encoding;
        bh=y1cduvSTD1GwdDz3U3oPzYHdhxUZXdQ2emU5gWPBe3E=;
        b=fZJqEL1AmVM2/hnL2VgqML7ODiGsCuoo8aiZtZ6b5DXZRzWcvxn85AMjqaS/N5Tei1
         WmK++pPRWta2WIW7fHYyblikTEnsIN5iSZXR1vqD4GuHexbVGYDSKBH3nd5zdMPGTtvC
         u3xpgyOd3rcLo0eyrCCFQTs9nacVcBO7oCBUY=
In-Reply-To: <BANLkTimt9L4ZUS2--Cp7D5u+L6V6ZyjcbQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

---------- Forwarded message ----------
=46rom: Aniruddha Bhattacharyya <aniruddha.aot@gmail.com>
Date: Sat, May 14, 2011 at 9:51 PM
Subject: Re: message queue for two processes.
To: ratheesh kannoth <ratheesh.ksz@gmail.com>,
linux-c-programming@vger.kernel.org


each MQ has a TYPE variable (long int).
struct my_MQ{
long int my_mq_type;
char data[512];
};

You can select a particular message by the TYPE argument in msgget().

Say, for x, type =3D=3D 2 and for y type =3D=3D 3.




On Sat, May 14, 2011 at 9:10 PM, ratheesh kannoth
<ratheesh.ksz@gmail.com> wrote:
>
> There is a server (say A ) and two clients ( say =A0x and y ). These =
are
> communicating thru message queue mechansim. =A0They are using same
> message queue and different id to communicate.
> i read like =A0-when a message is read , this will be removed from
> message queue. Then, how can process x can read =A0only its intended
> messages ?
>
>
> -Ratheesh
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
