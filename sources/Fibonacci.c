/*****************\
|* James Roberts *|
|* JPR4GC        *|
|* CS 4414       *|
|* HW 1          *|
\*****************/

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#include <assert.h>
#include <wait.h>

/* length of char*s */
static int l_str = 11;

int main(int argc, char * argv[]) {

	/* allocate auto variables */
	pid_t pid0, pid1;
	int SO = fileno(stdout);
	int num, status;
	int pipe1[2];
	int pipe2[2];
	char str[4][l_str];

	/* Get the number of fibonacci to calculate, check for error */
	num = strtol(argv[1], 0, 10);
	assert(!errno);

	if (num == 1 || num == 0) {
		/* base case fib(1) == fib(0) == 1 */

		printf("%d\n", 1);
		fflush(stdout);
		fclose(stdout);
		fclose(stderr);
		fclose(stdin);
		_exit(0);

	} else if (num < 0) {
		/* shouldn't be reached */

		printf("%d\n", 0);
		fflush(stdout);
		fclose(stdout);
		fclose(stderr);
		fclose(stdin);
		_exit(0);

	}

	if (argc > 2 && !strcmp(argv[2], "serial")) {
		/* serial */

		/* Set up pipe descriptors and fork */
		pipe(pipe1);
		pid0 = fork();

		/* Make sure there was not a fork error */
		assert(pid0 != -1);

		if (!pid0) {
			/* child */

			/* Setup childs output */
			close(pipe1[0]);
			dup2(pipe1[1], SO);
			close(pipe1[1]);

			/* Get num-1 as a char* */
			status = snprintf(str[0], l_str, "%d", num - 1);

			/* Call ./Fibonacci recursivly */
			execlp(argv[0], argv[0], str[0], "serial", NULL);

			/* Exit (should not be reached) */
			_exit(EXIT_FAILURE);

		} 

		/* Parent closes write end of pipe and waits for child to die */
		close(pipe1[1]);
		waitpid(pid0, &status, 0);

		/* Set up pipe descriptors and fork */
		pipe(pipe2);

		/* Make sure there was not a fork error */
		pid1 = fork();
		assert(pid1 != -1);

		if (!pid1) {
			/* child */

			/* Setup childs output */
			close(pipe2[0]);
			dup2(pipe2[1], SO);
			close(pipe2[1]);

			/* Get num-2 as a char* */
			status = snprintf(str[1], l_str, "%d", num - 2);

			/* Call ./Fibonacci recursivly */
			execlp(argv[0], argv[0], str[1], "serial", NULL);

			/* Exit (should not be reached) */
			_exit(EXIT_FAILURE);

		}

		/* Parent closes write end of pipe and waits for child to die */
		close(pipe2[1]);
		waitpid(pid1, &status, 0);

		/* Get read sides childs outputs as char*s */
		status = snprintf(str[0], l_str, "%d", pipe1[0]);
		status = snprintf(str[1], l_str, "%d", pipe2[0]);

		/* Run ./Add with the file descriptors of the children */
		execlp("./Add", "./Add", str[0], str[1], NULL);
		
		/* Exit (should not be reached) */
		_exit(EXIT_FAILURE);

	} else {
		/* not serial */

		/* create pipes ahead of time so that add can get the correct descriptors */
		pipe(pipe1);
		pipe(pipe2);

		/* Make sure there was not a fork error */
		pid1 = fork();
		assert(pid1 != -1);

		if (!pid1) {
			/* child Add */

			/* Close the write end of both pipes for Add */
			close(pipe1[1]); /* If removed Add */
			close(pipe2[1]); /* Will hang      */
			
			/* Get the descriptors for the read end of pipes as char*s */
			status = snprintf(str[0], l_str, "%d", pipe1[0]);
			status = snprintf(str[1], l_str, "%d", pipe2[0]);

			/* Call ./Add with the two read pipe ends */
			execlp("./Add", "./Add", str[0], str[1], NULL);

			/* Exit (should not be reached) */
			_exit(EXIT_FAILURE);

		}

		/* Make sure there was not a fork error */
		pid0 = fork();
		assert(pid0 != -1);

		if (!pid0) {
			/* child */

			/* Setup childs output */
			close(pipe1[0]);
			dup2(pipe1[1], SO);
			close(pipe1[1]);

			/* Get num-1 as a char* */
			status = snprintf(str[2], l_str, "%d", num - 1);

			/* Call ./Fibonacci with num-1 */
			execlp(argv[0], argv[0], str[2], NULL);

			/* Exit (should not be reached) */
			_exit(EXIT_FAILURE);

		}


		/* Close the write side of the pipe for the first child */
		close(pipe1[1]);

		/* close read end of pipes and alias standard output */
		close(pipe2[0]);
		dup2(pipe2[1], SO);
		close(pipe2[1]);

		/* Get num-2 as a char* */
		status = snprintf(str[3], l_str, "%d", num - 2);

		/* Call ./Fibonacci with num-2 */
		execlp(argv[0], argv[0], str[3], NULL);

		/* Exit (should not be reached) */
		_exit(EXIT_FAILURE);

	}

	return 1;
}
