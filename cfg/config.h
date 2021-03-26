#ifndef __CONFIG_H_
#define __CONFIG_H_

#define DIS (0) /* Excluded from build */
#define OFF (1) /* Build, runtime disabled */
#define ENA (2) /* Build, runtime enabled */

#if defined(CFG_Tiny)
# define FEAT_COMP (0)
# define FEAT_PART (0)

#elif defined(CFG_Mini)
# define FEAT_COMP (2)
# define FEAT_PART (0)

#elif defined(CFG_Medi)
# define FEAT_COMP (2)
# define FEAT_PART (1)

#elif defined(CFG_Huge)
# define FEAT_COMP (2)
# define FEAT_PART (2)

#else
#error "Not correct configuration"
#endif

#endif // __CONFIG_H_
