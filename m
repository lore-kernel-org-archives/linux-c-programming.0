From: Llfrg@aol.com
Subject: Re: Problem with the /proc filesystem
Date: Wed, 17 Mar 2004 14:16:19 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <00CBF511.1BEE7B5E.0000FADF@aol.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: florian.zimmermann@gmx.net
Cc: linux-c-programming@vger.kernel.org

Yes, I see the same behavior using watch. Does anyone else confirms tha=
t bug? It seems to happen when idle time is zero, or close to zero, try=
 running a "cpu consuming" process and 'watch'. I'll have my program to=
 consider cpu idle time equals to 0 on that case.

I am using:
Linux version 2.4.18-24.7.x (bhcompile@sylvester.devel.redhat.com) (gcc=
 version 2.96 20000731 (Red Hat Linux 7.3 2.96-112)) #1 Fri Jan 31 07:0=
6:03 EST 2003

Thanks.
Leonardo

Em um e-mail de Qua, 17 Mar 2004 1:57:21 PM Hora Padr=E3o da Costa Lest=
e, Florian Zimmermann <florian.zimmermann@gmx.net> escreveu:

>you can test the same by using 'watch', e.g.
># watch -n1 cat /proc/stat
>
>if the errors occurs as well with 'watch' it is likely
>that the proc kernel interface is buggy.
>otherwise you should post your own code here to analyse=20
>whats wrong.
>
>Florian
>
>On Wed, 2004-03-17 at 19:02, Llfrg@aol.com wrote:
>> Hello,
>>=20
>> I am reading the first line of /proc/stat once per second. Sometimes=
 a bug seems to occur, which is the value of the cpu idle time become l=
ower than the cpu idle time collected one second earlier. Does anyone k=
now what may be happening? Below is the output of my program. Idle mean=
s the last cpu idle time read from /proc/stat and old_id is the previou=
s cpu idle time read.
>>=20
>> Thanks
>>=20
>> ###Program output:
>>=20
>> Idle: 210097666 old_id: 210097666
>> user: 100 nice: 0 system: 3 idle: 0 total: 103
>> =20
>> Idle: 210097666 old_id: 210097666
>> user: 101 nice: 0 system: 2 idle: 0 total: 103
>> =20
>> Idle: 210097666 old_id: 210097666
>> user: 78 nice: 0 system: 25 idle: 0 total: 103
>> =20
>> Idle: 210097667 old_id: 210097666
>> user: 97 nice: 0 system: 6 idle: 1 total: 104
>> =20
>> Idle: 210097666 old_id: 210097667
>> user: 102 nice: 0 system: 2 idle: 4294967295 total: 103
>> BUUUUG
>> =20
>> Idle: 210097666 old_id: 210097666
>> user: 101 nice: 0 system: 2 idle: 0 total: 103
>> =20
>> Idle: 210097667 old_id: 210097666
>> user: 101 nice: 0 system: 2 idle: 1 total: 104
>> =20
>> Idle: 210097666 old_id: 210097667
>> user: 101 nice: 0 system: 3 idle: 4294967295 total: 103
>> BUUUUG
>> -
>> To unsubscribe from this list: send the line "unsubscribe linux-c-pr=
ogramming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
