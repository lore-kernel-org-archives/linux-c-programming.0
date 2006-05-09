From: Christian Stalp <stalp@imbei.uni-mainz.de>
Subject: IPC-Semaphore
Date: Tue, 9 May 2006 19:06:43 +0200
Message-ID: <200605091906.43370.stalp@imbei.uni-mainz.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

Hello out there,
Im working on a solution to delete a semaphore, which is used by other=20
processes.
The semaphore was created by a server-process. It write the semaphore-k=
ey into=20
a file ( where the clients can read it, and get access to the semaphore=
 )
After that the server proceeds its work.=20
When the server finished its work, it destroys the semaphore. And here =
we have=20
quandary. In this very moment the clients still need the semaphore.

In the semctl-manual we have a several arguments, amongst others.
GETZCNT     The  system  call returns the value of semzcnt for the sem-
                   num-th semaphore of the set (i.e. the number  of  pr=
ocesses
                   waiting for semval of the semnum-th semaphore of the=
 set to
                   become 0).  The calling process must have read acces=
s priv-
                   ileges on the semaphore set.
or
GETNCNT     The  system  call returns the value of semncnt for the sem-
                   num-th semaphore of the set (i.e. the number  of  pr=
ocesses
                   waiting  for  an  increase  of  semval  for  the  se=
mnum-th
                   semaphore of the set).  The calling process must hav=
e  read
                   access privileges on the semaphore set.

based on this I made this function:
/* Loeschen einer Semaphore                                            =
   */
int loesche_semaphore ( int kennung )
{
  union semun mysem;
  int semnum      =3D 0,
      rueckgabe_1 =3D 0,
      rueckgabe_2 =3D 0;

  while ( 1 )
  {
     if ( ( rueckgabe_1 =3D semctl ( kennung, semnum, GETZCNT, mysem ) =
) =3D=3D -1 )
     {
         perror ( "Fehler beim bestimmen der Semaphor-Wartelist\n" );
         exit ( errno );
     }
     else if ( ( rueckgabe_2 =3D semctl ( kennung, semnum, GETNCNT, mys=
em ) ) =3D=3D=20
-1 )
     {
         perror ( "Fehler beim bestimmen der Semaphor-Wartelist\n" );
         exit ( errno );
     }
     else
     {
         printf ( "Die Menge der Prozesse ist gleich: %d und %d \n",=20
rueckgabe_1, rueckgabe_2 );
         break;
     }
  }

  if ( ( semctl ( kennung, 0, IPC_RMID, mysem ) ) =3D=3D -1 )
  {
      perror ( "Fehler beim loeschen der Semaphore\n" );
      exit ( errno );
  }

 return ( 1 );
}

I know that so far this function doesn't work. It should only show me i=
f some=20
process try to access the semaphore.=20
But neither GETZCNT nor GETNCNT give me info about processes which try =
to=20
access the semaphore. Both gave me a '0'

What is the problem, what I have missed?

Thank you all...

Gruss Christian

--=20
Christian Stalp
Institut f=FCr Medizinische Biometrie, Epidemiologie und Informatik
Johannes-Gutenberg-Universit=E4t Mainz
Tel.: 06131 / 17-3107
E-Mail: stalp@imbei.uni-mainz.de
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
