From: "Mariano Moreyra" <moremari@aca.org.ar>
Subject: RE: Question!
Date: Thu, 4 Sep 2003 11:28:22 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000101c372f0$cc0b0e60$0b04a8c0@aca.org.ar>
References: <20030904140524.GB24691@lsd.di.uminho.pt>
Reply-To: <mariano_moreyra@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030904140524.GB24691@lsd.di.uminho.pt>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Luciano Miguel Ferreira Rocha' <luciano@lsd.di.uminho.pt>, mariano_moreyra@aca.org.ar
Cc: 'Jorge Opaso Pazos' <jopaso@trofeospazos.com>, linux-c-programming@vger.kernel.org

Ok!!! First of all, Sorry for writting in spanish!
I'm not closing the socket in the child process...so I'll try that and see
what happens.
Thanks a lot!!!
And sorry again!



-----Mensaje original-----
De: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]En nombre de Luciano
Miguel Ferreira Rocha
Enviado el: Jueves, 04 de Septiembre de 2003 11:05
Para: mariano_moreyra@aca.org.ar
CC: 'Jorge Opaso Pazos'; linux-c-programming@vger.kernel.org
Asunto: Re: Question!


On Thu, Sep 04, 2003 at 10:51:19AM -0300, Mariano Moreyra wrote:
> Hola!
> Te mando la seccion del programa que ejecuta el script en si.
>
> Este proceso lo unico que espera del script es que el mismo conteste con
un
> "-" si hubo algun error o con un "+" si salio todo bien
>
> ----------------------------------------------------------
>     if(err==0) {
>       pipe_in = popen(shell_cmd,"r");
>       fgets(response,5,pipe_in);
>
>       if(response[0]=='-') {
>         err=1;
>       } else if(response[0]=='+') {
>         err=0;
>       };
>       while(fgets(response,5,pipe_in)) {
>       };
>       pclose(pipe_in);
>     };
> -----------------------------------------------------------
>
> El script lo unico que hace es copiar algunos archivos y luego leventar el
> MySQL con el
> safe_mysqld
>
> Espero que esto sirva! Muchas gracias!!
> Saludos!!

Please, this is an international list, so write in english.

Are you closing the socket before de popen(3)? Make sure you do and
that if this is a child to exit(2) after being done with the script.

Regards,
Luciano Rocha
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

