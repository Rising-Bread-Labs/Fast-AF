#include <stdlib.h>
#include <stdio.h>
#include <getopt.h>
#include <unistd.h>
#include <fcntl.h>

#define BUFFER_SIZE 1048576

int main(int argc, char *argv[]) {
  int opt_char;
  const char *opt_string = "d:ef:";
  char *drive_name;
  char *filesystem_type;
  int encrypt = 0;

  struct option long_options[] = {
    {"disk", required_argument, NULL, 'd'},
    {"encrypt", no_argument, &encrypt, 1}, // if --encrypt option passed, will put 1 in encrypt variable.
    {"filesystem", required_argument, NULL, 'f'},
    {0, 0, 0, 0}
  };

  for (;;) {
    int option_index = 0;

    opt_char = getopt_long(argc, argv, opt_string, long_options, &option_index);

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
    int fd = open(drive_name, O_WRONLY);
    if (fd < 0) {
      perror("Failed to open drive");
      exit(EXIT_FAILURE);
    }

    unsigned char *buffer = malloc(BUFFER_SIZE);
    FILE *urandom = fopen("/dev/urandom", "r");

    for (;;) {
      fread(buffer, sizeof(char), BUFFER_SIZE, urandom);
      ssize_t written = write(fd, buffer, BUFFER_SIZE);
      if (written <= 0) {
        break; // drive is fully overwritten or write error
      }
    }
    fclose(urandom);
    free(buffer);
    close(fd);
  }
}
