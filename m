From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Randomizing
Date: Sat, 12 Apr 2003 16:40:39 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16024.13175.185821.374870@cerise.nosuchdomain.co.uk>
References: <200304122044.00387.abulfazl@juniv.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200304122044.00387.abulfazl@juniv.edu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Progga <abulfazl@juniv.edu>
Cc: linux-c-programming@vger.kernel.org


Progga wrote:

> Is there any function for randomizing a string (like glibc's
> strfry() ) which can be used across different Unices ?

No; but it's not hard to write one yourself:

	void randomize(char *str)
	{
		int len = strlen(str);
		int i;
		for (i = 0; i < len; i++)
		{
			int n = i + rand() % (len - i);
			char tmp = str[i];
			str[i] = str[n];
			str[n] = tmp;
		}
	}

-- 
Glynn Clements <glynn.clements@virgin.net>
