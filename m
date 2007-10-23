From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: threads and kernel
Date: Tue, 23 Oct 2007 07:14:54 +0200
Message-ID: <6a00c8d50710222214m116cba3h31b3c7e376a5f9fb@mail.gmail.com>
References: <471B5276.9010800@gmail.com>
	 <6a00c8d50710211023t898f17idf77bcad37c37a9b@mail.gmail.com>
	 <471C4849.2040409@purplelabs.com>
	 <6a00c8d50710220601s6aa10d26u762215a3989bf6cd@mail.gmail.com>
	 <471CA544.5050701@purplelabs.com>
	 <6a00c8d50710220631u7a9589bcjccdbca234184edaf@mail.gmail.com>
	 <471CA7CD.5070702@purplelabs.com>
	 <6a00c8d50710220720q31c24b71vf761a0dd5563bad9@mail.gmail.com>
	 <1193113932.2731.2.camel@root>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=jDZZNxMgUVExAqRiKElUoK0U3biPBw6rHUINirMXpUY=;
        b=aF8d4cOoDwaHQ9Y2YRIfMkTWL+sv2+jVNja0890zgKa5OPBN4S6hltXjFevevvssaHD/e70erPUEdYfNLQ1oc/pFuMM9YMvk7l2t/B43f8H7C58GfZHkdZPXQLKFlxEtlRMDOdQOhtp1JK1/HAk0NyHmgp/3hjrPkaribRkV/Rw=
In-Reply-To: <1193113932.2731.2.camel@root>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: vibi_sreenivasan@cms.com
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

On 10/23/07, vibi <vibi_sreenivasan@cms.com> wrote:
>  > "The init code used to set up the main program doesn't care about =
threads,
>
>  because it assumes that they won't be used anyway."
>
> when is init code linked to the program ,during the compile time or
> during the run time?

It's being added by the linker at compile time.

	\Steve

--

Steve Gr=E4gert
DigitalEther.de
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
