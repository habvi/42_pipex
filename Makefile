NAME	:=	pipex

SRC_DIR	:=	src
SRCS	:=	main.c

OBJ_DIR	:=	obj
OBJS	:=	$(SRCS:%.c=$(OBJ_DIR)/%.o)

INCLUDE_DIR	:=	include
INCLUDES	:=	-I./$(INCLUDE_DIR)/
DEPS		:=	$(OBJS:.o=.d)

CC		:=	cc
CFLAGS	:=	-Wall -Wextra -Werror -MMD -MP
MKDIR	:=	mkdir -p

all: $(NAME)

-include $(DEPS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(MKDIR) $(dir $@)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

clean:
	$(RM) -r $(OBJ_DIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re