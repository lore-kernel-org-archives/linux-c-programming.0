From: "John Anthony Kazos Jr." <jkazos@vt.edu>
Subject: Re: Password Encryption & Philosophy
Date: Fri, 30 May 2003 09:48:12 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <5.2.1.1.0.20030530093109.00a13060@pop.vt.edu>
References: <EF836A380096D511AD9000B0D021B527013AD2E1@narmada.techmas.hcltech.com>
 <001a01c3236e$6249bc00$ed64a8c0@descartes>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <000c01c32693$4d336e10$ed64a8c0@descartes>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "John T. Williams" <jtwilliams@vt.edu>
Cc: linux-c-programming <linux-c-programming@vger.kernel.org>

At 06:07 AM 5/30/03 -0400, John T. Williams wrote:
>I had a problem, and I was wondering if anyone had a solution.
>I'm writing a client which gives the user the option to store their
>password, and I want to lend some security to the password being stored. My
>problem is that no matter what algorithm I use to encrypt and decrypt the
>password (it can't be a one way hash, bc I have to be able to send it to the
>server in its original form), anyone who has access to the source code and
>the encrypted password can get the original password back. Does anyone have
>any suggestions on how to encrypt a password with an open source algorithm
>and yet lend more security stored information.

That's a really sticky problem. You have to consider what is being sent 
where, and why. Think of it in layers.

Start with a simple stored-cleartext, sent-cleartext password system. 
Anyone can sniff over the network for the user's password, so you one-time 
hash it when you send it. But that doesn't work, because the attacker can 
simply send the one-time hash, so you have the server send a random string 
to seed the hashing algorithm. Now it's secure against snooping (as long as 
your one-time hash algorithm is not susceptible to a 
partial-known-plaintext attack).

But what about storage? You can't store it hashed, like you said, because 
you have to have the password in its original form to hash. You can't have 
the server designate a permanent "salt" that you can hash'n'store with, 
because now you're doing the same thing as before, where the attacker can 
simply copy the hashed form and send it. You could encrypt it with some 
algorithm, but that relies on its own key. If you store the key with the 
password, it's no more secure. If you have the user remember the key, you 
may as well have saved time and told them to remember the password.

The basic thing is, there are only three ways to reliable authenticate 
someone nowadays: a secret they know and do not store or share, a device 
they have with a secret algorithm, and a public/private key pair signed by 
an authority like Verisign. How much security does all this get you? It 
depends.

The public key is *way* too long to remember, so it has to be stored 
somehow. On the disk? Same problem as before. If you cannot secure the 
disk, you have a big problem. On a read-only floppy or other peripheral 
device? If you cannot trust the disk, you cannot trust the programs on it, 
because for all you know the key-reading binary has been compromised. You 
could store the key on a computer connected by a network, a computer which 
does the encrypting/decrypting and which never tells you what the private 
key is, but you can't trust it fully unless you write everything from the 
OS to the client software all on your own, and test it completely for bugs. 
Using a "shrinkwrapped" OS might work, as long as it cannot be hacked from 
the network interface, because someone could compromise the computer 
connected to it and start sending Chernobyl packets.

How about one-time passwords? There is absolutely *nothing* software-based 
more secure than one-time passwords. But think about it: Someone can still 
guess it. By incredible, unbelievable, almost divine luck, someone can 
guess a one-time password. You want to secure by biometrics? Someone could 
fake some signs; someone could kidnap and coerce an authorized user; you 
could even be betrayed by that authorized user. Add visual inspection and 
monitoring of commands used? Humans can be fooled by humans.

You have to pick your battles. For your situation, I would suggest 
forgetting about trying to store the password any way other than plaintext. 
Some modern security systems even do that, if you go look up some PAM 
modules. What you need to do is secure the disk as best you can, and leave 
it at that.

You might also implement the security system I've come up with in the past 
week (though I have yet to look and see if someone's already done it). In 
the stead of certificate-signing authorities, record the client's public 
key the first time it is used. (When you're doing this, be careful, because 
the interceptor attack can break it.) Also choose a password at this time. 
Now, log them in by confirming their public key, not by asking for the 
password; ask for the password *only* if the public key is different, like 
they're logging in on another terminal. If you can confirm that no-one 
intercepted the original public-key exchange, then (I believe) you can 
consider the system very secure, so long as the private keys or the 
password are not compromised. 

