From: "Srinivas G." <srinivasg@esntechnologies.co.in>
Subject: Non Portable pthread (-np) API for thread creation in suspend mode
Date: Tue, 17 Mar 2009 18:26:18 +0530
Message-ID: <F5BA82141F7AA94885B9643C77EEA5F2134DFA@mail.esntechnologies.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org, linux-apps@vger.kernel.org, linux-gcc@vger.kernel.org
Cc: Glynn Clements <glynn@gclements.plus.com>, bert.wesarg@googlemail.com, Richard Dengler <rdengler@arcor.de>, pradeep.rautela@gmail.com, uday.karan@gmail.com, brouits@free.fr, Manish Katiyar <mkatiyar@gmail.com>

Dear All,

I have implemented a threading program using the pthread library on Cen=
tOS - 5.2 Linux system. (The CentOS is an Enterprise Linux distribution=
 based on the freely available sources from Red Hat Enterprise Linux.) =
However, I need to create a pthread that is initially suspended. But, I=
 did not find any API in the pthread library which does the my requirem=
ent. So, I googled and found some of the FreeBSD thread API which is as=
 follows.

pthread_attr_setcreatesuspend_np
pthread_suspend_np
pthread_resume_np=20

pthread_attr_setcreatesuspend_np =A0- prepare attribute for creation of=
 suspended thread. I have also seen that the "_np" stands for "non port=
able" API. (The functions with the pthread_ prefix and _np suffix are n=
ot portable extensions to POSIX threads.)

My question is, how can I use the "_np" API on my Linux box. I guess, t=
he "_np" API is available in "libthr" shared library. So, I tried to do=
wnload the "libthr" shared library, but there is no luck to me.=20

I have also one more question, Shall I use the "libthr" shared library =
on my CENTOS without affecting the "libpthread" library. If possible, p=
lease suggest me.

I can also able to implement the suspend and resume functionality with =
the following mechanism. But I have also seen that with "libthr" we get=
 better performance than "libpthread". Please look at the following lin=
k. That is the reason, I want to use the "libthr" on my CENTOS Linux bo=
x.

http://www.dslreports.com/forum/r19082719-FreeBSD-libthr-libpthread

static int ready_to_go =3D 0;
static pthread_mutex_t suspend_mutex =3D PTHREAD_MUTEX_INITIALIZER;
static pthread_cond_t suspend_cond =3D PTHREAD_COND_INITIALIZER;

static void *func(void *arg) {
=A0=A0=A0=A0=A0=A0=A0 pthread_mutex_lock(&suspend_mutex);
=A0=A0=A0=A0=A0=A0=A0 while (ready_to_go =3D=3D 0) {
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pthread_cond_wait(&suspend_c=
ond, &suspend_mutex);
=A0=A0=A0=A0=A0=A0=A0 }
=A0=A0=A0=A0=A0=A0=A0 pthread_mutex_unlock(&suspend_mutex);
=A0=A0=A0=A0=A0=A0=A0 /* Now do our thing */
=A0=A0=A0=A0=A0=A0=A0 ...
=A0=A0=A0=A0=A0=A0=A0 return NULL;
}

void spawn_thread(void) {
=A0=A0=A0=A0=A0=A0=A0 pthread_attr_t attr;
=A0=A0=A0=A0=A0=A0=A0 pthread_t thread;

=A0=A0=A0=A0=A0=A0=A0 pthread_attr_init(&attr);
=A0=A0=A0=A0=A0=A0=A0 /* We don't need to join this thread */
=A0=A0=A0=A0=A0=A0=A0 pthread_attr_setdetachstate(&attr, PTHREAD_CREATE=
_DETACHED);
=A0=A0=A0=A0=A0=A0=A0 pthread_create(&thread, &attr, func, NULL);
=A0=A0=A0=A0=A0=A0=A0 pthread_attr_destroy(&attr);

=A0=A0=A0=A0=A0=A0=A0 /* Do some stuff */
=A0=A0=A0=A0=A0=A0=A0 ...
=A0=A0=A0=A0=A0=A0=A0 /* Now tell thread to continue */
=A0=A0=A0=A0=A0=A0=A0 pthread_mutex_lock(&suspend_mutex);
=A0=A0=A0=A0=A0=A0=A0 ready_to_go =3D 1;
=A0=A0=A0=A0=A0=A0=A0 pthread_mutex_unlock(&suspend_mutex);
=A0=A0=A0=A0=A0=A0=A0 pthread_cond_signal(&suspend_cond);
}

Thanks in advance.

With Regards,
Srinivas G

--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
