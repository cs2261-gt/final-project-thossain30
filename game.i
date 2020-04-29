# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef signed short s16;
typedef unsigned int u32;
typedef signed int s32;
# 66 "myLib.h"
extern unsigned short *videoBuffer;
# 87 "myLib.h"
typedef struct
{
    u16 tileimg[8192];
} charblock;


typedef struct
{
    u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();




typedef struct
{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;
typedef struct OBJ_AFFINE
{
    u16 fill0[3];
    short a;
    u16 fill1[3];
    short b;
    u16 fill2[3];
    short c;
    u16 fill3[3];
    short d;
} OBJ_AFFINE;



extern OBJ_ATTR shadowOAM[];
# 189 "myLib.h"
void hideSprites();






typedef struct
{
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 232 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 242 "myLib.h"
typedef volatile struct
{
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 283 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 373 "myLib.h"
typedef struct
{
    const unsigned char *data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "game.h" 2




extern int lost;
extern int won;
extern int TPCollected;
int hOff;
int vOff;
int playerHoff;
int screenBlock;
int totalPaper;






void initGame();
void drawGame();
void updateGame();
void initPlayer();
void drawPlayer();
void updatePlayer();
void initPaper();
void drawPaper();
void updatePaper();
void initCustomer();
void drawCustomer();
void updateCustomer();
void initSanitizer();
void drawSanitizer();
void updateSanitizer();
void initHeart();
void drawHeart();
void initShadow();
void drawShadow();
void updateShadow();
void initEScore();
void drawEScore();
void initHScore();
void drawHScore();
void initTDigit();
void initODigit();
void drawTDigit();
void drawODigit();
void animateSprites();

typedef struct pool
{
    int screenRow;
    int screenCol;
    int worldCol;
    int worldRow;
    int height;
    int width;
    int curFrame;
    int aniState;
    int active;
    int aniCounter;
    int numFrames;
} TOILETPAPER, SANITIZER;
typedef struct
{
    int width;
    int height;
    int curFrame;
    int aniState;
    int worldCol;
    int worldRow;
    int screenCol;
    int screenRow;
    int active;
} SHADOW;

typedef struct
{
    int screenRow;
    int screenCol;
    int worldCol;
    int worldRow;
    int height;
    int width;
    int livesRemaining;
    int curFrame;
    int aniState;
    int prevAniState;
    int active;
    int follow;
    int numFrames;
    int aniCounter;
} CUSTOMER;


typedef struct
{
    int screenRow;
    int screenCol;
    int height;
    int width;
    int active;
    int curFrame;
    int aniState;
} HEART;


typedef struct score
{
    int width;
    int height;
    int curFrame;
    int aniState;
    int screenRow;
    int screenCol;
} ESCORE, HSCORE, TDIGIT, ODIGIT;

extern TOILETPAPER paper[20];
extern CUSTOMER customers[4];
extern ANISPRITE player;
extern SHADOW shadow;
extern SANITIZER sanitizer[8];
extern HEART hearts[5];
extern ESCORE escore;
extern HSCORE hscore;
extern TDIGIT tDigit;
extern ODIGIT oDigit;
# 2 "game.c" 2

# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 4 "game.c" 2
# 1 "collisionBitmap.h" 1
# 20 "collisionBitmap.h"
extern const unsigned short collisionBitmapBitmap[262144];
# 5 "game.c" 2
# 1 "gameBackground.h" 1
# 22 "gameBackground.h"
extern const unsigned short gameBackgroundTiles[7184];


extern const unsigned short gameBackgroundMap[4096];


extern const unsigned short gameBackgroundPal[256];
# 6 "game.c" 2
# 1 "sound.h" 1
SOUND soundA;
SOUND soundB;



void setupSounds();
void playSoundA(const signed char *sound, int length, int loops);
void playSoundB(const signed char *sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSoundA();
void pauseSoundB();
void unpauseSoundA();
void unpauseSoundB();
void stopSound();
void stopSoundA();
void stopSoundB();
# 7 "game.c" 2
# 1 "menuSong.h" 1
# 20 "menuSong.h"
extern const unsigned char menuSong[317934];
# 8 "game.c" 2
# 1 "loseSong.h" 1
# 20 "loseSong.h"
extern const unsigned char loseSong[374131];
# 9 "game.c" 2
# 1 "winSong.h" 1
# 20 "winSong.h"
extern const unsigned char winSong[318006];
# 10 "game.c" 2
# 1 "gameSong.h" 1
# 20 "gameSong.h"
extern const unsigned char gameSong[1100494];
# 11 "game.c" 2
# 1 "pauseNoise.h" 1
# 20 "pauseNoise.h"
extern const unsigned char pauseNoise[84562];
# 12 "game.c" 2
# 1 "owSound.h" 1
# 20 "owSound.h"
extern const unsigned char owSound[3516];
# 13 "game.c" 2
# 1 "punchSound.h" 1
# 20 "punchSound.h"
extern const unsigned char punchSound[4206];
# 14 "game.c" 2
# 1 "collectSound.h" 1
# 20 "collectSound.h"
extern const unsigned char collectSound[12384];
# 15 "game.c" 2
# 1 "sanSound.h" 1
# 20 "sanSound.h"
extern const unsigned char sanSound[13967];
# 16 "game.c" 2
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 1 3
# 10 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\ieeefp.h" 1 3
# 11 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 1 3
# 10 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\newlib.h" 1 3
# 14 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\newlib.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_newlib_version.h" 1 3
# 15 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\newlib.h" 2 3
# 11 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\config.h" 1 3



# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\ieeefp.h" 1 3
# 5 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\config.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\features.h" 1 3
# 6 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\config.h" 2 3
# 12 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 2 3
# 12 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 2 3




# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 1 3 4
# 209 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4

# 209 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4
typedef unsigned int size_t;
# 321 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 2 3

# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 1 3
# 13 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 1 3
# 14 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 1 3 4
# 143 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 1 3
# 24 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_types.h" 1 3



# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 1 3
# 41 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 5 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_types.h" 2 3


typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\lock.h" 1 3




# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stdint.h" 1 3 4
# 9 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stdint.h" 3 4
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 1 3 4
# 13 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_intsup.h" 1 3 4
# 35 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 2 3 4
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_stdint.h" 1 3 4
# 20 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stdint.h" 2 3 4
# 6 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef unsigned int __size_t;
# 145 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef signed int _ssize_t;
# 156 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 1 3 4
# 350 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;




typedef char * __va_list;
# 16 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 2 3






typedef unsigned long __ULong;
# 38 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 610 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

  void *deviceData;
};
# 817 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 19 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\cdefs.h" 1 3
# 47 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\cdefs.h" 3
# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 1 3 4
# 48 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\cdefs.h" 2 3
# 20 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\stdlib.h" 1 3
# 21 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 2 3
# 33 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void *__key,
         const void *__base,
         size_t __nmemb,
         size_t __size,
         __compar_fn_t _compar);
void *calloc(size_t, size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__))
      __attribute__((__alloc_size__(1, 2))) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void *malloc(size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(1))) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 134 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void *__base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void *realloc(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2))) ;
# 156 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 188 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
int system (const char *__string);
# 199 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 221 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 260 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 281 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);







char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 319 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 336 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3

# 17 "game.c" 2
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\math.h" 1 3






# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\ieeefp.h" 1 3
# 8 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\math.h" 2 3



# 86 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\math.h" 3
extern double atan (double);
extern double cos (double);
extern double sin (double);
extern double tan (double);
extern double tanh (double);
extern double frexp (double, int *);
extern double modf (double, double *);
extern double ceil (double);
extern double fabs (double);
extern double floor (double);






extern double acos (double);
extern double asin (double);
extern double atan2 (double, double);
extern double cosh (double);
extern double sinh (double);
extern double exp (double);
extern double ldexp (double, int);
extern double log (double);
extern double log10 (double);
extern double pow (double, double);
extern double sqrt (double);
extern double fmod (double, double);
# 150 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\math.h" 3
    typedef float float_t;
    typedef double double_t;
# 194 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\math.h" 3
extern int __isinff (float x);
extern int __isinfd (double x);
extern int __isnanf (float x);
extern int __isnand (double x);
extern int __fpclassifyf (float x);
extern int __fpclassifyd (double x);
extern int __signbitf (float x);
extern int __signbitd (double x);
# 290 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\math.h" 3
extern double infinity (void);
extern double nan (const char *);
extern double copysign (double, double);
extern double logb (double);
extern int ilogb (double);

extern double asinh (double);
extern double cbrt (double);
extern double nextafter (double, double);
extern double rint (double);
extern double scalbn (double, int);

extern double exp2 (double);
extern double scalbln (double, long int);
extern double tgamma (double);
extern double nearbyint (double);
extern long int lrint (double);
extern long long int llrint (double);
extern double round (double);
extern long int lround (double);
extern long long int llround (double);
extern double trunc (double);
extern double remquo (double, double, int *);
extern double fdim (double, double);
extern double fmax (double, double);
extern double fmin (double, double);
extern double fma (double, double, double);


extern double log1p (double);
extern double expm1 (double);



extern double acosh (double);
extern double atanh (double);
extern double remainder (double, double);
extern double gamma (double);
extern double lgamma (double);
extern double erf (double);
extern double erfc (double);
extern double log2 (double);





extern double hypot (double, double);






extern float atanf (float);
extern float cosf (float);
extern float sinf (float);
extern float tanf (float);
extern float tanhf (float);
extern float frexpf (float, int *);
extern float modff (float, float *);
extern float ceilf (float);
extern float fabsf (float);
extern float floorf (float);


extern float acosf (float);
extern float asinf (float);
extern float atan2f (float, float);
extern float coshf (float);
extern float sinhf (float);
extern float expf (float);
extern float ldexpf (float, int);
extern float logf (float);
extern float log10f (float);
extern float powf (float, float);
extern float sqrtf (float);
extern float fmodf (float, float);




extern float exp2f (float);
extern float scalblnf (float, long int);
extern float tgammaf (float);
extern float nearbyintf (float);
extern long int lrintf (float);
extern long long int llrintf (float);
extern float roundf (float);
extern long int lroundf (float);
extern long long int llroundf (float);
extern float truncf (float);
extern float remquof (float, float, int *);
extern float fdimf (float, float);
extern float fmaxf (float, float);
extern float fminf (float, float);
extern float fmaf (float, float, float);

extern float infinityf (void);
extern float nanf (const char *);
extern float copysignf (float, float);
extern float logbf (float);
extern int ilogbf (float);

extern float asinhf (float);
extern float cbrtf (float);
extern float nextafterf (float, float);
extern float rintf (float);
extern float scalbnf (float, int);
extern float log1pf (float);
extern float expm1f (float);


extern float acoshf (float);
extern float atanhf (float);
extern float remainderf (float, float);
extern float gammaf (float);
extern float lgammaf (float);
extern float erff (float);
extern float erfcf (float);
extern float log2f (float);
extern float hypotf (float, float);
# 422 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\math.h" 3
extern long double atanl (long double);
extern long double cosl (long double);
extern long double sinl (long double);
extern long double tanl (long double);
extern long double tanhl (long double);
extern long double frexpl (long double, int *);
extern long double modfl (long double, long double *);
extern long double ceill (long double);
extern long double fabsl (long double);
extern long double floorl (long double);
extern long double log1pl (long double);
extern long double expm1l (long double);




extern long double acosl (long double);
extern long double asinl (long double);
extern long double atan2l (long double, long double);
extern long double coshl (long double);
extern long double sinhl (long double);
extern long double expl (long double);
extern long double ldexpl (long double, int);
extern long double logl (long double);
extern long double log10l (long double);
extern long double powl (long double, long double);
extern long double sqrtl (long double);
extern long double fmodl (long double, long double);
extern long double hypotl (long double, long double);


extern long double copysignl (long double, long double);
extern long double nanl (const char *);
extern int ilogbl (long double);
extern long double asinhl (long double);
extern long double cbrtl (long double);
extern long double nextafterl (long double, long double);
extern float nexttowardf (float, long double);
extern double nexttoward (double, long double);
extern long double nexttowardl (long double, long double);
extern long double logbl (long double);
extern long double log2l (long double);
extern long double rintl (long double);
extern long double scalbnl (long double, int);
extern long double exp2l (long double);
extern long double scalblnl (long double, long);
extern long double tgammal (long double);
extern long double nearbyintl (long double);
extern long int lrintl (long double);
extern long long int llrintl (long double);
extern long double roundl (long double);
extern long lroundl (long double);
extern long long int llroundl (long double);
extern long double truncl (long double);
extern long double remquol (long double, long double, int *);
extern long double fdiml (long double, long double);
extern long double fmaxl (long double, long double);
extern long double fminl (long double, long double);
extern long double fmal (long double, long double, long double);

extern long double acoshl (long double);
extern long double atanhl (long double);
extern long double remainderl (long double, long double);
extern long double lgammal (long double);
extern long double erfl (long double);
extern long double erfcl (long double);
# 662 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\math.h" 3

# 18 "game.c" 2



# 20 "game.c"
int hOff;
int totalHoff;
int vOff;
int diff;
OBJ_ATTR shadowOAM[128];
OBJ_AFFINE* shadowOAM_AFF = (OBJ_AFFINE*) shadowOAM;

extern int lost;
extern int won;
extern int TPCollected;
TOILETPAPER paper[20];
ANISPRITE player;
CUSTOMER customers[4];
SANITIZER sanitizer[8];
HEART hearts[5];
ESCORE escore;
HSCORE hscore;
TDIGIT tDigit;
ODIGIT oDigit;
int timer;
double speed;
int playerHealth;
int hitflag;
double dx, dy, distance;
int heartCount;
int evy;
int eva;
int evb;
enum
{
    EASY,
    HARD
};

void initPlayer()
{
    player.curFrame = 0;
    player.aniState = 0;
    player.numFrames = 4;
    player.aniCounter = 0;
    player.cdel = 1;
    player.rdel = 1;
    player.height = 32;
    player.width = 32;
    player.worldRow = 155 + vOff;
    player.worldCol = 200 + playerHoff;
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - playerHoff;
    playerHealth = 4;
    hitflag = 0;
    eva = 16;
    evb = 0;
}

void drawPlayer()
{
    shadowOAM[0].attr0 = (0xFF & player.screenRow) | (0 << 14) | (1 << 10);
    shadowOAM[0].attr1 = (0x1FF & player.screenCol) | (2 << 14);
    shadowOAM[0].attr2 = ((player.curFrame * 4)*32 + (player.aniState * 4)) | ((0) << 12) | ((1) << 10);
}

void updatePlayer()
{
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))
        && collisionBitmapBitmap[((player.worldRow + (player.height / 4)) * (1024) + (player.worldCol - player.cdel))] != ((0) | (0) << 5 | (0) << 10)
        && collisionBitmapBitmap[((player.worldRow + player.height - 1) * (1024) + (player.worldCol - player.cdel))] != ((0) | (0) << 5 | (0) << 10))
    {
        if (player.screenCol > 0)
        {
            player.worldCol -= player.cdel;
            if (totalHoff >= 0 && player.screenCol < 240 / 2)
            {
                hOff--;
                playerHoff--;
                totalHoff--;
            }
        }
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))
        && collisionBitmapBitmap[((player.worldRow + (player.height / 4)) * (1024) + (player.worldCol + player.width + player.cdel - 1))] != ((0) | (0) << 5 | (0) << 10)
        && collisionBitmapBitmap[((player.worldRow + player.height - 1) * (1024) + (player.worldCol + player.width + player.cdel - 1))] != ((0) | (0) << 5 | (0) << 10))
    {
        if (player.worldCol + player.width - 1 < 1024 - 1)
        {
            player.worldCol += player.cdel;
            if (totalHoff < 1024 - 240 - 1 && hOff < 1024 - 240 - 1 && player.screenCol > 240 / 2)
            {
                hOff++;
                playerHoff++;
                totalHoff++;
            }
        }
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6)))
        && collisionBitmapBitmap[((player.worldRow - player.rdel + (player.height / 4)) * (1024) + (player.worldCol))] != ((0) | (0) << 5 | (0) << 10)
        && collisionBitmapBitmap[((player.worldRow - player.rdel + (player.height / 4)) * (1024) + (player.worldCol + player.width - 1))] != ((0) | (0) << 5 | (0) << 10))
    {
        if (player.screenRow > 0)
        {
            player.worldRow -= player.rdel;
            if (vOff >= 0 && player.screenRow < 160 / 2)
            {
                vOff--;
            }
        }
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7)))
        && collisionBitmapBitmap[((player.worldRow + player.height + player.rdel - 1) * (1024) + (player.worldCol + player.width - 1))] != ((0) | (0) << 5 | (0) << 10)
        && collisionBitmapBitmap[((player.worldRow + player.height + player.rdel - 1) * (1024) + (player.worldCol))] != ((0) | (0) << 5 | (0) << 10))
    {
        if (player.worldRow + player.height - 1 < 256 - 1)
        {
            player.worldRow += player.rdel;
            if (vOff < 256 - 160 && player.screenRow > 160 / 2)
            {
                vOff++;
            }
        }
    }
    if (gameBackgroundMap[((player.worldRow) * (1024) + (player.worldCol))] == 17407) {
        eva = 3;
        evb = 13;
    }
    animateSprites();
    (*(volatile u16 *)0x04000052) = ((eva) << 0) | ((evb) << 8);
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - playerHoff;
}

void initPaper()
{
    for (int i = 0; i < 20; i++)
    {
        paper[i].worldCol = 64 + (128 * (i % 8));
        paper[i].width = 32;
        paper[i].height = 32;
        paper[i].aniState = 0;
        paper[i].curFrame = 5;
        paper[i].numFrames = 4;
        if (i < 8)
        {
            paper[i].worldRow = 64;
            paper[i].active = 1;
        }
        else if (i < 16)
        {
            paper[i].worldRow = 116;
            paper[i].active = 1;
        }
        paper[i].screenRow = paper[i].worldRow;
        paper[i].screenCol = paper[i].worldCol;
    }
}

void drawPaper()
{
    for (int i = 0; i < 20; i++)
    {
        if (paper[i].active)
        {
            shadowOAM[i + 5].attr0 = (0xFF & paper[i].screenRow) | (0 << 14) | (0 << 10);
            shadowOAM[i + 5].attr1 = (0x1FF & paper[i].screenCol) | (2 << 14);
            shadowOAM[i + 5].attr2 = ((paper[i].curFrame * 4)*32 + (paper[i].aniState * 4)) | ((2) << 10);
        }
        if (paper[i].active == 0 || paper[i].screenCol < 0
            || paper[i].screenCol > 240 || paper[i].screenRow > 160
            || paper[i].screenRow < 0 || vOff > paper[i].worldRow
            || hOff > paper[i].worldCol || vOff + 160 < paper[i].worldRow
            || hOff + 240 < paper[i].worldRow)
        {
            shadowOAM[i + 5].attr0 = (2 << 8);
        }
    }
}

void updatePaper()
{

    for (int i = 0; i < 20; i++)
    {

        if (collision(player.screenCol + (player.width / 4), player.screenRow, player.width / 2, player.height,
                      paper[i].screenCol, paper[i].screenRow, paper[i].width, paper[i].height) &&
            paper[i].active)
        {

            playSoundB(collectSound, 12384 - 100, 0);
            paper[i].active = 0;
            TPCollected++;

            oDigit.aniState = (oDigit.aniState + 1) % 10;
            if (oDigit.aniState % 10 == 0 && TPCollected > 9)
            {
                tDigit.aniState = (tDigit.aniState + 1) % 10;
            }
        }

        if (TPCollected == totalPaper)
        {
            won = 1;
        }
        paper[i].screenRow = paper[i].worldRow - vOff;
        paper[i].screenCol = paper[i].worldCol - totalHoff;
    }
}

void initCustomer()
{
    for (int i = 0; i < 4; i++)
    {
        customers[i].worldCol = 64 + 256 * i;
        customers[i].worldRow = 32 + 16 * i;
        customers[i].aniState = 4;
        customers[i].curFrame = 1;
        customers[i].numFrames = 5;
        customers[i].aniCounter = 0;
        customers[i].width = 32;
        customers[i].height = 32;
        customers[i].active = 1;
        customers[i].livesRemaining = 3;
        customers[i].follow = 0;
        customers[i].screenCol = customers[i].worldCol;
        customers[i].screenRow = customers[i].worldRow;
    }
}

void drawCustomer()
{
    for (int i = 0; i < 4; i++)
    {
        if (customers[i].active)
        {
            shadowOAM[i + 50].attr0 = (0xFF & customers[i].screenRow) | (0 << 14) | (0 << 10);
            shadowOAM[i + 50].attr1 = (0x1FF & customers[i].screenCol) | (2 << 14);
            shadowOAM[i + 50].attr2 = ((customers[i].curFrame * 4)*32 + (customers[i].aniState * 4)) | ((2) << 10);
        }
        if (customers[i].active == 0 ||
            vOff > customers[i].worldRow || totalHoff > customers[i].worldCol ||
            totalHoff + 240 < customers[i].worldCol || vOff + 160 < customers[i].worldRow)
        {
            shadowOAM[i + 50].attr0 = (2 << 8);
        }
    }
}

void updateCustomer()
{

    speed = 1.3;
    for (int i = 0; i < 4; i++)
    {
        dx = player.screenCol - customers[i].screenCol;
        dy = player.screenRow - customers[i].screenRow;
        distance = sqrt(dx * dx + dy * dy);

        if (dx > 0 && dy > 0)
        {
            if (dx > dy)
            {
                customers[i].aniState = 6;
            }
            else
            {
                customers[i].aniState = 4;
            }
        }
        if (dx < 0 && dy > 0)
        {
            if ((dx * -1) > dy)
            {
                customers[i].aniState = 7;
            }
            else
            {
                customers[i].aniState = 4;
            }
        }
        if (dx > 0 && dy < 0)
        {
            if ((dy * -1) > dx)
            {
                customers[i].aniState = 5;
            }
            else
            {
                customers[i].aniState = 6;
            }
        }
        if (dx < 0 && dy < 0)
        {
            if ((dx * -1) > (dy * -1))
            {
                customers[i].aniState = 7;
            }
            else
            {
                customers[i].aniState = 5;
            }
        }

        if (customers[i].follow && timer % 2 == 0)
        {
            customers[i].worldCol += speed * (dx / distance);
            customers[i].worldRow += speed * (dy / distance);
        }



        if (collision(player.screenCol + (player.width / 4), player.screenRow, player.width / 2, player.height,
            customers[i].screenCol + (customers[i].width / 4), customers[i].screenRow,
            customers[i].width / 2, customers[i].height)
            && customers[i].active)
        {
            playSoundB(owSound, 3516 - 100, 0);
            eva = 3;
            evb = 13;
            hitflag = 1;

            if (collisionBitmapBitmap[((player.worldRow + (int)dy + 1) * (1024) + (player.worldCol + (int)dx + 1))] != ((0) | (0) << 5 | (0) << 10)
                && player.worldRow + (int)dy + 1 > 0 && player.worldCol + (int)dx + 1 > 0
                && player.worldRow + (int)dy + 1 < player.screenRow + 160
                && collisionBitmapBitmap[((player.worldRow + (int)dy) * (1024) + (player.worldCol + player.width + (int)dx))] != ((0) | (0) << 5 | (0) << 10)
                && collisionBitmapBitmap[((player.worldRow + player.height + (int)dy) * (1024) + (player.worldCol + player.width + (int)dx))] != ((0) | (0) << 5 | (0) << 10)
                && collisionBitmapBitmap[((player.worldRow + player.height + (int)dy) * (1024) + (player.worldCol + (int)dx))] != ((0) | (0) << 5 | (0) << 10))
            {
                player.worldRow += dy;
                player.worldCol += dx;
            }
        }

        if (hitflag == 1)
        {
            hearts[playerHealth].active = 0;
            playerHealth--;
            hitflag = 0;
        }
        if (playerHealth == 0)
            {
                lost = 1;
            }
        if (timer % 20 == 0)
        {
            eva = 16;
            evb = 0;
        }

        if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0)))))
        {
            player.curFrame = 4;
            if (player.aniCounter % 20 == 0)
            {
                player.curFrame = 0;
            }

            if (collision(player.screenCol - 15, player.screenRow - 15, player.width + 30, player.height + 30,
                customers[i].screenCol, customers[i].screenRow, customers[i].width, customers[i].height) &&
                customers[i].active)
            {
                playSoundB(punchSound, 4206 - 100, 0);
                customers[i].livesRemaining--;
                customers[i].follow = 1;
            }

            if (customers[i].active && customers[i].livesRemaining == 0)
            {
                customers[i].active = 0;

                for (int j = 16; j < 20; j++)
                {
                    if (paper[j].active == 0)
                    {
                        paper[j].worldCol = customers[i].worldCol;
                        paper[j].worldRow = customers[i].worldRow;
                        paper[j].active = 1;
                        break;
                    }
                }
            }
        }
        (*(volatile u16 *)0x04000052) = ((eva) << 0) | ((evb) << 8);
        customers[i].screenRow = customers[i].worldRow - vOff;
        customers[i].screenCol = customers[i].worldCol - totalHoff;
    }
}

void initSanitizer()
{
    for (int i = 0; i < 8; i++)
    {
        sanitizer[i].worldCol = 64 + 128 * i + totalHoff;
        sanitizer[i].worldRow = 16 + vOff;
        sanitizer[i].height = 16;
        sanitizer[i].width = 16;
        sanitizer[i].curFrame = 12;
        sanitizer[i].numFrames = 6;
        sanitizer[i].aniState = 0;
        sanitizer[i].active = 1;
    }
}

void drawSanitizer()
{
    for (int i = 0; i < 8; i++)
    {
        if (sanitizer[i].active)
        {
            shadowOAM[i + 100].attr0 = (0xFF & sanitizer[i].screenRow) | (0 << 14) | (0 << 10);
            shadowOAM[i + 100].attr1 = (0x1FF & sanitizer[i].screenCol) | (1 << 14);
            shadowOAM[i + 100].attr2 = ((sanitizer[i].curFrame * 2)*32 + (sanitizer[i].aniState * 2)) | ((2) << 10);
        }

        if (sanitizer[i].active == 0 || sanitizer[i].screenCol < 0
            || sanitizer[i].screenCol > 240 || sanitizer[i].screenRow > 160
            || sanitizer[i].screenRow < 0 || vOff > sanitizer[i].worldRow
            || totalHoff > sanitizer[i].worldCol || vOff + 160 < sanitizer[i].worldRow
            || totalHoff + 240 < sanitizer[i].worldRow)
        {
            shadowOAM[i + 100].attr0 = (2 << 8);
        }
    }
}

void updateSanitizer()
{
    for (int i = 0; i < 8; i++)
    {

        if (collision(player.screenCol, player.screenRow, player.width, player.height,
            sanitizer[i].screenCol, sanitizer[i].screenRow, sanitizer[i].width, sanitizer[i].height)
            && sanitizer[i].active && playerHealth < 4)
        {

            playerHealth++;
            hearts[playerHealth].active = 1;
            playSoundB(sanSound, 13967 - 100, 0);
            sanitizer[i].active = 0;
        }
        sanitizer[i].screenCol = sanitizer[i].worldCol - totalHoff;
        sanitizer[i].screenRow = sanitizer[i].worldRow - vOff;
    }
}

void initHeart()
{
    for (int i = 0; i < 5; i++)
    {
        hearts[i].screenCol = 5 + 18 * i;
        hearts[i].screenRow = 10;
        hearts[i].width = 16;
        hearts[i].height = 16;
        hearts[i].curFrame = 12;
        hearts[i].aniState = 6;
        hearts[i].active = 1;
    }
}

void drawHeart()
{
    for (int i = 0; i < 5; i++)
    {
        if (hearts[i].active)
        {
            shadowOAM[i + 60].attr0 = (0xFF & hearts[i].screenRow) | (0 << 14) | (0 << 10);
            shadowOAM[i + 60].attr1 = (0x1FF & hearts[i].screenCol) | (1 << 14);
            shadowOAM[i + 60].attr2 = ((hearts[i].curFrame * 2)*32 + (hearts[i].aniState * 2)) | ((0) << 10);
        }
        else
        {
            shadowOAM[i + 60].attr0 = (2 << 8);
        }
    }
}


void initEScore()
{
    escore.width = 32;
    escore.height = 8;
    escore.screenCol = 200;
    escore.screenRow = 150;
    escore.aniState = 3;
    escore.curFrame = 26;
}

void drawEScore()
{
    shadowOAM[89].attr0 = (0xFF & escore.screenRow) | (1 << 14) | (0 << 10);
    shadowOAM[89].attr1 = (0x1FF & escore.screenCol) | (1 << 14);
    shadowOAM[89].attr2 = ((escore.curFrame)*32 + (escore.aniState * 4)) | ((0) << 10);
}

void initHScore()
{
    hscore.width = 32;
    hscore.height = 8;
    hscore.screenCol = 200;
    hscore.screenRow = 150;
    hscore.aniState = 4;
    hscore.curFrame = 26;
}

void drawHScore()
{
    shadowOAM[88].attr0 = (0xFF & hscore.screenRow) | (1 << 14) | (0 << 10);
    shadowOAM[88].attr1 = (0x1FF & hscore.screenCol) | (1 << 14);
    shadowOAM[88].attr2 = ((hscore.curFrame)*32 + (hscore.aniState * 4)) | ((0) << 10);
}

void initODigit()
{
    oDigit.width = 8;
    oDigit.height = 8;
    oDigit.screenCol = 192;
    oDigit.screenRow = 150;
    oDigit.aniState = 0;
    oDigit.curFrame = 26;
}

void drawODigit()
{
    shadowOAM[90].attr0 = (0xFF & oDigit.screenRow) | (0 << 14) | (0 << 10);
    shadowOAM[90].attr1 = (0x1FF & oDigit.screenCol) | (0 << 14);
    shadowOAM[90].attr2 = ((oDigit.curFrame)*32 + (oDigit.aniState)) | ((0) << 10);
}

void initTDigit()
{
    tDigit.width = 8;
    tDigit.height = 8;
    tDigit.screenCol = 184;
    tDigit.screenRow = 150;
    tDigit.aniState = 0;
    tDigit.curFrame = 26;
}

void drawTDigit()
{
    shadowOAM[91].attr0 = (0xFF & tDigit.screenRow) | (0 << 14) | (0 << 10);
    shadowOAM[91].attr1 = (0x1FF & tDigit.screenCol) | (0 << 14);
    shadowOAM[91].attr2 = ((tDigit.curFrame)*32 + (tDigit.aniState)) | ((0) << 10);
}

void initGame()
{
    initCustomer();
    initPlayer();
    initHeart();
    initPaper();
    initSanitizer();
    initODigit();
    initTDigit();
    if (diff == EASY)
    {
        initEScore();
    }
    if (diff == HARD)
    {
        initHScore();
    }
    vOff = player.worldRow / 2;
    hOff = player.worldCol / 2;
    playerHoff = player.worldCol / 2;
    totalHoff = player.worldCol / 2;
    screenBlock = 28;
    TPCollected = 0;
    won = 0;
    lost = 0;
    timer = 0;
}

void updateGame()
{
    timer++;

    if (hOff > 256 && screenBlock < 31)
    {
        screenBlock++;
        hOff -= 256;
        (*(volatile unsigned short *)0x4000008) = ((0) << 2) | ((screenBlock) << 8) | (1 << 14) | 2;
    }
    if (hOff < 0 && screenBlock > 28)
    {
        screenBlock--;
        hOff += 256;
        (*(volatile unsigned short *)0x4000008) = ((0) << 2) | ((screenBlock) << 8) | (1 << 14) | 2;
    }
    updatePlayer();
    updatePaper();
    updateSanitizer();
    updateCustomer();
}

void drawGame()
{
    drawPlayer();
    drawHeart();
    drawPaper();
    drawCustomer();
    drawSanitizer();
    drawTDigit();
    drawODigit();
    if (diff == EASY)
    {
        drawEScore();
    }
    if (diff == HARD)
    {
        drawHScore();
    }
    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
}

void animateSprites()
{

    player.prevAniState = player.aniState;
    player.aniState = 4;

    if (player.aniCounter % 20 == 0)
    {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6))))
        player.aniState = 1;
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7))))
        player.aniState = 0;
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4))))
        player.aniState = 2;
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5))))
        player.aniState = 3;

    if (player.aniState == 4)
    {
        player.curFrame = 0;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
    }
    else
    {
        player.aniCounter++;
    }

    for (int i = 0; i < 4; i++)
    {
        if (customers[i].follow && customers[i].aniCounter % 20 == 0)
        {
            customers[i].curFrame = (customers[i].curFrame + 1) % customers[i].numFrames;
            if (customers[i].curFrame % customers[i].numFrames == 0)
            {
                customers[i].curFrame++;
            }
        }
        customers[i].aniCounter++;
    }

    for (int i = 0; i < 20; i++)
    {
        if (paper[i].aniCounter % 20 == 0 && paper[i].active)
        {
            paper[i].aniState = (paper[i].aniState + 1) % paper[i].numFrames;
        }
        paper[i].aniCounter++;
    }
    for (int i = 0; i < 8; i++)
    {
        if (sanitizer[i].aniCounter % 12 == 0 && sanitizer[i].active)
        {
            sanitizer[i].aniState = (sanitizer[i].aniState + 1) % sanitizer[i].numFrames;
        }
        sanitizer[i].aniCounter++;
    }
}
