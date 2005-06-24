From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: comparing char to other known char's
Date: Fri, 24 Jun 2005 09:32:31 +0100
Message-ID: <17083.50463.358080.49397@gargle.gargle.HOWL>
References: <42B9F2C7.2030205@colannino.org>
	<200506231610.55260.adix@vendio.ro>
	<42BB1E25.1050500@colannino.org>
	<200506231757.58518.eric@cisu.net>
	<42BB52E4.5090504@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42BB52E4.5090504@colannino.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Colannino <james@colannino.org>
Cc: linux-c-programming@vger.kernel.org


James Colannino wrote:

> > Generally speaking (in terms of input validation), its better practice to 
> > check against a LEGAL set of characters rather than an illegal set. That way 
> > you can get all the characters you need, but everything else is blocked. If 
> > you block illegal ones you're bound to miss a few or even ones from extended 
> > charsets and input methods that you might not have thought of that could 
> > wreck havoc in your program.
> 
> Here's what I've whipped up based on your suggestion that I should look
> for legal characters instead of the other way around:
> 
> <CODE>
> 
> /* This function returns 1 if the character being checked is legal and 0
> if it isn't. */
> 
> int legal_characters(char character_to_check) {
> 
> 	int index;

> 	legal_characters[] =

Should be preceded by "char", i.e.

	char legal_characters[] =

Better still, make it static and constant:

	static const char legal_characters[] =

> "abcdefghijklmnopqrstuvwxyzAVCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_-";
                              ^
Typo; should be "B".

> 	int number_of_legal_chars = sizeof(legal_characters) / sizeof(char);
> 
> 	for (index = 0; index < number_of_legal_chars; ++index) {
> 		if (character_to_check == legal_characters[index])
> 			return 1;
> 	}

> How does this function look?

You can replace the loop with a call to strchr(). But using a lookup
table as suggested by Eric would be significantly more efficient.

-- 
Glynn Clements <glynn@gclements.plus.com>
