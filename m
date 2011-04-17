From: Mahavir Jain <mjainp@gmail.com>
Subject: Re: close() on tcp socket.
Date: Sun, 17 Apr 2011 17:56:15 +0530
Message-ID: <BANLkTimLKZ-gESGq20Rz+nfVDBKpcxmTew@mail.gmail.com>
References: <BANLkTimLJ4k1KzmzHkz10JvL9HTyb0y+WQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:from
         :date:x-google-sender-auth:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=d9PfgoYtCnKZZIyUKJvN6wlMhAMBcbvWRd1gpCMoG5o=;
        b=bLiRzieNbqICxIg3S95cTbTDnLiDzDxjSpzah8FcOINpxwO5PxQ93P+a+nnwXNJlvd
         FrWu0oW5X76sIHfG0arqjAIjV7xk4qxv+iyXQ6zubY+/mdWvlec9WdquYYgOI1dAwwtN
         NO0OdREg9hjM5w+RUDzbABezJ8mTD2rXxNEyc=
In-Reply-To: <BANLkTimLJ4k1KzmzHkz10JvL9HTyb0y+WQ@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Hi Ratheesh,

On Wed, Apr 6, 2011 at 4:30 PM, ratheesh kannoth <ratheesh.ksz@gmail.co=
m> wrote:
> connect() system call establishes a connection as shown in below step=
s.
>
> 1. =A0 |client | =A0----------------- syn ---------------> =A0| serve=
r |
>
> 2. =A0|Server| =A0--------------syn+ ack --------------> | client |
>
> 3. =A0| Client | -----------------ack --------------------> | Server =
|
>
>
> But establishing connection , client calls close() system call. Clien=
t
> is sending FIN+ ACK to server =A0[ i expected only FIN to be sent fro=
m
> client to server ]
>

Above sequence is correct.

See Q2.7 in following link for more details,
http://www.faqs.org/faqs/unix-faq/socket/

--=20
Thanks,
Mahavir
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
