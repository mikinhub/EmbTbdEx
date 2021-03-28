#ifndef __FEATPARTIAL_API_H__
#define __FEATPARTIAL_API_H__

#include <featureCfg.h>
#include <FeatPartial_int.h>

#if F_IF_ENABLED(FEAT_PART)

/* Feature enabled */
extern int FP_Control;
#define FP_ARRAY (6)

#else // F_IF_ENABLED(FEAT_PART)

/* Feature disabled */
static const int FP_Control = (0);
#define FP_ARRAY (0)

#endif // F_IF_ENABLED(FEAT_PART)

// API
F_API void FP_print(void) { return (FP_Control) ? _FP_print() : 0; }

#endif // __FEATPARTIAL_API_H__
