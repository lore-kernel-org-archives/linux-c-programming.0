From: "John T. Williams" <jowillia@vt.edu>
Subject: Memory Overright problem. (sorry if this is a repeat )
Date: Wed, 02 Jun 2004 00:07:24 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1086149244.22758.17.camel@localhost>
Reply-To: jtwilliams@vt.edu
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-2XkWwwxAX81qgEz3nJ71"
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming <linux-c-programming@vger.kernel.org>


--=-2XkWwwxAX81qgEz3nJ71
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

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



--=-2XkWwwxAX81qgEz3nJ71
Content-Disposition: attachment; filename=connect.zip
Content-Type: application/zip; name=connect.zip
Content-Transfer-Encoding: base64

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

--=-2XkWwwxAX81qgEz3nJ71--

