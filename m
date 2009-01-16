From: ben <brouits@free.fr>
Subject: Re: extract the data from buffer
Date: Fri, 16 Jan 2009 18:31:23 +0100
Message-ID: <4970C46B.2010009@free.fr>
References: <1f714d50901160754m4568738ev27879b0e9ba72fab@mail.gmail.com> <200901161155.08177.jesse@eloquentpeasant.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200901161155.08177.jesse@eloquentpeasant.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org

there are also POSIX regular expressions, bundled with the libc.
$ man regcomp or man regex (same)
this is highly portable, and already in libc. those RE are the same as=20
sed's expressions (except shell escapes are not needed).

Jesse Ruffin a =E9crit :
> If you really want to use Perl style regular expressions, use libpcre=
 (www.pcre.org). It will be available in your package manager, and prob=
ably already installed. If you don't need the full functionality of a r=
egex, look into the scanf family of functions.
>=20
> Jesse Ruffin
>=20
> On Friday 16 January 2009 10:54:11 Jai Sharma wrote:
>> Hi
>>
>> I want to extract variables values from a string buffer. Can anyone
>> pleease tell me how can i do that.
>> In C how to use perl like regular expressions.
>>
>>
>> Channel              Location             State   Application(Data)
>> SIP/5078-099b4b48    s@newvcci:1          Ringing AppQueue((Outgoing=
 Line))
>> SIP/66.119.60.21-099 s@tracphone:6        Up      Queue(tracphone|||=
|3600)
>> SIP/5080-09964168    s@newvcci:1          Up      Bridged Call(SIP/6=
6.119.60.21-
>> SIP/66.119.60.21-099 s@tracphone:6        Up      Queue(tracphone|||=
|3600)
>> SIP/5079-09924998    s@newvcci:1          Up      Bridged Call(SIP/6=
6.119.60.21-
>> SIP/66.119.60.21-099 s@tracphone:6        Up      Queue(tracphone|||=
|3600)
>> SIP/5041-0993ee38    s@newvcci:1          Up      Bridged Call(SIP/6=
6.119.60.21-
>> SIP/66.119.60.21-099 s@tracphone:6        Up      Queue(tracphone|||=
|3600)
>> SIP/5010-098e7760    tsihomephoneservice@ Up      Bridged Call(SIP/6=
3.111.11.135
>> SIP/63.111.11.135-09 tsihomephoneservice@ Up      Queue(tsihomephone=
service||||9
>> 10 active channels
>> 5 of 200 max active calls ( 2.50% of capacity)
>>
>>
>> I want to extract three numeric data fields from last line:
>> as
>>
>> %d of %d max active calls ( %l% of capacity)
>> result : 5,200,2.50
>>
>> means 2.5
>>
>>
>> Thanks and Regards
>>
>> Jai
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
