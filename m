From: =?UTF-8?B?VcSfdXIgQVRB?= <ataugur@gmail.com>
Subject: Help on a memory leak issue
Date: Mon, 11 Jan 2010 17:05:08 +0200
Message-ID: <8eec89ee1001110705k3257bd80r2a719a67b0bda641@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:from:date:message-id
         :subject:to:content-type:content-transfer-encoding;
        bh=qNqMHvw7MmO31BjusZLQWVnAve9THl5z+pjVMqP+/Vs=;
        b=kmOcwu686pmPDCuyOjdBomJ/m64FyTxLct0djIDZSjF9OVxT7yA1sdWFKPPaNw9oGm
         aWhQDOnlX3DxqMA9MT8fVUdQo/8E5dnzNhIR3RP9NvecW2OJO1+n1KFhtluC1wvGx6AX
         LjqVIEMs3BlPz8YElOdEKmxjnKFJ+zAVEvpj0=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Hi,
I have a client server application which uses a local file socket.
When i connect to the server part and then close the connection the
memory usage stays the same indicating that the resources aren't
freed. Other then this memory leak problem everything is working fine.
Messeages are sent and received. After each message is sent/received
rss indicator in the ps command increases with different amounts for
each different message. When the rss reaches around 64MB the program
stops working and freezes. Then it needs to be restarted.
I couldn't find a solution to this problem anywhere on the web so
thanks in advance if someone could be of help.
Below is the result of uname -a:
Linux server 2.6.27.7-smp #2 SMP Thu Nov 20 22:32:43 CST 2008 i686
Pentium III (Katmai) GenuineIntel GNU/Linux
Slackware 12.2 is running on that kernel and my source for the server p=
art is:
<-------------
void wait_for_message() {
=C2=A0=C2=A0 =C2=A0sigset_t waitset;
=C2=A0=C2=A0 =C2=A0sigemptyset( &waitset );
=C2=A0=C2=A0 =C2=A0sigaddset( &waitset, SIGALRM );
=C2=A0=C2=A0 =C2=A0pthread_sigmask( SIG_BLOCK, &waitset, NULL );
=C2=A0=C2=A0 =C2=A0int loop =3D 1;
=C2=A0=C2=A0 =C2=A0// use local socket
=C2=A0=C2=A0 =C2=A0int socket_fd =3D socket(PF_UNIX, SOCK_STREAM, 0);
=C2=A0=C2=A0 =C2=A0struct sockaddr_un name;
=C2=A0=C2=A0 =C2=A0/* Indicate that this is a server. =C2=A0 */
=C2=A0=C2=A0 =C2=A0name.sun_family =3D AF_LOCAL;
=C2=A0=C2=A0 =C2=A0strcpy(name.sun_path, SOCKET); // use socket file
=C2=A0=C2=A0 =C2=A0bind(socket_fd, &name, SUN_LEN(&name));
=C2=A0=C2=A0 =C2=A0// maximum number of requests stacked
=C2=A0=C2=A0 =C2=A0listen(socket_fd, 10);
=C2=A0=C2=A0 =C2=A0do {
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0struct sockaddr_un client_name;
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0socklen_t client_name_len =3D 0; // it=
 should be >=3D 0 otherwise
accept returns EINVAL
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0int client_socket_fd;
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0client_socket_fd =3D accept(socket_fd,=
 &client_name, &client_name_len);

=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0if (read(client_socket_fd, &length, si=
zeof (length)) > 0) {
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .....
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0}
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0shutdown(client_socket_fd, SHUT_RDWR);
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0close(client_socket_fd);
=C2=A0=C2=A0 =C2=A0} while (loop);
=C2=A0=C2=A0 =C2=A0/* Remove the socket file. =C2=A0 */
=C2=A0=C2=A0 =C2=A0close(socket_fd);
=C2=A0=C2=A0 =C2=A0unlink(SOCKET);
-------------->
and the client part is:
char* sendMessage(char* message) {
=C2=A0=C2=A0 =C2=A0char* result =3D NULL;
=C2=A0=C2=A0 =C2=A0int length =3D strlen(message) + 1;
=C2=A0=C2=A0 =C2=A0if (message =3D=3D NULL || length <=3D 0) {
=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;
=C2=A0=C2=A0 =C2=A0}
=C2=A0=C2=A0 =C2=A0int socket_fd;
=C2=A0=C2=A0 =C2=A0struct sockaddr_un name;
=C2=A0=C2=A0 =C2=A0socket_fd =3D socket(PF_LOCAL, SOCK_STREAM, 0);
=C2=A0=C2=A0 =C2=A0name.sun_family =3D AF_LOCAL;
=C2=A0=C2=A0 =C2=A0strcpy(name.sun_path, SOCKET);
=C2=A0=C2=A0 =C2=A0connect(socket_fd, &name, SUN_LEN(&name));
=C2=A0=C2=A0 =C2=A0// write length of the message
=C2=A0=C2=A0 =C2=A0write(socket_fd, &length, sizeof (length));
=C2=A0=C2=A0 //write message itself
=C2=A0=C2=A0 =C2=A0write(socket_fd, message, length);
=C2=A0=C2=A0 =C2=A0length =3D 0;
=C2=A0=C2=A0 =C2=A0// read length of the result
=C2=A0=C2=A0 =C2=A0read(socket_fd, &length, sizeof(length));
=C2=A0=C2=A0 =C2=A0if (length > 0) {
=C2=A0=C2=A0 =C2=A0 =C2=A0 ......
=C2=A0=C2=A0 =C2=A0}
=C2=A0=C2=A0 =C2=A0shutdown(socket_fd, SHUT_RDWR);
=C2=A0=C2=A0 =C2=A0close(socket_fd);
=C2=A0=C2=A0 =C2=A0return result;
}
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
