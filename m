From: Sapuglha <sapuglha@yahoo.com.br>
Subject: Re: Newbie Question -> writing Hexadecimal values
Date: Thu, 25 Sep 2003 18:38:21 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030925183821.25ac0b25.sapuglha@yahoo.com.br>
References: <31E38B53D182D51195FA00508BE3A33402C13BBE@zwnbc004.cala.nortel.com>
Reply-To: sapuglha@yahoo.com.br
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <31E38B53D182D51195FA00508BE3A33402C13BBE@zwnbc004.cala.nortel.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sandro Dangui <sdangui@nortelnetworks.com>
Cc: linux-c-programming@vger.kernel.org

It worked. Thank you all.

Maybe on Thu, 25 Sep 2003 18:36:09 -0300
Sandro Dangui wrote:

| char strValue[] = {"3e"};
| int value;
| 
| if (sscanf(strValue, "%x", &value) == 1) // converts.
| {
| 	fprintf(test, "%c", value);
| }

-- 
 
=> Tiago Sant' Anna - UIN: 14252973 - Linux user #136940
	[.. ..]
