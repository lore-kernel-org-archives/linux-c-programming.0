From: Akos Marton <makos999@gmail.com>
Subject: Re: time system call expensive?
Date: Thu, 21 Jul 2011 13:46:17 +0200
Message-ID: <4E281189.8010904@gmail.com>
References: <CA+NBAy6499cgdzwGuPk6h+Y3D-DxEHP2HEKjtNAgis7K4RTKig@mail.gmail.com> <op.vyyu34nf3l0zgt@mnazarewicz-glaptop>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060107020008070208030404"
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:disposition-notification-to:date:from:user-agent
         :mime-version:to:cc:subject:references:in-reply-to
         :x-enigmail-version:content-type;
        bh=3GKkmkEZXyPE0JSLefPoRUzD9kBJuzpM10N1dOMW5+8=;
        b=DkCpCNbG2S3hnngDUFUaRkUom5nn00GaY0W9vS2advObgmkBlzlU1Kpa5jj3l/i2vj
         /qCmLrgc0wYulYDZsF6hT4ysN/yRIFG9/rxwGWbxq7tpszLbOX7iRRrsimiV5Us0VXIe
         p9sN961gqRgKbgHZXVgKO4UL0l/NCH02lFJZo=
In-Reply-To: <op.vyyu34nf3l0zgt@mnazarewicz-glaptop>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: Michal Nazarewicz <mina86@mina86.com>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

This is a multi-part message in MIME format.
--------------060107020008070208030404
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I advice you `man 3 clock`.
If you want to get much more precision the attached project can help you.
Does it help?

Regards,
mAkos


Michal Nazarewicz wrote:
> On Thu, 21 Jul 2011 06:41:14 +0200, Vadiraj <vadiraj.cs@gmail.com> wrote:
>> I'm evaluating time consumed by method. I'm using time(NULL) system
>> call to capture time before and after the call to the function.
>> Just wanted to know if this has a considerable performance hit? For
>> all I believe time syscall is quite optimized and should not really be
>> matter of concern.
>>
>> Please let me know if someone have evaluated time(NULL) system over head..
>>
>> Assuming the method I'm evaluating is a frequently called method.
> 
> Why do you worry about it?  What do you need the time for?  If are
> really using time(2) it means that the function you're calling run time
> is counted in seconds.  If that's the case, two call to time(2) are
> by all means negligible.
> 
> If you need in for benchmark, you would probably do something like:
> 
> start = time(NULL)
> for (vary big number)
>     call function you benchmark
> end = time(NULL)
> 
> In either case, you should check gettimeofday(2).
> 


--------------060107020008070208030404
Content-Type: application/octet-stream;
 name="timing.tar.bz2"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="timing.tar.bz2"

QlpoOTFBWSZTWUXZikUAAW//hMy4AIBef/+ff//e1P/v/2oAAIAIUARe4zsrp2Ns07bsIZFG
QjSbSbJoTJppo9Q0HqGgyBpoAyA0ANNSFPT0aNU9NJhGagAeoZGIGIBkNNNNDIBIkEEyNApt
U/VPSfqj/VTyIPKHqMjRoep6gAADyhxkyaNAaNMRkaGIYE0aYgxGgwgAMEkUJ6AKm0wp7U9J
6poABoyPUBk9QGnqbSaaeoeptOkTQ6OZvrmLbxl+hQlZkA04hCv7F/A5HKKwUgvKC1kvYndY
FrGC8QmkKAXPhvbaD4/l65IzpAhtMab7u8/Hv91v7TBdT/hUJ0UUgbGUijt7NlLv0z/mZj5R
6r9HR8XSU9RkMu0twjjpn05KVNBugqnUdAoEwA4BPnBoiV+Nq+uZWfK22q9fdlq5zZwe8GgB
uIs1IszZ5G2ppcgdHQyhLqVbQEyCPLbsoopHIrl36Ss5i5Io6jj2nNU0rD1AT7E07XaSnVOR
VS6s6qoWGFkLH32sU8KCCJZnHTu09ZZ5TwkuY9xJzUShDaKAw5ZrDmlETRyeeulI9KSuKxDC
JbTlb2POrzhXV0vsZyuIvy/zqhcDz2YMJBRcG2kgj36MVI8QcSAJTIBKJRbf8LAjrvlqBR7X
ID0YGPwSssymcLdwdt+NzKTrHcJtlA+YWIg3HUzgg16/v+PVv5xBAWQTicWIW9HbVY9ZxEqU
wtIoL2dzgTFSt/oKJMhiwkQW7trsPsreKWJOd982FbihEI0m8lUDC0VgovNQN6KE3QUzOaxe
n5rleo6IyuIiS+9GkCCmkWGw4GoyfCIQYUPCiBP3+9Bj5ZvyHl4g7QelLj6Lk9cIM2gd5FAM
Bg1GswqBSTi9uwwJcIR9JQbOrZ+5ZBokuoNIbnk5lNsFsR7g3SIqiISBMRhmxs0lovhU6RdH
bCCksLi7VMOYijOWB49v3FkKIezKUxatXbxW3gbbZhxFlXzIbhthAUKyVyZBLEgolsgkIjNI
KVxnj1ni8jcpphYQZ8cEF4wrNNskGp96B1op0bWs+lphFKTy1z88Q7gDVnCozj4EEvZKJaNT
ocYyvuki56SPvDoxNZvFOVJSYeU4t2kwmMljFRh0WTsHwkvAZZ2PENPN29avxelOrfAnL8+Y
MjMO6c0jDkVzEuJkrWTRjgEYyeQzofx1azrVsNUllRkDJaWY1PM7ooAV+0lUhUWYVKWUCBrJ
pA4QWvpKUDcD0sEsgAiEe4zUSVCTLgosnwJSNeK4XXLCuuvkFcTaQrBVIgGSiF4ioTlw7ojG
SRa7DiGO/XWYXZqDOluNNT4KED4S2+DYLboLHwWSgVjCS6UF7nicsq0gVrmvdXRYVrqomYNG
zZ6efPoftyG5l8GdvtZWmie2XIg7xOgGSrkLZxPZ8lEBVQO/nAg6ZC37M8ok5Y81NEhYW4Lh
inp0HF+N1FakZX2zW2eBjaStX0NcklSlGbyV1y0A7dW9b1daWGJLwFLZJawrCPVjqlqdznQD
+4I2iQf8XckU4UJBF2YpFA==
--------------060107020008070208030404--
