From: Jose Celestino <japc@co.sapo.pt>
Subject: Re: libCurl in C
Date: Tue, 20 Jan 2009 21:10:32 +0000
Message-ID: <20090120211032.GA4752@co.sapo.pt>
References: <1f714d50901201243v289c2e84o19c79adfd0ef463d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1f714d50901201243v289c2e84o19c79adfd0ef463d@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jai Sharma <jai.unix@gmail.com>
Cc: linux-c-programming@vger.kernel.org

Words by Jai Sharma [Wed, Jan 21, 2009 at 02:13:04AM +0530]:
> Dear Friends,
>=20
> I am using CURL to get HTTP response.
> The default output for CURL is stdout, but i am unable to change it t=
o
> a variable.
>=20
> Right now,
> I am using a temporary file for this purpose and read it to process i=
t.
> Is there any way, by which method i will get CURL output to a string
> or any structure?
>=20

I usually do:

/* store curl "output" here */
char buffer[BUFFER_SIZE];

/* function that does the copy */
size_t tobuffer(char *ptr, size_t size, size_t nmemb, void *stream)
{
	strncpy(buffer,ptr,size*nmemb);
	return size*nmemb;
}

=2E...
/* tell curl to use the upper function */
curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, &tobuffer);
=2E...

then do whatever I want (print, parse, etc) with buffer.

--=20
Jose Celestino | http://japc.uncovering.org/files/japc-pgpkey.asc
----------------------------------------------------------------
"One man=E2=80=99s theology is another man=E2=80=99s belly laugh." -- R=
obert A. Heinlein
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
