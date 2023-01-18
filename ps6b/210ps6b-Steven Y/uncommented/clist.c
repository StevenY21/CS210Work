#include "ccalc.h"
#include <stdio.h>

struct Node { 
  long long v;  
  struct Node *next;  
};

long long
clist(long long cres, void *head, calc_simple_func_ptr func)
{
  struct Node *node = head;

  for (; node != 0; node=node->next) {    
    VPRINT("  func:%p cres:%lld SUM_POSITIVE=%lld SUM_NEGATIVE=%lld "
	   ": node:%p: v:%lld next:%p\n",
	   func, cres, SUM_POSITIVE, SUM_NEGATIVE, node, node->v,
	   node->next);
    cres = func(cres, node->v);
  }
  
  VPRINT("  FINAL func:%p cres:%lld SUM_POSITIVE=%lld "
	 "SUM_NEGATIVE=%lld : node:%p\n",
	 func, cres, SUM_POSITIVE, SUM_NEGATIVE, node);
  return cres;
}

