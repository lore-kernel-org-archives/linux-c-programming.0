From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: Newbie Trouble with pointers and structures.
Date: Sat, 9 Aug 2003 21:49:01 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16181.24125.22717.313131@cerise.nosuchdomain.co.uk>
References: <200308091316.34217.eric@cisu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200308091316.34217.eric@cisu.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: eric@cisu.net
Cc: linux-c-programming@vger.kernel.org


Eric wrote:

> 	I am a newbie who is trying to teach himself C programming and I am having 
> trouble modifying structure contents. I want the function setoption() to take 
> a pointer to a pointer in a structure and modify it without needing to return 
> a value (although currently it does). The function works correctly and GDB 
> shows that *Option has been set to *String. However, when the function 
> returns the pointer in the structure has not been modified. Here are the 
> relevant code pieces.
> 
> in file vpn.c (where main() is)
> 
> structure definition (declared global in vpn.c):
> struct {

> 	char *LogFilename;

> } ConfigOptions = { NULL, NULL, NULL, NULL, NULL, 0,\
> 		    NULL,NULL,NULL,0, NULL,NULL, NULL,NULL,NULL};
> 
> extern char *setoption(char *Option,const char *String);
> 
> setoption is called like this from vpn.c: 
> setoption(ConfigOptions.LogFilename,"/var/log/vpn.log");
> 
> in file helpers.c:
> char *setoption(char *Option,const char *String){
> 	int achar = sizeof(char);

sizeof(char) is *always* 1; there is no need to compute it.

> 	/* This function takes a pointer to a structure element and sets it to
> 	the given string. Takes care of memory allocation with free and malloc. We
> 	can just give it the option and the string and let it play. Saves time. */
> 	if (Option != NULL){
> 		free(Option);
> 	}
> 	Option = (char *)malloc(achar * strlen(String));

The result of strlen() doesn't include the terminating NUL byte; you
have to add that yourself. But in this case, just use strdup().

> 	if (Option == NULL){
> 		fprintf(stderr,"Error Allocating Memory in setoption");
> 	}
> 	//Copy the new string.
> 	strcpy(Option,String);
> }
> 
> After the function returns. GDB print ConfigOptions.LogFilename shows 0x0 
> address (NULL).Obviously this is what it has been initialized to in the 
> beginning. I know that
> ConfigOptions.LogFilename = \ 
> setoption(ConfigOptions.LogFilename,"/var/log/vpn.log");
> will work....but thats not quite how I want to do it. And besides, its longer 
> and kinda clunky compared to giving it the pointer only once.
> 
> According to my knowledge I should be modifying the Pointer in the structure, 
> but according to gdb It seems that I am missing something.

Except for arrays, C uses call-by-value, i.e. the parameter variable
is distinct from the argument expression; modifying the parameter
within the callee won't affect the argument in the caller. I'll give
an example:

	#include <stdio.h>
	
	void foo(int x)
	{
		printf("foo[1]: x = %d\n", x);
		x++;
		printf("foo[2]: x = %d\n", x);
	}
	
	void bar(void)
	{
		int x = 1;
		printf("bar[1]: x = %d\n", x);
		foo(x);
		printf("bar[2]: x = %d\n", x);
	}
	
	int main(void)
	{
		bar();
		return 0;
	}

This will print:

	bar[1]: x = 1
	foo[1]: x = 1
	foo[2]: x = 2
	bar[2]: x = 1

If you want the callee to modify something from the caller's scope,
you have to pass a pointer to the thing which you wish it to modify,
e.g.:

	#include <stdio.h>
	
	void foo(int *px)
	{
		printf("foo[1]: *px = %d\n", *px);
		(*px)++;
		printf("foo[2]: *px = %d\n", *px);
	}
	
	void bar(void)
	{
		int x = 1;
		printf("bar[1]: x = %d\n", x);
		foo(&x);
		printf("bar[2]: x = %d\n", x);
	}
	
	int main(void)
	{
		bar();
		return 0;
	}

prints:

	bar[1]: x = 1
	foo[1]: *px = 1
	foo[2]: *px = 2
	bar[2]: x = 2

So, in your specific case, you need e.g.:

	char *setoption(char **pOption, const char *String)
	{
		char *Option = *pOption;
		if (Option)
			free(Option);
		Option = strdup(String);
		if (!Option)
			fprintf(stderr,"Error Allocating Memory in setoption");
		*pOption = Option;
	}

For this, you have to pass the address of the field, i.e.:

	setoption(&ConfigOptions.LogFilename,"/var/log/vpn.log");

-- 
Glynn Clements <glynn.clements@virgin.net>
