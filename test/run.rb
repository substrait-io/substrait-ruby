# SPDX-License-Identifier: Apache-2.0

$VERBOSE = true

$LOAD_PATH.unshift("#{__dir__}/../lib")

require "substrait"

require "test-unit"

exit(Test::Unit::AutoRunner.run(true, __dir__))
