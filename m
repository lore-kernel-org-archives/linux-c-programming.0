From: "Charlie Gordon" <gmane@chqrlie.org>
Subject: Re: value computed is not used ??
Date: Tue, 1 Jun 2004 18:08:53 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <c9i9iv$oc2$1@sea.gmane.org>
References: <20040531193810.GE31833@opaque> <Pine.LNX.4.21.0406010333220.1813-100000@hestia> <c9hb7s$3o1$1@sea.gmane.org>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

> I gave the program as an example; After all the answers I received
> from y'all I think I'm gonna throw away some c books I have used in the
> past or even burn them in a ritual kind a way :-) They are loaded with c
> code like the above.

There is indeed so much crap in print !

Here is some palatable food for thought I would recommend :
- The C programming language, 2nd edition (Kernighan and Ritchie)
- The practice of Programming (Kernighan and Pike)
- C traps and Pitfalls (Andrew Koenig)
- The C puzzle book (Alan R. Feuer)
- Expert C Programming (Peter Van der Linden)

As a rule of thumb, stay away from books more than an inch thick or using
more than 4 colors on the cover.

> I understood everything in the above answer except for one issue ? Why is:
> int main(void) {
> The wrong prototype for main ? main() schould return `0' or `1' etc ?!?
> Thank you very much for taking the effort to explain and answer.
> Jeroen.

the proper prototype for main is
int main(int argc, char **argv);
or possibly :
int main(int argc, char *argv[]);
which is semantically equivalent, but emphasises the fact that argv points
to an array of char*

The mere fact that you do not use the arguments doesn't justify a change of
prototypes. It may even become a portability issue in some circumstances.

Glad to help.

Chqrlie.



