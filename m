From: "Mariano Moreyra" <moremari@aca.org.ar>
Subject: RE: Segmentation fault from free()
Date: Fri, 27 Aug 2004 17:26:23 -0300
Sender: linux-gcc-owner@vger.kernel.org
Message-ID: <003801c48c74$1ef6c400$0c81640a@aca.org.ar>
References: <412BA650.6050305@nec-labs.com>
Reply-To: <mariano_moreyra@aca.org.ar>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_IS_MIME_Boundary"
Return-path: <linux-gcc-owner@vger.kernel.org>
In-Reply-To: <412BA650.6050305@nec-labs.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: 'Lei Yang' <leiyang@nec-labs.com>, linux-c-programming@vger.kernel.org, linux-gcc@vger.kernel.org

--=_IS_MIME_Boundary
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Are you writting exactly 2048 chars to in_buffer?? Or are you writting
2047??
If you want to write 2048 chars into in_buffer, you have to malloc 2049
bytes, to store the '\0' char.
I know it seems a little stupid observation, but sometimes we let this
stupid errors happen.


Mariano Moreyra



-----Mensaje original-----
De: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]En nombre de Lei Yang
Enviado el: Martes, 24 de Agosto de 2004 17:34
Para: linux-c-programming@vger.kernel.org; linux-gcc@vger.kernel.org
CC: Lei Yang
Asunto: Segmentation fault from free()


Hi friends,

I am writing a c code and have been bugged by this segmentation fault
for a while.

What I did is simply like:

----------------------------------------------------------------------------
-------------------------
.........
unsigned long blocksize =3D 2048;
char *in_buffer
char *out_buffer;
if(( in_buffer=3D malloc(blocksize)) =3D=3D NULL)
{
fprintf(stderr, "*** Can't malloc(%ld) forbuffer.\n",blocksize);
return NULL;
}

if(( out_buffer=3D malloc(2*blocksize)) =3D=3D NULL)
{
fprintf(stderr, "*** Can't malloc(%ld) forbuffer.\n",blocksize);
free(in_buffer);
return NULL;
}

loop: until all the data are read from file
{
//read a block of data from a file to in_buffer
// do some data processing with in_buffer
//write the result to out_buffer
//memcpy out_buffer to list
}

free(in_buffer);
free(out_buffer);

return list;
......
----------------------------------------------------------------------------
-------------------------------------

I've debugged with gdb to see where the segmentation fault happens, it
is at free(in_buffer).
I've verified that the value for in_buffer after malloc() and before
free() is the same. Or in other words, in_buffer is a valid pointer
allocated by malloc.

And the SF only happens when the file is large, although block size
could be small.
Means that for both small (2KB) and large(5MB) files, block size are the
same. However, only large files could cause SF.

Could anyone please point me out what could possibly be the reason?
BTW, pls cc me when you reply, since I am not able to receive emails
from this list. Thanks a lot!

TIA!
Lei
-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


_______________________________________

Importante



El contenido del presente mensaje y el de sus adjuntos, es privado, confide=
ncial y de uso exclusivo de los destinatarios a los cuales est=E1 dirig=EDd=
o, pudiendo contener informaci=F3n legalmente protegida.Queda prohibida la =
revisi=F3n, divulgaci=F3n, publicaci=F3n, modificaci=F3n, copia, distribuci=
=F3n o acci=F3n en relaci=F3n con esta informaci=F3n, por personas o entida=
des distintas al destinatario.

Las opiniones contenidas son exclusivas de su autor y no representan ni nec=
esariamente pueden coincidir con las de la entidad.

La transmisi=F3n de e-mails no garantiza que el correo electr=F3nico sea se=
guro o libre de error. En consecuencia, no manifestamos que la informaci=F3=
n sea completa o precisa. Toda informaci=F3n est=E1 sujeta a alterarse sin =
previo aviso.

Si Ud. recibi=F3 este mensaje por error, por favor reenv=EDelo al remitente=
 y destruya las copias de papel o grabadas en cualquier medio magn=E9tico, =
que pueda haber realizado.

Muchas Gracias.


--=_IS_MIME_Boundary--
