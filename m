From: "Joao Carneiro - DLS" <jcarneiro@dls.pt>
Subject: RE: serial comm
Date: Mon, 3 May 2004 09:44:15 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <8DF8639155BBCA4CB560E640ACD614F70A21A9@svr-mail.desicor.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
content-class: urn:content-classes:message
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: gracecott@sancharnet.in, linux-c-programming@vger.kernel.org

Hi there, i recomend you to take a look at the datasheet of the USART i=
n question so that you can understand how it works, what it expects to =
receive and what it sends as a reply.
After that study you can go ahead and write some code because you'll ha=
ve a pretty good idea of what you nead to do on both ends.

cheers=20


       Jo=E3o B. G. Carneiro
       jcarneiro@dls.pt

* +351 227 470 786

7 +351 227 470 787

Esta mensagem pode conter informa=E7=E3o confidencial, e =E9 apenas des=
tinada aos destinat=E1rios indicados. Se o seu nome n=E3o consta na lis=
ta de endere=E7os n=E3o dever=E1 disseminar, distribuir ou copiar este =
e-mail. Por favor notifique, imediatamente, o remetente por e-mail se o=
 recebeu por erro e apague-o do seu sistema. A transmiss=E3o de e-mail =
n=E3o =E9 garantida como segura ou livre de erros assim como a informa=E7=
=E3o poder=E1 ser interceptada, corrompida, perdida, destru=EDda, chega=
r tardiamente ou incompleta, ou conter v=EDrus. Em consequ=EAncia o rem=
etente n=E3o aceitar=E1 responsabilidade por qualquer erro ou omiss=E3o=
 no conte=FAdo desta mensagem que lhe =E9 entregue por transmiss=E3o de=
 e-mail. Se necessita de verificar a informa=E7=E3o requisite o documen=
to original.


-----Mensagem original-----
De: linux-c-programming-owner@vger.kernel.org [mailto:linux-c-programmi=
ng-owner@vger.kernel.org] Em nome de joy
Enviada: sexta-feira, 30 de Abril de 2004 19:12
Para: linux-c-programming@vger.kernel.org
Assunto: serial comm

Hi, I am trying to send info thru the serial port using a program.it ha=
s to communicate with a USART (intel 8251A) on a single board 8085 kit.=
 any suggestions as to how I can implement this?

Thanx in advance,
Joy.M.M

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in the body of a message to majordomo@vger.kernel.org More majo=
rdomo info at  http://vger.kernel.org/majordomo-info.html


-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
