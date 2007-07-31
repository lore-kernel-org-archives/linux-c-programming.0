From: Mateus Interciso <p.zarnick@gmail.com>
Subject: Re: programming using system calls
Date: Tue, 31 Jul 2007 14:13:05 +0000 (UTC)
Message-ID: <f8ng1g$ios$1@sea.gmane.org>
References: <11922382.post@talk.nabble.com> <f8n88c$hsu$1@sea.gmane.org>
	<192840a00707310700l2536f183s66e05a6c9b072fd3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-c-programming@vger.kernel.org

On Tue, 31 Jul 2007 18:00:03 +0400,
=D0=90=D0=BD=D0=B4=D1=80=D1=96=D0=B9 =D0=9C=D1=96=D1=88=D0=BA=D0=BE=D0=B2=
=D1=81=D1=8C=D0=BA=D0=B8=D0=B9 wrote:

> Hi, Mateus.
> Maybe it looks rude, but i want to correct you: fread, feof, fopen ar=
e
> _not_ system calls, as i remember. Your example is correct, but it ma=
kes
> no use of system calls. Your code is pure ISO C. :)
> Considering this, the program should look like this:
>=20
> #include <unistd.h> /*read(), close()*/ #include <fcntl.h> /*open()*/
> #include <stdio.h> /*fprintf()*/
> #include <sys/types.h> /**/
> #include <errno.h> /* errno*/
> #include <string.h> /* strerror(), memset()*/
>=20
> int
> main(int argc, char **argv)
> {
> 	int fd; /*file descriptor*/
> 	char buf[BUFSIZ]; /*buffer for reading data*/ int bytes_read =3D -1;
> 	/*bytes, already read from file*/
> =09
> 	if (argc !=3D 2)
> 	{
> 		fprintf(stderr, "Usage: %s <file>\n", argv[0]); return 1;
> 	}
> =09
> 	fd =3D open (argv[1], O_RDONLY);
> 	if (fd =3D=3D -1)
> 	{
> 		fprintf(stderr, "%s: open() failed. Reason: %s", argv[0],
> 		strerror(errno)); return 1;
> 	}
> =09
> 	while (bytes_read !=3D 0)
> 	{
> 		bytes_read =3D read(fd, buf, BUFSIZ);
> 		if (bytes_read =3D=3D -1)
> 		{
> 			fprintf(stderr, "%s: read() failed. Reason: %s",=20
argv[0],
> 			strerror(errno)); close(fd);
> 			return 1;
> 		}
> 		fprintf(stdout, "%s", buf);
> 		memset(buf, 0, BUFSIZ);
> 	}
> =09
> 	close(fd);
> =09
> 	return 0;
> }
>=20
> 2007/7/31, Mateus Interciso <p.zarnick@gmail.com>:
>> On Tue, 31 Jul 2007 04:27:13 -0700, nisa wrote:
>>
>> > hi,
>> > i am quite new to programming using system calls and would like a
>> > basic idea regarding the usage of system calls. i would like
>> > assistance in the following area of c programming in linux: 1.how =
to
>> > open a text file ,read data and print the data on console using
>> > system calls
>> > 2.create a text file and write some data 3.read data from a file a=
nd
>> > append that data to another file using lseek() 4.creation of a par=
ent
>> > and child process using fork()
>>
>> Well, just to not let you in blank, here is a VERY simple file that
>> reads a text file, and output it to the screen
>>
>> #include <stdio.h>  //standard IO
>> #include <stdlib.h> //for reading files #include <string.h> //for
>> memset
>> #include <errno.h>  //for errno
>> int main(int argc, char *argv[]){
>>   FILE *fp =3D NULL;
>>   char ch[1];
>>
>>   if(argc!=3D2){
>>     fprintf(stderr,"Usage:%s <file>\n",argv[0]); return 1;
>>   }
>>   memset(ch,'\0',sizeof(char)*1);
>>   if((fp=3Dfopen(argv[1],"r"))=3D=3DNULL){
>>     perror("fopen");
>>     return errno;
>>   }
>>   while(feof(fp)=3D=3D0){
>>     if( (fread(ch,sizeof(char),1,fp)=3D=3D0) && (feof(fp)=3D=3D0) ){
>>       perror("fread");
>>       fclose(fp);
>>       memset(ch,'\0',sizeof(char)*1);
>>       return errno;
>>     }
>>     fprintf(stdout,"%c",ch[0]);
>>   }
>>   fclose(fp);
>>   memset(ch,'\0',sizeof(char)*1);
>>   return 0;
>> }
>>
>> Also, as it was stated before, use the man pages. If you don't have =
a
>> Linux box, then google will be your friend for this. In this example=
,
>> you would need, the man pages for fopen(),fread() and feof().
>>
>> Good luck.
>>
>> -
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-c-programming" in the body of a message to
>> majordomo@vger.kernel.org More majordomo info at=20
>> http://vger.kernel.org/majordomo-info.html
>>

You are absolutly right, I'm terrible sorry...It's just that it has bee=
n=20
so long since I haven't used open(), read(), close(), that I must have=20
gone crazy, I'm terribly sorry for this.

Mateus

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
