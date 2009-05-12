From: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Subject: gettimeofday vs. CLOCK_MONOTONIC
Date: Tue, 12 May 2009 11:00:41 +0530
Message-ID: <4A090981.5090704@sun.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_mbEA7t3r9RTSOqHesmA8Uw)"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

This is a multi-part message in MIME format.

--Boundary_(ID_mbEA7t3r9RTSOqHesmA8Uw)
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7BIT

Hi All,

We are trying to see if changing the system date(hardware clock) during 
sleep time of a process causes the process to exit abruptly or not. It 
seems when we use gettimeofday(), the process hangs but when we use 
clock_gettime(...,CLOCK_MONOTONIC) by defining USE_MONOTONIC in the 
attached c file the program works.
Can anyone tell me why gettimeofday() will cause the process to hang and 
why clock_gettime() will work?

Thanks in advance
Regards
Prasanta

--Boundary_(ID_mbEA7t3r9RTSOqHesmA8Uw)
Content-type: text/x-csrc; name=clocktest.c
Content-transfer-encoding: 7BIT
Content-disposition: inline; filename=clocktest.c

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <time.h>
#include <semaphore.h>
#include <errno.h>

#undef USE_MONOTONIC


sem_t sem_l1, sem_l2, sem_l3;

void
setclock(
	const char *d)
{
	char buf[256];

	sprintf(buf, "/bin/date %s", d);
	system(buf);

	sprintf(buf, "/sbin/hwclock -w");
	system(buf);
}


void *
thread1(
	void *data)
{
#ifdef USE_MONOTONIC
	pthread_condattr_t ca;
#endif
	pthread_cond_t cond  = PTHREAD_COND_INITIALIZER;
	pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
	struct timeval tp;
	struct timespec ts;
	int rc;

#ifdef USE_MONOTONIC
	if ((rc = pthread_condattr_init(&ca)) != 0) {
		printf("thread1: can't condattr_init, rc=%d\n", rc);
		exit(1);
	}

	if ((rc = pthread_condattr_setclock(&ca, CLOCK_MONOTONIC)) != 0) {
		printf("thread1: can't condattr_setclock, rc=%d\n", rc);
		exit(1);
	}

	if ((rc = pthread_cond_init(&cond, &ca)) != 0) {
		printf("thread1: can't cond_init, rc=%d\n", rc);
		exit(1);
	}
#endif

	if ((rc = pthread_mutex_lock(&mutex)) != 0) {
		printf("thread1: can't lock mutex, rc=%d\n", rc);
		exit(1);
	}

#ifdef USE_MONOTONIC
	if ((rc = clock_gettime(CLOCK_MONOTONIC, &ts)) != 0) {
		printf("thread1: can't gettime, rc=%d\n", rc);
	}
#else
	if ((rc = gettimeofday(&tp, NULL)) != 0) {
		printf("thread1: can't get time of day, rc=%d\n", rc);
		exit(1);
	}

	ts.tv_sec = tp.tv_sec;
	ts.tv_nsec = tp.tv_usec * 1000;
#endif

	ts.tv_sec += 10;			// wait for ten seconds

	sem_wait(&sem_l1);

	puts("thread1: calling pthread_cond_timedwait...");

	rc = pthread_cond_timedwait(&cond, &mutex, &ts);
	if (rc == ETIMEDOUT) {
		puts("thread1: ETIMEDOUT");
	} else {
		printf("thread1: timedwait result=%d\n", rc);
	}

	pthread_mutex_unlock(&mutex);

	puts("thread1: done");

	sem_post(&sem_l3);

	pthread_exit(NULL);
}

void *
thread2(
	void *data)
{
	puts("thread2: starting test");

	setclock("010100002009");

	sem_post(&sem_l1);

	sleep(2);

	setclock("010100002010");

	pthread_exit(NULL);
}


int
main(
	int argc,
	char *argv[])
{
	pthread_t t1, t2;
	int rc;

	sem_init(&sem_l1, 0, 0);
	sem_init(&sem_l2, 0, 0);
	sem_init(&sem_l3, 0, 0);

	puts("main: starting threads");

	if ((rc = pthread_create(&t1, NULL, thread1, NULL)) != 0) {
		printf("error creating thread1, rc=%d\n", rc);
		return 1;
	}

	if ((rc = pthread_create(&t2, NULL, thread2, NULL)) != 0) {
		printf("error creating thread2, rc=%d\n", rc);
		return 1;
	}

	sem_wait(&sem_l3);

	setclock("010100002009");

	puts("main: exiting");

	return 0;
}




--Boundary_(ID_mbEA7t3r9RTSOqHesmA8Uw)--
