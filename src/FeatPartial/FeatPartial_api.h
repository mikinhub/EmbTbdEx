#ifndef __FEATPARTIAL_API_H__
#define __FEATPARTIAL_API_H__

#include <featureCfg.h>
#include <FeatPartial_int.h>

// Feature Control Flag
#if (FEAT_PART == 0 ) // Excluded
static const int FP_Control = (0);
#else
extern int FP_Control;
#endif

// API
static inline void FP_print(void)
{
  if (FP_Control)
  {
    _FP_print();
  }
}

#endif // __FEATPARTIAL_API_H__
