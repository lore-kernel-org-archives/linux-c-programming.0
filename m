From: LDB <thesource@ldb-jab.org>
Subject: Re: Testing if a file or directory exist
Date: Sun, 09 Sep 2007 11:04:58 -0400
Message-ID: <46E40B9A.4020709@master.ldb-jab.org>
References: <Pine.LNX.4.64.0709090907400.18317@diagnostix.dwd.de>	 <Pine.LNX.4.64.0709090605220.31293@localhost.localdomain> <1189333013.9615.2.camel@chimay>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <1189333013.9615.2.camel@chimay>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: 
Cc: linux-c-programming@vger.kernel.org

Agreed, by definition access() does the following:

	access() checks whether the process would be allowed to read, write or=
 test for
existence of the file (or other file system object) whose name is pathn=
ame.


LDB

Benoit Rouits wrote:
> I think, as information are not needed, even access() is better than
> stat() and also uses less memory/cpu.
> - ben
> Le dimanche 09 septembre 2007 =C3=A0 06:07 -0400, Robert P. J. Day a =
=C3=A9crit :
>> if all you want to do is check for existence, then, execution time
>> notwithstanding, you should use the method which accomplishes that a=
nd
>> nothing more, so the obvious solution would be stat().
>>
>> it would be illogical to call open() since a side-effect would be th=
at
>> you then had an open file.  in short, if you just want to test, then
>> just test.=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
