From: "John T. Williams" <jowillia@vt.edu>
Subject: Nevermind, I'm stupid:  Memory Overright problem.
Date: Wed, 02 Jun 2004 00:18:26 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1086149906.23026.2.camel@localhost>
Reply-To: jtwilliams@vt.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Anyone who wondering, for some reason (probably blind habit) I was using the 
sizeof() function in my malloc call, when I shouldn't have been, consiquently i was
makeing a bunch of arrays 4 bytes long

>>shakes head, hits self on forhead


While trying to write a function to parse a http url, I ran accross a
strange problem, which is that when I malloc some memory, suddenly some
memory already allocated changes its contents.  I can't figure out where
the problem is so I was hoping someone might point me at it.  

I'm including the code here, and as an attachment 


The problem line is pointed out with at 

***************here********************
***************end here ***************
and its affecting the memory pointed at by http_addr->abspath

#####################################################
#include <string.h>

#ifndef NULL
#define NULL (void*) 0
#endif


typedef struct _http {
  char* query;	// query string
  int  port;	// port number if other then 80
  char* abspath;// absolute path of file on serve
  char* host; 	// domain ex: www.something.com

} http_url;

int parsehttp( http_url*, char* );
int initurl(http_url*);
int cleanurl(http_url*);

int
initurl( http_url* url)
{
  if( !url ) return -1;
  url->host = NULL;
  url->query = NULL;
  url->abspath = NULL;
  url->port = 80;
}

int cleanurl(http_url* url) {
  if( !url ) return -1;
  if(url->host) {
    free(url->host);
    url->host = NULL;
  }
  if(url->query) {
    free(url->query);
    url->query = NULL;
  }
  if(url->abspath) {
    free(url->abspath);
    url->abspath = NULL;
  }
  url->port = 80;
}

int
parsehttp( http_url* http_addr, char* urlstr )
{
  char* host_ptr;
  char* abspath_ptr;
  char* port_ptr;
  char* query_ptr;

  int host_len,
    abspath_len,
    port_len,
    query_len,
    total_len;


  //check for null parameters:
  if( !http_addr || !urlstr ) {
    perror("error called parsehttp with NULL\n");
    return -1;
  }

  //check for http:// head
  if( strncmp(urlstr, "http://", 7) ) {
    perror("url not propperly formatted: %s\n", urlstr);
    return -2;
  }

  // find the starting point for each string
  // if there indicating character is missing *ptr == NULL;
  port_ptr = abspath_ptr = query_ptr = host_ptr = &urlstr[7];
  while(port_ptr && *port_ptr != ':') port_ptr++; //search for ':'
indicating
  //					      		a port in this url
  while(abspath_ptr && *abspath_ptr != '/') abspath_ptr++;
  //					     	search for a '/' indicating
  //						a absolute path listed
  while(query_ptr && *query_ptr != '?') query_ptr++;
  //						search for a '?' indicating
  //						a query is listed

  // Parse out the query if any and record its length
  if(*query_ptr) {
    query_len = strlen(query_ptr);
    http_addr->query = (char*) malloc( sizeof( query_len + 128 ) );
    strncpy(http_addr->query, &query_ptr[1], query_len - 1 );
    http_addr->query[query_len - 1] = '\0';
  } else query_len = 0;

  // Parse out the abspath if any and record its length
  if(*abspath_ptr) {
    abspath_len = strlen(abspath_ptr) - query_len;
    http_addr->abspath = (char*) malloc( sizeof( abspath_len + 128 ) );
    strncpy(http_addr->abspath, abspath_ptr, abspath_len);
    http_addr->abspath[abspath_len] = '\0';
  } else abspath_len = 0;

  // Parse out the port number if any
  if(*port_ptr) {  // if a port was found
    port_len = strlen( port_ptr) - abspath_len - query_len;
    port_ptr++; //move past ':'
    http_addr->port = atoi(port_ptr);
  } else port_len = 0;
  printf("port length: %i\n", port_len);

  // Parse out the host str if any
  if(*host_ptr) {
    host_len = strlen(host_ptr) - port_len - abspath_len - query_len;

/***************here********************/
    http_addr->host = (char*) malloc( sizeof( host_len + 128 ) );
/***************end here ***************/

    strncpy(http_addr->host, host_ptr, host_len );
    http_addr->host[host_len] = '\0';
  }


  return 0;
}


int
main(int argC, char** argV, char** envp)
{
  http_url  url;

  initurl( &url );
  parsehttp( &url,
"http://www.vt.edu:23/users/jowillia/index.html?t=12");


  printf("http://");
  //  if(url.host) printf("%s", url.host);
  if(url.port != 80) printf(":%i", url.port);
  if(url.abspath) printf("%s", url.abspath);
  if(url.query) printf("?%s", url.query);
  printf("\n");

  cleanurl( &url );


  return 0;
}



