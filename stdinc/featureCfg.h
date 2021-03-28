#ifndef __FEATURECFG_H__
#define __FEATURECFG_H__

#include <config.h>

// Build time condition
/*
  F_IF_ENABLED(xxx)
  - evaluates to TRUE if xxx is built in
  - evaluates to FALSE if xxx is excluded
*/
#define F_IF_ENABLED(NAME) (NAME > 0)

/*
  F_SELECT(xxx, value if built in , value if excluded)
  - evaluates to 'value if built in' in case xxx is built in
  - evaluates to 'value if excluded' in case xxx is excluded
*/
#define F_IF_BUILD(NAME, ENA, DIS) ((F_IF_ENABLED(NAME)) ? (ENA) : (DIS))

/*
  Prefix for the API function definition
 */
#define F_API static inline


#endif // __FEATURECFG_H__
