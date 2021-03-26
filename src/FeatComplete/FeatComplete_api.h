#ifndef __FEATCOMPLETE_API_H__
#define __FEATCOMPLETE_API_H__

#include <featureCfg.h>
#include <FeatComplete_int.h>

// Feature Control Flag
#if (FEAT_COMP == 0) // Excluded
static const int FC_Control = (0);
#else
extern int FC_Control;
#endif

// API
static inline void FC_print(void)
{
  if (FC_Control)
  {
    _FC_print();
  }
}

#endif // __FEATCOMPLETE_API_H__
