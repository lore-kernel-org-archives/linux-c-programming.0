From: "Wen Guangcheng" <wen.guangcheng@cnt.sp.qnes.nec.co.jp>
Subject: Question on socket of broadcast
Date: Thu, 18 Mar 2004 20:15:11 +0900
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <012901c40cda$47c51a40$de01a8c0@qnessmphibiki>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello,
I create a socket for broadcast by

dhcpSocket = socket(PF_PACKET, SOCK_PACKET, htons(ETH_P_ALL));
setsockopt(dhcpSocket, SOL_SOCKET, SO_BROADCAST, &flags, sizeof(int *));

and send a message by

sendto(dhcpSocket,&UdpIpMsgSend,sizeof(struct packed_ether_header)+
    sizeof(udpiphdr)+sizeof(dhcpMessage),0,
    &addr,sizeof(struct sockaddr)

then receive a replied broadcast message by

recvfrom(dhcpSocket,&UdpIpMsgRecv,sizeof(udpipMessage),0,(struct sockaddr
*)&addr,&i);

It works well on normal LAN. But on a wireless LAN the message
which was sent by the socket. is received from itself.
Should a message sent by broadcast socket be recieved by itself?

Thanks in advance.

--Wen

