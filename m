From: Saurabh Sehgal <saurabh.r.s@gmail.com>
Subject: memory address represented as a string
Date: Sun, 26 Jul 2009 03:39:38 -0400
Message-ID: <2a46ebd60907260039g290268b7i3183ee785994b86@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=XpsUEMDNB5lLZ7+e6oNnoHvVGXUE5d3YvQDBDCdUpbs=;
        b=YVmhIAJujCS9KeE4aZxO8/8h/YYOTK43Tn/jxQH4Fn7UzJvueVhsVOsSlPhDGf1K6l
         fFcMMMWuTpEnt1bUsJggq23iu+hk2QXJeIXip3Kf5cPjwFouUE3LFVy6xht8EkTmIm/w
         FM0SloZYCJodlYEHLKdq0MhSfVZ0JDHjYkckA=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi all,

I had a quick question:

Let's say I design a function with the signature:

void * foo( char * addr ) ; ,

where addr is a string that represents a valid memory address  ...
so the way someone can call this function is ...

char * addr = "0xae456778" // assume this is a valid memory address on
the machine
foo( addr ) ;

Is it possible to take this address in string form, and assign it to
an actual pointer of void * type ?
I want the function "foo" to return a pointer pointing to the memory
location as indicated
by the string passed in.

Thank you !

Saurabh
