From: Rafael Santos <rafael@thinkfreak.com.br>
Subject: Re: Returning pointer to array of structures
Date: Mon, 28 Apr 2003 07:57:07 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <UP74EBBAEBHCKGTNLKMJPL95LFFDV.3ead0903@rafaelnote.ns1.lhost.com.br>
References: <20030429083122.GA22282@gre.ac.uk>
Reply-To: rafael@thinkfreak.com.br
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030429083122.GA22282@gre.ac.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Martin Buchan <M.J.Buchan@gre.ac.uk>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

Try the modifications above.


>Hi,
>
>I am trying to populate an array of structures with data read in from an
>xml file (using libxml2). I have a few methods which parse separate chunks
>of the xml file, populate the array, call the next method passing it
>whatever is in the array so far, and then returning the array back to the
>original caller.I am not getting any errors but the array is never
>populated when i return it to the calling function ( and most
>importantly main() ).
>
>Here is my struct and some of my code.
> =20
>struct menuentry =20
>{
>	char *appsection;
>	char *appsubmenu;
>};
>
>typedef struct menuentry menuentry;
>

- menuentry parseSubmenu (xmlDocPtr doc, xmlNodePtr cur, menuentry *mePtr, =
int i)
+ void parseSubmenu (xmlDocPtr doc, xmlNodePtr cur, menuentry *mePtr, int i)

>{
>	xmlChar *uri;
>	cur =3D cur->xmlChildrenNode;
>	printf("I: %d. SECOND SECTION: %s\n", i,  mePtr[i].appsection);
>	while (cur !=3D NULL)=20
>	  {
>		  if ((!xmlStrcmp(cur->name, (const xmlChar *)"submenu")))
>			 {
>				 uri =3D xmlGetProp(cur, "name");
>				 xmlFree(uri);
>				 mePtr[i].appsubmenu =3D uri;
>				 printf("  SUBMENU: %s\n", mePtr[i].appsubmenu);
>			 }
>		  cur =3D cur->next;
>	  }

-	return *mePtr;

>}
>

-menuentry parseSection (xmlDocPtr doc, xmlNodePtr cur, menuentry *mePtr)
+void parseSection (xmlDocPtr doc, xmlNodePtr cur, menuentry *mePtr)

>{
>	int i=3D0;
>	xmlChar *uri;
>	cur =3D cur->xmlChildrenNode;
>	while (cur !=3D NULL)=20
>	  {
>		  if ((!xmlStrcmp(cur->name, (const xmlChar *)"section")))
>			 {
>				   uri =3D xmlGetProp(cur, "name");
>				   mePtr[i].appsection =3D uri;
>				   xmlFree(uri);
>				   printf("SECTION: %s\n", mePtr[i].appsection); /*prints out correct =
*/

-				   *mePtr =3D parseSubmenu(doc, cur, mePtr, i);
+				   parseSubmenu(doc, cur, mePtr, i);

>				   printf("SECOND SUBMENU: %s\n", mePtr[i].appsubmenu); /* empty */
>				   i++;
>			 }
>		  cur =3D cur->next;
>	  }

-	return *mePtr;

>}
>

-menuentry parseDoc(char *docname, menuentry *mePtr)
+void parseDoc(char *docname, menuentry *mePtr)

>{
>	xmlDocPtr doc;
>	xmlNodePtr cur;
>	doc =3D xmlParseFile(docname);
>=09
>	/* snipped all error checking code */
>=09
>	cur =3D xmlDocGetRootElement(doc);
>=09
>	while (cur !=3D NULL)=20
>	  {
>		  if ((!xmlStrcmp(cur->name, (const xmlChar *)"root")))
>			 {
>				 printf ("happened once\n");

-				 *mePtr =3D parseSection (doc, cur, mePtr);
+				 parseSection (doc, cur, mePtr);

>			 }
>		  cur =3D cur->next;
>	  }
>	xmlFreeDoc(doc);

-	return *mePtr;

>}
>
>int main(int argc, char **argv)=20
>{
>	int n =3D countElements("menuconfig");

-	menuentry *mePtr =3D malloc( n * sizeof (*mePtr) ); /* Gets size of array=
 */
+	menuentry *mePtr =3D malloc( n * sizeof (struct menuentry) ); /* Gets siz=
e of array */

>	printf ("number of apps: %d\n", n);

-	*mePtr =3D parseDoc("menuconfig", mePtr); /* calls method to populate me =
*/
+	parseDoc("menuconfig", mePtr); /* calls method to populate me */

>	printf("SECTION: %s\n", mePtr[0].appsection); /* Always empty */
>	return EXIT_SUCCESS;
>}
>
>
>The printf statements in the methods print out the stuff i expect it
>to except for the one that prints out "SECOND SUBMENU:" and also
>the final printf statement in main() shows the array always being
>empty. This tells me i am not returning my pointer properly but i
>cant see what im doing wrong. Can anyone see what i am trying to do
>and/or where the error lies?
>
>Thanks for any help.
>
>Martin
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-c-programm=
ing" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
Rafael Costa dos Santos
ThinkFreak Com=E9rcio e Solu=E7=F5es em Hardware e Software
Rio de Janeiro / RJ / Brazil
rafael@thinkfreak.com.br
+ 55 21 9432-9266


-
To unsubscribe from this list: send the line "unsubscribe linux-c-programmi=
ng" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
