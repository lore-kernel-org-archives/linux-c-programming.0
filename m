From: Jason Cooper <jcooper@nevernight.net>
Subject: Re: Returning pointer to array of structures
Date: Tue, 29 Apr 2003 08:11:25 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030429121125.GA24600@nevernight.net>
References: <20030429083122.GA22282@gre.ac.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030429083122.GA22282@gre.ac.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Martin Buchan (M.J.Buchan@gre.ac.uk) wrote:
> Hi,
> 
> I am trying to populate an array of structures with data read in from an
> xml file (using libxml2). I have a few methods which parse separate chunks
> of the xml file, populate the array, call the next method passing it
> whatever is in the array so far, and then returning the array back to the
> original caller.I am not getting any errors but the array is never
> populated when i return it to the calling function ( and most
> importantly main() ).
> 
> Here is my struct and some of my code.
>   
> struct menuentry  
> {
> 	char *appsection;
> 	char *appsubmenu;
> };
> 
> typedef struct menuentry menuentry;
> 
> menuentry parseSubmenu (xmlDocPtr doc, xmlNodePtr cur, menuentry *mePtr, int i)
> {
> 	xmlChar *uri;
> 	cur = cur->xmlChildrenNode;
> 	printf("I: %d. SECOND SECTION: %s\n", i,  mePtr[i].appsection);
> 	while (cur != NULL) 
> 	  {
> 		  if ((!xmlStrcmp(cur->name, (const xmlChar *)"submenu")))
> 			 {
> 				 uri = xmlGetProp(cur, "name");
> 				 xmlFree(uri);
> 				 mePtr[i].appsubmenu = uri;
> 				 printf("  SUBMENU: %s\n", mePtr[i].appsubmenu);
> 			 }
> 		  cur = cur->next;
> 	  }
> 	return *mePtr;
> }


Hey, I am by no means an expert, but at my new job (1.5 months) I've
just had a crash course in this for the project I'm on (C coding on
linux).  With that in mind, here is what I see:

1.) Your pointer *mePtr is being passed as an argument.  It does not
need to be returned.  Your local function will modify the memory space
that *mePtr points to.  

2.) mePtr[i] doesn't make sense.  It's equivalent to adding the size of
struct menuentry to the address mePtr contains ( if i=1, eg).  Not to
mention that it was never declared as an array in the first place.  I
think you may be confusing char */array ([1] increments one byte) with
pointers of different types.

3.) With malloc, it should probably be 

menuentry *mePtr;
mePtr = malloc(n * sizeof(struct menuentry));
...
free(mePtr);
return...

4.) Consider this (without malloc/free)):

int main(yada yada) {
   menuentry me[MAXENTRIES];

   n = countElements();

   for(i = 0; i < n; i++) {

      func_call(fnjsf, fdo, &me[i]);

   }

}
int func_call(int a, int b, menuentry *me) {

...

   return 0; /*success*/
}


Like I said above, I haven't been doing this too long, so I may be
wrong.  I don't mean to sound harsh, but it look as though you could use
a crash course in pointers, arrays, and malloc/free.  Don't take it the
wrong way, I just learned it the hard way a month ago myself.

HTH,

Cooper.
