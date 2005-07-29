From: Luiz Fernando Capitulino <lcapitulino@conectiva.com.br>
Subject: errno usage.
Date: Fri, 29 Jul 2005 12:00:29 -0300
Message-ID: <42EA448D.6080904@conectiva.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi, hi, hi there!

  I have a question about 'errno' which I'm postponing for some
time: is it a bad pratice to set 'errno' by hand in libraries
and even in ordinary programs?

I mean, AFAIK 'errno' was created to store error codes from system
calls, but it's widely used by several libraries. Sometimes is even
helpful to set 'errno' in the program itself, something like:

int get_foobar_info(char *value)
{
	if (!value) {
		errno = EINVAL;
		return -1;
	}

...

	return 0;
}

Is it a bad pratice? Is there a 'limit' for 'errno' usage?

Thank you!

