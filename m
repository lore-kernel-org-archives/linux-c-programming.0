From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: getdate(3) - format date
Date: Fri, 22 Sep 2006 09:28:16 +0200
Message-ID: <6a00c8d50609220028n76b35f37v9603746100804c44@mail.gmail.com>
References: <200609212236.46183.hitoc_mail@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200609212236.46183.hitoc_mail@yahoo.it>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org

On 9/21/06, HIToC <hitoc_mail@yahoo.it> wrote:
> Hello list,
> I am using the getdate(3) function to convert a string date in its tm=
 structure, but
> I have tried several formats of string-dates and it always returns a =
NULL pointer.
>
> All this dates I suppose invalid for the getdate(3):
> Fri, 19 Nov 82 16:14:55 EST
> Wed, 20 Sep 2006 15:03:53 GMT
> Thu, 21 Sep 2006 08:59:25 +0400
> 19 Sep 2006 15:52:25 -0700
> 19 Sep 2006 15:52:25 EST

Sure, they are valid, but getdate(3) requires a template file to be
present, with each line in the file representing a date format to
parse.  From getdate(3):

     User-supplied templates are used to parse and interpret  the
     input  string.  The templates are  text files created by the
     user and identified via the  environment  variable  DATEMSK.
     Each  line  in  the  template  represents an acceptable date
     and/or time specification using   conversion  specifications
     similar  to  those  used  by  strftime(3) and strptime(3).

Consider the following example which illustrates the usage of getdate(3=
)

--- BEGIN script ---

#!/bin/sh
#
# create template file
#
cat >.date <<EOF
%m
%A %B %d, %Y, %H:%M:%S
%A
%B
%m/%d/%y %I %p
%d, %m, %Y %H:%M
at %A the %dst of %B in %Y
run job at %I %p, %B %dnd
&A den %d. %B %Y %H.%M Uhr
EOF
DATEMSK=3D.date
export DATEMSK

--- END script ---

--- BEGIN C Source ---

#include <stdio.h>
#include <time.h>

#define BUF	512

void daterr(int err) {
	switch(err) {
        case 1: printf("The DATEMSK environment variable is null or
undefined.\n");
            break;

        case 2: printf("The template file cannot be opened for reading.=
\n");
            break;

        case 3: printf("Failed to get file status information.\n");
            break;

        case 4: printf("The template file is not a regular file.\n");
            break;

        case 5: printf("An error is encountered while reading the
template file.\n");
            break;

        case 6: printf("Memory allocation failed (not enough memory
available.\n");
            break;

        case 7: printf("There is no line in the template that matches
the input.\n");
            break;

        case 8: printf("Invalid input specification\n");
            break;

        default:	printf("unknown\n");
	}
=09
	exit(1);
}

int main(void) {
	struct tm *tm;
	char buf[BUF];

	tm =3D getdate("09/22/06");

	if (getdate_err !=3D 0)
        	daterr(getdate_err);

	strftime(buf,BUF,"%a %Y %H:%M:%S\n",tm);
	printf("%s",buf);

	return 1;
}

--- END C Source ---

	\Steve

--

Steve Gr=E4gert <steve@graegert.com>
Jabber    xmpp://graegerts@jabber.org
Internet  http://eth0.graegert.com, http://blog.graegert.com
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
