#ifndef _CONFIG_H
#define _CONFIG_H

#ifndef PROG
  #error "Need define PROG"
#endif

#ifdef BOXMIX
  #define BOX64 "box64"
  #define BOX86 "box86"
  #ifndef OPT64
    #error "Need define OPT64"
  #endif
  #define CONFIG_BIN64_PREFIX OPT64
  #ifndef OPT32
    #error "Need define OPT32"
  #endif
  #define CONFIG_BIN32_PREFIX OPT32
#else
  #ifdef BOX64
    #define BOX "box64"
    #ifndef OPT64
      #error "Need define OPT64"
    #endif
    #define CONFIG_BIN_PREFIX OPT64
  #elif BOX86
    #define BOX "box86"
    #ifndef OPT32
      #error "Need define OPT32"
    #endif
    #define CONFIG_BIN_PREFIX OPT32
#else
    #error "Need define BOX64 or BOX86"
  #endif
#endif

#endif
