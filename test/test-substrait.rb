# SPDX-License-Identifier: Apache-2.0

class SubstraitTest < Test::Unit::TestCase
  def test_plan
    uri = "https://example.com/extension"
    extension_uri = Substrait::Extensions::SimpleExtensionURI.new(uri: uri)
    plan = Substrait::Plan.new(extension_uris: [extension_uri])
    assert_equal(plan, plan.class.decode(plan.class.encode(plan)))
  end
end
