#include <stdlib.h>
#include <stdio.h>
#include <getopt.h>
#include <unistd.h>
#include <fcntl.h>

// 1 Mebibyte buffer size cuz powers of 2 are better than powers of 10
#define BUFFER_SIZE 1048576

int main(int argc, char *argv[]) {
  // used to hold the char of a passed in option;
  // for example, if called with -c, opt_char would hold 'c'
  int opt_char; 
  // defines the option chars that getopt_long should look out for
  const char *opt_string = "d:ef:";
  // variable to hold the drive name
  char *drive_name;
  // variable to hold the filesystem type
  char *filesystem_type;
  // boolean flag of whether to encrypt drive or not
  int encrypt = 0;

  // defines the long options (--example) getopt_long should look for
  struct option long_options[] = {
    // if --disk option passed, returns 'd' and puts the argument in optarg.
    {"disk", required_argument, NULL, 'd'},
    // if --encrypt option passed, returns 0 and will put 1 in encrypt variable.
    {"encrypt", no_argument, &encrypt, 1},
    {"filesystem", required_argument, NULL, 'f'},
    // needed by getopt_long for reasons (I imagine it uses this to know
    // when to stop looping over long_options[])
    {0, 0, 0, 0} 
  };

  // infinite loop
  for (;;) {
    int option_index = 0;

    opt_char = getopt_long(argc, argv, opt_string, long_options, &option_index);

    // if opt_char == -1, then there are no more cmdline options to parse.
    if (opt_char == -1) break;

    switch (opt_char) {
      case 'd':
        printf("option d with val %s", optarg);
        drive_name = optarg;
        break;

      case 'f':
        printf("option f with val %s", optarg);
        filesystem_type = optarg;
        break;

      default:
        break;
    }
  }

  if (encrypt) {
    // open the drive to encrypt and get its file descriptor in fd.
    int fd = open(drive_name, O_WRONLY);
    if (fd < 0) {
      perror("Failed to open drive");
      exit(EXIT_FAILURE);
    }

    // buffer to hold data we're writing to drive
    unsigned char *buffer = malloc(BUFFER_SIZE);
    // kernel provided randomness
    FILE *urandom = fopen("/dev/urandom", "r");

    for (;;) {
      // read 10 MiB of data from /dev/urandom into buffer.
      fread(buffer, sizeof(char), BUFFER_SIZE, urandom);
      // write buffer to fd (the drive to encrypt)
      ssize_t written = write(fd, buffer, BUFFER_SIZE);
      if (written <= 0) {
        break; // drive is fully overwritten or write error
      }
    }
    // close our dynamically allocated stuff
    fclose(urandom);
    free(buffer);
    close(fd);
  }
}
