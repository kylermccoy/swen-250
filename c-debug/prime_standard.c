/* prime-number finding program
Originally by Norman Matloff, UC Davis
http://wwwcsif.cs.ucdavis.edu/~davis/40/gdb_Tutorial.htm
Modified by Mark Ardis, RIT, 11/1/2006

Will report a list of all primes which are less than
or equal to the user-supplied upper bound.
WARNING: There are bugs in this program! */

#include <stdio.h>

int primes[15];  /* prime[i] will be 1 if i is prime, 0 otherwise */
int upper_bound; /* check all numbers up through this one for primeness 
*/

/*
   Check_Prime() function checks the primality of the number
   Parameters: 
	int k : number to check if divisible
	int primes[] : array containing 1 is [i] prime or 0 if [i] is not prime
   No Output
*/
void Check_Prime(int k, int primes[]) {
  int j;

  /* the plan:  see if j divides k, for all values j which are
  themselves prime (no need to try j if it is nonprime), and
  less than or equal to sqrt(k) (if k has a divisor larger
  than this square root, it must also have a smaller one,
  so no need to check for larger ones) */
 
  j = 2;
  while (j * j <= k) {
    if (primes[j] == 1){
      if (k % j == 0)  {
        primes[k] = 0;
        return;
      } /* if (k % j == 0) */
    } /* if (primes[j] == 1) */
    j++;
  } /* while (j * j <= k) */

  /* if we get here, then there were no divisors of k, so it is prime */
  primes[k] = 1;

}  /* Check_Prime() */

/*
   main() function asks user for an upperbound and loops
   through the numbers checking for primality
   No parameters
   Outputs the numbers found to be prime
*/
int main() {
  int i;
	
  // Access uperbound
  printf("Enter upper bound:\n");
  scanf("%d", &upper_bound);
  primes[1] = 1;
  primes[2] = 1;
  // Loop through numbers checking primality until upper_bound
  for (i = 3; i <= upper_bound; i += 2) {
    Check_Prime(i, primes); // calls function to check primality
    if (primes[i]) {
      printf("%d is a prime\n", i);
    } /* if (primes[i]) */
  } /* for (i = 3; i <= upper_bound; i += 2) */
  return 0;
} /* main() */
