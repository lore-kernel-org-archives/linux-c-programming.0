From: Karol Banczyk <car-los@tlen.pl>
Subject: Re: ophan child process to take standard input
Date: Mon, 05 Sep 2005 19:42:11 +0200
Message-ID: <dfi01j$opt$1@sea.gmane.org>
References: <dfffk2$fp8$1@sea.gmane.org> <6a00c8d505090422337beed9a0@mail.gmail.com>
Reply-To: car-los@tlen.pl
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <6a00c8d505090422337beed9a0@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-c-programming@vger.kernel.org

Steve Graegert napisa=B3(a):
> On 9/4/05, Karol Banczyk <car-los@tlen.pl> wrote:
>=20
>>Hello,
>>       I'm solving an exercise from my school. Not to go into details=
 - the
>>task is to create a initiating process which in turn starts three new
>>processes  and then finishes its work. The three processes are to
>>communicate with pipes. There's no problem till this stage. But there=
's
>>the catch. The first of the three processes has to get its input from
>>the standard input and this works only as long as the parent
>>(initiating) process is alive. When the parent finishes the standard
>>input goes back to bash and the orphaned processes are adopted by the
>>init process having no access to stdin.
>=20
>=20
> This is what I would expect.  As long as the parent is running child
> processes are attached to the process group's controlling terminal an=
d
> will be detached automatically when the parent is terminated.
>=20
> Normally, the parent should wait (waitpid) for its childs to prevent
> them of becoming orphans.  Are you waiting for them?
>=20
> It would be easier to help if you would let us know what the exercise=
 is. =20
>=20
>=20
> Regards
>=20
> 	\Steve


Hello again
Thanks for reply, Steve,

So - let's describe the whole exercise. I've done almost everything=20
except the "finish parent" part.

We have to: create an initializing process that would create 3 processe=
s:
1. first one to read from stdin and send read lines to a named pipe,
2. second to read from the pipe from proc 1, display the lines and to=20
write the to another pipe numbers of characters from the read lines,
3. third one to read from the pipe form proc 2 and to display the numbe=
rs.

No there is a restriction that the initializing process should just=20
"init the processes and finish immediately". The rest of the task is=20
about using signals to suspend/continue the pipe communication or the=20
finish all the processes. It's rather unimportant for my problem apart=20
from the fact, that the three processes have to communicate with each=20
other using signal (which makes it even harder if you really have to=20
kill the parent process).


My solution fulfills all the requirements of the exercise except for th=
e=20
termination of the initilizing process. As you said, Steve, I do wait=20
for all the three child processes in parent - interpreting the exercise=
=20
to my convenience that "fihishing" is a way of "being suspended" or=20
"doing nothing".

I just don't know if the creator of the task wants me to do some=20
extraordinary magic with process groups and task controlling processes=20
or is it just a bug. I can't find a way to give an orphan process acces=
s=20
to a terminal which has no realtion with it (after a orphaned process i=
s=20
adopted by init). Is it anyway a good programming style to create=20
orphaned processes??

Or maybe there is a way to create process that are not child processes?=
=20
I currently create child processes using the fork function..

I hope my description has enough details now. Thanks


KB

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
