From: "Mariano Moreyra" <moremari@aca.org.ar>
Subject: RE: Question!
Date: Thu, 4 Sep 2003 15:41:36 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000401c37314$2c440020$0b04a8c0@aca.org.ar>
References: <20030904175335.GA25820@lsd.di.uminho.pt>
Reply-To: <mariano_moreyra@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030904175335.GA25820@lsd.di.uminho.pt>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Luciano Miguel Ferreira Rocha' <luciano@lsd.di.uminho.pt>, 'Jorge Opaso Pazos' <jopaso@trofeospazos.com>
Cc: linux-c-programming@vger.kernel.org

The problem is that the child is waiting for the script to finish (the =
one
that start mysqld) so the child sends a response to the client telling =
him
that the script finished ok (or not).
So, if I close the socket, the child can't send the response.
I tried to find a solution to this situation, but the client needs to k=
now
the exit status of the script.
The parent process has his own socket listening for incoming connection=
s and
forks the childs. These childs accepts the connections on his own socke=
ts,
so  childs doesn't inherit the parent's socket.
It's ok to do that?? Or I'm doing something wrong with the sockets??
Thanks a lot to all of you for your answers!!

-----Mensaje original-----
De: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]En nombre de Luciano
Miguel Ferreira Rocha
Enviado el: Jueves, 04 de Septiembre de 2003 14:54
Para: Jorge Opaso Pazos
CC: linux-c-programming@vger.kernel.org
Asunto: Re: Question!


On Thu, Sep 04, 2003 at 12:04:43PM -0400, Jorge Opaso Pazos wrote:
> Mariano Moreyra wrote:
> >Hola!
> >Te mando la seccion del programa que ejecuta el script en si.
> >
> >Este proceso lo unico que espera del script es que el mismo conteste=
 con
un
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
tar
el
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
> >>	- When the bash script runs the safe_mysql script to run MySql
> >>	engine,
> >
> >it's
> >
> >>like the child process never ends.
> >>	  And because of that, the parent can't close the connection with =
the
> >>client socket.
> >>	- But if the bash script doesn't run the safe_mysql script...the
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
>
> English: I suspect that the problem is that safe_mysqld don't return
> until mysqld ends.
> Try to execute safe_mysqld in background in the shellscript:
>
> 	if ! pgrep mysqld
> 	then
> 		/usr/bin/safe_mysqld &
> 	fi
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
 no
> termina mysqld. Se podr=EDa solucionar llamando a safe_mysqld en
> "background" de la forma anterior.

Portugues: AH! that would be something :)

Regards,
Luciano Rocha
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
