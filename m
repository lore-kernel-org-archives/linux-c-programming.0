From: "Alphex K." <alphex@crew.org.ru>
Subject: Some troubles with dynamic structures ;-(
Date: Thu, 22 Jan 2004 23:23:45 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040122232345.75911b51.alphex@crew.org.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi, guys
I'm develop some program using gtk+ with dynamic structures

I'm have some problem with dynamic structures in thi code:
--
#include "oaptypes.h"

OapClient *clients;

OapClient * AddClient(OapClient * clientpointer,
		      int id,const char *nname,char *nmainsname,
		      char *nemail,char *naddress,char *noffaddress,
		      char *nicq,char *ninn,char *nphone,int nstatus,
		      char *nnotes) // this function add a new structure
{
   OapClient * tt=clientpointer;
   // check and to dynamic structure (begin)
   if (clientpointer!=NULL)
     {
	while (clientpointer->next!=NULL)
	  clientpointer=clientpointer->next;
	clientpointer->next=(struct OapClient  *) malloc(sizeof (OapClient));
	clientpointer=clientpointer->next;
	clientpointer->next=NULL;
	clientpointer->cid=id;
	/*debugl*/ printf("name is:%s\n",nname);
	clientpointer->name=nname;
	/*debugl*/ printf("in db name is:%s\n",clientpointer->name);
	clientpointer->mainsname=nmainsname;
	clientpointer->email=nemail;
	clientpointer->address=naddress;
	clientpointer->offaddress=noffaddress;
	clientpointer->icq=nicq;
	clientpointer->inn=ninn;
	clientpointer->phone=nphone;
	clientpointer->status=nstatus;
	clientpointer->notes=nnotes;
	return tt;
     }
   else
     {
	clientpointer=(struct OapClient  *) malloc(sizeof (OapClient));
	/*debug8*/ //clientpointer=malloc(4096);
	clientpointer->next=NULL;
	clientpointer->cid=id;
	clientpointer->name=nname;
	clientpointer->mainsname=nmainsname;
	clientpointer->email=nemail;
	clientpointer->address=naddress;
	clientpointer->offaddress=noffaddress;
	clientpointer->icq=nicq;
	clientpointer->inn=ninn;
	clientpointer->phone=nphone;
	clientpointer->status=nstatus;
	clientpointer->notes=nnotes;
	return clientpointer;
     }
   // end
}

// interface functions section

void _AddClient(void) //this function add a new structure, variables from gtk face =)
{
   int astatus;
   int aid;
   char *aname;
   char *amainsname;
   char *aemail;
   char *aaddress;
   char *aoffaddress;
   char *aicq;
   char *ainn;
   char *aphone;
   char *anotes;
   
   // get values from "add client" win
   aname=gtk_entry_get_text(GTK_ENTRY(namecentry));
   /*debugh*/ printf("name from entry is:%s\n",aname);
   /*debug1*/ //sprintf(aname,"Default");
   amainsname=gtk_entry_get_text(GTK_ENTRY(mainercentry));
   aemail=gtk_entry_get_text(GTK_ENTRY(emailcentry));
   aaddress=gtk_entry_get_text(GTK_ENTRY(physaddrentry));
   aoffaddress=gtk_entry_get_text(GTK_ENTRY(offaddrentry));
   aicq=gtk_entry_get_text(GTK_ENTRY(icqentry));
   ainn=gtk_entry_get_text(GTK_ENTRY(innentry));
   aphone=gtk_entry_get_text(GTK_ENTRY(phoneentry));
   anotes=gtk_entry_get_text(GTK_ENTRY(notesentry));
   // for debug only
   astatus=0;
   //for test only
   aid=12;
   // so and add values to the client db
   clients=AddClient(clients,aid,aname,amainsname,aemail,
		     aaddress,aoffaddress,aicq,ainn,aphone,
		     astatus,anotes);
   /*debug1*/ //free(aname);
}

void _FillClientsTable(OapClient *pointer) // it read from dynamic structure and fill gtk_clist
{
   gchar *entr[4]; /*to fill*/

   
   // adding to table
   if (pointer!=NULL)
     {

     while(pointer!=NULL)
       {
	  entr[0]=malloc(4);
	  sprintf(entr[0],"%d",clients->cid);
	  entr[1]=malloc(4);
	  sprintf(entr[1],"%d",clients->status);
	   //entr[0]=pointer->icq;
	  //entr[1]=pointer->icq;
	  /*debugj*/ printf("DEBUG: in db ->%s\n",pointer->name);
	  entr[2]=(char *)pointer->name;
	  /*debugj*/ printf("DEBUG: in entr ->%s\n",entr[2]);
	  entr[3]=pointer->mainsname;
	  entr[4]=pointer->email;
	  gtk_clist_append(GTK_CLIST(clclist),entr);
	  pointer=pointer->next;
	  free(entr[0]);
	  free(entr[1]);
       }
     }

}
--
so and structure
typedef struct
{
   int cid;
   char *name;
   char *mainsname;
   char *email;
   char *address;
   char *offaddress;
   char *icq;
   char *inn;
   char *phone;
   int status;
   char *notes;
   struct OapClient *next;
} OapClient;


--
Where I have a mistake,
integers in structure work normally, but 
I'm have a problem with pointers to char 


thanx


-- 
Alphex Kaanoken
Senior developer of Crew IT research labs
web: http://crew.org.ru
mailto:Alphex@Crew.Org.RU
