From: Martin Buchan <M.J.Buchan@gre.ac.uk>
Subject: Re: warning: assignment makes integer from pointer without a cast
Date: Wed, 7 May 2003 16:44:42 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030507154442.GQ674@gre.ac.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,

Thanks to the list for the pointers.

On Tue, May 06, 2003 at 08:44:16PM +0100, Glynn Clements wrote:
> Martin Buchan wrote:
> 
> > I am trying to populate an array with strings which i have
> > extracted from another string using strtok. I have managed to split
> > up the string into its constituent parts but i cant seem to populate
> > the array. 
> 
> > static void item_response( GtkObject *passme )
> > { 	 /* Execute Apps */
> >    char *appArgs, *tmpappArgs, *token, *appCommand; 
> >    int pid, i = 0;
> >    char sep[] = " ";
> > 	
> >    int *numArgs = gtk_object_get_data(passme, "numargs_key"); /* Get number of arguments */
> >    char *nArgsPtr = malloc( *numArgs * sizeof (char) ); /* Create array of size numArgs */
> 
> This should be an array of pointers:
> 
>      char **nArgsPtr = malloc( *numArgs * sizeof (char *) ); /* Create array of size numArgs */
> 

I've ended up doing it a different way altogether as even with the
suggestions on here, i still couldn't get it to compile/run. (Even
after i had sorted *numArgs)

What i have instead which is cleaner i think is.

static void parse(buf, args)
	 char * buf;
    char **args;
{
	while (*buf != NULL) {
		/* Strip whitespace.  Use nulls, so that the previous argument 
		 * is terminated automatically. */
		while ((*buf == ' ') || (*buf == '\t'))    // || is OR
		  *buf++ = NULL;
		
		/* Save the argument. */
		*args++ = buf;
		
		/* Skip over the argument.  */
		while ((*buf != NULL) && (*buf != ' ') && (*buf != '\t'))
		  buf++;
	}
	*args = NULL;
}

static void item_response( GtkObject *passme )
{ /* Execute Apps */
	char *buf;
	char *args[64];
	
	buf = gtk_object_get_data(passme, "command_key"); /* assign my command and args to buf */
	parse(buf, args);
	
	execute(args); /* Here i call the execvp stuff with the properly sized array */
}

Thanks again
Martin


