TARGET = conhash
CC = gcc

SRCS = rbtree.c consistent_hash.c test/consistent_hash_test.c
	
CFLAGS = -g -std=c11 -Wall -O2
CFLAGS_MD5 = -lssl -lcrypto
OBJS = $(SRCS:.c=.o)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(CFLAGS_MD5)

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

.PHONY: clean

clean:
	-rm -f $(OBJS) $(TARGET)
