From: Luciano Miguel Ferreira Rocha <luciano@lsd.di.uminho.pt>
Subject: Re: Question!
Date: Thu, 4 Sep 2003 15:05:24 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030904140524.GB24691@lsd.di.uminho.pt>
References: <3F565883.6040901@trofeospazos.com> <000001c372eb$9ee69b20$0b04a8c0@aca.org.ar>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000001c372eb$9ee69b20$0b04a8c0@aca.org.ar>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mariano_moreyra@aca.org.ar
Cc: 'Jorge Opaso Pazos' <jopaso@trofeospazos.com>, linux-c-programming@vger.kernel.org

On Thu, Sep 04, 2003 at 10:51:19AM -0300, Mariano Moreyra wrote:
> Hola!
> Te mando la seccion del programa que ejecuta el script en si.
> 
> Este proceso lo unico que espera del script es que el mismo conteste con un
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
