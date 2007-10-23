From: "Steve Graegert" <graegerts@gmail.com>
Subject: Re: Creating a routing program - the basics
Date: Tue, 23 Oct 2007 13:15:11 +0200
Message-ID: <6a00c8d50710230415o3a3b0e47x3cb85b14f2128b90@mail.gmail.com>
References: <ffkja9$io8$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=Y3GsTayp5hOhg6SssCWBi4snJMOrtfL29kbdJvi7YaI=;
        b=BZNf2LqgpEiKc6kITNc0o6Rukju1Ize87CT+rDxNH9w7BXZtOE8AApIzgCmHbM+zisJsnkca0jxcwFWnHyw8vesQUiSG6E0wuXGft6p54UI73v7wVs/787UcHYSS/cNmf6n1FUAECBSri/XcQH1HXezk+PWc/UJz217HfCiO7rs=
In-Reply-To: <ffkja9$io8$1@ger.gmane.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mateus Interciso <p.zarnick@gmail.com>
Cc: linux-c-programming@vger.kernel.org

On 10/23/07, Mateus Interciso <p.zarnick@gmail.com> wrote:
> Hello, I'm currently on university, and for my graduation paper, I'll=
 be
> implementing a routing algorythm, by hand, in C.
> The routing algorythm itself is not easy, but one of the starting par=
ts
> of it, is to find a way of discovering the MAC that it is currently
> connected to, maybe is bether if I draw, since I'm not really that go=
od
> in english:
>
> [PC with n NICs]-----(n cables)---->[n PCs]
>
> I have full control of the first PC, of course, since is the one I'm
> implementing the router, so I do know the MAC of it, but how to disco=
ver
> the MAC on the other end of the n lines, so I can start sending packe=
ts?

Probably this is a starting point:  (not tested)

___ BEGIN SOURCE ___

#include <iostream>
#include <stdio.h>
#include <netdb.h>
#include <netinet/if_ether.h>

int read_mac(void) {
	int sock, sockfd, n, cnt;
	char buffer[2048];
	unsigned char *iphead, *ethhead;
	struct ether_addr ether;

	if ((sock =3D socket(PF_PACKET, SOCK_RAW, htons(ETH_P_IP))) < 0) {
		perror("socket");
		exit(1);
	}

	while (1) {
		if ((n =3D recvfrom(sock, buffer, 2048, 0, NULL, NULL)) =3D=3D -1) {
			perror("recvfrom");
			close(sock);
			exit(1);
		}
=09
		ethhead =3D (unsigned char *)buffer;
	=09
		if (ethhead !=3D NULL) {
			iphead =3D (unsigned char *)(buffer + 14); // Skip Ethernet header		=
=09
			printf("Peer MAC: "
				"%02x:%02x:%02x:%02x:%02x:%02x\n",
				ethhead[0], ethhead[1], ethhead[2],
				ethhead[3], ethhead[4], ethhead[5]);
			printf("Source MAC: "
				"%02x:%02x:%02x:%02x:%02x:%02x\n",
				ethhead[6], ethhead[7], ethhead[8],
				ethhead[9], ethhead[10], ethhead[11]);

			if (*iphead =3D=3D 0x45) { // Check for IPv4, no options present
				printf("Peer IP: %d.%d.%d.%d\n",
					iphead[12], iphead[13],
					iphead[14], iphead[15]);
				printf("Source IP: %d.%d.%d.%d\n",
					iphead[16], iphead[17],
					iphead[18], iphead[19]);
				printf("Protocol (UDP =3D 11): %02x Hex\n", iphead[9]);
			}
		}
	}
=09
	return 0;
}


int main(int argc, char **argv) {
    read_mac();
    return EXIT_SUCCESS;
}

___ END SOURCE ___

Honestly, you should make yourself acquainted with low-level network
programming.  Otherwise you'll be asking a lot of theses questions in
the future.  Anyway, hope this helps.

	\Steve

--

Steve Gr=E4gert
DigitalEther.de
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
