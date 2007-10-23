From: Mateus Interciso <p.zarnick@gmail.com>
Subject: Re: Creating a routing program - the basics
Date: Tue, 23 Oct 2007 12:11:19 +0000 (UTC)
Message-ID: <ffkod6$io8$2@ger.gmane.org>
References: <ffkja9$io8$1@ger.gmane.org>
	<6a00c8d50710230415o3a3b0e47x3cb85b14f2128b90@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

On Tue, 23 Oct 2007 13:15:11 +0200, Steve Graegert wrote:

> On 10/23/07, Mateus Interciso <p.zarnick@gmail.com> wrote:
>> Hello, I'm currently on university, and for my graduation paper, I'l=
l
>> be implementing a routing algorythm, by hand, in C. The routing
>> algorythm itself is not easy, but one of the starting parts of it, i=
s
>> to find a way of discovering the MAC that it is currently connected =
to,
>> maybe is bether if I draw, since I'm not really that good in english=
:
>>
>> [PC with n NICs]-----(n cables)---->[n PCs]
>>
>> I have full control of the first PC, of course, since is the one I'm
>> implementing the router, so I do know the MAC of it, but how to
>> discover the MAC on the other end of the n lines, so I can start
>> sending packets?
>=20
> Probably this is a starting point:  (not tested)
>=20
> ___ BEGIN SOURCE ___
>=20
> #include <iostream>
> #include <stdio.h>
> #include <netdb.h>
> #include <netinet/if_ether.h>
>=20
> int read_mac(void) {
> 	int sock, sockfd, n, cnt;
> 	char buffer[2048];
> 	unsigned char *iphead, *ethhead;
> 	struct ether_addr ether;
>=20
> 	if ((sock =3D socket(PF_PACKET, SOCK_RAW, htons(ETH_P_IP))) < 0) {
> 		perror("socket");
> 		exit(1);
> 	}
>=20
> 	while (1) {
> 		if ((n =3D recvfrom(sock, buffer, 2048, 0, NULL, NULL)) =3D=3D=20
-1) {
> 			perror("recvfrom");
> 			close(sock);
> 			exit(1);
> 		}
> =09
> 		ethhead =3D (unsigned char *)buffer;
> 	=09
> 		if (ethhead !=3D NULL) {
> 			iphead =3D (unsigned char *)(buffer + 14); // Skip=20
Ethernet header
> 			printf("Peer MAC: "
> 				"%02x:%02x:%02x:%02x:%02x:%02x\n",
> 				ethhead[0], ethhead[1], ethhead[2],
> 				ethhead[3], ethhead[4], ethhead[5]);
> 			printf("Source MAC: "
> 				"%02x:%02x:%02x:%02x:%02x:%02x\n",
> 				ethhead[6], ethhead[7], ethhead[8],
> 				ethhead[9], ethhead[10], ethhead[11]);
>=20
> 			if (*iphead =3D=3D 0x45) { // Check for IPv4, no=20
options present
> 				printf("Peer IP: %d.%d.%d.%d\n",
> 					iphead[12], iphead[13],
> 					iphead[14], iphead[15]);
> 				printf("Source IP: %d.%d.%d.%d\n",
> 					iphead[16], iphead[17],
> 					iphead[18], iphead[19]);
> 				printf("Protocol (UDP =3D 11): %02x Hex\n",=20
iphead[9]);
> 			}
> 		}
> 	}
> =09
> 	return 0;
> }
>=20
>=20
> int main(int argc, char **argv) {
>     read_mac();
>     return EXIT_SUCCESS;
> }
>=20
> ___ END SOURCE ___
>=20
> Honestly, you should make yourself acquainted with low-level network
> programming.  Otherwise you'll be asking a lot of theses questions in
> the future.  Anyway, hope this helps.
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

Thank you, this will help.
Do you have any book/site where I can take a deep look into how to do=20
that stuff?

MAteus

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
