From: "Steven" <sos22@cam.ac.uk>
Subject: Re: Need to implement
Date: Wed, 10 Sep 2003 21:53:29 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030910205329.GA46661@archibold.chu.cam.ac.uk>
References: <8EA11405E59BD611BA7100104B93C260020B2777@exdel01.del.mgsl.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8EA11405E59BD611BA7100104B93C260020B2777@exdel01.del.mgsl.com>
List-Id: <linux-c-programming.vger.kernel.org>
To: Harmeet Uppal <Harmeet_Uppal@KeaneIndia.com>
Cc: linux-c-programming@vger.kernel.org


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Any clues how to implement a Read-Write lock on Linux using write
> preference.
=46rom memory, the standard implementation on top of mutexes and
condition variables goes a bit like this:

struct biassed_lock {
	mutex lock;                 /* Lock to protect the other
				       fields of this structure. */
	int num_writers_waiting;
	int num_readers_waiting;
	int num_readers_active;
	int num_writers_active;
	pthread_cond_t event_object;
};

void write_lock(struct biassed_lock *bl)
{
	lock(bl->lock);
	bl->num_writers_waiting++;
	while (bl->num_readers_active || bl->num_writers_active)
		pthread_cond_wait(bl->event_object, bl->lock);
	bl->num_writers_waiting--;
	bl->num_writers_active++;
	unlock(bl->lock);
}

void read_lock(struct biassed_lock *bl)
{
	lock(bl->lock);
	bl->num_readers_waiting++;
	while (bl->num_writers_active || bl->num_writers_waiting)
		pthread_cond_wait(bl->event_object, bl->lock);
	bl->num_readers_active++;
	bl->num_readers_waiting--;
	unlock(bl->lock);
}

void upgrade_lock(struct biassed_lock *bl)
{
	lock(bl->lock);
	bl->num_writers_waiting++;
	assert(bl->num_writers_active =3D=3D 0);
	while (bl->num_readers_active > 1)
		pthread_cond_wait(bl->event_object, bl->lock);
	assert(bl->num_writers_active =3D=3D 0);
	bl->num_writers_active++;
	bl->num_readers_active--;
	bl->num_readers_waiting--;
	unlock(bl->lock);
}

void write_unlock(struct biassed_lock *bl)
{
	lock(bl->lock);
	bl->num_writers_active--;
	pthread_cond_broadcast(bl->event_object);
	unlock(bl->lock);
}

void read_unlock(struct biassed_lock *bl)
{
	lock(bl->lock);
	bl->num_readers_active--;
	pthread_cond_broadcast(bl->event_object);
	unlock(bl->lock);
}

Internally, the behaviour is roughly this:

1) Unless bl->lock is held:
   a) bl->num_readers_active is the number of threads currently
   holding a read lock on bl.
   b) bl->num_readers_waiting is the number of threads currently
   waiting for a read lock on bl.
   c) bl->num_writers_active is the number of threads currently
   holding a write lock on bl (either 0 or 1).
   d) bl->num_writers_waiting is the number of threads currently
   waiting for a write lock on bl.
2) num_{readers,writers}_{active,waiting} are only ever modified with
   the lock held.
3) event_object is signalled whenever bl->num_writers_active or
   bl->num_readers_active decreases.

Externally, a biassed_lock behaves like this:

4) If a thread enters write_lock while a read lock is in place,
   it will block until the read lock is removed.
5) If a thread enters write_lock while a write lock is in place,
   it will block until the write lock is removed.
6) If a thread enters read_lock while a write lock is in place or
   while another thread is waiting for a write lock, it will
   block until those write locks have been acquired and released.
7) If a thread enters write_unlock with other threads blocked
   trying to acquire a write lock, it will unblock precisely one
   of those.  Otherwise, if there are threads trying to acquire
   a read lock, it will unblock all of those.  Otherwise, it
   just marks the lock as available.
8) If a thread enters read_unlock with other threads blocked
   trying to acquire a write lock, and it is the last thread to
   hold a read lock, it will unblock precisely one of the threads
   trying to get the write lock.
9) If a thread holds a read lock, then calling upgrade_lock(bl) is
   equivalent to calling read_unlock(bl); write_lock(bl);, except
   that it is atomic.


It's been a while since I've needed to do anything like this, though,
so test thoroughly...

Steven Smith,
sos22@cam.ac.uk.

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (FreeBSD)

iD8DBQE/X49JO4S8/gLNrjcRApzLAJ9eIYC1Cdt2Z2G20/doZ5CcvlwOwACeIBG7
GoBgIReAteISe7ZIHa4Uhcw=
=e5fK
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
