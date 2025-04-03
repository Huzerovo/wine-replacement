#ifndef _CONFIG_H
#define _CONFIG_H

#ifndef PROG
  #error "Need define PROG"
#endif

#ifndef BOX86
  #error "Need define BOX86"
#endif

#ifndef BOX64
  #error "Need define BOX64"
#endif

#ifndef OPT32
  #error "Need define OPT32"
#endif
#define CONFIG_BIN32_PREFIX OPT32

#ifndef OPT64
  #error "Need define OPT64"
#endif
#define CONFIG_BIN64_PREFIX OPT64

#endif
