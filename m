From: Martin Buchan <M.J.Buchan@gre.ac.uk>
Subject: warning: assignment makes integer from pointer without a cast
Date: Tue, 6 May 2003 14:57:33 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030506135733.GH674@gre.ac.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,

I am trying to populate an array with strings which i have
extracted from another string using strtok. I have managed to split
up the string into its constituent parts but i cant seem to populate
the array. 

The error and line where it's failing on is at the bottom of the
post, what follows is some background info if it may help.

One problem is that it is unknown how many elements will
be in the new array. (I.e. the original string length changes all
the time) so i have used malloc to allocate some memory for it. Here
is some of my code - the malloc code for the new array is in the
item_response() function at the end.

struct menuentry  
{
   char *appsection;
   char *appsubmenu;
   int numargs; /* used to get size of array */
};

typedef struct menuentry menuentry;


I have an array of structs (also of unknown size at compile time) which 
i create using malloc also and then go off and populate the structs
with what i need to populate it with. This all works fine.


menuentry *mePtr = malloc( n * sizeof (menuentry) ); /* Create space for array of structs */ 


I then assign a value to menuentry[i].numargs with the following code.


/* Get number of arguments */
numAppArgs = strdup(key); /* key is a pointer to the string i want to slpit */
token = strtok( numAppArgs, sep );
while( token != NULL ) 
{
   n++;
   token = strtok( NULL, sep );
}
mePtr[i].numargs = n;  /* amount of elements i split the string into */


In another function, I pass the address of what this pointer points
to, to a GTK+ method like so (The method expects a pointer)


gtk_object_set_data(GTK_OBJECT (menu_items), "numargs_key", &mePtr[i].numargs);


I then call another function passing it the menu_items object which
has a bunch of data attached to it attached as key-value pairs where
the value is a pointer to some data.

Here is the function.


static void item_response( GtkObject *passme )
{ 	 /* Execute Apps */
   char *appArgs, *tmpappArgs, *token, *appCommand; 
   int pid, i = 0;
   char sep[] = " ";
	
   int *numArgs = gtk_object_get_data(passme, "numargs_key"); /* Get number of arguments */
   char *nArgsPtr = malloc( *numArgs * sizeof (char) ); /* Create array of size numArgs */
	
   tmpappArgs = gtk_object_get_data(passme, "args_key");
   printf("num args: %d\n",  *numArgs); /* Prints out correctly */
	
   appArgs = strdup(tmpappArgs);
   printf("args: %s\n", appArgs ); /* Prints out correctly */
	
   token = strtok( appArgs, sep );
   while( token != NULL )
   {
      nArgsPtr[i] = strdup(token); /* Fails on this line - 623 */
      printf( " %s I: %d\n", nArgsPtr[i], i ); /* Fails on this line - 624 */
      i++;
      token = strtok( NULL, sep );
   }
	
   appCommand = gtk_object_get_data(passme, "command_key");
	
   /* snipped fork() checking etc */
	
   execvp(appCommand, (gpointer) nArgsPtr); /* This is what i am trying to achieve */
   
   /* snipped */
}


Here is what i get when i compile using gcc-2.95.2 on sparc solaris

gcc -Wall menu-0.5.c -o menu-0.5 gtk-config --cflags gtk-config \
    --libs -I/usr/local/include/libxml2 -Wall -lxml2

menu-0.5.c: In function item_response':
menu-0.5.c:623: warning: assignment makes integer from pointer without a cast
menu-0.5.c:624: warning: format argument is not a pointer (arg 2)


I dont understand why it says i am assigning integer from pointer
when i have declared nArgsPtr as a char ( char *nArgsPtr)

Does anyone know what I am doing wrong here?

Thanks 
Martin
