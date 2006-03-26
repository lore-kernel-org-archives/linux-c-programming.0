From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Need for const in function argument list
Date: Sun, 26 Mar 2006 10:57:44 +0000
Message-ID: <6a00c8d50603260257u18642532l7b88ae11c86e46cb@mail.gmail.com>
References: <200603261614.39708.samjnaa@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200603261614.39708.samjnaa@gmail.com>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 3/26/06, Shriramana Sharma <samjnaa@gmail.com> wrote:
> In the Qt constructor for the DateTime class, I see:
>
> QDateTime::QDateTime(const QDate &date)
>
> what is the need for the keyword const here? If it is to indicate that the
> date variable does not change, then in very many such places should the const
> keyword be used. But it is not.

You've answered your own question.  If there is no const in places
where it should be there can be three reasons: (a) either the
developer have forgotten to mark the parameters const or (b) the code
has been written before ANSI C where the const keyword was not known. 
Most sophisticated libraries provide properly designed functions, so I
am sure, (c) they have had their reasons not to "const" in some
places.

> As a related question, in the syntax for printf, we have printf(const char
> *format) -- why should we have const here?

Because the format (the string to display) is provided as a constant
expression and it is not being modified:

	printf("%s\n", "abc");
	printf("%s\n", mystring);

In both cases the format argument is a constant string.

	\Steve
