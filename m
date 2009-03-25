From: Bert Wesarg <bert.wesarg@googlemail.com>
Subject: Re: pass a local variable to a function
Date: Wed, 25 Mar 2009 19:50:26 +0100
Message-ID: <36ca99e90903251150n4508993dvfc1f74c8f1a37d25@mail.gmail.com>
References: <56b13acf0903250921w1934942bma7280055c97a9db3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: base64
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=9a4bf/fquLMLMRJh10En27yw8wmUwwLZDZf3fFlifSg=;
        b=vCDaKVCFn04qM9XBiCD0OvbkoDWup1oyjzOzdu0thQsWAW7K6K0vV8TYxKd5N1i/xh
         xnQuudo6CJjQCB5ZJQgkGmLdAYjgyL/4aQPmTkvcHpU+rwGxOhVLxNEA7ZYKnu6dkcN2
         03y/iZnznjHr55uVDnOb8YrNc5xDATxASCwbE=
In-Reply-To: <56b13acf0903250921w1934942bma7280055c97a9db3@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?5piO5Lqu?= <longapple@gmail.com>
Cc: linux-c-programming@vger.kernel.org

T24gV2VkLCBNYXIgMjUsIDIwMDkgYXQgMTc6MjEsIOaYjuS6riA8bG9uZ2FwcGxlQGdtYWlsLmNv
bT4gd3JvdGU6Cj4gSGkgZ3V5cywKPgo+IFRoaXMgaXMgbXkgZmlyc3QgZW1haWwgaW4gdGhpcyBs
aXN0LCBhbnkgaGVscCBpcyBtdWNoIGFwcHJlY2lhdGVkLgo+IEFzIEkga25vdywgaXQncyBub3Qg
YWxsb3dlZCB0byBwYXNzIGEgbG9jYWwgdmFyaWFibGUgdG8gYSBmdW5jdGlvbiwKPiBiZWNhdXNl
IHRoZSBzdGFjayB3aGVyZSBsb2NhbCB2YXJpYWJsZSByZXNpZGVzIHdpbGwgYmUgcmV1c2VkIGJ5
IG90aGVyCj4gZnVuY3Rpb25zLgo+IGVnOgo+IMKgwqDCoMKgIDHCoCAjaW5jbHVkZSA8c3RkaW8u
aD4KPiDCoMKgwqDCoCAyCj4gwqDCoMKgwqAgM8KgIGNoYXIgKmZldGNoKCk7Cj4gwqDCoMKgwqAg
NAo+IMKgwqDCoMKgIDXCoCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKXsKPiDCoMKg
wqDCoCA2wqDCoMKgwqDCoMKgwqDCoMKgIGNoYXIgKnN0cmluZzsKPiDCoMKgwqDCoCA3wqDCoMKg
wqDCoMKgwqDCoMKgIHN0cmluZyA9IGZldGNoKCk7Cj4gwqDCoMKgwqAgOMKgwqDCoMKgwqDCoMKg
wqDCoCBwcmludGYoIiVzXG4iLCBzdHJpbmcpOwo+IMKgwqDCoMKgIDnCoMKgwqDCoMKgwqDCoMKg
wqAgZXhpdCgwKTsKPiDCoMKgwqAgMTDCoCB9Cj4gwqDCoMKgIDExCj4gwqDCoMKgIDEywqAgY2hh
ciAqZmV0Y2goKXsKPiDCoMKgwqAgMTPCoMKgwqDCoMKgwqDCoMKgwqAgY2hhciBzdHJpbmdbMTBd
Owo+IMKgwqDCoCAxNCDCoMKgwqDCoMKgwqDCoMKgIHNjYW5mKCIlcyIsIHN0cmluZyk7Cj4gwqDC
oMKgIDE1IMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHN0cmluZzsKPiDCoMKgwqAgMTbCoCB9Cj4K
PiBXaGVuIHRoZSBhcHBsaWNhdGlvbiBpcyBleGVjdXRlZCwgYWZ0ZXIgaW5wdXQgImEiLCBpdCB3
aWxsIHByb2R1Y2UKPiB1bmtub3duIGNoYXJhY3RlcnMsIGxpa2UgIjjFoMOowr/DtMO/TyIuIFdo
aWNoIGlzIGxpa2Ugd2hhdCBJIGV4cGVjdAo+Cj4gSG93ZXZlciwgaWYgSSBjaGFuZ2UgbGluZSAx
MyB0bzoKPiDCoMKgwqAgMTPCoMKgwqDCoMKgwqDCoMKgwqDCoCBjaGFyIHN0cmluZ1sxMDI0XTsK
Pgo+IFdoZW4gSSB0eXBlICJhIiwgaXQgZWNob3MgImEiLCB3aGljaCBpcyBvdXQgb2YgbXkgZXhw
ZWN0YXRpb24KPgo+IFdoeSBkb2VzIGl0IGJlaGF2ZSBsaWtlIHRoaXM/ClRoYXQgaXMgaXJyZWxl
dmFudC4gV2hhdCB5b3UgdHJ5IHRvIGRvIGlzICd1bmRlZmluZWQgYmVoYXZpb3InLCBzbyB5b3UK
c2hvdWxkIGhhdmUgbm8gZXhwZWN0YXRpb25zLCB3aGV0aGVyIGl0IHdvcmtzIGZvciB5b3Ugb3Ig
bm90LgoKQmVydAo+Cj4gVGhhbmtzIGluIGFkdmFuY2UsCj4gbG9uZ2FwcGxlCg==
