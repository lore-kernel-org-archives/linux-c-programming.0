From: "David L. Martin" <dlmarti@kc2lcf.net>
Subject: Re: comparing char to other known char's
Date: Wed, 22 Jun 2005 19:44:36 -0400
Message-ID: <1119483877.15686.14.camel@localhost.localdomain>
References: <42B9F2C7.2030205@colannino.org>
Reply-To: dlmarti@kc2lcf.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42B9F2C7.2030205@colannino.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Colannino <james@colannino.org>
Cc: linux-c-programming@vger.kernel.org

On Wed, 2005-06-22 at 16:22 -0700, James Colannino wrote:
> let's say I have a char called 'character.'  I want to compare
> 'character' to see if it's any one of the characters in a list.  For
> example, maybe I would want to test character to see if it's either 'e',
> 'r', '*', etc.

if(strchr( teststr, character) != NULL)
	found();
else
	not_found();


