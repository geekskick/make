#define CATCH_CONFIG_MAIN
#include <catch.hpp>
#include "other.h"


TEST_CASE("one", "one"){
  REQUIRE(testicles().multiply() == 900);  
}
