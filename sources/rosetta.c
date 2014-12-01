/*********************\
|*Name: James Roberts*|
|*Email ID: JPR4GC   *|
|*Date: 1-26-14      *|
|*File: rosetta.c    *|
\*********************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>



struct listNode {
     char * head;
     struct listNode * tail;
};

void pretty(int * * counts, int len) {
     int i;
     int j;
     for(i = 0; i < len; i++) {
	  for(j = 0; j < len; j++) {
	       printf("%d ", counts[i][j]);
	  }
	  printf("\n");
     }
}

void chomp(char * line) {
     int i;
     for(i = 0; i < 80; i++) {
	  if(line[i] == '\n') {
	       line[i] == '\0';
	       return;
	  }
     }
}

void printArr(int * arr, int length) {
     int i;
     for(i = 0; i < length; i++) {
	  printf("%d ", arr[i]);
     }
     printf("\n");
}

int myStrCmp(char * s1, char * s2) {
     int i = 0;
     for(i = 0; i < 80; i++) {
	  char c1 = s1[i];
	  char c2 = s2[i];
	  if(c1 == c2) {
	       if(c1 == '\0') {
		    return 0;
	       }
	       continue;
	  }
	  
	  if(c1 < c2) {
	       return -1;
	  } else {
	       return 1;
	  }

     }
     return 0;
}

int removeFront(int * arr, int * length) {
     int toReturn = arr[0];

     int i;
     for(i = 1; i < length[0]; i++) {
	  arr[i - 1] = arr[i];
     }
     arr[i] = -1;
     length[0]--;

     return toReturn;
}

int removeBack(int * arr, int length) {
     length--;
     int toReturn = arr[length];
     arr[length] = -1;
     return toReturn;
}

void addFront(int * arr, int length, int toAdd) {
     int i;
     for(i = length; i > 0; i--) {
	  arr[i] = arr[i - 1];
     }
     arr[0] = toAdd;
}

void addBack(int * arr, int length, int toAdd) {
     arr[length] = toAdd;
}

int sumRow(int * * arr, int length, int row) {
     int toReturn;
     toReturn = 0;
     int i;
     for(i = 0; i < length; i++) {
	  toReturn += arr[row][i];
     }

     return toReturn;
}

int reverseComparison(const void *a, const void *b);
int forwardComparison(const void *a, const void *b);
int indexOf(struct listNode *list, char *a);

int reverseComparison(const void *a_ptr, const void *b_ptr) {
  char * a = * (char * *)a_ptr;
  char * b = * (char * *)b_ptr;
  return strcmp(b,a); 
}

int forwardComparison(const void *a_ptr, const void *b_ptr) {
  char * a = * (char * *)a_ptr;
  char * b = * (char * *)b_ptr;
  return strcmp(a, b); 
}

int intCompR(const void * a, const void * b) {
     int va = *(const int*) a;
     int vb = *(const int*) b;
     return (va < vb) - (va > vb);
}

void printEach(struct listNode * list) {
     struct listNode * temp = list;
     while(1) {
	  printf("%s", temp -> head);
	  if(temp -> tail == NULL) {
	       break;
	  }
	  temp = temp -> tail;
     }
     printf("Done printing\n");
     return;
}

int indexOf(struct listNode *list, char *a) {
     //printf("startfunc");
     //char * a = * (char * *)a_ptr;
     if(list == NULL) {
	  return -1;
     }
     int toReturn = 0;
     struct listNode * temp = list;
     while(1) {
	  if(myStrCmp(a, temp -> head) == 0) {
	       return toReturn;
	  }
	  if(temp -> tail == NULL) {
	       break;
	  }
	  temp = temp -> tail;
	  toReturn++;
     }
     return -1;
}

int indexOfArr(char * * list, int length, char * a) {
     int toReturn = 0;
     //char * a = * (char * *)a_ptr;
     for(toReturn = 0; toReturn < length; toReturn++) {
	  if(myStrCmp(a, list[toReturn]) == 0) {
	       return toReturn;
	  }
     }
     return -1;
}

int main() {    /* 'main' is where your program starts */ 
//printf("here7");
  /* We'll make a variable of our special list type. Later we'll use it
   * to hold all of the lines we read in. Right now we'll initialize it to
   * NULL, the special "nothing here yet" value. */ 
  struct listNode * lines = NULL;
  struct listNode * unique = NULL;

  int line_count = 0; /* we'll track the number of lines we read */ 
  int uniques = 0;
//printf("here5");
  while (1) { /* loop and read all of the lines from stdin */ 
     //printf("topofloopwhile");
    /* C does not have automatic memory management, so we must plan out
     * where we will store the lines we read in. We'll make a local
     * variable that can hold 80 characters for now. This sort of
     * pre-determined buffer size limit is a big problem in practice; we'll
     * return to it when we talk about language security later. */
    char line_buffer[80]; 

    fgets(line_buffer, sizeof(line_buffer), stdin); 
    //scanf("%79s", line_buffer);
    /* This gets a line from stdin (standard input) and puts it
     * into 'line_buffer'. At most sizeof(line_buffer) (which is 80) 
     * characters will be read in. */
//printf("afterfgets ");
    if (feof(stdin)) break; 
    /* If that read didn't work because we've read in everything already
     * and now we're done, break out of this loop. "break" will transfer
     * control to the end of this while loop (which otherwise lasts
     * forever). */

    /* let's allocate a new list cell to hold our line */ 
    { /* In standard C I need to introduce a new { block } in order to
       * introduce a new local variable. */
      struct listNode * new_cell =
        malloc(sizeof(*new_cell)); 
      //struct listNode * dup = malloc(sizeof(*dup));
      /* malloc stands for "memory allocate" -- we have to tell it how
       * much space we need. It returns a pointer to the newly-allocated
       * space. In C, "*x" means loosely "tell me what x points to". */ 

      /* In a real C program you'd want to check and make sure that the
       * memory allocation succeeded and that you didn't run out of memory.
       * We'll skip that. */
      
      new_cell -> head = strdup(line_buffer); 
      //new_cell -> tail = NULL;
      //dup -> head = strdup(line_buffer);
      //dup -> tail = NULL;
      //chomp(dup -> head);
      //chomp(new_cell -> head);
      /* strdup() makes a duplicate (a copy) of a string and returns a
       * poitner to it. We can't just store our local 'line_buffer' 
       * in the list because it's a stack-allocated local variable and
       * we're going to overwrite it when we read in the next line. */

      /* In a real C program we'd have to worry about freeing the memory
       * allocated by strdup (and the memory from malloc!) ... let's ignore
       * that, too. */ 

      new_cell -> tail = lines; 
      lines = new_cell; 

      //dup -> tail = unique;
      //unique = dup;
      /* We have just prepended "new_cell" to the beginning of "lines". */

      /* In C the arrow -> means "follow a pointer to a structure and
       * access its field". */

      line_count++;     /* increment our counter */ 
     // uniques++;


      if(indexOf(unique, new_cell -> head) == -1) {
	  struct listNode * temp = malloc(sizeof(*temp));
	  temp -> head = strdup(line_buffer);
	  temp -> tail = unique;
	  unique = temp;
	  uniques ++;
      }

      //printf("%d", strcmp(strdup(line_buffer), strdup(line_buffer)));
    } 
  } 


     //printEach(unique);
     //printf("here");
     //int d = 0;
     //d += line_count;
     //printf("%d", d);

//     printf("%d", strcmp(unique -> head, unique -> head));
//     printf("done");
     //d = indexOf(unique, unique -> tail -> head);
     //if(indexOf(unique, unique -> head) == 0) {
	//  printf("comparison works");
     //}

//  printEach(unique);

  /* OK, now we have to reverse-sort the list. C does have built-in
   * sorting, but it is only for arrays. I don't want to write bubblesort
   * (or whatever) by hand on my new linked list, so I'll convert my list
   * to an array. */ 
  {
    char * * array; 
    /* In the same way that a "char *" is like a "character array" and thus
     * a "string", a "string *" or "char * *" is an array of strings. */

     int * * counts;
     counts = malloc(uniques * sizeof(* counts));
     int j;
     for(j = 0; j < uniques; j++) {
	  counts[j] = malloc(sizeof(* counts[j]) * uniques);
     }
     char * * uniqueArr;
     uniqueArr = malloc(uniques * sizeof(*uniqueArr));
     int temp1;
     int temp2;
//printf("here3");
     for(temp1 = 0; temp1 < uniques; temp1++) {
	  for(temp2 = 0; temp2 < uniques; temp2++) {
	       counts[temp1][temp2] = 0;
	  }
     }
//printf("here2");
    int i = 0; /* we'll use this local variable to index our array */

    array = malloc(line_count * sizeof(*array));

    /* How much space do we need? Well, we have line_count lines and each
     * line needs sizeof(char *) bytes. */ 

    /* We will walk down our linked list and put the ith element into
     * the ith slot in our array. */ 
    while (lines != NULL) { /* while we're not at the end */ 
      array[i] = lines->head; 
      /* store the line from the list into the array */
      i++; 
      lines = lines->tail; 
    } 
     i = 0;
     struct listNode * tempLN = unique;
    while(unique != NULL) {
	  uniqueArr[i] = unique -> head;
	  i++;
	  unique = unique -> tail;
    }
     unique = tempLN;

     qsort(uniqueArr, uniques, sizeof(uniqueArr[0]), forwardComparison);

     i = 0;
    for(i = 0; i < line_count; i += 2) {
	  char * src = array[i];
	  char * des = array[i + 1];
	  counts[indexOfArr(uniqueArr, uniques, des)][indexOfArr(uniqueArr, uniques, src)] = 1;
    }

    //printf("here1");

    int * zeros = malloc(uniques * sizeof(*zeros));
    int zerost = 0;
    int * result = malloc(uniques * sizeof(*result));
    int resultt = 0;

    for(i = 0; i < uniques; i++) {
	  if(sumRow(counts, uniques, i) == 0) {
	       addFront(zeros, zerost, i);
	       zerost++;
	  }
    }

    //printArr(zeros, uniques);
     //printf("top: %d\n", zerost);
     while(zerost > 0) {
	  int current = removeBack(zeros, zerost);
	  zerost--;
	  //printArr(zeros, uniques);
	  addBack(result, resultt, current);
	  //printf("RESULT += %d\n", current);
	  resultt++;
	  //pretty(counts, uniques);
	  for(i = 0; i < uniques; i++) {
	       if(counts[i][current] == 1) {
		    //printf("entering if1\n");
		    counts[i][current] = 0;
		    if(sumRow(counts, uniques, i) == 0) {
			 //printf("entering if2\n");
			 addBack(zeros, zerost, i);
			 zerost++;
			 //printf("ADDING ZERO: %d\n", i);
			 //printf("Unsorted: ");
			 //printArr(zeros, uniques);
			 qsort(zeros, zerost + 1, sizeof(int), intCompR);
			 //printf("Sorted: ");
			 //printArr(zeros, uniques);
		    }
	       }
	  }
     }

     //printf("resultt: %d, uniques: %d\n", resultt, uniques);

     if(resultt  == uniques) {
	  for(i = 0; i < uniques; i++) {
	       //printf("%d\n", result[i]);
	       printf("%s", uniqueArr[result[i]]);
	  }
     } else {
	  printf("cycle\n");
     }
     /*
    qsort(array, line_count, sizeof(array[0]), reverseComparison); 
    */
    /* qsort is the C standard library (quick-)sorting function. We have to
     * tell it the array to sort, how many elements there are (line_count),
     * how big each element is (each one is the same size as the 0th
     * element of array), and what our comparison function is. We haven't
     * defined our comparison function yet; we'll get to that in a bit. */

    /* Now that the array has been destructively sorted in place, we can 
     * iterate over it and print out the results. */
    /*for (i=0; i<line_count; i++) {
      printf("%s",array[i]); 
     */
     /* print the ith element to standard output */ 

      
    /*}*/ 
  } 

  return 0; /* we're done! */
}
