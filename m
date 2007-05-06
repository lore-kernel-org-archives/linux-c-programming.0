From: "Shahbaz Khan" <shaz.linux@gmail.com>
Subject: lxr problem - newbie needs help
Date: Mon, 7 May 2007 00:06:11 +0500
Message-ID: <20cbb9450705061206h767285f6n339dd4e0d7ce9658@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_71869_32970646.1178478371395"
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type;
        b=KDLMtKBpiOFbE1eyheagwChos2KnVllJEtGBvUGMavYwF4O0E4WDiObPEChUdWQotQNF0YtWrGgPOmsoX1Gx6cUwRDQkha+fdUSN4jeRgGK5dlucRvWGwGNqQi+L5JcgoXDbjyLtCcxJmZfD0tQDbf5cgq+Pu136BLGSpEiAXXQ=
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

------=_Part_71869_32970646.1178478371395
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I am using Fedora core 6. I have configured lxr 0.3 with the latest
glimpse but I get the following in the browser:

-> Parent Directory
 -  fileidx
 -  xref

when i click the files it gives me some wierd source code with lots of
funny faces like ones in the ascii command line screens (if that makes
sense at all!).

lxr installprefix is /var/www/lxr/
My document root for apache is /var/www/
attached is my lxr configuration.

------=_Part_71869_32970646.1178478371395
Content-Type: application/octet-stream; name="lxr.conf"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="lxr.conf"
X-Attachment-Id: f_f1dvtsjv

IyBDb25maWd1cmF0aW9uIGZpbGUuCgojIERlZmluZSB0eXBlZCB2YXJpYWJsZSAidiIsIHJlYWQg
dmFsdWVzZXQgZnJvbSBmaWxlLgp2YXJpYWJsZTogdiwgVmVyc2lvbiwgWy92YXIvd3d3L2x4ci9z
b3VyY2UvdmVyc2lvbnNdLCBbL3Zhci93d3cvbHhyL3NvdXJjZS9kZWZ2ZXJzaW9uXQoKIyBEZWZp
bmUgdHlwZWQgdmFyaWFibGUgImEiLiAgRmlyc3QgdmFsdWUgaXMgZGVmYXVsdC4KdmFyaWFibGU6
IGEsIEFyY2hpdGVjdHVyZSwgKGkzODYsIGFscGhhLCBtNjhrLCBtaXBzLCBwcGMsIHNwYXJjLCBz
cGFyYzY0KQoKIyBEZWZpbmUgdGhlIGJhc2UgdXJsIGZvciB0aGUgTFhSIGZpbGVzLgpiYXNldXJs
OiBodHRwOi8vMTI3LjAuMC4xL2x4ci9odHRwLwoKIyBUaGVzZSBhcmUgdGhlIHRlbXBsYXRlcyBm
b3IgdGhlIEhUTUwgaGVhZGluZywgZGlyZWN0b3J5IGxpc3RpbmcgYW5kCiMgZm9vdGVyLCByZXNw
ZWN0aXZlbHkuCmh0bWxoZWFkOiAvdmFyL3d3dy9seHIvaHR0cC90ZW1wbGF0ZS1oZWFkCmh0bWx0
YWlsOiAvdmFyL3d3dy9seHIvaHR0cC90ZW1wbGF0ZS10YWlsCmh0bWxkaXI6ICAvdmFyL3d3dy9s
eHIvaHR0cC90ZW1wbGF0ZS1kaXIKCiMgVGhlIHNvdXJjZSBpcyBoZXJlLgpzb3VyY2Vyb290OiAv
dmFyL3d3dy9seHIvc291cmNlLyR2L2xpbnV4LwpzcmNyb290bmFtZTogTGludXgKCiMgIiNpbmNs
dWRlIDxmb28uaD4iIGlzIG1hcHBlZCB0byB0aGlzIGRpcmVjdG9yeSAoaW4gdGhlIExYUiBzb3Vy
Y2UKIyB0cmVlKQppbmNwcmVmaXg6IC9pbmNsdWRlCgojIFRoZSBkYXRhYmFzZSBmaWxlcyBnbyBo
ZXJlLgpkYmRpcjogL3Zhci93d3cvbHhyL3NvdXJjZS8kdi8KCiMgR2xpbXBzZSBjYW4gYmUgZm91
bmQgaGVyZS4KZ2xpbXBzZWJpbjogL3Vzci9sb2NhbC9iaW4vZ2xpbXBzZQoKIyBUaGUgcG93ZXIg
b2YgcmVnZXhwcy4gIFRoaXMgaXMgcHJldHR5IExpbnV4LXNwZWNpZmljLCBidXQgcXVpdGUKIyB1
c2VmdWwuICBUaW5rZXIgd2l0aCBpdCBhbmQgc2VlIHdoYXQgaXQgZG9lcy4gIChIb3cncyB0aGF0
IGZvcgojIGRvY3VtZW50YXRpb24/KQptYXA6IC9pbmNsdWRlL2FzbVteXC9dKi8gL2luY2x1ZGUv
YXNtLSRhLwptYXA6IC9hcmNoL1teXC9dKy8gL2FyY2gvJGEvCgo=
------=_Part_71869_32970646.1178478371395--
