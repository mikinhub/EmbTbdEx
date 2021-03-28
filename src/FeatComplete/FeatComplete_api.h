#ifndef __FEATCOMPLETE_API_H__
#define __FEATCOMPLETE_API_H__

#include <featureCfg.h>
#include <FeatComplete_int.h>

#if F_IF_ENABLED(FEAT_COMP)

/* Feature enabled */
extern int FC_Control;
#define FC_ARRAY (6)

#else // F_IF_ENABLED(FEAT_COMP)

/* Feature disabled */
static const int FC_Control = (0);
#define FC_ARRAY (0)

#endif // F_IF_ENABLED(FEAT_COMP)

// API
F_API void FC_print(void) { return (FC_Control) ? _FC_print() : 0; }

#endif // __FEATCOMPLETE_API_H__
