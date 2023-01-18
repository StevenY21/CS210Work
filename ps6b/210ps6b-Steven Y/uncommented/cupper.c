long long
cupper(long long cres, char *cptr)
{
  char c;
  int i=0;

  for (i=0; cptr[i] != 0; i++) {
    c = cptr[i];
    if ((c >= 'a') && (c <= 'z')) {
      *((int *)0) = 1;
    }
  }
  return cres + i;
}
