From: lucianolnx <lucianolnx@ig.com.br>
Subject: ENC: Re: Check if a process exists? (EXTENDING THE QUESTION)
Date: Sat, 9 Apr 2005 10:54:40 -0300
Message-ID: <20050409_135440_094266.lucianolnx@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Message-Boundary-by-Mail-Sender-1113054880"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Message-Boundary-by-Mail-Sender-1113054880
Content-type: text/plain; charset=ISO-8859-1
Content-description: Mail message body
Content-transfer-encoding: 8bit
Content-disposition: inline

LEAVE ME TO REVIEW THE PROBLEM: 
1) How is the best and more OS resources indenpendent way to know the PID of 
a "friend" searched process ? 

2)How is the best way to check process identity, instead of only check your 
running state (kill -0) ? 

MY COMMENTS: 
I know that "/proc" is optional, because it I m asking for some ways to 
locate the PID when it isn't known, using non-optional OS resources. 

Shared memory or some kind of pipes, was a good way ? (the main problem is 
about persistent files that isn't the good way to store it, because the 
process can be killed without chance to remove its PID file, and then we can 
have a inconsistent PID file). 

Does parse "ps -e" command or using some API to simulate "ps" was a good way 
? 

AFTER KNOWING THE PID: 
Does someone kown a special way to know or authenticate the process (like a 
digital signature) instead only cheacking its running state by "kill -0". 

Luciano 


------------------------------------------------------------ 
De: "M.Baris Demiray" <baris@labristeknoloji.com> 
Para: lucianolnx<lucianolnx@ig.com.br> 
Data: Sat, 09 Apr 2005 10:24:55 +0300 
Assunto: ENC: Re: Check if a process exists? (EXTENDING THE QUESTION) 
Cc: linux-c-programming@vger.kernel.org 

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

--Message-Boundary-by-Mail-Sender-1113054880
Content-type: text/x-vcalendar; name="baris.vcf"
Content-description: Arquivo anexado pelo iGmail
Content-transfer-encoding: Base64
Content-disposition: attachment

YmVnaW46dmNhcmQNCmZuOk0uQmFyaXMgRGVtaXJheQ0KbjpEZW1pcmF5O00uQmFyaXMNCm9yZzpM
YWJyaXMgVGVrbm9sb2ppDQphZHI6T0RUVTs7VGVrbm9rZW50IFNpbGlrb24gQmxvayBObzoyNDtB
bmthcmE7OzA2NTMxO1R1cmtpeWUNCmVtYWlsO2ludGVybmV0OmJhcmlzQGxhYnJpc3Rla25vbG9q
aS5jb20NCnRpdGxlOllhemlsaW0gR2VsaXN0aXJtZSBVem1hbmkNCnRlbDt3b3JrOis5MDMxMjIx
MDE0OTANCnRlbDtmYXg6KzkwMzEyMjEwMTQ5Mg0KeC1tb3ppbGxhLWh0bWw6RkFMU0UNCnVybDpo
dHRwOi8vd3d3LmxhYnJpc3Rla25vbG9qaS5jb20NCnZlcnNpb246Mi4xDQplbmQ6dmNhcmQNCg0K

--Message-Boundary-by-Mail-Sender-1113054880--

