From: "M.Baris Demiray" <baris@labristeknoloji.com>
Subject: Re: Check if a process exists? (EXTENDING THE QUESTION)
Date: Sat, 09 Apr 2005 10:24:55 +0300
Message-ID: <42578347.5040605@labristeknoloji.com>
References: <20050409_015010_024210.lucianolnx@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000408090103080700020904"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20050409_015010_024210.lucianolnx@ig.com.br>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: lucianolnx <lucianolnx@ig.com.br>
Cc: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.
--------------000408090103080700020904
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


lucianolnx wrote:
> Today, what are the bests ways to know if a deamon is running without 
> knowing its PID ? 

I'm not sure whether this is `the best way' but you can parse some proc
file system entry. Especially /proc/$pid/cmdline and /proc/$pid/status
will be useful. And you will have to search all the /proc/$pid entries
since you don't know the pid..

For example, they provide following information for clamd.

[baris@rhinox]$ ps aux|grep clamd
clamav     424  0.0  3.1  11520  7856 ?        Ss   01:35   0:03 
/usr/sbin/clamd
clamav    1184  0.0  3.1  11520  7856 ?        S    09:38   0:00 
/usr/sbin/clamd
baris     1238  0.0  0.2   1688   712 pts/2    S+   09:58   0:00 grep clamd
[baris@rhinox]$ cat /proc/1184/cmdline
/usr/sbin/clamd
[baris@rhinox]$ cat /proc/1184/status
Name:   clamd
State:  S (sleeping)
Tgid:   1184
Pid:    1184
PPid:   424
....
....

I also should add that /proc filesystem is _optional_ in configuration.
Highly likely it will exist on a target system but a little possibility
of being it unselected still there.

> My old technique (used until now), is based on recovering the PID saved by 
> the own process in a special and known location (like a file), almost all 
> times persisted (PERSISTENCE IS A PROBLEM). 
> 
> Luciano 

-- 
"You have to understand, most of these people are not ready to be
unplugged. And many of them are no inert, so hopelessly dependent
on the system, that they will fight to protect it."
                                                         Morpheus

--------------000408090103080700020904
Content-Type: text/x-vcard; charset=utf-8;
 name="baris.vcf"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="baris.vcf"

YmVnaW46dmNhcmQNCmZuOk0uQmFyaXMgRGVtaXJheQ0KbjpEZW1pcmF5O00uQmFyaXMNCm9y
ZzpMYWJyaXMgVGVrbm9sb2ppDQphZHI6T0RUVTs7VGVrbm9rZW50IFNpbGlrb24gQmxvayBO
bzoyNDtBbmthcmE7OzA2NTMxO1R1cmtpeWUNCmVtYWlsO2ludGVybmV0OmJhcmlzQGxhYnJp
c3Rla25vbG9qaS5jb20NCnRpdGxlOllhemlsaW0gR2VsaXN0aXJtZSBVem1hbmkNCnRlbDt3
b3JrOis5MDMxMjIxMDE0OTANCnRlbDtmYXg6KzkwMzEyMjEwMTQ5Mg0KeC1tb3ppbGxhLWh0
bWw6RkFMU0UNCnVybDpodHRwOi8vd3d3LmxhYnJpc3Rla25vbG9qaS5jb20NCnZlcnNpb246
Mi4xDQplbmQ6dmNhcmQNCg0K
--------------000408090103080700020904--
