From: Jorge Opaso Pazos <jopaso@trofeospazos.com>
Subject: Re: Question!
Date: Thu, 04 Sep 2003 12:04:43 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F57629B.2000004@trofeospazos.com>
References: <000001c372eb$9ee69b20$0b04a8c0@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <000001c372eb$9ee69b20$0b04a8c0@aca.org.ar>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org

Mariano Moreyra wrote:
> Hola!
> Te mando la seccion del programa que ejecuta el script en si.
>=20
> Este proceso lo unico que espera del script es que el mismo conteste =
con un
> "-" si hubo algun error o con un "+" si salio todo bien
>=20
> ----------------------------------------------------------
>     if(err=3D=3D0) {
>       pipe_in =3D popen(shell_cmd,"r");
>       fgets(response,5,pipe_in);
>=20
>       if(response[0]=3D=3D'-') {
>         err=3D1;
>       } else if(response[0]=3D=3D'+') {
>         err=3D0;
>       };
>       while(fgets(response,5,pipe_in)) {
>       };
>       pclose(pipe_in);
>     };
> -----------------------------------------------------------
>=20
> El script lo unico que hace es copiar algunos archivos y luego levent=
ar el
> MySQL con el
> safe_mysqld
>=20
> Espero que esto sirva! Muchas gracias!!
> Saludos!!
>=20
>=20
>=20
> -----Mensaje original-----
> De: linux-c-programming-owner@vger.kernel.org
> [mailto:linux-c-programming-owner@vger.kernel.org]En nombre de Jorge
> Opaso Pazos
> Enviado el: Mi=E9rcoles, 03 de Septiembre de 2003 18:09
> Para: linux-c-programming@vger.kernel.org
> Asunto: Re: Question!
>=20
>=20
> Mariano Moreyra wrote:
>=20
>>Hi!!
>>First...I'd like to know if there is any kind of digest on this list =
to
>=20
> see
>=20
>>old submited messages.
>>
>>Now...I have a little problem.
>>I have a process that is listening for incoming connections on a sock=
et.
>>That process waits for a command and then
>>forks a child to run a bash script.
>>The problems is:
>>	- When the bash script runs the safe_mysql script to run MySql engin=
e,
>=20
> it's
>=20
>>like the child process never ends.
>>	  And because of that, the parent can't close the connection with th=
e
>>client socket.
>>	- But if the bash script doesn't run the safe_mysql script...the chi=
ld
>>process dies successfully and everything end
>>	  Ok
>>
>>Sorry about my english, but I hope that I made my self clear....
>>Bye!
>>
>>-
>>To unsubscribe from this list: send the line "unsubscribe
>=20
> linux-c-programming" in
>=20
>>the body of a message to majordomo@vger.kernel.org
>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>=20
>=20
> env=EDame el script.
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

English: I suspect that the problem is that safe_mysqld don't return=20
until mysqld ends.
Try to execute safe_mysqld in background in the shellscript:

	if ! pgrep mysqld
	then
		/usr/bin/safe_mysqld &
	fi=09
=09
Castellano: El problema debe ser que no termina safe_mydqld hasta que n=
o=20
termina mysqld. Se podr=EDa solucionar llamando a safe_mysqld en=20
"background" de la forma anterior.

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
