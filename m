From: Martin Buchan <M.J.Buchan@gre.ac.uk>
Subject: Returning pointer to array of structures
Date: Tue, 29 Apr 2003 09:31:22 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030429083122.GA22282@gre.ac.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,

I am trying to populate an array of structures with data read in from an
xml file (using libxml2). I have a few methods which parse separate chunks
of the xml file, populate the array, call the next method passing it
whatever is in the array so far, and then returning the array back to the
original caller.I am not getting any errors but the array is never
populated when i return it to the calling function ( and most
importantly main() ).

Here is my struct and some of my code.
  
struct menuentry  
{
	char *appsection;
	char *appsubmenu;
};

typedef struct menuentry menuentry;

menuentry parseSubmenu (xmlDocPtr doc, xmlNodePtr cur, menuentry *mePtr, int i)
{
	xmlChar *uri;
	cur = cur->xmlChildrenNode;
	printf("I: %d. SECOND SECTION: %s\n", i,  mePtr[i].appsection);
	while (cur != NULL) 
	  {
		  if ((!xmlStrcmp(cur->name, (const xmlChar *)"submenu")))
			 {
				 uri = xmlGetProp(cur, "name");
				 xmlFree(uri);
				 mePtr[i].appsubmenu = uri;
				 printf("  SUBMENU: %s\n", mePtr[i].appsubmenu);
			 }
		  cur = cur->next;
	  }
	return *mePtr;
}

menuentry parseSection (xmlDocPtr doc, xmlNodePtr cur, menuentry *mePtr)
{
	int i=0;
	xmlChar *uri;
	cur = cur->xmlChildrenNode;
	while (cur != NULL) 
	  {
		  if ((!xmlStrcmp(cur->name, (const xmlChar *)"section")))
			 {
				   uri = xmlGetProp(cur, "name");
				   mePtr[i].appsection = uri;
				   xmlFree(uri);
				   printf("SECTION: %s\n", mePtr[i].appsection); /*prints out correct */
				   *mePtr = parseSubmenu(doc, cur, mePtr, i);
				   printf("SECOND SUBMENU: %s\n", mePtr[i].appsubmenu); /* empty */
				   i++;
			 }
		  cur = cur->next;
	  }
	return *mePtr;
}

menuentry parseDoc(char *docname, menuentry *mePtr)
{
	xmlDocPtr doc;
	xmlNodePtr cur;
	doc = xmlParseFile(docname);
	
	/* snipped all error checking code */
	
	cur = xmlDocGetRootElement(doc);
	
	while (cur != NULL) 
	  {
		  if ((!xmlStrcmp(cur->name, (const xmlChar *)"root")))
			 {
				 printf ("happened once\n");
				 *mePtr = parseSection (doc, cur, mePtr);
			 }
		  cur = cur->next;
	  }
	xmlFreeDoc(doc);
	return *mePtr;
}

int main(int argc, char **argv) 
{
	int n = countElements("menuconfig");
	menuentry *mePtr = malloc( n * sizeof (*mePtr) ); /* Gets size of array */
	printf ("number of apps: %d\n", n);
	
	*mePtr = parseDoc("menuconfig", mePtr); /* calls method to populate me */
	printf("SECTION: %s\n", mePtr[0].appsection); /* Always empty */
	return EXIT_SUCCESS;
}


The printf statements in the methods print out the stuff i expect it
to except for the one that prints out "SECOND SUBMENU:" and also
the final printf statement in main() shows the array always being
empty. This tells me i am not returning my pointer properly but i
cant see what im doing wrong. Can anyone see what i am trying to do
and/or where the error lies?

Thanks for any help.

Martin

