From: "Sandro Dangui" <sdangui@nortelnetworks.com>
Subject: RE: Newbie Question -> writing Hexadecimal values
Date: Thu, 25 Sep 2003 18:36:09 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <31E38B53D182D51195FA00508BE3A33402C13BBE@zwnbc004.cala.nortel.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sapuglha@yahoo.com.br, linux-c-programming@vger.kernel.org


First, you have to convert the string value to an integer value.
After that, you are able to use the integer value do to what you want...

<snip>
char strValue[] = {"3e"};
int value;

if (sscanf(strValue, "%x", &value) == 1) // converts.
{
	fprintf(test, "%c", value);
}
<snip>






-----Original Message-----
From: Sapuglha [mailto:sapuglha@yahoo.com.br] 
Sent: quinta-feira, 25 de setembro de 2003 18:11
To: linux-c-programming@vger.kernel.org
Subject: Newbie Question -> writing Hexadecimal values


Hello people,

my problem is:

I have an hexadecimal value. It's char, but correspond to an hexa value.
Then I want to write it to a file. But in the file, if viewed in hexa (ie.
using
hexdump) I want to see "3e" and not the correspondig values in hexa to "3"
and to "e".

An example that works:

	fprintf(test, "%c", 0x3e);

But in my case "3e" is stored in a variable, so I'd like to use something
like:

	strcmp(variable, "3e");
	fprintf(test, "%c", variable);

Is it possible? Any light?

Thanks 

-- 
 
=> Tiago Sant' Anna - Linux user #136940
	[.. ..]
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
