From: =?ISO-8859-1?Q?Dar=EDo_Mariani?= <dmarian@fi.uba.ar>
Subject: Creating an NSS module
Date: Mon, 28 Apr 2003 15:54:41 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3EAD78F1.9050408@fi.uba.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; 
To: linux-c-programming@vger.kernel.org

  Hello:
  I'm creating an NSS module for the passwd and group databases. I=20
implemented the following functions:

nss_status _nss_authon_setgrent()
nss_status _nss_authon_endgrent()
nss_status _nss_authon_getgrent_r (group * gr, char * buffer, size_t=20
buflen, int * errnop)
nss_status _nss_authon_getgrnam_r (const char * name, struct group * gr=
,=20
char * buffer, size_t buflen, int * errnop)
nss_status _nss_authon_getgrgid_r (const gid_t gid, struct group * gr,=20
char * buffer, size_t buflen, int *errnop)

nss_status _nss_authon_setpwent()
nss_status _nss_authon_endpwent()
nss_status _nss_authon_getpwent_r (passwd * pw, char * buffer, size_t=20
buflen, int * errnop)
nss_status _nss_authon_getpwnam_r (const char * name, struct passwd *=20
result, char * buffer, size_t buflen, int * errnop)
nss_status _nss_authon_getpwuid_r (uid_t uid, passwd * result, char *=20
buffer, size_t buflen, int * errnop)

The libc functions getgrent(), getgrnam(), getgrgid() and the finger=20
command work, but the groups command doesn't and also the chgrp doesn't=
=20
work for an user other than root. Any ideas on what happens? Am I=20
missing some function?
Thanks,
            Dar=EDo

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
