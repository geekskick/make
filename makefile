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
SRC_PATH=src
BUILD_PATH=build
DEBUG_FOLDER=debug
RELEASE_FOLDER=release

# Get all the .cpp files in the SRC_PATH
SRCS=$(wildcard $(SRC_PATH)/*.cpp)

# Use substitution references to change the .cpp into the correct path for the objects
DEBUG_OBJS=$(SRCS:$(SRC_PATH)/%.cpp=$(BUILD_PATH)/$(DEBUG_FOLDER)/%.o)
RELEASE_OBJS=$(SRCS:$(SRC_PATH)/%.cpp=$(BUILD_PATH)/$(RELEASE_FOLDER)/%.o)

# Declare that there aren't files called these things
# so that when I use them as target names there are no complications
PHONY: .debug
PHONY: .release
PHONY: .all
PHONY: .clean

# When make debug, first make sure that the debug objects are ok
	# The output is called the APP_NAME
	# This uses the full list of prequisites ($^)
debug: $(DEBUG_OBJS)
	$(CC) -o $(BUILD_PATH)/$(DEBUG_FOLDER)/$(APP_NAME) $^ $(COMMON_FLAGS) $(DEBUG_FLAGS) $(LIB_PATH) $(LIBS)

# When make release, first make sure that the release objects are ok
release: $(RELEASE_OBJS)
	$(CC) -o $(BUILD_PATH)/$(RELEASE_FOLDER)/$(APP_NAME) $^ $(COMMON_FLAGS) $(RELEASE_FLAGS) $(LIB_PATH) $(LIBS)

# When a debug object needs to be made, find the source file for it
	# The -c flag is to compile to object file
	# With the name as the target ($@)
	# And the inputs to it the first found source file with that name ($<$)
$(BUILD_PATH)/$(DEBUG_FOLDER)/%.o: $(SRC_PATH)/%.cpp
	$(CC) -c $< -o $@ $(DEBUG_FLAGS) $(COMMON_FLAGS)

$(BUILD_PATH)/$(RELEASE_FOLDER)/%.o: $(SRC_PATH)/%.cpp
	$(CC) -c $< -o $@ $(RELEASE_FLAGS) $(COMMON_FLAGS)

all: debug release

clean:
	rm $(RELEASE_OBJS)
	rm $(DEBUG_OBJS)
	rm $(BUILD_PATH)/$(DEBUG_FOLDER)/$(APP_NAME)
	rm $(BUILD_PATH)/$(RELEASE_FOLDER)/$(APP_NAME)

# Just examples follow use make test to show the example
PHONY: .test
test: bugger tits
	$(info The name of the target is $@)
	$(info $@ has the prequiste $< first in the list)
	$(info $^ is the full list of prequisites)

PHONY: .bugger
bugger:
	$(info BUGGER)

PHONY: .tits
tits:
	$(info TITS)
