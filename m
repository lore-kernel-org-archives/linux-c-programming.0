From: Nicle <ynicle@gmail.com>
Subject: Re: How to lseek the larger file > 2GB under linux
Date: Mon, 18 May 2009 12:38:50 +0800
Message-ID: <d13fb4990905172138y2a30ed5cq412874621f605282@mail.gmail.com>
References: <d13fb4990905170840j6ac84b0ej758582e5ffb5fa8c@mail.gmail.com>
	 <d13fb4990905170842l5f700842k43db34f44ef2f829@mail.gmail.com>
	 <87tz3ju2eu.fsf@erwin.mina86.com>
	 <d13fb4990905172137l1a4a9c92k47988da28ad4b7b1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=PpYaQz7f235+iEII5YAaTBw57VUQS98HSQ0u8i8pgk4=;
        b=dznvczfAs/u9V42pWSejS7khVsB1Z8Jd7rcGmxV8dff738DU5sNFxIck0h+HEgce07
         FIzeS9v2tB4U414XmvyIByYA6td/EUytYtHNT0HYvhTU2yIyoG5kDF2Ko2auOHSL/Wmy
         UgIL9i+Ane8mEQEryZElPQbDe9KjFCcy3GqBA=
In-Reply-To: <d13fb4990905172137l1a4a9c92k47988da28ad4b7b1@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michal Nazarewicz <mina86@tlen.pl>
Cc: linux-c-programming@vger.kernel.org

Hi Michal,

The "LL" does make my prog work :)

Thanks for your help!!

Best Regard
Nicle Yang


>
>
> 2009/5/18 Michal Nazarewicz <mina86@tlen.pl>
>>
>> Nicle <ynicle@gmail.com> writes:
>> > I have a file > 2GB, and my job is seeking the file to pos: 2.1G.
>> > But, it seems that the lseek64 doesn't work.
>>
>> > #define _LARGEFILE64_SOURCE
>> > #include ...
>> >
>> > int main() {
>> > =A0int fd =3D -1;
>> > =A0long long pos =3D (long long) 2*1024*1024*1024 + 10; // over 2G
>>
>> A long shot, but try (2LL << 30) (the "LL" is important). =A0I don't
>> expect that will make it work but if you're out of ideas... ;)
>>
>> > =A0fd =3D open(FILENAME, O_WRONLY|O_LARGEFILE);
>> > =A0if (fd < 0) { /* ... */ }
>> >
>> > =A0if (lseek64(fd, pos, SEEK_SET) < 0)
>> > =A0 =A0 =A0fprintf(stderr, "Failed seeking to %lld, %s\n", pos, st=
rerror(errno));
>> >
>> > =A0return 0;
>> > }
>>
>> > =A0Then the building cmd: =A0 gcc -o test test.c -D_FILE_OFFSET_BI=
TS=3D64
>> > =A0Output: =A0 =A0 =A0 =A0 =A0 =A0> =A0 =A0 Failed seeking to 2147=
483658, Success.
>> >
>> > The return val of lseek64 =A0was "<0", but the strerror told me "S=
uccess".
>>
>> BTW. The following works fine for me:
>>
>> #v+
>> #define _LARGEFILE64_SOURCE
>>
>> #include <errno.h>
>> #include <fcntl.h>
>> #include <stdio.h>
>> #include <string.h>
>> #include <sys/stat.h>
>> #include <sys/types.h>
>> #include <unistd.h>
>>
>> #define RUN(expr) if ((expr) < 0) { perror(#expr); return 1; } else =
(void)0
>>
>> int main(void) {
>> =A0 =A0 =A0 =A0const long long pos =3D (2LL << 30) + 10;
>> =A0 =A0 =A0 =A0int fd;
>>
>> =A0 =A0 =A0 =A0RUN(fd =3D open("deleteme", O_WRONLY | O_LARGEFILE | =
O_CREAT, 0600));
>> =A0 =A0 =A0 =A0RUN(lseek64(fd, pos, SEEK_SET));
>> =A0 =A0 =A0 =A0RUN(write(fd, "a", 1));
>> =A0 =A0 =A0 =A0return 0;
>> }
>> #v-
>>
>> --
>> Best regards, =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 _ =A0 =A0 _
>> =A0.o. | Liege of Serenly Enlightened Majesty of =A0 =A0 =A0o' \,=3D=
=2E/ `o
>> =A0..o | Computer Science, =A0Michal "mina86" Nazarewicz =A0 (o o)
>> =A0ooo +--<mina86*tlen.pl>--<jid:mina86*jabber.org>--ooO--(_)--Ooo--
>
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
