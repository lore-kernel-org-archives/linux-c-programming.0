From: Sapuglha <sapuglha@yahoo.com.br>
Subject: Newbie Question -> writing Hexadecimal values
Date: Thu, 25 Sep 2003 18:11:17 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030925181117.256d0a31.sapuglha@yahoo.com.br>
Reply-To: sapuglha@yahoo.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello people,

my problem is:

I have an hexadecimal value. It's char, but correspond to an hexa value. Then I
want to write it to a file. But in the file, if viewed in hexa (ie. using
hexdump) I want to see "3e" and not the correspondig values in hexa to "3" and
to "e".

An example that works:

	fprintf(test, "%c", 0x3e);

But in my case "3e" is stored in a variable, so I'd like to use something like:

	strcmp(variable, "3e");
	fprintf(test, "%c", variable);

Is it possible? Any light?

Thanks 

-- 
 
=> Tiago Sant' Anna - Linux user #136940
	[.. ..]
