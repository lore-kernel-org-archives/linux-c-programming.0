From: James Colannino <james@colannino.org>
Subject: Re: comparing char to other known char's
Date: Thu, 23 Jun 2005 17:25:08 -0700
Message-ID: <42BB52E4.5090504@colannino.org>
References: <42B9F2C7.2030205@colannino.org> <200506231610.55260.adix@vendio.ro> <42BB1E25.1050500@colannino.org> <200506231757.58518.eric@cisu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200506231757.58518.eric@cisu.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Eric Bambach wrote:

> Generally speaking (in terms of input validation), its better practice to 
> check against a LEGAL set of characters rather than an illegal set. That way 
> you can get all the characters you need, but everything else is blocked. If 
> you block illegal ones you're bound to miss a few or even ones from extended 
> charsets and input methods that you might not have thought of that could 
> wreck havoc in your program.

Here's what I've whipped up based on your suggestion that I should look
for legal characters instead of the other way around:

<CODE>

/* This function returns 1 if the character being checked is legal and 0
if it isn't. */

int legal_characters(char character_to_check) {

	int index;
	legal_characters[] =
"abcdefghijklmnopqrstuvwxyzAVCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_-";

	int number_of_legal_chars = sizeof(legal_characters) / sizeof(char);

	for (index = 0; index < number_of_legal_chars; ++index) {
		if (character_to_check == legal_characters[index])
			return 1;
	}

	return 0;

</CODE>

How does this function look?

James
-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/

" Those who would give up essential Liberty, to purchase a little
temporary Safety, deserve neither Liberty nor Safety." --Benjamin Franklin
