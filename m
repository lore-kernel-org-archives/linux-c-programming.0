From: Alina Valea <avalea@home.ro>
Subject: xdr functions cause segmentation fault
Date: 7 Jun 2002 05:59:53 -0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020607055953.2129.qmail@relay1.home.ro>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org



Hello everybody,

I have one client program that sends a message string to a
server program, which echoes it back to the client.

The server side: ... char * print_message(char *message) {

printf("Arg: %s\n",message); return message; }

void main() {

... if(registerrpc (PRINTPROG,PRINTVERS,PRINTPROC_NUM,
print_message,xdr_message,xdr_message, "visible")==-1) { ...}
svc_run(); }

The client side: ... char
*tokens[]={"message1","message2","message3","message4"}; char
result[20];

while(1) { i=counter++ % 4; if( (error_code=callrpc(
"localhost", PRINTPROG, PRINTVERS, PRINTPROC_NUM, xdr_message,
tokens[i], xdr_message, result))!=RPC_SUCCESS) 	{...}
printf("client: %s\n",result); }

where bool_t xdr_message(XDR *xdrs, char *message) { return
(xdr_string(xdrs,&message,20)); }

The problem is I always get a segmentation fault on the
server side (using any of the xdr_message(),
xdr_wrapstring(),xdr_string()) after the receipt and printing
of the first string. The only time the server doesn't crash is
when using xdr_message() on the client side, and
xdr_wrapstring() on the server side. Except that the server
won't print the right string, but 'I', over and over.

Even more, I get a gcc warning on compiling the client: args
5,7 of callrpc of incompatible pointer type.

Thanks for your help, Alina


----

Home, no matter how far...
http://www.home.ro
