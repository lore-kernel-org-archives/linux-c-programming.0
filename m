From: "Mariano Moreyra" <moremari@aca.org.ar>
Subject: RE: Question!
Date: Thu, 4 Sep 2003 10:51:19 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000001c372eb$9ee69b20$0b04a8c0@aca.org.ar>
References: <3F565883.6040901@trofeospazos.com>
Reply-To: <mariano_moreyra@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <3F565883.6040901@trofeospazos.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Jorge Opaso Pazos' <jopaso@trofeospazos.com>, linux-c-programming@vger.kernel.org

Hola!
Te mando la seccion del programa que ejecuta el script en si.

Este proceso lo unico que espera del script es que el mismo conteste co=
n un
"-" si hubo algun error o con un "+" si salio todo bien

----------------------------------------------------------
    if(err=3D=3D0) {
      pipe_in =3D popen(shell_cmd,"r");
      fgets(response,5,pipe_in);

      if(response[0]=3D=3D'-') {
        err=3D1;
      } else if(response[0]=3D=3D'+') {
        err=3D0;
      };
      while(fgets(response,5,pipe_in)) {
      };
      pclose(pipe_in);
    };
-----------------------------------------------------------

El script lo unico que hace es copiar algunos archivos y luego leventar=
 el
MySQL con el
safe_mysqld

Espero que esto sirva! Muchas gracias!!
Saludos!!



-----Mensaje original-----
De: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]En nombre de Jorge
Opaso Pazos
Enviado el: Mi=E9rcoles, 03 de Septiembre de 2003 18:09
Para: linux-c-programming@vger.kernel.org
Asunto: Re: Question!


Mariano Moreyra wrote:
> Hi!!
> First...I'd like to know if there is any kind of digest on this list =
to
see
> old submited messages.
>
> Now...I have a little problem.
> I have a process that is listening for incoming connections on a sock=
et.
> That process waits for a command and then
> forks a child to run a bash script.
> The problems is:
> 	- When the bash script runs the safe_mysql script to run MySql engin=
e,
it's
> like the child process never ends.
> 	  And because of that, the parent can't close the connection with th=
e
> client socket.
> 	- But if the bash script doesn't run the safe_mysql script...the chi=
ld
> process dies successfully and everything end
> 	  Ok
>
> Sorry about my english, but I hope that I made my self clear....
> Bye!
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

env=EDame el script.

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
