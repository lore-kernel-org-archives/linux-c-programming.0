From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: Memory Overright problem. (sorry if this is a repeat )
Date: Wed, 2 Jun 2004 08:30:12 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040602063012.GJ20632@lug-owl.de>
References: <1086149244.22758.17.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jAJnlX6Iz2QeVWJH"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1086149244.22758.17.camel@localhost>
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming <linux-c-programming@vger.kernel.org>


--jAJnlX6Iz2QeVWJH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-06-02 00:07:24 -0400, John T. Williams <jowillia@vt.edu>
wrote in message <1086149244.22758.17.camel@localhost>:
> #####################################################
> #include <string.h>
>=20
> #ifndef NULL
> #define NULL (void*) 0
> #endif

There's a header file for NULL:)

> typedef struct _http {
>   char* query;	// query string
>   int  port;	// port number if other then 80
>   char* abspath;// absolute path of file on serve
>   char* host; 	// domain ex: www.something.com
>=20
> } http_url;
>=20
> int parsehttp( http_url*, char* );
> int initurl(http_url*);
> int cleanurl(http_url*);
>=20
> int
> initurl( http_url* url)
> {
>   if( !url ) return -1;
>   url->host =3D NULL;
>   url->query =3D NULL;
>   url->abspath =3D NULL;
>   url->port =3D 80;
> }
>=20
> int cleanurl(http_url* url) {
>   if( !url ) return -1;
>   if(url->host) {
>     free(url->host);
>     url->host =3D NULL;
>   }
>   if(url->query) {
>     free(url->query);
>     url->query =3D NULL;
>   }
>   if(url->abspath) {
>     free(url->abspath);
>     url->abspath =3D NULL;
>   }
>   url->port =3D 80;
> }
>=20
> int
> parsehttp( http_url* http_addr, char* urlstr )
> {
>   char* host_ptr;
>   char* abspath_ptr;
>   char* port_ptr;
>   char* query_ptr;
>=20
>   int host_len,
>     abspath_len,
>     port_len,
>     query_len,
>     total_len;
>=20
>=20
>   //check for null parameters:
>   if( !http_addr || !urlstr ) {
>     perror("error called parsehttp with NULL\n");

perror does only make sense if you call it after a system call, that
failed. In this case, I'd use fprintf (stderr, "message"); .

>     return -1;
>   }
>=20
>   //check for http:// head
>   if( strncmp(urlstr, "http://", 7) ) {
>     perror("url not propperly formatted: %s\n", urlstr);
>     return -2;
>   }
>=20
>   // find the starting point for each string
>   // if there indicating character is missing *ptr =3D=3D NULL;
>   port_ptr =3D abspath_ptr =3D query_ptr =3D host_ptr =3D &urlstr[7];
>   while(port_ptr && *port_ptr !=3D ':') port_ptr++; //search for ':'

So if there's no ':' (like in "http://somehost.com/index.html", you'll
see your first crash while overstepping the final '\0'. You probably
intended to do

	while (*port_ptr && *port_ptr !=3D ':')
		port_ptr++;

This'll pay attention to the final zero.

> indicating
>   //					      		a port in this url
>   while(abspath_ptr && *abspath_ptr !=3D '/') abspath_ptr++;
>   //					     	search for a '/' indicating
>   //						a absolute path listed
>   while(query_ptr && *query_ptr !=3D '?') query_ptr++;
>   //						search for a '?' indicating
>   //						a query is listed

Same here.

>   // Parse out the query if any and record its length
>   if(*query_ptr) {
>     query_len =3D strlen(query_ptr);

It's still pointing to the leading '?' of the supplied arguments, right?

>     http_addr->query =3D (char*) malloc( sizeof( query_len + 128 ) );

Here's a servere one! It will probably allocate 4 bytes - query_len is
an integer! This should have been

	http_addr->query =3D (char *) malloc (query_len + 128);

>     strncpy(http_addr->query, &query_ptr[1], query_len - 1 );

=2E..and a check for malloc's return value (if it failed, it might have
returned NULL) is missing, too. However, you're properly dealing with
the initial '?'.

>     http_addr->query[query_len - 1] =3D '\0';
>   } else query_len =3D 0;
>
>   // Parse out the abspath if any and record its length
>   if(*abspath_ptr) {
>     abspath_len =3D strlen(abspath_ptr) - query_len;
>     http_addr->abspath =3D (char*) malloc( sizeof( abspath_len + 128 ) );
>     strncpy(http_addr->abspath, abspath_ptr, abspath_len);

Same here - you allocated 4 bytes, forgot to check and write the full
path (which is probably longer than 3 bytes + '\0') to it.

>     http_addr->abspath[abspath_len] =3D '\0';
>   } else abspath_len =3D 0;
>=20
>   // Parse out the port number if any
>   if(*port_ptr) {  // if a port was found
>     port_len =3D strlen( port_ptr) - abspath_len - query_len;
>     port_ptr++; //move past ':'
>     http_addr->port =3D atoi(port_ptr);
>   } else port_len =3D 0;
>   printf("port length: %i\n", port_len);
>=20
>   // Parse out the host str if any
>   if(*host_ptr) {
>     host_len =3D strlen(host_ptr) - port_len - abspath_len - query_len;

This looks fragile. Don't ask me why, but I'd probably written that
using strcspn().

> /***************here********************/
>     http_addr->host =3D (char*) malloc( sizeof( host_len + 128 ) );
> /***************end here ***************/

You're only allocating 4 bytes and forget to check:)

>     strncpy(http_addr->host, host_ptr, host_len );
>     http_addr->host[host_len] =3D '\0';
>   }
>=20
>=20
>   return 0;
> }
>=20
>=20
> int
> main(int argC, char** argV, char** envp)
> {
>   http_url  url;
>=20
>   initurl( &url );
>   parsehttp( &url,
> "http://www.vt.edu:23/users/jowillia/index.html?t=3D12");
>=20
>=20
>   printf("http://");
>   //  if(url.host) printf("%s", url.host);
>   if(url.port !=3D 80) printf(":%i", url.port);
>   if(url.abspath) printf("%s", url.abspath);
>   if(url.query) printf("?%s", url.query);
>   printf("\n");
>=20
>   cleanurl( &url );
>=20
>=20
>   return 0;
> }
>=20
>=20



--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--jAJnlX6Iz2QeVWJH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAvXP0Hb1edYOZ4bsRAvFRAJ0Vx9c4PuYMZP0M72BJrHYcU0RpYgCfWCuW
RJNjCn5U/NLM/wm4fjz6yyg=
=w5zY
-----END PGP SIGNATURE-----

--jAJnlX6Iz2QeVWJH--
