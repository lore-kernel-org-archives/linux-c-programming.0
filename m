From: Luciano Miguel Ferreira Rocha <luciano@lsd.di.uminho.pt>
Subject: Re: Question!
Date: Thu, 4 Sep 2003 18:53:35 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030904175335.GA25820@lsd.di.uminho.pt>
References: <000001c372eb$9ee69b20$0b04a8c0@aca.org.ar> <3F57629B.2000004@trofeospazos.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3F57629B.2000004@trofeospazos.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jorge Opaso Pazos <jopaso@trofeospazos.com>
Cc: linux-c-programming@vger.kernel.org

On Thu, Sep 04, 2003 at 12:04:43PM -0400, Jorge Opaso Pazos wrote:
> Mariano Moreyra wrote:
> >Hola!
> >Te mando la seccion del programa que ejecuta el script en si.
> >
> >Este proceso lo unico que espera del script es que el mismo conteste=
 con un
> >"-" si hubo algun error o con un "+" si salio todo bien
> >
> >----------------------------------------------------------
> >    if(err=3D=3D0) {
> >      pipe_in =3D popen(shell_cmd,"r");
> >      fgets(response,5,pipe_in);
> >
> >      if(response[0]=3D=3D'-') {
> >        err=3D1;
> >      } else if(response[0]=3D=3D'+') {
> >        err=3D0;
> >      };
> >      while(fgets(response,5,pipe_in)) {
> >      };
> >      pclose(pipe_in);
> >    };
> >-----------------------------------------------------------
> >
> >El script lo unico que hace es copiar algunos archivos y luego leven=
tar el
> >MySQL con el
> >safe_mysqld
> >
> >Espero que esto sirva! Muchas gracias!!
> >Saludos!!
> >
> >
> >
> >-----Mensaje original-----
> >De: linux-c-programming-owner@vger.kernel.org
> >[mailto:linux-c-programming-owner@vger.kernel.org]En nombre de Jorge
> >Opaso Pazos
> >Enviado el: Mi=E9rcoles, 03 de Septiembre de 2003 18:09
> >Para: linux-c-programming@vger.kernel.org
> >Asunto: Re: Question!
> >
> >
> >Mariano Moreyra wrote:
> >
> >>Hi!!
> >>First...I'd like to know if there is any kind of digest on this lis=
t to
> >
> >see
> >
> >>old submited messages.
> >>
> >>Now...I have a little problem.
> >>I have a process that is listening for incoming connections on a so=
cket.
> >>That process waits for a command and then
> >>forks a child to run a bash script.
> >>The problems is:
> >>	- When the bash script runs the safe_mysql script to run MySql=20
> >>	engine,
> >
> >it's
> >
> >>like the child process never ends.
> >>	  And because of that, the parent can't close the connection with =
the
> >>client socket.
> >>	- But if the bash script doesn't run the safe_mysql script...the=20
> >>	child
> >>process dies successfully and everything end
> >>	  Ok
> >>
> >>Sorry about my english, but I hope that I made my self clear....
> >>Bye!
> >>
> >>-
> >>To unsubscribe from this list: send the line "unsubscribe
> >
> >linux-c-programming" in
> >
> >>the body of a message to majordomo@vger.kernel.org
> >>More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >>
> >
> >
> >env=EDame el script.
> >
> >-
> >To unsubscribe from this list: send the line "unsubscribe
> >linux-c-programming" in
> >the body of a message to majordomo@vger.kernel.org
> >More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
>=20
> English: I suspect that the problem is that safe_mysqld don't return=20
> until mysqld ends.
> Try to execute safe_mysqld in background in the shellscript:
>=20
> 	if ! pgrep mysqld
> 	then
> 		/usr/bin/safe_mysqld &
> 	fi=09
As the socket is inherited, the remote client will never exit.
If the popen is after a fork(), then it doesn't matter if safe_mysql do=
esn't
end, as the parent wouldn't be waiting on it.

My bet is in the socket not being closed, either in the parent, child, =
or
both, or before the execution of safe_mysql. (If mysqld inherits the so=
cket,
then the connection won't close until mysqld does.)

> Castellano: El problema debe ser que no termina safe_mydqld hasta que=
 no=20
> termina mysqld. Se podr=EDa solucionar llamando a safe_mysqld en=20
> "background" de la forma anterior.

Portugues: AH! that would be something :)

Regards,
Luciano Rocha
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
