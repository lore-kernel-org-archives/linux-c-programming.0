From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: warning: assignment makes integer from pointer without a cast
Date: Tue, 6 May 2003 20:44:16 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16056.4240.502692.77648@cerise.nosuchdomain.co.uk>
References: <20030506135733.GH674@gre.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030506135733.GH674@gre.ac.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martin Buchan <M.J.Buchan@gre.ac.uk>
Cc: linux-c-programming@vger.kernel.org


Martin Buchan wrote:

> I am trying to populate an array with strings which i have
> extracted from another string using strtok. I have managed to split
> up the string into its constituent parts but i cant seem to populate
> the array. 
> 
> The error and line where it's failing on is at the bottom of the
> post, what follows is some background info if it may help.

> static void item_response( GtkObject *passme )
> { 	 /* Execute Apps */
>    char *appArgs, *tmpappArgs, *token, *appCommand; 
>    int pid, i = 0;
>    char sep[] = " ";
> 	
>    int *numArgs = gtk_object_get_data(passme, "numargs_key"); /* Get number of arguments */
>    char *nArgsPtr = malloc( *numArgs * sizeof (char) ); /* Create array of size numArgs */

This should be an array of pointers:

     char **nArgsPtr = malloc( *numArgs * sizeof (char *) ); /* Create array of size numArgs */

>       nArgsPtr[i] = strdup(token); /* Fails on this line - 623 */
>       printf( " %s I: %d\n", nArgsPtr[i], i ); /* Fails on this line - 624 */

> Here is what i get when i compile using gcc-2.95.2 on sparc solaris
> 
> gcc -Wall menu-0.5.c -o menu-0.5 gtk-config --cflags gtk-config \
>     --libs -I/usr/local/include/libxml2 -Wall -lxml2
> 
> menu-0.5.c: In function item_response':
> menu-0.5.c:623: warning: assignment makes integer from pointer without a cast
> menu-0.5.c:624: warning: format argument is not a pointer (arg 2)
> 
> 
> I dont understand why it says i am assigning integer from pointer
> when i have declared nArgsPtr as a char ( char *nArgsPtr)
> 
> Does anyone know what I am doing wrong here?

nArgsPtr has type "char *", so nArgsPtr[i] has type "char", which is
an integral type. If you declare nArgsPtr with type "char **",
nArgsPtr[i] has type "char *".

You also have to fix the size; the array consists of *numArgs
pointers, not *numArgs characters.

-- 
Glynn Clements <glynn.clements@virgin.net>
