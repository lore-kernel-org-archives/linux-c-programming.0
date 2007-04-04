From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: efficiency in passing a value to a function
Date: Wed, 4 Apr 2007 20:38:36 +0200
Message-ID: <6a00c8d50704041138l278f34d2t9c97ba551f7ad5c3@mail.gmail.com>
References: <4613DCB8.8030007@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=XQ/J4AkP59C7vfSy7ekyapoaiwMI2NWZRjAw6yKgJTE0mwVIEhMAcbNfQrKYUwtvxCLefKQh/sCDOiaNewHqC5xahmvkBohQq+1dEj4GvrfZY6tcyMHLNbctV+4cvVnvLbibV0vRhYVcJ0xcOv2Hcf4VkW45LF+wxf4SgTOznCg=
In-Reply-To: <4613DCB8.8030007@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Shriramana Sharma <jamadagni@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Shriramana,

On 4/4/07, Shriramana Sharma <jamadagni@gmail.com> wrote:
> Hello.
>
> Is providing an input to a function by constant reference more effici=
ent
> than passing it by value? In what way.
>
> For ex:
>
> int addOne ( const & int inValue ) { return inValue + 1 ; }
>
> vs:
>
> int addOne ( int inValue ) { return inValue + 1 ; }
>
> or:
>
> void printThis ( const & int inValue ) { cout << inValue ; }
>
> vs:
>
> void printThis ( int inValue ) { cout << inValue ; }
>
> I think passing as const & would be more efficient since passing by
> value would involve copying the value whereas passing by const & woul=
d
> skip this step. Am I right? Or is there something else?

I have seen many programs making use const reference parameters in
order to inform the compiler that the parameter is read-only, and
hence should be better optimized.

Unfortunately, this intent is at odds with the C++ language
definition. The const keyword says that the storage may not be
modified through the given name. What it does not say is that the
storage cannot be modified through some other name.

With the exception of variables directly declared const, which means
you can only initialize them, const is basically ineffective a
improving run-time performance. It does, however, catch errors in the
programming process.

	\Steve

--

Steve Gr=E4gert <steve@graegert.com>
Jabber    xmpp://graegerts@jabber.org
Internet  http://eth0.graegert.com, http://blog.graegert.com
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
