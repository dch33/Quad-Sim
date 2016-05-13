#ifndef __MULTIWORD_TYPES_H__
#define __MULTIWORD_TYPES_H__
#include "rtwtypes.h"

/*
 * MultiWord supporting definitions
 */
typedef long long longlong_T;

/*
 * MultiWord types
 */
typedef struct {
  uint64_T chunks[2];
} int128m_T;

typedef struct {
  int128m_T re;
  int128m_T im;
} cint128m_T;

typedef struct {
  uint64_T chunks[2];
} uint128m_T;

typedef struct {
  uint128m_T re;
  uint128m_T im;
} cuint128m_T;

typedef struct {
  uint64_T chunks[3];
} int192m_T;

typedef struct {
  int192m_T re;
  int192m_T im;
} cint192m_T;

typedef struct {
  uint64_T chunks[3];
} uint192m_T;

typedef struct {
  uint192m_T re;
  uint192m_T im;
} cuint192m_T;

typedef struct {
  uint64_T chunks[4];
} int256m_T;

typedef struct {
  int256m_T re;
  int256m_T im;
} cint256m_T;

typedef struct {
  uint64_T chunks[4];
} uint256m_T;

typedef struct {
  uint256m_T re;
  uint256m_T im;
} cuint256m_T;

typedef struct {
  uint64_T chunks[5];
} int320m_T;

typedef struct {
  int320m_T re;
  int320m_T im;
} cint320m_T;

typedef struct {
  uint64_T chunks[5];
} uint320m_T;

typedef struct {
  uint320m_T re;
  uint320m_T im;
} cuint320m_T;

typedef struct {
  uint64_T chunks[6];
} int384m_T;

typedef struct {
  int384m_T re;
  int384m_T im;
} cint384m_T;

typedef struct {
  uint64_T chunks[6];
} uint384m_T;

typedef struct {
  uint384m_T re;
  uint384m_T im;
} cuint384m_T;

typedef struct {
  uint64_T chunks[7];
} int448m_T;

typedef struct {
  int448m_T re;
  int448m_T im;
} cint448m_T;

typedef struct {
  uint64_T chunks[7];
} uint448m_T;

typedef struct {
  uint448m_T re;
  uint448m_T im;
} cuint448m_T;

typedef struct {
  uint64_T chunks[8];
} int512m_T;

typedef struct {
  int512m_T re;
  int512m_T im;
} cint512m_T;

typedef struct {
  uint64_T chunks[8];
} uint512m_T;

typedef struct {
  uint512m_T re;
  uint512m_T im;
} cuint512m_T;

typedef struct {
  uint64_T chunks[9];
} int576m_T;

typedef struct {
  int576m_T re;
  int576m_T im;
} cint576m_T;

typedef struct {
  uint64_T chunks[9];
} uint576m_T;

typedef struct {
  uint576m_T re;
  uint576m_T im;
} cuint576m_T;

typedef struct {
  uint64_T chunks[10];
} int640m_T;

typedef struct {
  int640m_T re;
  int640m_T im;
} cint640m_T;

typedef struct {
  uint64_T chunks[10];
} uint640m_T;

typedef struct {
  uint640m_T re;
  uint640m_T im;
} cuint640m_T;

typedef struct {
  uint64_T chunks[11];
} int704m_T;

typedef struct {
  int704m_T re;
  int704m_T im;
} cint704m_T;

typedef struct {
  uint64_T chunks[11];
} uint704m_T;

typedef struct {
  uint704m_T re;
  uint704m_T im;
} cuint704m_T;

typedef struct {
  uint64_T chunks[12];
} int768m_T;

typedef struct {
  int768m_T re;
  int768m_T im;
} cint768m_T;

typedef struct {
  uint64_T chunks[12];
} uint768m_T;

typedef struct {
  uint768m_T re;
  uint768m_T im;
} cuint768m_T;

typedef struct {
  uint64_T chunks[13];
} int832m_T;

typedef struct {
  int832m_T re;
  int832m_T im;
} cint832m_T;

typedef struct {
  uint64_T chunks[13];
} uint832m_T;

typedef struct {
  uint832m_T re;
  uint832m_T im;
} cuint832m_T;

typedef struct {
  uint64_T chunks[14];
} int896m_T;

typedef struct {
  int896m_T re;
  int896m_T im;
} cint896m_T;

typedef struct {
  uint64_T chunks[14];
} uint896m_T;

typedef struct {
  uint896m_T re;
  uint896m_T im;
} cuint896m_T;

typedef struct {
  uint64_T chunks[15];
} int960m_T;

typedef struct {
  int960m_T re;
  int960m_T im;
} cint960m_T;

typedef struct {
  uint64_T chunks[15];
} uint960m_T;

typedef struct {
  uint960m_T re;
  uint960m_T im;
} cuint960m_T;

typedef struct {
  uint64_T chunks[16];
} int1024m_T;

typedef struct {
  int1024m_T re;
  int1024m_T im;
} cint1024m_T;

typedef struct {
  uint64_T chunks[16];
} uint1024m_T;

typedef struct {
  uint1024m_T re;
  uint1024m_T im;
} cuint1024m_T;

#endif                                 /* __MULTIWORD_TYPES_H__ */
