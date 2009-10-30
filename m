From: Prasanta Sadhukhan <Prasanta.Sadhukhan@Sun.COM>
Subject: Re: code to list contents of zip files
Date: Fri, 30 Oct 2009 12:32:49 +0530
Message-ID: <4AEA8F99.3090201@sun.com>
References: <4ADDADEE.1060806@sun.com>
 <19165.47003.922855.202636@cerise.gclements.plus.com>
 <4ADEFDE3.9000303@sun.com>
 <19167.22609.946075.575192@cerise.gclements.plus.com>
 <4AE04FD0.9080603@sun.com> <4AE94373.8020702@sun.com>
 <4AE96180.8000807@sun.com>
 <19178.20399.326515.377343@cerise.gclements.plus.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_GTOwr5hW5D1eg56LjCLyWQ)"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-reply-to: <19178.20399.326515.377343@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
To: Glynn Clements <glynn@gclements.plus.com>
Cc: Linux C Programming List <linux-c-programming@vger.kernel.org>

This is a multi-part message in MIME format.

--Boundary_(ID_GTOwr5hW5D1eg56LjCLyWQ)
Content-type: text/plain; CHARSET=US-ASCII; format=flowed
Content-transfer-encoding: 7BIT

Glynn Clements wrote:
> Prasanta Sadhukhan wrote:
>
>   
>> Is it possible to output the content of a particular file from a zip file?
>> For example, in the attached ziptest.c I want to get the contents of a 
>> particular file Class3.class from testclasses.zip into a buffer, can 
>> anyone point out what I need to change in the code?
>>     
>
> Iterate over the files until you find the right one. Either start by
> locating the first local file header, then each subsequent one, or
> locate the central directory and iterate over the file headers which
> are stored there.
>
> For the first method, given the offset of one local file header, the
> next one should be located 30 + "file name length" + "extra field length"
> + "compressed size" + 12 bytes further on.
>
> For the second method, the offset from one entry to the next is
> 46 + "file name length" + "extra field length" + "file comment length".
>
> The start of the central directory can be found from the end of
> central directory record, which is at the end of the file. The length
> is variable, so you have to scan backwards for the signature (50 4b 05
> 06), then verify that the offset is 22 + "ZIP file comment length"
> bytes before the end of the file).
>
>   

Thanks. I tried finding the central directory and list the contents 
which I am now able to do. I got the match also but I am not sure how 
would I get the contents once I get the match.
I tried fopen but it fails with "No such file or directory"
Attached is my code

Regards
Prasanta

--Boundary_(ID_GTOwr5hW5D1eg56LjCLyWQ)
Content-type: text/plain; name=ziptest.c
Content-transfer-encoding: 7BIT
Content-disposition: inline; filename=ziptest.c

#include <stdio.h>
#include <string.h>
#include <malloc.h>
#include <zlib.h>
#include <errno.h>
#include <assert.h>

#define CHUNK 16384

/* PKZIP header definitions */
#define ZIPMAG 0x4b50           /* two-byte zip lead-in */
#define LOCREM 0x0403           /* remaining two bytes in zip signature */
/*
 *  * Header signatures
 *   */
#define LOCSIG 0x04034b50L          /* "PK\003\004" */
#define EXTSIG 0x08074b50L          /* "PK\007\008" */
#define CENSIG 0x02014b50L          /* "PK\001\002" */
#define ENDSIG 0x06054b50L          /* "PK\005\006" */
#define LOCFLG 4                /* offset of bit flag */
#define  CRPFLG 1               /*  bit for encrypted entry */
#define  EXTFLG 8               /*  bit for extended local header */
#define LOCHOW 6                /* offset of compression method */
#define LOCTIM 8                /* file mod time (for decryption) */
#define LOCCRC 12               /* offset of crc */
#define LOCSIZ 16               /* offset of compressed size */
#define LOCLEN 20               /* offset of uncompressed length */
#define LOCFIL 24               /* offset of file name field length */
#define LOCEXT 26               /* offset of extra field length */
#define LOCHDR 28               /* size of local header, including LOCREM */
#define EXTHDR 16               /* size of extended local header, inc sig */
#define CENHDR 46
#define ENDHDR 22

#define CH(b, n) (((unsigned char *)(b))[n])
#define SH(b, n) (CH(b, n) | (CH(b, n+1) << 8))
#define LG(b, n) (SH(b, n) | (SH(b, n+2) << 16))
#define GETSIG(b) LG(b, 0)

/*
 *  * Macros for getting end of central directory header (END) fields
 *   */
#define ENDSUB(b) SH(b, 8)          /* number of entries on this disk */
#define ENDTOT(b) SH(b, 10)         /* total number of entries */
#define ENDSIZ(b) LG(b, 12)         /* central directory size */
#define ENDOFF(b) LG(b, 16)         /* central directory offset */
#define ENDCOM(b) SH(b, 20)         /* size of zip file comment */

/*
 *  * Macros for getting central directory header (CEN) fields
 *   */
#define CENVEM(b) SH(b, 4)          /* version made by */
#define CENVER(b) SH(b, 6)          /* version needed to extract */
#define CENFLG(b) SH(b, 8)          /* general purpose bit flags */
#define CENHOW(b) SH(b, 10)         /* compression method */
#define CENTIM(b) LG(b, 12)         /* modification time */
#define CENCRC(b) LG(b, 16)         /* crc of uncompressed data */
#define CENSIZ(b) LG(b, 20)         /* compressed size */
#define CENLEN(b) LG(b, 24)         /* uncompressed size */
#define CENNAM(b) SH(b, 28)         /* length of filename */
#define CENEXT(b) SH(b, 30)         /* length of extra field */
#define CENCOM(b) SH(b, 32)         /* file comment length */
#define CENDSK(b) SH(b, 34)         /* disk number start */
#define CENATT(b) SH(b, 36)         /* internal file attributes */
#define CENATX(b) LG(b, 38)         /* external file attributes */
#define CENOFF(b) LG(b, 42)         /* offset of local header */

char *entries[1024];
int totalentry;

int inf(FILE *source, FILE *dest)
{
    int ret;
    unsigned have;
    z_stream strm;
    unsigned char in[CHUNK];
    unsigned char out[CHUNK];
	unsigned char dict;

    /* allocate inflate state */
    strm.zalloc = Z_NULL;
    strm.zfree = Z_NULL;
    strm.opaque = Z_NULL;
    strm.avail_in = 0;
    strm.next_in = Z_NULL;
    ret = inflateInit2(&strm, -15);
    if (ret != Z_OK) {
		printf("inflateInit failed\n");
        return ret;
	}

		printf("inflateInit succeeded\n");
    /* decompress until deflate stream ends or end of file */
    do {
        strm.avail_in = fread(in, 1, CHUNK, source);
        if (ferror(source)) {
			printf("fread failed\n");
            (void)inflateEnd(&strm);
            return Z_ERRNO;
        }
		printf("fread succeeded\n");
        if (strm.avail_in == 0)
            break;
        strm.next_in = in;

        /* run inflate() on input until output buffer not full */
        do {
            strm.avail_out = CHUNK;
            strm.next_out = out;
            ret = inflate(&strm, Z_NO_FLUSH);
            assert(ret != Z_STREAM_ERROR);  /* state not clobbered */
            switch (ret) {
            case Z_NEED_DICT:
		printf("inflate returned Z_NEED_DICT\n");
                ret = Z_DATA_ERROR;     /* and fall through */
            case Z_DATA_ERROR:
		printf("inflate returned Z_DATA_ERROR\n");
            case Z_MEM_ERROR:
		printf("inflate returned Z_MEM_ERROR\n");
                (void)inflateEnd(&strm);
                return ret;
            }
		printf("inflate succeeded\n");
            have = CHUNK - strm.avail_out;
            if (fwrite(out, 1, have, dest) != have || ferror(dest)) {
		printf("fwrite failed\n");
                (void)inflateEnd(&strm);
                return Z_ERRNO;
            }
        } while (strm.avail_out == 0);

        /* done when inflate() says it's done */
    } while (ret != Z_STREAM_END);

    /* clean up and return */
    (void)inflateEnd(&strm);
    return ret == Z_STREAM_END ? Z_OK : Z_DATA_ERROR;
}

/* report a zlib or i/o error */
void zerr(int ret)
{
    fputs("ziptest: ", stderr);
    switch (ret) {
    case Z_ERRNO:
        if (ferror(stdin))
            fputs("error reading stdin\n", stderr);
        if (ferror(stdout))
            fputs("error writing stdout\n", stderr);
        break;
    case Z_STREAM_ERROR:
        fputs("invalid compression level\n", stderr);
        break;
    case Z_DATA_ERROR:
        fputs("invalid or incomplete deflate data\n", stderr);
        break;
    case Z_MEM_ERROR:
        fputs("out of memory\n", stderr);
        break;
    case Z_VERSION_ERROR:
        fputs("zlib version mismatch!\n", stderr);
    }
}

int readFully(FILE *fd, void *buf, int len)
{
	unsigned char *bp = (unsigned char *)buf;
	while (len > 0) {
		int n = fread((char*)bp, 1, len, fd);
		if (n <=0) {
			return -1;
		}
		bp += n;
		len -= n;
	}
	return 0;
}

int findEND(FILE *fd, void *endbuf)
{
	unsigned char buf[ENDHDR *2];
	int len,pos;

	fseek(fd, 0, SEEK_END);
	len = pos = ftell(fd);
	printf("zip length %d\n", len);	

	/*
     * Search backwards ENDHDR bytes at a time from end of file stopping
     * when the END header has been found.
     */
	memset(buf, 0, sizeof(buf));
	while (len - pos < 0xFFFF) {
		unsigned char *bp;
		int count = 0xFFFF - (len - pos);
		if (count > ENDHDR) {
            count = ENDHDR;
        }
        /* Shift previous block */
        memcpy(buf + count, buf, count);
		/* Update position and read next block */
        pos -= count;
		fseek(fd, pos, SEEK_SET);
		readFully(fd, buf, count); 
		/* Now scan the block for END header signature */
        for (bp = buf; bp < buf + count; bp++) {
            if (GETSIG(bp) == ENDSIG) {
                /* Check for possible END header */
                int endpos = pos + (int)(bp - buf);
                int clen = ENDCOM(bp);
                if (endpos + ENDHDR + clen == len) {
                    /* Found END header */
                    memcpy(endbuf, bp, ENDHDR);
					fseek(fd, endpos+ENDHDR, SEEK_SET);
					if (clen > 0) {
						char *comment = malloc(clen+1);
						readFully(fd, comment, clen);
						comment[clen] = '\0';
					}
					return endpos;
				} else { // added for '0' padding
					memcpy(endbuf, bp, ENDHDR);
					return endpos;
				}
			}
		}
	}
	return 0; //END header not found
}

int readCEN(FILE *fd)
{
	unsigned char endbuf[ENDHDR];
	unsigned char *cenbuf, *cp;
	int locpos, cenpos, cenoff, cenlen, total, count, i;
	int endpos = findEND(fd, endbuf);
	int namelen = 512 + 1;
	char namebuf[512 + 1];
	char *name = namebuf;

	printf("END header is at %d\n", endpos);

	/* Get position and length of central directory */
	cenlen = ENDSIZ(endbuf);
	cenpos = endpos - cenlen;
	
	printf("postion & length of central directory is %d & %d\n", cenlen, cenpos);
	cenoff = ENDOFF(endbuf);
	locpos = cenpos - cenoff;
	totalentry = ENDTOT(endbuf);
	printf("total number of central directory entries %d\n", totalentry);

	fseek(fd, cenpos, SEEK_SET);
	cenbuf = (char *)malloc(cenlen);
	readFully(fd, cenbuf, cenlen);

	//entries = (char*)malloc(total);
	for (count = 0, cp = cenbuf; count < totalentry; count++) {
		int method, nlen, clen, elen, size, csize, crc;
		nlen = CENNAM(cp);
		elen = CENEXT(cp);
		clen = CENCOM(cp);
		size = CENLEN(cp);
		csize = CENSIZ(cp);
		crc = CENCRC(cp);
		if (namelen < nlen + 1) { /* grow temp buffer */
            do
                namelen = namelen * 2;
            while (namelen < nlen + 1);
            if (name != namebuf)
                free(name);
            name = (char *)malloc(namelen);
	        if (name == 0) {
    		    free(cenbuf);
		        return -1;
        	}
        }
	    memcpy(name, cp+CENHDR, nlen);
        name[nlen] = 0;
	entries[count] = (char*)malloc(nlen);
		memcpy(entries[count], name, nlen);
		
		cp += (CENHDR + nlen + elen + clen);
	}
	
	return cenpos;
}

int main(char *argc, char **argv)
{
	char str[] = "./testclasses.zip/package1/package3/Class3.class";
	char *substr = strcasestr(str, ".zip");
	char *loc;
	char *zipfile;
	int errnum;
	unsigned short n;
	unsigned char h[LOCHDR];
	int ret;
	int i;
	FILE *filecontent;

	if (substr == NULL) {
		printf("zip not found\n");
		substr = strcasestr(str, ".jar");
		if (substr == NULL) 
			printf("jar not found\n");
		else
			printf("jar found at location: %s\n",substr);
	}
	else {
	//	printf("zip found at location: %s\n",substr);
	}
	if (*(substr+4) == '\0')
		printf("zip/jar found at last\n");

	loc = (char*)malloc(substr-str+4);
	strncpy(loc, str, substr-str+4);
	printf("zip path = %s\n",loc);

	zipfile = substr+4+1;
	printf("zipfile %s\n", zipfile);

	errno = 0;
	FILE* file = fopen(loc, "r");
	if (file == (FILE*)NULL)
		printf("cannot open zipfile. errno %d\n",errno);
	else 
		printf("file %p\n", file);

	n = getc(file);
	n |= getc(file) << 8;
	if (n == ZIPMAG)
	{
		if (fread((char *)h, 1, LOCHDR, file) != LOCHDR || SH(h,0) != LOCREM) {
			printf("invalid zipfile");
		}
		else
			printf("valid zip or jar file\n");
	} else
		printf("input not a zip file\n");

	readCEN(file);	
	fseek(file, SH(&h[LOCFIL], 0), SEEK_CUR);
	fseek(file, SH(&h[LOCEXT], 0), SEEK_CUR);
	
	for (i=0; i < totalentry; i++){
		printf("entry[%d]=%s\n", i, entries[i]);
		if (!strcmp(entries[i], zipfile)) {
			printf("match found in entry number %d\n",i);
			filecontent = fopen(entries[i], "r");
			if (filecontent == (FILE*)NULL) 
				printf("cannot open content. errno %d\n",errno);
			else
				printf("filecontent %p\n", filecontent);
			}
	}
//	ret = inf(file, stdout);
	if (ret != Z_OK)
		zerr(ret);
}

--Boundary_(ID_GTOwr5hW5D1eg56LjCLyWQ)--
