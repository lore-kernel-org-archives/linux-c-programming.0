From: Jorge Opaso Pazos <jopaso@trofeospazos.com>
Subject: Re: Question!
Date: Fri, 05 Sep 2003 00:16:52 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F580E34.8090905@trofeospazos.com>
References: <000401c37314$2c440020$0b04a8c0@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <000401c37314$2c440020$0b04a8c0@aca.org.ar>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org

Mariano Moreyra wrote:
> The problem is that the child is waiting for the script to finish (th=
e one
> that start mysqld) so the child sends a response to the client tellin=
g him
> that the script finished ok (or not).
> So, if I close the socket, the child can't send the response.
> I tried to find a solution to this situation, but the client needs to=
 know
> the exit status of the script.
> The parent process has his own socket listening for incoming connecti=
ons and
> forks the childs. These childs accepts the connections on his own soc=
kets,
> so  childs doesn't inherit the parent's socket.
> It's ok to do that?? Or I'm doing something wrong with the sockets??
> Thanks a lot to all of you for your answers!!
>=20
> -----Mensaje original-----
> De: linux-c-programming-owner@vger.kernel.org
> [mailto:linux-c-programming-owner@vger.kernel.org]En nombre de Lucian=
o
> Miguel Ferreira Rocha
> Enviado el: Jueves, 04 de Septiembre de 2003 14:54
> Para: Jorge Opaso Pazos
> CC: linux-c-programming@vger.kernel.org
> Asunto: Re: Question!
>=20
>=20
> On Thu, Sep 04, 2003 at 12:04:43PM -0400, Jorge Opaso Pazos wrote:
>=20
>>Mariano Moreyra wrote:
>>
>>>Hola!
>>>Te mando la seccion del programa que ejecuta el script en si.
>>>
>>>Este proceso lo unico que espera del script es que el mismo conteste=
 con
>=20
> un
>=20
>>>"-" si hubo algun error o con un "+" si salio todo bien
>>>
>>>----------------------------------------------------------
>>>   if(err=3D=3D0) {
>>>     pipe_in =3D popen(shell_cmd,"r");
>>>     fgets(response,5,pipe_in);
>>>
>>>     if(response[0]=3D=3D'-') {
>>>       err=3D1;
>>>     } else if(response[0]=3D=3D'+') {
>>>       err=3D0;
>>>     };
>>>     while(fgets(response,5,pipe_in)) {
>>>     };
>>>     pclose(pipe_in);
>>>   };
>>>-----------------------------------------------------------
>>>
>>>El script lo unico que hace es copiar algunos archivos y luego leven=
tar
>=20
> el
>=20
>>>MySQL con el
>>>safe_mysqld
>>>
>>>Espero que esto sirva! Muchas gracias!!
>>>Saludos!!
>>>
>>>
>>>
>>>-----Mensaje original-----
>>>De: linux-c-programming-owner@vger.kernel.org
>>>[mailto:linux-c-programming-owner@vger.kernel.org]En nombre de Jorge
>>>Opaso Pazos
>>>Enviado el: Mi=E9rcoles, 03 de Septiembre de 2003 18:09
>>>Para: linux-c-programming@vger.kernel.org
>>>Asunto: Re: Question!
>>>
>>>
>>>Mariano Moreyra wrote:
>>>
>>>
>>>>Hi!!
>>>>First...I'd like to know if there is any kind of digest on this lis=
t to
>>>
>>>see
>>>
>>>
>>>>old submited messages.
>>>>
>>>>Now...I have a little problem.
>>>>I have a process that is listening for incoming connections on a so=
cket.
>>>>That process waits for a command and then
>>>>forks a child to run a bash script.
>>>>The problems is:
>>>>	- When the bash script runs the safe_mysql script to run MySql
>>>>	engine,
>>>
>>>it's
>>>
>>>
>>>>like the child process never ends.
>>>>	  And because of that, the parent can't close the connection with =
the
>>>>client socket.
>>>>	- But if the bash script doesn't run the safe_mysql script...the
>>>>	child
>>>>process dies successfully and everything end
>>>>	  Ok
>>>>
>>>>Sorry about my english, but I hope that I made my self clear....
>>>>Bye!
>>>>
>>>>-
>>>>To unsubscribe from this list: send the line "unsubscribe
>>>
>>>linux-c-programming" in
>>>
>>>
>>>>the body of a message to majordomo@vger.kernel.org
>>>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>
>>>
>>>
>>>env=EDame el script.
>>>
>>>-
>>>To unsubscribe from this list: send the line "unsubscribe
>>>linux-c-programming" in
>>>the body of a message to majordomo@vger.kernel.org
>>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>
>>English: I suspect that the problem is that safe_mysqld don't return
>>until mysqld ends.
>>Try to execute safe_mysqld in background in the shellscript:
>>
>>	if ! pgrep mysqld
>>	then
>>		/usr/bin/safe_mysqld &
>>	fi
>=20
> As the socket is inherited, the remote client will never exit.
> If the popen is after a fork(), then it doesn't matter if safe_mysql =
doesn't
> end, as the parent wouldn't be waiting on it.
>=20
> My bet is in the socket not being closed, either in the parent, child=
, or
> both, or before the execution of safe_mysql. (If mysqld inherits the =
socket,
> then the connection won't close until mysqld does.)
>=20
>=20
>>Castellano: El problema debe ser que no termina safe_mydqld hasta que=
 no
>>termina mysqld. Se podr=EDa solucionar llamando a safe_mysqld en
>>"background" de la forma anterior.
>=20
>=20
> Portugues: AH! that would be something :)
>=20
> Regards,
> Luciano Rocha
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

Hi Mariano, hi Luciano.

When we make a concurrent server (a server that spawn a child process=20
when accept return) always the parent have to close de socket returned=20
by accept and the child have to close the socket that the server use to=
=20
call accept (server socket).
I you have to inform the client about the exit status of the script, th=
e=20
better way (I think) is to execute the script in the child with=20
system(3), because you need the exit status of the script, not the=20
output. About the safe_mysqld, you must send it to bg.

Luciano, I've never heard the lsof command, thanks.

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
