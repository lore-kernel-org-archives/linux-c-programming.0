From: Martin Buchan <M.J.Buchan@gre.ac.uk>
Subject: Re: segfault with strdup
Date: Tue, 20 May 2003 13:46:13 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030520124613.GB674@gre.ac.uk>
References: <20030520112034.GZ674@gre.ac.uk> <002d01c31ecb$8c947600$852005d5@carlos>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="q9KOos5vDmpwPx9o"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <002d01c31ecb$8c947600$852005d5@carlos>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org
Cc: Chris Nanakos <nanakos@wired-net.gr>


--q9KOos5vDmpwPx9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 20, 2003 at 03:25:31PM +0300, Chris Nanakos wrote:
> Can you send the source code???

Here is the code. All 869 lines of it. :-)                        
I would have snipped it and included only the relevant sections but 
i am totally at a loss as to why this is happening and hence dont     
know what the relevant sections are. Also included is the menu.h    
file which contains the #define 's and some XPM data.

Thanks again. 
                                   
Martin          



--q9KOos5vDmpwPx9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="menu-0.9.1.c"

/* CMS Gtk+ Menu for newbians
 * Version 0.7 MJB - 2003 
 * gcc -Wall menu-0.9.1.c -o menu-0.9.1 `gtk-config --cflags` `gtk-config --libs` \
 * -I/usr/local/include/libxml2 -Wall -lxml2 -Wno-parentheses
 */
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <signal.h>
#include <errno.h>
#include <unistd.h>
#include <stdio.h>
#include <gtk/gtk.h>
#include <stdlib.h>
#include <string.h>
#include <libxml/xmlmemory.h>
#include <libxml/parser.h>
#include <libxml/xpath.h>
#include <libxml/tree.h>
#include "menu.h"

static gint button_press (GtkWidget *, GdkEvent *);
extern int xmlDoValidityCheckingDefaultValue;

struct termentry 
{
  gchar *termxpm;
  gchar *termname;
  gchar *termcmd;
};

typedef struct termentry termentry;

struct menuentry 
{
  gchar *appsection;
  gchar *sectionxpm;
  gchar *appsubmenu;
  gchar *appname;
  gchar *appcommand;
};

typedef struct menuentry menuentry;

/* Count how many apps we have in applist.xml */
float countElements(char *docname) 
{
  xmlDocPtr doc;
  xmlXPathContextPtr ctx;
  xmlXPathObjectPtr path;
  float i = 0.0;
  
  xmlKeepBlanksDefault(1);
  doc = xmlParseFile(docname);
  
  xmlXPathInit();
  ctx = xmlXPathNewContext(doc);
  
  path = xmlXPathEvalExpression((const xmlChar *)"count(/*/section)", ctx);
  i = path->floatval;
  
  xmlXPathFreeObject(path);
  xmlXPathFreeContext(ctx);
  xmlFreeDoc(doc);
  return i;
}

/* Count how many submenus we have in applist.xml */
float countSubmenus(char *docname) 
{
  xmlDocPtr doc;
  xmlXPathContextPtr ctx;
  xmlXPathObjectPtr path;
  float i = 0.0;
  
  xmlKeepBlanksDefault(1);
  doc = xmlParseFile(docname);
  
  xmlXPathInit();
  ctx = xmlXPathNewContext(doc);
  
  path = xmlXPathEvalExpression((const xmlChar *)"count(/*/section/submenu)", ctx);
  i = path->floatval;
  
  xmlXPathFreeObject(path);
  xmlXPathFreeContext(ctx);
  xmlFreeDoc(doc);
  return i;
}

int countSections(char *docname) 
{
  xmlDocPtr doc;
  xmlNodePtr cur;
  xmlChar *uri;
  xmlChar *tmp = "null";
  int n = 0;
							
  doc = xmlParseFile(docname);
  cur = xmlDocGetRootElement(doc);
  
  while (cur != NULL) 
	 {
		if ((!xmlStrcmp(cur->name, (const xmlChar *)"root")))
		  {
			 cur = cur->xmlChildrenNode;
			 while (cur != NULL) 
				{
				  if ((!xmlStrcmp(cur->name, (const xmlChar *)"section")))
					 {
						uri = xmlGetProp(cur, "name");
						if ((strcmp(uri, tmp) != 0 )) 
						  n++;
						tmp = uri;
					 }
				  cur = cur->next;
				}
		  }
	 }
  return n;
}

/* Parse command line arguments of New Terminal */
void parseTermCommand (xmlDocPtr doc, xmlNodePtr cur, termentry *termPtr)
{
  xmlChar *key;
  cur = cur->xmlChildrenNode;
  
  while (cur != NULL) 
	 {
		if ((!xmlStrcmp(cur->name, (const xmlChar *)"termcmd")))
		  {
			 key = xmlNodeListGetString(doc, cur->xmlChildrenNode, 1);
			 termPtr[0].termcmd = strdup(key);
			 xmlFree(key);
		  }
		cur = cur->next;
	 }
}

void parseTermXpm (xmlDocPtr doc, xmlNodePtr cur, termentry *termPtr)
{
  xmlChar *key;
  gchar *xpmdir;
  xpmdir = strdup(XPMDIR);
  cur = cur->xmlChildrenNode;
  
  while (cur != NULL) 
	 {
		if ((!xmlStrcmp(cur->name, (const xmlChar *)"termxpm")))
		  {
			 key = xmlNodeListGetString(doc, cur->xmlChildrenNode, 1);
			 termPtr[0].termxpm =  strdup(key);
			 termPtr[0].termxpm = strcat(xpmdir, termPtr[0].termxpm);
			 cur = cur->parent;
			 parseTermCommand(doc, cur, termPtr);
		  }
		cur = cur->next;
	 }
}

/* Parse name of Terminal command and any command line arguments */
void parseTermName (xmlDocPtr doc, xmlNodePtr cur, termentry *termPtr)
{
  xmlChar *uri;
  cur = cur->xmlChildrenNode;
  while (cur != NULL) 
	 {
		if ((!xmlStrcmp(cur->name, (const xmlChar *)"newterm"))) {
		  uri = xmlGetProp(cur, "name");
		  termPtr[0].termname = strdup(uri);
		  xmlFree(uri);
		  parseTermXpm(doc, cur, termPtr);
		}
		cur = cur->next;
	 }
}

/* Parse command line arguments of app*/
void parseCommand (xmlDocPtr doc, xmlNodePtr cur, menuentry *mePtr, int i)
{
  xmlChar *key;
  cur = cur->xmlChildrenNode;
  
  while (cur != NULL) 
	 {
		if ((!xmlStrcmp(cur->name, (const xmlChar *)"command"))) 
		  {
			 key = xmlNodeListGetString(doc, cur->xmlChildrenNode, 1);
			 mePtr[i].appcommand = strdup(key);
			 xmlFree(key);
		  }
		cur = cur->next;
	 }
}

/* Parse the display name of the application */
void parseApp (xmlDocPtr doc, xmlNodePtr cur, menuentry *mePtr, int i)
{
  xmlChar *uri;
  cur = cur->xmlChildrenNode;
  while (cur != NULL) 
	 {
		if ((!xmlStrcmp(cur->name, (const xmlChar *)"app")))
		  {
			 uri = xmlGetProp(cur, "name");
			 mePtr[i].appname = strdup(uri);
			 xmlFree(uri);
			 parseCommand(doc, cur, mePtr, i);
		  }
		cur = cur->next;
	 }
}

/* Find if the app is in a submenu or not */
void parseSubmenu (xmlDocPtr doc, xmlNodePtr cur, menuentry *mePtr, int i)
{
  xmlChar *uri;
  cur = cur->xmlChildrenNode;
  while (cur != NULL) 
	 {
		if ((!xmlStrcmp(cur->name, (const xmlChar *)"submenu")))
		  {
			 uri = xmlGetProp(cur, "name");
			 mePtr[i].appsubmenu = strdup(uri);
			 xmlFree(uri);
			 parseApp(doc, cur, mePtr, i);
		  }
		else 
		  {
			 if ((!xmlStrcmp(cur->name, (const xmlChar *)"app"))) 
				{
				  uri = xmlGetProp(cur, "name");
				  mePtr[i].appsubmenu = "";
				  mePtr[i].appname = strdup(uri);
				  xmlFree(uri);
				  parseCommand (doc, cur, mePtr, i);
				}
		  }
		cur = cur->next;
	 }
}
/* Parse the Icon for the Section buttons */
void parseXpm (xmlDocPtr doc, xmlNodePtr cur, menuentry *mePtr, int i)
{
  xmlChar *key;
  gchar  *xpmdir;
  xpmdir = strdup(XPMDIR);
  cur = cur->xmlChildrenNode;
  while (cur != NULL) 
	 {
		if ((!xmlStrcmp(cur->name, (const xmlChar *)"xpm")))
		  {
			 key = xmlNodeListGetString(doc, cur->xmlChildrenNode, 1);

			 mePtr[i].sectionxpm = strdup(key);
			 mePtr[i].sectionxpm = strdup(strcat(xpmdir, mePtr[i].sectionxpm));
			 xmlFree(key);
			 free(xpmdir);
			 cur = cur->parent;
			 parseSubmenu(doc, cur, mePtr, i);
			 i++;
		  }
		cur = cur->next;
	 }
}

/* Find which section the app is in */
void parseSection (xmlDocPtr doc, xmlNodePtr cur, menuentry *mePtr)
{
  int i=0;
  xmlChar *uri;
  cur = cur->xmlChildrenNode;
  while (cur != NULL) 
	 {
		if ((!xmlStrcmp(cur->name, (const xmlChar *)"section")))
		  {
			 uri = xmlGetProp(cur, "name");
			 mePtr[i].appsection = strdup(uri);
			 xmlFree(uri);
			 parseXpm(doc, cur, mePtr, i);
			 i++;
		  }
		cur = cur->next;
	 }
}

/* Parse applist.xml - XML file */
void parseDoc(char *docname, menuentry *mePtr, termentry *termPtr)
{
  xmlDocPtr doc;
  xmlNodePtr cur;
  doc = xmlParseFile(docname);
  
  if (doc == NULL ) 
	 fprintf(stderr,"Document not parsed successfully. \n");

  
  cur = xmlDocGetRootElement(doc);
  
  if (cur == NULL) {
	 fprintf(stderr,"empty document\n");
	 xmlFreeDoc(doc);
  }
  
  if (xmlStrcmp(cur->name, (const xmlChar *) "root")) {
	 fprintf(stderr,"document of the wrong type, root node != root");
	 xmlFreeDoc(doc);
  }
  
  while (cur != NULL) 
	 {
		if ((!xmlStrcmp(cur->name, (const xmlChar *)"root")))
		  {
			 parseTermName(doc, cur, termPtr);
			 parseSection(doc, cur, mePtr);
		  }
		cur = cur->next;
	 }
  /*  xmlFreeDoc(doc); */
}

/* function to create or delete start login file */
void start_login (GtkWidget *widget,  gpointer data)
{
  char *msg;
  char autoload[200];
  char menudir[200];
  char *home = strdup(HOMED);
  char *menufile = strdup(MENUFILE);
  char *menud = strdup(MENUD);
  sprintf(menudir, "%s%s", home, menud);
  sprintf(autoload, "%s%s",menudir, menufile);

  if (GTK_TOGGLE_BUTTON (widget)->active) 
	 {
		FILE *fopen(), *fp;
	
		msg = "#####################################################################\n"
		  "#               This file was created by the CMS Menu.              #\n"
		  "#               --------------------------------------              #\n"
		  "# Do not delete this file unless you want the menu to appear every  #\n"
		  "# time you login. If you want to change the way the menu behaves,   #\n"
		  "# open up the menu by typing menu at the shell prompt and go to the #\n"
		  "# options menu in the program.                                      #\n"
		  "#####################################################################\n";
		
		fp = fopen(autoload,"w");
		fprintf(fp,"%s", msg);
		chmod (autoload, 0400);
	 } 
  else {
	 unlink(autoload);
  }
}

static gboolean delete_event( GtkWidget *widget,
										GdkEvent  *event,
										gpointer   data )
{
  return TRUE; 
}

static gint button_press( GtkWidget *widget,
								  GdkEvent *event )
{
  if (event->type == GDK_BUTTON_PRESS) 
	 {
		GdkEventButton *bevent = (GdkEventButton *) event; 
		gtk_menu_popup (GTK_MENU (widget), NULL, NULL, NULL, NULL,
							 bevent->button, bevent->time);
		/* Tell calling code that we have handled this event; stop here */
		return TRUE;
	 }
  /* Tell calling code that we have not handled this event; pass it on. */
  return FALSE;
}

void destroy( GtkWidget *widget,
				  gpointer   data )
{
  gtk_main_quit();
}

GtkWidget *xpm_menu_box( GtkWidget *parent,
								 gchar     **xpm_arrow,
								 gchar     *xpm_icon,
								 gchar     *label_text)
{
  GtkWidget *box1;
  GtkWidget *box2;
  GtkWidget *box3;
  GtkWidget *label;
  GtkWidget *pixmapwid;
  GdkPixmap *pixmap;
  GdkBitmap *mask;
  GtkWidget *pixmapwid2;
  GdkPixmap *pixmap2;
  GtkStyle *style;
  
  /* Create box for xpm and label */
  box1 = gtk_hbox_new (FALSE, 0);
  box2 = gtk_hbox_new (FALSE, 0);
  box3 = gtk_hbox_new (FALSE, 0);

  gtk_container_set_border_width (GTK_CONTAINER (box1), 0);
  gtk_container_set_border_width (GTK_CONTAINER (box2), 0);
  gtk_container_set_border_width (GTK_CONTAINER (box3), 0);
  style = gtk_widget_get_style(parent); /* Get style of button for background */
  
  pixmap = gdk_pixmap_create_from_xpm_d (parent->window, &mask,
													  &style->bg[GTK_STATE_NORMAL],
													  (gchar **)xpm_arrow);
  pixmapwid = gtk_pixmap_new (pixmap, mask);

  pixmap2 = gdk_pixmap_create_from_xpm (parent->window, &mask,
                                        &style->bg[GTK_STATE_NORMAL],
													 xpm_icon);
  pixmapwid2 = gtk_pixmap_new (pixmap2, mask); 
  label = gtk_label_new (label_text);
  
  /* Pack the pixmap and label into the box */
  gtk_box_pack_start (GTK_BOX (box1), pixmapwid2, FALSE, FALSE, 0);
  gtk_box_pack_start (GTK_BOX (box1), label, FALSE, FALSE, 3);
  gtk_box_pack_end (GTK_BOX (box2), pixmapwid, FALSE, FALSE, 0);
  gtk_box_pack_start (GTK_BOX (box3), box1, FALSE, FALSE, 0);
  gtk_box_pack_end (GTK_BOX (box3), box2, FALSE, FALSE, 0);
  
  gtk_widget_show(box1);
  gtk_widget_show(box2);
  gtk_widget_show(pixmapwid);
  gtk_widget_show(pixmapwid2);
  gtk_widget_show(label);
  return(box3);
}

static void helpitem_response( gchar *helpfile )
{ /* HELP MENU */
  
  GtkWidget *window;
  GtkWidget *box1;
  GtkWidget *box2;
  GtkWidget *button;
  GtkWidget *separator;
  GtkWidget *table;
  GtkWidget *vscrollbar;
  GtkWidget *text;
  GdkFont *fixed_font;
  gchar *helpdir = strdup(HELPDIR);

  FILE *infile;
  
  window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
  gtk_widget_set_usize (window, 300, 250);
  gtk_window_set_policy (GTK_WINDOW(window), TRUE, TRUE, FALSE);  
  gtk_signal_connect (GTK_OBJECT (window), "delete_event",
							 GTK_SIGNAL_FUNC(delete_event), NULL);
  gtk_window_set_title (GTK_WINDOW (window), "Common Unix Commands");
  gtk_container_set_border_width (GTK_CONTAINER (window), 0);
  
  box1 = gtk_vbox_new (FALSE, 0);
  gtk_container_add (GTK_CONTAINER (window), box1);
  gtk_widget_show (box1);
  
  box2 = gtk_vbox_new (FALSE, 10);
  gtk_container_set_border_width (GTK_CONTAINER (box2), 10);
  gtk_box_pack_start (GTK_BOX (box1), box2, TRUE, TRUE, 0);
  gtk_widget_show (box2);
  
  table = gtk_table_new (2, 2, FALSE);
  gtk_table_set_row_spacing (GTK_TABLE (table), 0, 2);
  gtk_table_set_col_spacing (GTK_TABLE (table), 0, 2);
  gtk_box_pack_start (GTK_BOX (box2), table, TRUE, TRUE, 0);
  gtk_widget_show (table);
  
  /* Create the GtkText widget */
  text = gtk_text_new (NULL, NULL);
  gtk_text_set_editable (GTK_TEXT (text), FALSE);
  gtk_text_set_word_wrap (GTK_TEXT (text), TRUE);
  gtk_table_attach (GTK_TABLE (table), text, 0, 1, 0, 1,
						  GTK_EXPAND | GTK_SHRINK | GTK_FILL,
						  GTK_EXPAND | GTK_SHRINK | GTK_FILL, 0, 0);
  gtk_widget_show (text);
  
  /* Add a vertical scrollbar to the GtkText widget */
  vscrollbar = gtk_vscrollbar_new (GTK_TEXT (text)->vadj);
  gtk_table_attach (GTK_TABLE (table), vscrollbar, 1, 2, 0, 1,
						  GTK_FILL, GTK_EXPAND | GTK_SHRINK | GTK_FILL, 0, 0);
  gtk_widget_show (vscrollbar);
  
  /* Load a fixed font */
  fixed_font = gdk_font_load ("-misc-fixed-medium-r-*-*-*-120-*-*-*-*-*-*");
  
  gtk_widget_realize (text);
  
  /* Freeze the text widget, ready for multiple updates */
  gtk_text_freeze (GTK_TEXT (text));
  
  /* Load the file text.c into the text window */

  helpdir = strcat(helpdir, helpfile);  
  infile = fopen(helpdir, "r");

  if (infile) {
	 char buffer[1024];
	 int nchars;
	 
	 while (1)
		{
		  nchars = fread(buffer, 1, 1024, infile);
		  gtk_text_insert (GTK_TEXT (text), fixed_font, NULL,
								 NULL, buffer, nchars);
		  if (nchars < 1024)
			 break;
		}
	 fclose (infile);
  }
  gtk_text_thaw (GTK_TEXT (text)); /* Thaw. Make updates available on screen */
  
  separator = gtk_hseparator_new ();
  gtk_box_pack_start (GTK_BOX (box1), separator, FALSE, TRUE, 0);
  gtk_widget_show (separator);
  
  box2 = gtk_vbox_new (FALSE, 10);
  gtk_container_set_border_width (GTK_CONTAINER (box2), 10);
  gtk_box_pack_start (GTK_BOX (box1), box2, FALSE, TRUE, 0);
  gtk_widget_show (box2);
  
  button = gtk_button_new_with_label ("Close");
  gtk_signal_connect_object (GTK_OBJECT (button), "clicked",
									  GTK_SIGNAL_FUNC (gtk_widget_destroy),
									  GTK_OBJECT (window));
  gtk_box_pack_start (GTK_BOX (box2), button, TRUE, TRUE, 0);
  GTK_WIDGET_SET_FLAGS (button, GTK_CAN_DEFAULT);
  gtk_widget_grab_default (button);
  gtk_widget_show (button);
  
  gtk_widget_show (window);
}

static void option_response( gchar *string )
{ /* OPTIONS MENU */
  GtkWidget *window;
  GtkWidget *box1;
  GtkWidget *box2;
  GtkWidget *box3;
  GtkWidget *separator;
  GtkWidget *button;
  GtkWidget *label;
  GtkWidget *frame;
  GSList *group;
  char autoload[200];
  char menudir[200];
  char *home = strdup(HOMED);
  char *menufile = strdup(MENUFILE);
  char *menud = strdup(MENUD);
  sprintf(menudir, "%s%s", home, menud);
  sprintf(autoload, "%s%s", menudir, menufile); 

  window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
  gtk_window_set_policy (GTK_WINDOW(window), TRUE, TRUE, FALSE);  
  gtk_signal_connect (GTK_OBJECT (window), "delete_event",
							 GTK_SIGNAL_FUNC(delete_event), NULL);
  gtk_window_set_title (GTK_WINDOW (window), "Unix@CMS Menu Options");
  gtk_container_set_border_width (GTK_CONTAINER (window), 4);
  
  box1 = gtk_vbox_new (FALSE, 0);
  gtk_container_add (GTK_CONTAINER (window), box1);
  gtk_widget_show (box1);
  
  frame = gtk_frame_new ("Start at Login");	
  
  box2 = gtk_vbox_new (FALSE, 0);
  gtk_container_set_border_width (GTK_CONTAINER (box2), 2);
  gtk_container_add (GTK_CONTAINER (frame), box2);
  gtk_widget_show (box2); 
  
  label = gtk_label_new ("You can start the menu manually by typing menu at the" 
								 " shell prompt if you disable the \"Start At Login\" feature.");
  gtk_label_set_justify (GTK_LABEL (label), GTK_JUSTIFY_FILL);
  
  gtk_label_set_line_wrap (GTK_LABEL (label), TRUE);
  gtk_box_pack_start (GTK_BOX (box2), label, FALSE, FALSE, 0);
  gtk_widget_show (label);	
  
  separator = gtk_menu_item_new ();
  gtk_box_pack_start (GTK_BOX (box2), separator, FALSE, FALSE, 0);
  gtk_widget_show (separator);
  
  box3 = gtk_hbox_new (FALSE, 0);
  gtk_box_pack_start (GTK_BOX (box2), box3, FALSE, FALSE, 0);
  gtk_widget_show (box3);
  
  button = gtk_radio_button_new_with_label (NULL, "Start At Login");
  gtk_box_pack_start (GTK_BOX (box3), button, FALSE, FALSE, 0);
  gtk_widget_show (button);
  
  group = gtk_radio_button_group (GTK_RADIO_BUTTON (button));
  button = gtk_radio_button_new_with_label(group, "Dont Start At Login");
  if(access(autoload, F_OK) == 0) 
	 {
		gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (button), TRUE);
	 }
  else 
	 {
		gtk_toggle_button_set_active (GTK_TOGGLE_BUTTON (button), FALSE);
	 }
  
  gtk_signal_connect (GTK_OBJECT (button), "toggled",
							 GTK_SIGNAL_FUNC(start_login), NULL);
  gtk_box_pack_start (GTK_BOX (box3), button, FALSE, FALSE, 0);
  gtk_widget_show (button);
  
  gtk_box_pack_start (GTK_BOX (box1), frame, FALSE, FALSE, 0);
  gtk_widget_show (frame); 
  
  button = gtk_button_new_with_label ("Close");
  gtk_signal_connect_object (GTK_OBJECT (button), "clicked",
									  GTK_SIGNAL_FUNC (gtk_widget_destroy),
									  GTK_OBJECT (window));
  gtk_box_pack_start (GTK_BOX (box1), button, FALSE, FALSE, 0);
  GTK_WIDGET_SET_FLAGS (button, GTK_CAN_DEFAULT);
  gtk_widget_grab_default (button);
  gtk_widget_show (button);
  gtk_widget_show (window);	
}

void checkChild(int sigint_flag)
{
  if (sigint_flag) 
	 kill (getpid(), SIGINT);  
}

void execute(char ** args)
{
  pid_t pid;
  int sigint_flag = 0;

  pid = fork();  /* spawn a child process */
  
  switch(pid) 
    {
    case -1:
		exit(1);
    case 0:
		checkChild(sigint_flag);
		break;
	 default:
		execvp(*args, args);
		break;
    }
}

void parse(char * buf, char **args)
{
  while (*buf != NULL) {
	 /* Strip whitespace.  Use nulls, so previous argument is terminated */
	 while ((*buf == ' ') || (*buf == '\t')) 
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
  char *sec;
  char *args[64];
  buf = strdup(gtk_object_get_data(passme, "command_key"));
  sec = strdup(gtk_object_get_data(passme, "section_key"));

  if (strcmp(sec, "Help") != 0)
	 {
		parse(buf, args);
		execute(args);
	 }
  else 
	 {
		helpitem_response(buf);
	 }
}


static void make_window(menuentry *mePtr, termentry *termPtr, int n)
{
  gint numSubs = countSubmenus(APPLIST);
  gint numSections = countSections(APPLIST);
  GtkWidget *submenu[numSubs], *sectionmenu[numSections], *window, *menu_items, *vbox, *hbox, *button;
  GtkTooltips *tooltips;
  gint sectionButton[numSections], i, getSecs = 0, getSubs = 0;
  gchar buf[128], *done = "", *doneSection = "null";
  gchar *optionxpm = strdup(XPMDIR);
  gchar *quitxpm = strdup(XPMDIR);
  optionxpm = strcat(optionxpm, "options.xpm");
  quitxpm = strcat(quitxpm, "logout.xpm");
  
  for (i=0; i< numSections; i++) 
	 sectionmenu[i] = gtk_menu_new();
  
  for (i=0; i< numSubs; i++) 
	 submenu[i] = gtk_menu_new();
  
  for (i=0; i < numSections; i++) 
	 sectionButton[i] = 0;
  
  /* create a new window */
  window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
  gtk_window_set_title (GTK_WINDOW (window), "Unix@CMS");
  gtk_signal_connect (GTK_OBJECT (window), "delete_event",
							 (GtkSignalFunc) gtk_main_quit, NULL);
  gtk_widget_realize(window);
  
  vbox = gtk_vbox_new (FALSE, 0);
  gtk_container_add (GTK_CONTAINER (window), vbox);
  gtk_widget_show (vbox);
  
  /* NEW TERMINAL BUTTON */
  button = gtk_button_new();
  gtk_object_set_data(GTK_OBJECT (button), "command_key", termPtr[0].termcmd);
  gtk_object_set_data(GTK_OBJECT (button), "section_key", mePtr[i].appsection);
  gtk_signal_connect (GTK_OBJECT (button), "clicked",
							 GTK_SIGNAL_FUNC (item_response), button);
  
  hbox = xpm_menu_box(window, no_xpm, termPtr[0].termxpm, termPtr[0].termname);
  gtk_widget_show(hbox);
  gtk_container_add (GTK_CONTAINER (button), hbox);
  gtk_widget_show(button);
  gtk_box_pack_start (GTK_BOX (vbox), button, TRUE, TRUE, 0);
  
  /* BEGIN BUILDING TOP LEVEL BUTTONS */
  for (i = 0; i < n; i++) 
	 {
		if ((strcmp(doneSection, mePtr[i].appsection) != 0)) 
		  {
			 button = gtk_button_new();
			 gtk_signal_connect_object (GTK_OBJECT (button), "event",
												 GTK_SIGNAL_FUNC (button_press), GTK_OBJECT (sectionmenu[getSecs]));
			 hbox = xpm_menu_box(window, r_arrow_xpm, mePtr[i].sectionxpm, mePtr[i].appsection);
			 gtk_widget_show(hbox);
			 gtk_container_add (GTK_CONTAINER (button), hbox);
			 gtk_widget_show(button);
			 gtk_box_pack_start (GTK_BOX (vbox), button, TRUE, TRUE, 2);
			 gtk_widget_show (button);
			 getSecs++;
			 doneSection =  mePtr[i].appsection;
		  }
		if (strcmp(mePtr[i].appsubmenu, ""))  /* There is a sub menu */
			 {
				if (strcmp(done, mePtr[i].appsubmenu)) /* already done submenu label */
				  { 
					 getSubs++;
					 sprintf (buf, mePtr[i].appsubmenu);
					 menu_items = gtk_menu_item_new_with_label (buf);
					 gtk_widget_set_name (menu_items, "menu_items");
					 gtk_container_add (GTK_CONTAINER (sectionmenu[getSecs-1]), menu_items);
					 gtk_widget_show (menu_items);
					 gtk_menu_item_set_submenu (GTK_MENU_ITEM (menu_items), submenu[getSubs]);
					 done = mePtr[i].appsubmenu; /* Make submenus unique */
				  }
				if (strcmp(done, mePtr[i].appname)) /* App in submenu */
				  {
					 sprintf (buf, mePtr[i].appname);
					 menu_items = gtk_menu_item_new_with_label (buf);
					 gtk_menu_append (GTK_MENU (submenu[getSubs]), menu_items);
					 /* Find number of args */
					 gtk_object_set_data(GTK_OBJECT (menu_items), "command_key", mePtr[i].appcommand);
					 gtk_object_set_data(GTK_OBJECT (menu_items), "section_key", mePtr[i].appsection);
					 gtk_signal_connect (GTK_OBJECT (menu_items), "activate",
												GTK_SIGNAL_FUNC (item_response),	menu_items);
					 gtk_widget_show (menu_items);
				  }
			 }
		  else /* no submenu */
			 {
				if (strcmp(done, mePtr[i].appname)) 
				  {
					 sprintf (buf, mePtr[i].appname);
					 menu_items = gtk_menu_item_new_with_label (buf);
					 gtk_menu_append (GTK_MENU (sectionmenu[getSecs-1]), menu_items);
					 gtk_object_set_data(GTK_OBJECT (menu_items), "command_key", mePtr[i].appcommand);
					 gtk_object_set_data(GTK_OBJECT (menu_items), "section_key", mePtr[i].appsection);
					 gtk_signal_connect (GTK_OBJECT (menu_items), "activate",
												GTK_SIGNAL_FUNC (item_response),	menu_items);
					 gtk_widget_show (menu_items);
				  }
			 }
	 }
  
  button = gtk_button_new();
  tooltips = gtk_tooltips_new ();
  gtk_signal_connect (GTK_OBJECT (button), "clicked",
							 GTK_SIGNAL_FUNC (option_response), (gpointer) "Options");
  hbox = xpm_menu_box(window, no_xpm, optionxpm, "Options");
  gtk_tooltips_set_tip (tooltips, button, "Automatic startup of the menu at login can be disabled by clicking on Options", NULL);
  gtk_widget_show(hbox);
  gtk_container_add (GTK_CONTAINER (button), hbox);
  gtk_widget_show(button);
  gtk_box_pack_start (GTK_BOX (vbox), button, TRUE, TRUE, 2);
  gtk_widget_show (button);
  
  button = gtk_button_new();
  gtk_signal_connect (GTK_OBJECT (button), "clicked",
							 GTK_SIGNAL_FUNC (destroy), (gpointer) "Exit");
  hbox = xpm_menu_box(window, no_xpm, quitxpm, "Quit");
  gtk_widget_show(hbox);
  gtk_container_add (GTK_CONTAINER (button), hbox);
  gtk_widget_show(button);
  gtk_box_pack_start (GTK_BOX (vbox), button, TRUE, TRUE, 2);
  gtk_widget_show (button);
  gtk_widget_show (window);
  gtk_main ();
}

int main( int argc, char *argv[] )
{
  gint c, readrc = 0;
  gint n = countElements(APPLIST);
  menuentry *mePtr = malloc( n * sizeof (menuentry) );
  termentry *termPtr = malloc( 1 * sizeof (menuentry) );
  char autoload[200];
  char menudir[200];
  char *home = strdup(HOMED);
  char *menufile = strdup(MENUFILE);
  char *menud = strdup(MENUD);

  gtk_init (&argc, &argv);
  /* Parse commandline arguments */
  while (--argc > 0 && (*++argv)[0] == '-')
	 while (c = *++argv[0])
		switch (c) 
		  {
		  case 'r': /* started from login script */
			 readrc = 1;
			 break;
		  default:
			 argc = 0; 
			 break;
		  }
  sprintf(menudir, "%s%s", home, menud);
  sprintf(autoload, "%s%s%s", home, menudir, menufile);
  
  if(access(menudir, F_OK) != 0) 
	 mkdir(menudir, 0700);
  
  if (readrc != 1)  /* no arguments were passed */
	 {
		parseDoc(APPLIST, mePtr, termPtr);
		make_window(mePtr, termPtr, n);
	 }
  else  /* The -r option was passed. Need to test if they want to start menu */
	 {
		if(access(autoload, F_OK) == 0) /* Previously select not to start menu */
			 return EXIT_SUCCESS;
		else /* Have selected to start menu */
		  {
			 parseDoc(APPLIST, mePtr, termPtr);
			 make_window(mePtr, termPtr, n);
		  }
	 }
  return EXIT_SUCCESS;
}

--q9KOos5vDmpwPx9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="menu.h"

/* Contains XPM data for arrow and transparent xpm
 * and the location of applist.xml, the xpm files
 * and the help files.
 */

/* THESE NEED TO CHANGE TO REFLECT THE LOCATION OF THE FILES */
#define APPLIST "/home/bm98/prg/gtk-menu/current/applist.xml"
#define XPMDIR "/home/bm98/prg/gtk-menu/current/xpms/"
#define HELPDIR "/home/bm98/prg/gtk-menu/current/help/"
/* END CHANGE */
#define HOMED strdup(getenv("HOME"))
#define MENUD "/.cmsmenu"
#define MENUFILE "/menu-autoload"

static gchar * no_xpm[] = {
"1 1 1 1",
"  c None",
" "};

static char * r_arrow_xpm[] = {
"14 14 26 1",
"  c None",
". c #B1B1B1",
"+ c #404040",
"@ c #323232",
"# c #414141",
"$ c #767676",
"% c #979797",
"& c #000000",
"* c #3B3B3B",
"= c #292929",
"- c #969696",
"; c #242424",
"> c #EBEBEB",
", c #F4F4F4",
"' c #272727",
") c #949494",
"! c #393939",
"~ c #FDFDFD",
"{ c #5F5F5F",
"] c #717171",
"^ c #1B1B1B",
"/ c #D5D5D5",
"( c #515151",
"_ c #B0B0B0",
": c #737373",
"< c #0D0D0D",
"     .+       ",
"     .@#      ",
"     .$%#     ",
"     .$&%#    ",
"*****=$&&-#   ",
";......&&&-#  ",
"'&&&&&&&&&&-# ",
"'&&&&&&&&&&&-]",
"'&&&&&&&&&&-] ",
";......&&&-]  ",
"$$$$$($&&-]   ",
"     _$&-]    ",
"     _:-]     ",
"     _<]      "};

--q9KOos5vDmpwPx9o--
