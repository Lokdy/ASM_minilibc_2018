##
## EPITECH PROJECT, 2019
## Minilibc
## File description:
## Made by Florian Cohuet
##

ASM	=	nasm

CC	=	gcc

ASFLAGS	=	-f elf64

NAME	=	libasm.so

SRCS	=	src/strlen.asm		\
			src/strchr.asm		\
			src/memcpy.asm		\
			src/memset.asm		\
			src/strcmp.asm		\
			src/memmove.asm		\
			src/strncmp.asm		\
			src/strcasecmp.asm

OBJS	=	$(SRCS:.asm=.o)


all:		$(NAME)

$(NAME):	$(OBJS)
		$(CC) -nostdlib -shared -fPIC $(OBJS) -o $(NAME)

%.o : %.asm
		$(ASM) $(ASFLAGS) -o $@ $<

clean:
		$(RM) $(OBJS)

fclean:		clean
		$(RM) $(NAME)

re:		fclean all

.PHONY:		all clean fclean re
