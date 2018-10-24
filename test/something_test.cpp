#define CATCH_CONFIG_MAIN
#include <catch.hpp>
#include "something.h"


TEST_CASE("one", "one"){
  REQUIRE(tits().get() == "(. )( .)");  
}
