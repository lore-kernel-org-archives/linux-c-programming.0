From: Dev Linux <devlinux@gmail.com>
Subject: Re: File [Pointers vs Descriptors]
Date: Wed, 19 Jan 2005 14:01:09 +0530
Message-ID: <a6ad8d30050119003133024930@mail.gmail.com>
References: <50C05B7AA7D6924FB5E384EF14BC647B495FA2@inba1mx2.corp.emc.com>
Reply-To: Dev Linux <devlinux@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <50C05B7AA7D6924FB5E384EF14BC647B495FA2@inba1mx2.corp.emc.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Wed, 19 Jan 2005 06:53:00 -0000, Honnavalli_Sreevathsa@EMC.com
<Honnavalli_Sreevathsa@EMC.com> wrote:
> Can someone pls let me know the difference b/w file pointers and file
> descriptors?? In what way do they differ intenally?
> 
> Thanks,
> Vathsa
> 

There are two types of I/O facilities available on Linux systems.

1. Linux I/O
2. Standard C I/O = Linux I/O + Buffering capabilities

The standard abstraction for accessing devices, terminals etc is the 'file'!
This interface provides the following operations
  open(), read(), write () and close() among others.
The 'file' referred to here is the *kernel file object* and the book keeping
is done using 'file descriptor'(s) which is on a per process basis!
(Typical limit would be 2048 file descriptors per process).

Given this background, a 'file descriptor' is an unsigned integer used by
the process to identify a open file.

struct file {
        struct list_head        f_list;
        struct dentry           *f_dentry;
        struct vfsmount         *f_vfsmnt;
        struct file_operations  *f_op;
        atomic_t                f_count;
        unsigned int            f_flags;
        mode_t                  f_mode;
        int                     f_error;
        loff_t                  f_pos;
        struct fown_struct      f_owner;
        unsigned int            f_uid, f_gid;
        struct file_ra_state    f_ra;
                                                                                
        unsigned long           f_version;
        void                    *f_security;

        /* needed for tty driver, and maybe others */
        void                    *private_data;
                                                                                
#ifdef CONFIG_EPOLL
        /* Used by fs/eventpoll.c to link all the hooks to this file */
        struct list_head        f_ep_links;
        spinlock_t              f_ep_lock;
#endif /* #ifdef CONFIG_EPOLL */
        struct address_space    *f_mapping;
};
                                                                                
and the open file structure is

struct files_struct {
        atomic_t count;
        spinlock_t file_lock;     /* Protects all the below members. 
Nests inside tsk->alloc_lock */
        int max_fds;
        int max_fdset;
        int next_fd;
        struct file ** fd;      /* current fd array */
        fd_set *close_on_exec;
        fd_set *open_fds;
        fd_set close_on_exec_init;
        fd_set open_fds_init;
        struct file * fd_array[NR_OPEN_DEFAULT];
};

As you can see, file descriptors are just indexes in the file descriptor table,
and are maintained by the kernel for each process.

For the latter (buffered), files are represented by index nodes (i-nodes).
Within a filesystem, i-node is a 128-byte structure containing book keeping
information.
From a programmer's perspective (in userspace), a FILE abstraction is
provided, which is defined in <stdio.h>

typedef struct _IO_FILE FILE;

struct _IO_FILE {
  int _flags;
#define _IO_file_flags _flags
  char* _IO_read_ptr;          /* Current read pointer */
  char* _IO_read_end;        /* End of get area. */
  char* _IO_read_base;      /* Start of putback+get area. */
  char* _IO_write_base;     /* Start of put area. */
  char* _IO_write_ptr;        /* Current put pointer. */
  char* _IO_write_end;       /* End of put area. */
  char* _IO_buf_base;       /* Start of reserve area. */
  char* _IO_buf_end;         /* End of reserve area. */
  
  char *_IO_save_base;       /* Pointer to start of non-current get area. */
  char *_IO_backup_base;   /* Pointer to first valid character of backup area */
  char *_IO_save_end;        /* Pointer to end of non-current get area. */
                                                                                
  struct _IO_marker *_markers;
  struct _IO_FILE *_chain;
                                                                                
  int _fileno;
#if 0
  int _blksize;
#else
  int _flags2;
#endif
  _IO_off_t _old_offset;
                                                                                
#define __HAVE_COLUMN 
  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];
                                                                                
  _IO_lock_t *_lock;
#ifdef _IO_USE_OLD_IO_FILE
};

In the final analysis, file descriptor and a file pointer are
"associated" by means
of a file descriptor table.

It is important to understand that the "ASSOCIATION" is established between 
a "kernel file object" and "userspace file object"! and it is M:N relationship.

A userspace file may be shared between different processes and thus the
"open files structure" must maintain a reference count to track the number of
file descriptors assigned to a file.

Hope this helps see the structure, interaction and the design of the various
artifacts of the "unix file abstraction".

thanks
Dev L.
