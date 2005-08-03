From: Steve Graegert <graegerts@gmail.com>
Subject: Re: does static function declaration require static definition?
Date: Wed, 3 Aug 2005 10:04:45 +0200
Message-ID: <6a00c8d5050803010444370ae9@mail.gmail.com>
References: <Pine.LNX.4.63.0508021520360.29602@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.63.0508021520360.29602@localhost.localdomain>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: C programming list <linux-c-programming@vger.kernel.org>

On 8/2/05, Robert P. J. Day <rpjday@mindspring.com> wrote:
>=20
>  from my 5th edition of harbison and steele, p. 83, i read that the
> "static" storage class specifier on a function "indicates that the
> declared function will be defined -- with storage class static --
> later in the file."
>=20
>  doesn't this read that, once you declare the function as static, you
> *must* define it as static as well?  gcc doesn't seem to have a
> problem with leaving "static" off of the definition.

=46or GCC it should be sufficient to declare a function as static and
omit the static keyword in the definition (but I prefer to see it in
both, declarations and definitions):

	/* declaration */
	static void func(int, int);
=09
	/* definition */
	void func(int a, int b) {
		/* do some work here */
	}

Please note that static functions are only visible to other functions
in the same translation unit.  Also note that C99 (p. 141 =A74) says:

"The storage-class specifier, if any, in the declaration specifiers
shall be either extern or static."

The static keyword is optional in function definitions.

Regards

       \Steve
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
