From: "Charlie Gordon" <gmane@chqrlie.org>
Subject: Re: complex variable
Date: Wed, 8 Sep 2004 23:54:45 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <chnv2v$j6n$1@sea.gmane.org>
References: <E3E30069B061524E90BCEE4417E30661138525@monm207.monmouth.army.mil> <chml6d$kri$1@sea.gmane.org> <20040908120658.GZ6985@lug-owl.de>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

"Jan-Benedict Glaw" <jbglaw@lug-owl.de> wrote in message
news:20040908120658.GZ6985@lug-owl.de...

> > >                 for(i=0; i< N; i++)
> > >                     printf("%lf\t", in[i]);
> > What does this mean ?
> Works for now, see the ugliness clause above. (Sure,
> you don't want that
> code in your program's final version, though...)

Enlighten me: does it just print the real part of each complex in the array
? Ankit: was that the intent ?

it's ugly because the whole complex number in whatever storage format it's
in gets passed to printf.
In my understanding, this may fail because there is no guaranty about which
part of the structure will be printed and the format specifier may be
incorrect for the actual type thus passed.

Chqrlie.



