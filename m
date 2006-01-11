From: Steve Graegert <graegerts@gmail.com>
Subject: Re: Complete a character array.
Date: Wed, 11 Jan 2006 13:29:28 +0100
Message-ID: <6a00c8d50601110429q5ba66205u7bb33cfbc5033155@mail.gmail.com>
References: <22239.81.33.200.252.1136979040.squirrel@webmail.sinanimodelucro.dyns.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <22239.81.33.200.252.1136979040.squirrel@webmail.sinanimodelucro.dyns.cx>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On 1/11/06, Ibon Castilla <estri@euskalnet.net> wrote:
> Hi there:
>
> This is my first message to the list. I recently started to programming in
> GNU/Linux. I learned C programming with TurboC, and I'm trying to dump all
> my knoweledge to Free Software :)
>
> I've started with keyboard input functions, and here is my question: how
> can I do to complete an a character array?. Both getchar() and scanf()
> need the user to push ENTER. I remember getche() and getch(), but I didn't
> found any similar function on any library.

As far as I know, there is no such thing, but you can write one
yourself as suggested in http://c-faq.com/osdep/cbreak.html. 
Unfortunately, the approach described therein is not portable, thus
requiring some effort to ease maintainability across platforms.

	\Steve

--

Steve Graegert <graegerts@gmail.com>
Software Consultant {C/C++ && Java && .NET}
Office: +49 9131 7123988
Mobile: +49 1520 9289212
