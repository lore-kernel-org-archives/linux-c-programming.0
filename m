From: Mateus Interciso <p.zarnick@gmail.com>
Subject: Re: Creating a routing program - the basics
Date: Tue, 23 Oct 2007 14:13:22 +0000 (UTC)
Message-ID: <ffkvi1$io8$8@ger.gmane.org>
References: <ffkja9$io8$1@ger.gmane.org>
	<6a00c8d50710230415o3a3b0e47x3cb85b14f2128b90@mail.gmail.com>
	<ffkod6$io8$2@ger.gmane.org>
	<6a00c8d50710230656t45faf16cg9c732eee13063a47@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-c-programming@vger.kernel.org

On Tue, 23 Oct 2007 15:56:22 +0200, Steve Graegert wrote:

> On 10/23/07, Mateus Interciso <p.zarnick@gmail.com> wrote:
>> On Tue, 23 Oct 2007 13:15:11 +0200, Steve Graegert wrote:
>>
>> > On 10/23/07, Mateus Interciso <p.zarnick@gmail.com> wrote:
>> >> Hello, I'm currently on university, and for my graduation paper,
>> >> I'll be implementing a routing algorythm, by hand, in C. The rout=
ing
>> >> algorythm itself is not easy, but one of the starting parts of it=
,
>> >> is to find a way of discovering the MAC that it is currently
>> >> connected to, maybe is bether if I draw, since I'm not really tha=
t
>> >> good in english:
>> >>
>> >> [PC with n NICs]-----(n cables)---->[n PCs]
>> >>
>> >> I have full control of the first PC, of course, since is the one =
I'm
>> >> implementing the router, so I do know the MAC of it, but how to
>> >> discover the MAC on the other end of the n lines, so I can start
>> >> sending packets?
>> >
>> > Probably this is a starting point:  (not tested)
>> >
>> > ___ BEGIN SOURCE ___
>> >
>> > #include <iostream>
>> > #include <stdio.h>
>> > #include <netdb.h>
>> > #include <netinet/if_ether.h>
>> >
>> > int read_mac(void) {
>> >       int sock, sockfd, n, cnt;
>> >       char buffer[2048];
>> >       unsigned char *iphead, *ethhead;
>> >       struct ether_addr ether;
>> >
>> >       if ((sock =3D socket(PF_PACKET, SOCK_RAW, htons(ETH_P_IP))) =
< 0)
>> >       {
>> >               perror("socket");
>> >               exit(1);
>> >       }
>> >
>> >       while (1) {
>> >               if ((n =3D recvfrom(sock, buffer, 2048, 0, NULL, NUL=
L))
>> >               =3D=3D
>> -1) {
>> >                       perror("recvfrom");
>> >                       close(sock);
>> >                       exit(1);
>> >               }
>> >
>> >               ethhead =3D (unsigned char *)buffer;
>> >
>> >               if (ethhead !=3D NULL) {
>> >                       iphead =3D (unsigned char *)(buffer + 14); /=
/
>> >                       Skip
>> Ethernet header
>> >                       printf("Peer MAC: "
>> >                               "%02x:%02x:%02x:%02x:%02x:%02x\n",
>> >                               ethhead[0], ethhead[1], ethhead[2],
>> >                               ethhead[3], ethhead[4], ethhead[5]);
>> >                       printf("Source MAC: "
>> >                               "%02x:%02x:%02x:%02x:%02x:%02x\n",
>> >                               ethhead[6], ethhead[7], ethhead[8],
>> >                               ethhead[9], ethhead[10], ethhead[11]=
);
>> >
>> >                       if (*iphead =3D=3D 0x45) { // Check for IPv4=
, no
>> options present
>> >                               printf("Peer IP: %d.%d.%d.%d\n",
>> >                                       iphead[12], iphead[13],
>> >                                       iphead[14], iphead[15]);
>> >                               printf("Source IP: %d.%d.%d.%d\n",
>> >                                       iphead[16], iphead[17],
>> >                                       iphead[18], iphead[19]);
>> >                               printf("Protocol (UDP =3D 11): %02x
>> >                               Hex\n",
>> iphead[9]);
>> >                       }
>> >               }
>> >       }
>> >
>> >       return 0;
>> > }
>> >
>> >
>> > int main(int argc, char **argv) {
>> >     read_mac();
>> >     return EXIT_SUCCESS;
>> > }
>> >
>> > ___ END SOURCE ___
>> >
>> > Honestly, you should make yourself acquainted with low-level netwo=
rk
>> > programming.  Otherwise you'll be asking a lot of theses questions=
 in
>> > the future.  Anyway, hope this helps.
>> >
>> >       \Steve
>> >
>> > --
>> >
>> > Steve Gr=C3=A4gert
>> > DigitalEther.de
>> > -
>> > To unsubscribe from this list: send the line "unsubscribe
>> > linux-c-programming" in the body of a message to
>> > majordomo@vger.kernel.org More majordomo info at
>> > http://vger.kernel.org/majordomo-info.html
>>
>> Thank you, this will help.
>> Do you have any book/site where I can take a deep look into how to d=
o
>> that stuff?
>=20
> I can't make any recommendations beyond the well-known programming bo=
oks
> like Steven's UNP and O'Reilly's "Understanding the Linux Kernel".=20
> Additionally, you may find Sams Publishing 's "Linux(R) Socket
> Programming" (0672319357) useful.
>=20
> 	\Steve
>=20
> --
>=20
> Steve Gr=C3=A4gert
> DigitalEther.de
> -
> To unsubscribe from this list: send the line "unsubscribe
> linux-c-programming" in the body of a message to
> majordomo@vger.kernel.org More majordomo info at=20
> http://vger.kernel.org/majordomo-info.html

Thank you, I'll take a look at those books :D

Mateus

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
