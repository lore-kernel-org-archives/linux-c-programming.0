From: leo mueller <llug.dan@googlemail.com>
Subject: mmap() returns with -EINVAL
Date: Thu, 30 Jul 2009 15:19:05 +0200
Message-ID: <c93f91ee0907300619q2dc38f49q1092b363ed28687@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=0016e64be264df686d046fec258f
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=s2q5LOblFhHsrtMTZDI+x3T060wZjPGAuaO7sHkfCrM=;
        b=gctpnLpPZrNVmc87oB9F5KcjVZ0lYrLgUIE+o36RkqlE5xTGicrJZ/PKCevy/WgPjF
         vg2F2RI9g0Up/xVprPAsZPEwg/voG4/N3o1m9li+iJ3J7aLWkoa1IUh8AucuDbpz+ALu
         /XtisEEg0XeEpsurhP2DDVyFd6AEo1L7ahCeU=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

--0016e64be264df686d046fec258f
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

hi all,

in my attached code snippet i try to mmap the incoming socket data
accoring to the kernel documentation
which can also be found online:
http://lxr.linux.no/linux+v2.6.30/Documentation/networking/packet_mmap.txt

by doing a mmap() my program exits with -EINVAL and up to now i have
no clue why... parametes should be right.

do you have any idea?

big thanks,
daniel

--0016e64be264df686d046fec258f
Content-Type: text/plain; charset=US-ASCII; name="err.txt"
Content-Disposition: attachment; filename="err.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fxrig4vu0

dHlwZWRlZiB1bnNpZ25lZCBjaGFyICpyaW5nX2J1ZmZfdDsKClsuLi5dCgpyaW5nX2J1ZmZfdCBj
cmVhdGVfdmlydF9yaW5nKGludCBzb2NrKQp7CiAgICBpbnQgcmV0OwogICAgcmluZ19idWZmX3Qg
cmI7CiAgICBzdHJ1Y3QgdHBhY2tldF9yZXEgcmVxOwoKICAgIG1lbXNldCgmcmVxLCAwLCBzaXpl
b2YocmVxKSk7CgogICAgZGJnKCJwYWdlc2l6ZTogJWRcbiIsIGdldHBhZ2VzaXplKCkpOwoKICAg
IHJlcS50cF9ibG9ja19zaXplID0gZ2V0cGFnZXNpemUoKTsKICAgIHJlcS50cF9mcmFtZV9zaXpl
ID0gVFBfUlhfRlJBTUVfU0laOwogICAgcmVxLnRwX2Jsb2NrX25yID0gVFBfUlhfQkxPQ0tTOwog
ICAgcmVxLnRwX2ZyYW1lX25yID0gcmVxLnRwX2Jsb2NrX3NpemUgLyByZXEudHBfZnJhbWVfc2l6
ZSAqIHJlcS50cF9ibG9ja19ucjsKCiAgICByZXQgPSBzZXRzb2Nrb3B0KHNvY2ssIFNPTF9TT0NL
RVQsIFBBQ0tFVF9SWF9SSU5HLCAodm9pZCAqKSAmcmVxLCBzaXplb2YocmVxKSk7CiAgICBpZihy
ZXQgPCAwKXsKICAgICAgICBlcnIoInNldHNvY2tvcHQ6IGNyZWF0aW9uIG9mIHJ4IHJpbmcgZmFp
bGVkOiAlZCAtICIsIGVycm5vKTsKICAgICAgICBwZXJyb3IoIiIpOwogICAgICAgIGdvdG8gX291
dF9lcnI7CiAgICB9CgogICAgcmIgPSBtbWFwKDAsIChzaXplX3QpIHJlcS50cF9ibG9ja19uciAq
IHJlcS50cF9ibG9ja19zaXplLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLCBNQVBfU0hBUkVELCBz
b2NrLCAwKTsKICAgIGlmKHJiID09IE1BUF9GQUlMRUQpewogICAgICAgIGVycigibW1hcDogY2Fu
bm90IG1tYXAgdGhlIHJ4IHJpbmc6ICVkIC0gIiwgZXJybm8pOwogICAgICAgIHBlcnJvcigiIik7
CiAgICAgICAgZ290byBfb3V0X21tYXA7CiAgICB9CgogICAgZGJnKCJrZXJuZWwgcmluZ2J1ZmYg
YWxsb2NhdGVkXG4iKTsKCiAgICByZXR1cm4gcmI7Cgpfb3V0X21tYXA6CiAgICBkZXN0cm95X3Zp
cnRfcmluZyhzb2NrLCByYik7Cl9vdXRfZXJyOgogICAgY2xvc2Uoc29jayk7CiAgICBleGl0KDEp
Owp9CgpbLi4uXQoKdm9pZCBkZXN0cm95X3ZpcnRfcmluZyhpbnQgc29jaywgcmluZ19idWZmX3Qg
cmIpCnsKICAgIGludCByZXQ7CiAgICBzdHJ1Y3QgdHBhY2tldF9yZXEgcmVxOwoKICAgIG1lbXNl
dCgmcmVxLCAwLCBzaXplb2YocmVxKSk7CiAgICByZXQgPSBzZXRzb2Nrb3B0KHNvY2ssIFNPTF9Q
QUNLRVQsIFBBQ0tFVF9SWF9SSU5HLCAodm9pZCAqKSAmcmVxLCBzaXplb2YocmVxKSk7CiAgICBp
ZihyZXQgPCAwKXsKICAgICAgICBlcnIoInNldHNvY2tvcHQ6IGRlc3RydWN0aW9uIG9mIHJ4IHJp
bmcgZmFpbGVkOiAlZCAtICIsIGVycm5vKTsKICAgICAgICBwZXJyb3IoIiIpOwogICAgfQoKCWlm
KHJiKXsKICAgICAgICBtdW5tYXAocmIsIFRQX1JYX0JMT0NLUyAqIGdldHBhZ2VzaXplKCkpOwog
ICAgICAgIHJiID0gMDsKICAgIH0KICAgIAogICAgZGJnKCJrZXJuZWwgcmluZ2J1ZmYgZGVhbGxv
Y2F0ZWRcbiIpOwp9CgoK
--0016e64be264df686d046fec258f--
