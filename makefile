# REALLY GOOD TUTORIAL 
# https://stackoverflow.com/a/30602701/3575948
APP_NAME=tutorial
CC=clang++

# Compliler Flags
COMMON_FLAGS=-Wall -std=c++14
DEBUG_FLAGS=-g -O0
RELEASE_FLAGS=-O3

# Linker Flags
LIB_PATH=
LIBS=

# Paths
SRC_PATH=./src
BUILD_PATH=./build
DEBUG_FOLDER=debug
RELEASE_FOLDER=release

SRCS=$(wildcard $(SRC_PATH)/*.cpp)

DEBUG_OBJS=$(patsubst $(BUILD_PATH)/$(SRC_DIR)/%.cpp,$(BUILD_PATH)/$(DEBUG_FOLDER)/%.o,$(SRC))
RELEASE_OBJS=$(SRCS:$(SRC_DIR)/%.cpp=$(BUILD_PATH)/%.o)

test:
	$(DEBUG_OBJS)

debug: $(DEBUG_OBJS)
	$(CC) -o $(BUILD_PATH)/$(DEBUG_FOLDER)/$(APP_NAME) $^ $(COMMON_FLAGS) $(DEBUG_FLAGS) $(LIB_PATH) $(LIBS)

release: $(RELEASE_OBJS)
	$(CC) -o $(BUILD_PATH)/$(RELEASE_FOLDER)/$(APP_NAME) $^ $(COMMON_FLAGS) $(RELEASE_FLAGS) $(LIB_PATH) $(LIBS)

$(BUILD_PATH)/$(DEBUG_FOLDER)/%.o: $(SRCS)
	$(CC) -c $< -o $@ $(DEBUG_FLAGS) $(COMMON_FLAGS)

$(BUILD_PATH)/$(RELEASE_FOLDER)/%.o: $(SRCS)
	$(CC) -c $< -o $@ $(RELEASE_FLAGS) $(COMMON_FLAGS)


PHONY: .clean
clean:
	rm $(RELEASE_OBJS)
	rm $(DEBUG_OBJS)
