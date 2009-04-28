From: leo mueller <llug.dan@googlemail.com>
Subject: Re: problems with free()
Date: Tue, 28 Apr 2009 14:52:09 +0200
Message-ID: <c93f91ee0904280552u12f4ba4ey5eca1ac0fccbc07d@mail.gmail.com>
References: <c93f91ee0904280218o2f844cd0u2262db407ca8f468@mail.gmail.com>
	 <c93f91ee0904280220x663ff91fibeca0886af04458f@mail.gmail.com>
	 <36ca99e90904280422u243af682qe2ea0efc4b6a4984@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=0wtBaNjgRC02r4vt/MWBu36PQHUaKLM97W6aqwA4Yg0=;
        b=idYHGxThSRYJGZBEjeDyO3QglSdIv6L+ULme36J9bRXqxQ+sKzq72KNDQeKZ/sej4I
         AhUZHbxV7rfin/ByYTfUbwyusmieyJrrEA/7EG/23YqAKT7xjBMNFjBDTG4Cv+5XF/gO
         pPxB/Gu2YEfEFKHNIXnz77dzCDTbxYJJIULcU=
In-Reply-To: <36ca99e90904280422u243af682qe2ea0efc4b6a4984@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bert Wesarg <bert.wesarg@googlemail.com>
Cc: linux-c-programming@vger.kernel.org

yeah, i was just wondering why doing a free() on the last example (the
char* stuff...) decreased the used mem by 'a.out' _immediately_ and on
my first example (source attached in 1st mail) _not_ (nothing happened
after free; only the os cleaned up after exit). i tried that several
times and got the same behaviour as mentioned, so i thought there
might be a bug in my source....

another fact would proof my assumption....

during programming (on that source) i first cleaned up my mem
recursively... which ended up in segfault when allocating more than
(e.g.) 1.5gig over the time, so a stack overflow might occur. instead
of
traversing my built tree recursively, i thought about putting the
lists with nodes (my 'parts' of the tree) into a linked list to solve
this issue. but i'm wondering about the following fact... freeing
recursivly made a visible decrease of my used mem in 'htop' while
freeing with my iterative variant made no decrease at all... so i
thought about a bug in my program... (but cannot find it....)

2009/4/28 Bert Wesarg <bert.wesarg@googlemail.com>:
> On Tue, Apr 28, 2009 at 11:20, leo mueller <llug.dan@googlemail.com> wrote:
>> hi all,
>>
>> i got a little problem with free() ... i am allocating mem for a
>> special struct and putting it afterwards
>> into a linked list. allocating works fine, but freeing not. i'm
>> tracking the program with htop. after
>> allocating, the percentage of mem usage stays constant ...
> Can you at least describe what do you expect to happen, and what does
> not work with freeing?
>
> bert
>>
>> the test-file is attached.
>>
>> any help is appreciated. big thanks :)
>>
>
