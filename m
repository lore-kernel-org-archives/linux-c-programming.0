From: "Terrence Koeman" <root@mediamonks.net>
Subject: Assistance requested with 'injecting' data into the IPC of two propetiary binaries
Date: Fri, 11 Mar 2005 01:56:54 +0100
Message-ID: <auto-000000700076@mail.mediamonks.net>
Reply-To: <root@mediamonks.net>
Mime-Version: 1.0
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_0019_01C525DD.99A93310"
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.

------=_NextPart_000_0019_01C525DD.99A93310
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello everyone,

I'm trying to 'inject' a command into the IPC of two propetiary binaries, 
Program A (a daemon) and Program C.

Program A executes Program C as a child and sends newline-terminated commands 
to it's stdin, Program C responds by sending newline-terminated responses to 
stdout.

Now, I need Program C to process two commands of mine, before servicing 
Program A's commands. So I need a Program B which sends these commands to 
Program C.

At the moment I have the following source for Program B:

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/wait.h>
#include <sys/types.h>

int main(){
  pid_t pid;
  char buffer[256];
  int rv;
  int inpipe[2];
  FILE * stream;
  fd_set rfds;
  int retval;

  if(pipe(inpipe)){
    fprintf(stderr,"pipe error!\n");
    exit(1);
  }
  if((pid=fork()) == -1){
    fprintf(stderr,"fork error!\n");
    exit(1);
  }
  if(pid){
    /* parent */

    close(inpipe[0]);

    stream = fdopen( inpipe[1], "w" );
    setbuf (stream, NULL );
    fprintf(stream, "TEST COMMAND\n");

    FD_ZERO(&rfds);
    FD_SET(0, &rfds);
    while(waitpid(-1, &rv, WNOHANG) <= 0){
      if (select(1, &rfds, NULL, NULL, NULL)) {
        fgets (buffer, 256, stdin);
        fputs(buffer, stream);
      }
    }
    wait(&rv);
    fprintf(stderr,"child exited with a %d value\n",rv);
  }
  else{
    /* child */
    close(inpipe[1]);
    dup2(inpipe[0],0);
    if(execl("program","program",NULL) == -1){
      fprintf(stderr,"execl error!");
      exit(1);
    }
  }
  return 0;
}

This essentially works, however, in this setup the parent will sit around 
passing it's stdin to the pipe. And of course the select() still blocks if the 
child terminates and there will be nasty broken pipes.

There must be an easier way to accomplish what I need. For instance, the 
parent connecting it's stdin to the pipe, detach the child and exit. Or, the 
parent restoring the stdin of the child to the original stdin(), then setsid() 
the child and exit. In any case, it would be nice if the parent can be 
eliminated after the commands have been sent.

I've been at it for hours now, and this was the best I could get working, so 
I'd appreciate some input.

Thanks for your time!

-- 
Regards,
Terrence Koeman

MediaMonks B.V. (www.mediamonks.com)
Please quote all replies in correspondence.


"The crucial memorandum will be snared in the out-basket by
the paper clip of the overlying memo and go to file."

------=_NextPart_000_0019_01C525DD.99A93310
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKATCCAj0w
ggGmAhEAzbp/VvDf5LxU/iKss3KqVTANBgkqhkiG9w0BAQIFADBfMQswCQYDVQQGEwJVUzEXMBUG
A1UEChMOVmVyaVNpZ24sIEluYy4xNzA1BgNVBAsTLkNsYXNzIDEgUHVibGljIFByaW1hcnkgQ2Vy
dGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNOTYwMTI5MDAwMDAwWhcNMjgwODAxMjM1OTU5WjBfMQsw
CQYDVQQGEwJVUzEXMBUGA1UEChMOVmVyaVNpZ24sIEluYy4xNzA1BgNVBAsTLkNsYXNzIDEgUHVi
bGljIFByaW1hcnkgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwgZ8wDQYJKoZIhvcNAQEBBQADgY0A
MIGJAoGBAOUZv22jVmEtmUhx9mfeuY3rt56GgAqRDvo4Ja9GiILlc6igmyRdDR/MZW4MsNBWhBiH
mgabEKFz37RYOWtuwfYV1aioP6oSBo0xrH+wNNePNGeICc0UEeJORVZpH3gCgNrcR5EpuzbJY1zF
4Ncth3uhtzKwezC6Ki8xqu6jZ9rbAgMBAAEwDQYJKoZIhvcNAQECBQADgYEATD+4i8Zo3+5DMw5d
6abLB4RNejP/khv0Nq3YlSI2aBFsfELM85wuxAc/FLAPT/+Qknb54rxK6Y/NoIAK98Up8YIiXbix
3YEjo3slFUYweRb46gVLlH8dwhzI47f0EEA8E8NfH1PoSOSGtHuhNbB7Jbq4046rPzidADQAmPPR
cZQwggNmMIICz6ADAgECAhANi0/uqtIYW/R1ap0p4X/7MA0GCSqGSIb3DQEBAgUAMF8xCzAJBgNV
BAYTAlVTMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjE3MDUGA1UECxMuQ2xhc3MgMSBQdWJsaWMg
UHJpbWFyeSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTAeFw05ODA1MTIwMDAwMDBaFw0wODA1MTIy
MzU5NTlaMIHMMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UECxMWVmVyaVNpZ24gVHJ1
c3QgTmV0d29yazFGMEQGA1UECxM9d3d3LnZlcmlzaWduLmNvbS9yZXBvc2l0b3J5L1JQQSBJbmNv
cnAuIEJ5IFJlZi4sTElBQi5MVEQoYyk5ODFIMEYGA1UEAxM/VmVyaVNpZ24gQ2xhc3MgMSBDQSBJ
bmRpdmlkdWFsIFN1YnNjcmliZXItUGVyc29uYSBOb3QgVmFsaWRhdGVkMIGfMA0GCSqGSIb3DQEB
AQUAA4GNADCBiQKBgQC7WkSKBBa7Vf0DeootlE8VeDa4DUqyb5xUv7zodyqdufBou5XZMUFweoFL
uUgTVi3HCOGEQqvAopKrRFyqQvCCDgLpL/vCO7u+yScKXbawNkIztW5UiE+HSr8Z2vkV6A+Hthzj
zMaajn9qJJLj/OBluqexfu/J2zdqyErICQbkmQIDAQABo4G0MIGxMBEGCWCGSAGG+EIBAQQEAwIB
BjA1BgNVHR8ELjAsMCqgKKAmhiRodHRwOi8vY3JsLnZlcmlzaWduLmNvbS9wY2ExLjEuMS5jcmww
RwYDVR0gBEAwPjA8BgtghkgBhvhFAQcBATAtMCsGCCsGAQUFBwIBFh93d3cudmVyaXNpZ24uY29t
L3JlcG9zaXRvcnkvUlBBMA8GA1UdEwQIMAYBAf8CAQAwCwYDVR0PBAQDAgEGMA0GCSqGSIb3DQEB
AgUAA4GBAEJ8Dt+MeUysvwjsTVUvUImgxV5OLl6VMpt5rWURCxxKUsTVqDEhjt4Qm2wIxQfmA7nn
yDR4CQnyvAZC+FqMg9GK3qoi9dnjIdLPZYwGM7DNILIzzQq9PuGdwTWpZLCnpSRb6fFo6xPEfDf0
lGQNmsW9MxfvgzOgPuWqPq7Ycx+tMIIEUjCCA7ugAwIBAgIQA9vRLe3DckwbHCvUJwpGwzANBgkq
hkiG9w0BAQUFADCBzDEXMBUGA1UEChMOVmVyaVNpZ24sIEluYy4xHzAdBgNVBAsTFlZlcmlTaWdu
IFRydXN0IE5ldHdvcmsxRjBEBgNVBAsTPXd3dy52ZXJpc2lnbi5jb20vcmVwb3NpdG9yeS9SUEEg
SW5jb3JwLiBCeSBSZWYuLExJQUIuTFREKGMpOTgxSDBGBgNVBAMTP1ZlcmlTaWduIENsYXNzIDEg
Q0EgSW5kaXZpZHVhbCBTdWJzY3JpYmVyLVBlcnNvbmEgTm90IFZhbGlkYXRlZDAeFw0wNTAxMjkw
MDAwMDBaFw0wNjAyMDMyMzU5NTlaMIIBFjEXMBUGA1UEChMOVmVyaVNpZ24sIEluYy4xHzAdBgNV
BAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxRjBEBgNVBAsTPXd3dy52ZXJpc2lnbi5jb20vcmVw
b3NpdG9yeS9SUEEgSW5jb3JwLiBieSBSZWYuLExJQUIuTFREKGMpOTgxHjAcBgNVBAsTFVBlcnNv
bmEgTm90IFZhbGlkYXRlZDE0MDIGA1UECxMrRGlnaXRhbCBJRCBDbGFzcyAxIC0gTWljcm9zb2Z0
IEZ1bGwgU2VydmljZTEYMBYGA1UEAxQPVGVycmVuY2UgS29lbWFuMSIwIAYJKoZIhvcNAQkBFhNy
b290QG1lZGlhbW9ua3MubmV0MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQD9YLIPv2NYzdD8
pP3tDHnqgiHjcUkET97GZqGruZh934sIX0gbOjsGkhxYNSon/YwJunVNtyDSbngXnUQZYmSWkXdp
9M8bCWhZPkSj52U4I3Zm0VOu96VE9FU9AIihLOfZM/eHtAm0PFf4/epTEnRHcwT/jGIa4z9Wp11K
nxqhgwIDAQABo4HnMIHkMAkGA1UdEwQCMAAwRAYDVR0gBD0wOzA5BgtghkgBhvhFAQcXAzAqMCgG
CCsGAQUFBwIBFhxodHRwczovL3d3dy52ZXJpc2lnbi5jb20vcnBhMAsGA1UdDwQEAwIFoDAdBgNV
HSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwMAYKYIZIAYb4RQEGBwQiFiAxYTk2OTI5MzdjYzI5
MWEzNmRmMDE3ZDg0MGM0NGIxNjAzBgNVHR8ELDAqMCigJqAkhiJodHRwOi8vY3JsLnZlcmlzaWdu
LmNvbS9jbGFzczEuY3JsMA0GCSqGSIb3DQEBBQUAA4GBAHI9D6iQxH9wluMNMGUpM/qjJ5o1dq10
MC0wE14MPhXXb8hQu3mc3LMp/hcJomY7pJQIYQTbpSP0uBh+xwge4Ff2zG0b3kUN6eklkZdvtgl8
Q4yqfphzTDoZfMa5SPNUYwnJhAElC3wLr2fvWPD9YVh/4CD3aL/rEzrUYMJ0l2paMYIEPjCCBDoC
AQEwgeEwgcwxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVz
dCBOZXR3b3JrMUYwRAYDVQQLEz13d3cudmVyaXNpZ24uY29tL3JlcG9zaXRvcnkvUlBBIEluY29y
cC4gQnkgUmVmLixMSUFCLkxURChjKTk4MUgwRgYDVQQDEz9WZXJpU2lnbiBDbGFzcyAxIENBIElu
ZGl2aWR1YWwgU3Vic2NyaWJlci1QZXJzb25hIE5vdCBWYWxpZGF0ZWQCEAPb0S3tw3JMGxwr1CcK
RsMwCQYFKw4DAhoFAKCCArIwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUx
DxcNMDUwMzExMDA1NjU0WjAjBgkqhkiG9w0BCQQxFgQUTRc7WiI4TRkpq9Dt16AjnDFzdlEwZwYJ
KoZIhvcNAQkPMVowWDAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAw
BwYFKw4DAgcwDQYIKoZIhvcNAwICASgwBwYFKw4DAhowCgYIKoZIhvcNAgUwgfIGCSsGAQQBgjcQ
BDGB5DCB4TCBzDEXMBUGA1UEChMOVmVyaVNpZ24sIEluYy4xHzAdBgNVBAsTFlZlcmlTaWduIFRy
dXN0IE5ldHdvcmsxRjBEBgNVBAsTPXd3dy52ZXJpc2lnbi5jb20vcmVwb3NpdG9yeS9SUEEgSW5j
b3JwLiBCeSBSZWYuLExJQUIuTFREKGMpOTgxSDBGBgNVBAMTP1ZlcmlTaWduIENsYXNzIDEgQ0Eg
SW5kaXZpZHVhbCBTdWJzY3JpYmVyLVBlcnNvbmEgTm90IFZhbGlkYXRlZAIQA9vRLe3DckwbHCvU
JwpGwzCB9AYLKoZIhvcNAQkQAgsxgeSggeEwgcwxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMR8w
HQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMUYwRAYDVQQLEz13d3cudmVyaXNpZ24uY29t
L3JlcG9zaXRvcnkvUlBBIEluY29ycC4gQnkgUmVmLixMSUFCLkxURChjKTk4MUgwRgYDVQQDEz9W
ZXJpU2lnbiBDbGFzcyAxIENBIEluZGl2aWR1YWwgU3Vic2NyaWJlci1QZXJzb25hIE5vdCBWYWxp
ZGF0ZWQCEAPb0S3tw3JMGxwr1CcKRsMwDQYJKoZIhvcNAQEBBQAEgYAfuyMYcYbP/Rj/kqMgiAUW
aP/lxN1O5QjHs/e6fMi1hoZLoINhQh3RvDcTdQ6WD1yPC+e6qGQjsulhx7nFH/v0d8RTZ1gsoZde
u3PWqMokgyaQHube3pSeZKnECcAYLOYim/efE/Ex5IvFZkIb1vqPpUcg5NOnMWBLx/6hG2OObgAA
AAAAAA==

------=_NextPart_000_0019_01C525DD.99A93310--

