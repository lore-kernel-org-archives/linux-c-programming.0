From: "Yigit Can" <yigit.can@karel.com.tr>
Subject: Re: SPI driver
Date: Thu, 26 Jun 2003 08:35:05 +0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <004201c33ba4$b4345630$3002a8c0@yigitcan>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_003F_01C33BBD.D81D6A50"
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
To: kernelnewbies <kernelnewbies@nl.linux.org>, linux c programming <linux-c-programming@vger.kernel.org>

This is a multi-part message in MIME format.

------=_NextPart_000_003F_01C33BBD.D81D6A50
Content-Type: text/plain;
	charset="iso-8859-9"
Content-Transfer-Encoding: 7bit

sorry my mistake the code  is attached now.

the spmode register is in loopback mode to test the driver.

the problem is when we set the rx_buffer_desc. to 0xb000 it does not return
to empty state after the writing has finished.

the writing part is working (I can see it from oscilloscope)

thanks

----- Original Message -----
From: "Yigit Can" <yigit.can@karel.com.tr>
To: "linux c programming" <linux-c-programming@vger.kernel.org>
Sent: Wednesday, June 25, 2003 5:29 PM
Subject: SPI driver


>
> Hello,
>
> I'm trying to write an SPI driver for 850_ppc kernel
>
> I have written some code according to the datasheet and some samples.
>
> I can send data but I am not able to receive any data
>
> any comments ?
>
> Thank you
>
> Yigit
>

------=_NextPart_000_003F_01C33BBD.D81D6A50
Content-Type: application/octet-stream;
	name="cpm_spi.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="cpm_spi.c"

#include <linux/config.h>=0A=
#include <linux/module.h>=0A=
#include <linux/kernel.h>=0A=
#include <linux/slab.h>=0A=
#include <linux/fs.h>=0A=
#include <linux/errno.h>=0A=
#include <linux/types.h>=0A=
#include <linux/init.h>=0A=
#include <linux/delay.h>=0A=
#include <linux/proc_fs.h>=0A=
#include <asm/page.h>=0A=
#include <asm/uaccess.h>=0A=
#include <asm/io.h>=0A=
#include <asm/8xx_immap.h>=0A=
#include <asm/mpc8xx.h>=0A=
#include <linux/wrapper.h>=0A=
=0A=
#include "commproc.h"=0A=
//#include "cpm_spi.h"=0A=
=0A=
#define DRIVER_NAME "cmp_spi"=0A=
=0A=
MODULE_AUTHOR("YIGIT CAN");=0A=
MODULE_DESCRIPTION("SPI driver");=0A=
=0A=
#undef DEBUG=0A=
=0A=
=0A=
#define CPM_SPI_MAJOR 89=0A=
#define CONFIG_CPM_SPI_BDSIZE 16=0A=
=0A=
static immap_t *immap =3D NULL;=0A=
static cpm8xx_t *cpmp =3D NULL;=0A=
=0A=
=0A=
static unsigned int dp_addr;=0A=
static ushort t_tbase, r_rbase; =0A=
static volatile cbd_t *tx_bdf, *rx_bdf;=0A=
static u_char *tx_buf, *rx_buf;=0A=
=0A=
=0A=
static int cpm_spi_open(struct inode *inode, struct file *fp);=0A=
static int cpm_spi_release(struct inode *inode, struct file *fp);=0A=
static ssize_t cpm_spi_read(struct file *filp, char *buf, size_t count, =
loff_t *f_pos);=0A=
static ssize_t cpm_spi_write(struct file *filp, const char *buf, size_t =
count, loff_t *f_pos);=0A=
static int cpm_spi_init(void);=0A=
static void cpm_spi_cleanup(void);=0A=
=0A=
/*=0A=
 * File operations supported by this driver.=0A=
 */=0A=
struct file_operations cpm_spi_fops =3D {=0A=
	open:    cpm_spi_open,=0A=
	release: cpm_spi_release,=0A=
	write:    cpm_spi_write,=0A=
	read:	cpm_spi_read,=0A=
};=0A=
=0A=
=0A=
static int cpm_spi_open ( struct inode *inode, struct file *fp )=0A=
{=0A=
	fp->f_op =3D &cpm_spi_fops;=0A=
	MOD_INC_USE_COUNT;=0A=
	return 0;=0A=
}=0A=
=0A=
static int cpm_spi_release( struct inode *inode, struct file *fp )=0A=
{=0A=
	MOD_DEC_USE_COUNT;=0A=
	return 0;=0A=
}=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
static ssize_t cpm_spi_read( struct file *fp, char *buf, size_t count, =
loff_t *f_pos )=0A=
{=0A=
	=0A=
	volatile cpm8xx_t *cp; // comm proc pointer=0A=
	unsigned int i;=0A=
=0A=
	if ( count > CONFIG_CPM_SPI_BDSIZE ) // if the length of data is =
greater than buffer size print error=0A=
	{=0A=
	    printk( "SPI : Invalid Size\n" );=0A=
	    return -EINVAL;=0A=
	}=0A=
	=0A=
	cp =3D cpmp; // pointer to the comm proc=0A=
	=0A=
/*	if ( rx_bdf->cbd_sc & BD_SC_EMPTY ) // if buffer is in use exit with =
error=0A=
	{=0A=
	    printk( "SPI : Buffer Descriptor is in use\n" );=0A=
	    return -EFAULT;=0A=
	}=0A=
*/=0A=
	memset( ( void* )tx_buf, 0, count ); // empty tx_buf ( fill with 0 s )=0A=
=0A=
	tx_bdf->cbd_sc =3D BD_SC_READY | BD_SC_LAST | BD_SC_WRAP;=0A=
	tx_bdf->cbd_datlen =3D count;=0A=
	=0A=
	rx_bdf->cbd_sc =3D BD_SC_EMPTY | BD_SC_WRAP; // receive reg statuses=0A=
	rx_bdf->cbd_datlen =3D count; // data length=0A=
	=0A=
		// start SPI transfer=0A=
	=0A=
	cp->cp_spcom |=3D 0x80; // start transfer=0A=
	=0A=
	for ( i=3D0 ;i<100000; i++) // 10000 us wait to complete transfer=0A=
	{=0A=
	    udelay( 1 );=0A=
//	    if ( (rx_bdf->cbd_sc & BD_SC_EMPTY) =3D=3D 0 ) // this bit turns =
to 0 when the transfer completes=0A=
=0A=
	    if ( (tx_bdf->cbd_sc & BD_SC_READY) =3D=3D 0 ) // this bit turns to =
0 when the transfer completes=0A=
		break;=0A=
	}=0A=
	=0A=
	if ( i =3D=3D 100000 ) // is data received in 10000 us period ?=0A=
	{=0A=
	    printk ( "SPI : Transfer Timeout\n" );=0A=
	    return -EIO;=0A=
	}=0A=
=0A=
	=0A=
	copy_to_user( ( void* )buf, ( void* )rx_buf, count );=0A=
	=0A=
	printk ("\nSONUC : %d ",*rx_buf);=0A=
	return count;=0A=
}=0A=
=0A=
=0A=
=0A=
=0A=
static ssize_t cpm_spi_write( struct file *fp, const char *buf, size_t =
count, loff_t *f_pos )=0A=
{=0A=
	=0A=
	volatile cpm8xx_t *cp; // comm proc pointer=0A=
	unsigned long int i;=0A=
	unsigned long flags;=0A=
=0A=
//	save_flags(flags); cli () ;=0A=
	=0A=
	if ( count > CONFIG_CPM_SPI_BDSIZE ) // if the length of data is =
greater than buffer size print error=0A=
	{=0A=
	    printk( "SPI : Invalid Size\n" );=0A=
	    return -EINVAL;=0A=
	}=0A=
	=0A=
	cp =3D cpmp; // pointer to the comm proc=0A=
	=0A=
=0A=
/*	if ( ( tx_bdf->cbd_sc & BD_SC_READY ) || ( rx_bdf->cbd_sc & =
BD_SC_EMPTY ) ) // if buffer is in use exit with error=0A=
	{=0A=
	    printk( "SPI : Buffer Descriptor is in use\n" );=0A=
	    return -EFAULT;=0A=
	}=0A=
*/	=0A=
	tx_bdf->cbd_sc =3D 0xB800; // trans. reg statuses=0A=
	tx_bdf->cbd_datlen =3D count; // data length=0A=
	=0A=
	rx_bdf->cbd_sc =3D 0xB000;=0A=
	rx_bdf->cbd_datlen =3D count;=0A=
	=0A=
	if ( copy_from_user( (void *)tx_buf,(void *) buf, count ) )=0A=
	{=0A=
	    printk ( "SPI : Error copying from user space\n" );=0A=
	    return -EFAULT;=0A=
	}=0A=
	=0A=
	// start SPI transfer=0A=
	=0A=
	printk ( "SPI : Before transfer regs : rx_bdf->cbd_sc =3D %08x : =
tx_bdf->cbd_sc =3D %08x \n",rx_bdf->cbd_sc, tx_bdf->cbd_sc );=0A=
	printk ( "SPI : Before transfer regs : rx_bdf->datlen =3D %08x : =
tx_bdf->datlen =3D %08x \n",rx_bdf->cbd_datlen, tx_bdf->cbd_datlen );=0A=
	=0A=
	cp->cp_spcom |=3D 0x80; // start transfer=0A=
	=0A=
	for ( i=3D0; i<1000000; i++) // 10000 us wait to complete transfer=0A=
	{=0A=
	    udelay( 1 );=0A=
	    if ( (tx_bdf->cbd_sc & BD_SC_READY) =3D=3D 0 ) // this bit turns to =
0 when the transfer completes=0A=
		break;=0A=
	}=0A=
	=0A=
	if ( i =3D=3D 1000000 ) // is data sent in 10000 us period ?=0A=
	{=0A=
	    printk ( "SPI : Transfer Timeout : rx_bdf->cdb_sc =3D %08x : =
tx_bdf->cbd_sc =3D %08x \n",rx_bdf->cbd_sc, tx_bdf->cbd_sc );=0A=
	    return -EIO;=0A=
	}=0A=
	=0A=
	printk ("RECEIVED : %d ", *rx_buf);=0A=
//	restore_flags(flags);=0A=
	return count;=0A=
	=0A=
}=0A=
=0A=
=0A=
static int cpm_spi_init(void)=0A=
{=0A=
	int err =3D 0; // error variable=0A=
        volatile spi_t *spi; // spi  type pointer=0A=
	volatile cpic8xx_t *cpi;=0A=
	=0A=
//	unsigned long imtemp; =0A=
=0A=
        printk (KERN_INFO "CPM SPI Driver by Yigit Can\n"); // print =
driver info=0A=
	=0A=
	=0A=
	/* Global pointer to internal registers */=0A=
/*	if ( !cpmp )=0A=
	{=0A=
	    asm( "mfspr %0,638": "=3Dr"(imtemp) : );=0A=
	    imtemp &=3D 0xFFFF0000;=0A=
	    immap =3D (immap_t *)&imtemp;=0A=
	} =0A=
*/=0A=
	immap =3D ( immap_t * )IMAP_ADDR;	// pointer to immr reg=0A=
	cpi =3D ( cpic8xx_t *)&(immap->im_cpic);=0A=
	=0A=
	if ( !immap ) // if immr can not be found print error and exit=0A=
	{=0A=
	    printk ( "\n Unable to locate immr\n ");=0A=
	    return -1;=0A=
	}=0A=
		=0A=
	cpmp =3D ( cpm8xx_t * ) &( immap->im_cpm ); // pointer to comm proc=0A=
	=0A=
//	printk (" CPMP "); =0A=
	spi =3D ( spi_t * ) &cpmp->cp_dparam[ PROFF_SPI ];   // pointer to spi=0A=
=0A=
// if IIC microcode patched to the kernel use relocated rpbase 	=0A=
#ifdef  USE_IIC_PATCH =0A=
        if ( spi->spi_rpbase ) =0A=
	{=0A=
	    spi =3D ( spi_t * ) &cpmp->cp_dpmem[ spi->spi_rpbase ];=0A=
	    printk ( "SPI : Using IIC patch\n" );=0A=
	}=0A=
#endif=0A=
	spi->spi_rstate =3D 0;=0A=
        spi->spi_rdp =3D 0;=0A=
        spi->spi_rbptr =3D 0;=0A=
        spi->spi_rbc =3D 0;   =0A=
        spi->spi_rxtmp =3D 0;=0A=
        spi->spi_tstate =3D 0;=0A=
        spi->spi_tdp =3D 0;=0A=
        spi->spi_tbptr =3D 0;=0A=
        spi->spi_tbc =3D 0;=0A=
        spi->spi_txtmp =3D 0;=0A=
=0A=
=0A=
	/* =0A=
	 * Initiliaze port pins for SPI=0A=
	 *                  par dir odr=0A=
	 * PB28 -> SPIMISO:  1   1   0=0A=
         * PB29 -> SPIMOSI:  1   1   0=0A=
         * PB30 -> SPICLK :  1   1   0=0A=
	 */=0A=
	 cpmp->cp_pbodr  &=3D ~(0x000e);=0A=
         cpmp->cp_pbdir  |=3D   0x000e;=0A=
         cpmp->cp_pbpar  |=3D   0x000e; // these pins configured as in =
the datasheet=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
        dp_addr =3D m8xx_cpm_dpalloc( sizeof( cbd_t ) * 2 ); //buffer =
malloc in dp ram=0A=
        if ( dp_addr =3D=3D CPM_DP_NOSPACE ) =0A=
	{=0A=
		printk( "cpm_spi: m8xx_cpm_dpalloc() failed\n" );=0A=
                return -ENOMEM;=0A=
        }=0A=
=0A=
        spi->spi_rbase =3D r_rbase =3D dp_addr; // first part of buffer =
is receive base=0A=
        spi->spi_tbase =3D t_tbase =3D dp_addr + sizeof( cbd_t ); // sec =
part is transmit=0A=
=0A=
	spi->spi_rbptr =3D r_rbase; //start addr of rec buffer is receive buf =
pointer=0A=
        spi->spi_tbptr =3D t_tbase; // start addr of trans buf is =
transmit buf pointer=0A=
	=0A=
=0A=
//	cpmp->cp_cpcr |=3D0x0051; // as mentioned in the data sheet =0A=
	cpmp->cp_cpcr |=3D mk_cr_cmd( CPM_CR_CH_SPI, CPM_CR_INIT_TRX ) | =
CPM_CR_FLG;=0A=
	=0A=
        while(cpmp->cp_cpcr & CPM_CR_FLG) ; // if the command completed=0A=
//	printk ("\n COMM PROC COMMAND COMPLETED \n");=0A=
=0A=
=0A=
        immap->im_siu_conf.sc_sdcr =3D 0x0001;=0A=
=0A=
=0A=
        // Set to big endian=0A=
        spi->spi_tfcr =3D 0x10;=0A=
        spi->spi_rfcr =3D 0x10;=0A=
=0A=
=0A=
        // Set maximum receive size=0A=
        spi->spi_mrblr =3D 0x0010; // max receive buf size=0A=
=0A=
=0A=
	=0A=
=0A=
=0A=
	/* Clear all pending SPI events and mask all possible SPI=0A=
	   interrupts. For the moment we don't use interrupts.=0A=
	 */=0A=
	cpmp->cp_spie =3D 0xff;=0A=
	cpmp->cp_spim =3D 0x00;=0A=
	=0A=
	=0A=
=0A=
        cpmp->cp_spmode =3D 0x4370;=0A=
=0A=
//        cpmp->cp_spmode =3D 0x0370 | SPMODE_LOOP; // spi mode reg as =
mentioned in the data sheet=0A=
	 /* =0A=
	  I will PUT OTHER PORT INIT STRINGS HERE !=0A=
	  */=0A=
	=0A=
	 /* Tx and Rx buffer descriptors. */=0A=
    =0A=
    	 tx_bdf =3D ( volatile cbd_t * )&cpmp->cp_dpmem[ t_tbase ];=0A=
	 rx_bdf =3D ( volatile cbd_t * )&cpmp->cp_dpmem[ r_rbase ];=0A=
=0A=
	 printk ( "\nADRESSES : tx_bdf =3D %d, rx_bdf =3D %d   ",tx_bdf,rx_bdf);=0A=
	 /* Initialize Tx and Tx BD's */=0A=
//	 rx_bdf->cbd_sc =3D BD_SC_EMPTY | BD_SC_WRAP;=0A=
//	 tx_bdf->cbd_sc =3D BD_SC_LAST | BD_SC_WRAP;=0A=
	 memset( (void*)tx_bdf, 0, sizeof(cbd_t) );=0A=
	 memset( (void*)rx_bdf, 0, sizeof(cbd_t) );=0A=
	 =0A=
=0A=
	 /* Allocate memory for Rx and Tx buffers */=0A=
	 rx_buf =3D ( u_char * )m8xx_cpm_hostalloc( CONFIG_CPM_SPI_BDSIZE );=0A=
	 tx_buf =3D ( u_char * )m8xx_cpm_hostalloc( CONFIG_CPM_SPI_BDSIZE );=0A=
=0A=
	 if ( rx_buf =3D=3D NULL || tx_buf =3D=3D NULL )=0A=
	 { =0A=
	    printk ( "SPI : Error getting memory for rx_buf" );=0A=
	    return -ENOMEM;=0A=
	 }=0A=
	 =0A=
	 /* Set the bd's rx and tx buffer address pointers */=0A=
	 =0A=
	 tx_bdf->cbd_bufaddr =3D __pa( tx_buf );=0A=
	 rx_bdf->cbd_bufaddr =3D __pa( rx_buf );=0A=
	 =0A=
	 =0A=
	printk ( "\nBUFADDR ADRESSES (cbd_bufaddr): tx_bdf =3D %d, rx_bdf =3D =
%d   ",tx_bdf->cbd_bufaddr,rx_bdf->cbd_bufaddr);=0A=
	 =0A=
	 /* =0A=
	  * Finally register the driver.=0A=
	  */=0A=
	 =0A=
	 err =3D register_chrdev( CPM_SPI_MAJOR, DRIVER_NAME, &cpm_spi_fops );=0A=
	 if ( err < 0 ) {=0A=
		 printk( "\ncpm_spi: Couldn't register driver ( major=3D%d )\n", =
CPM_SPI_MAJOR );=0A=
		 return err;=0A=
	 }=0A=
	else=0A=
	    printk ("SPI DEVICE REGISTERED\n");=0A=
	return 0;=0A=
}=0A=
=0A=
static void cpm_spi_cleanup( void )=0A=
{=0A=
	unregister_chrdev( CPM_SPI_MAJOR, DRIVER_NAME );=0A=
	m8xx_cpm_dpfree( dp_addr );	=0A=
}=0A=
=0A=
module_init(cpm_spi_init);=0A=
module_exit(cpm_spi_cleanup);=0A=

------=_NextPart_000_003F_01C33BBD.D81D6A50--

