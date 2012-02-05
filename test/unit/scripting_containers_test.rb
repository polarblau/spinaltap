require File.expand_path(File.join(File.dirname(__FILE__), '..',  'test_helper'))

class ScriptingContainerTest < MiniTest::Unit::TestCase

  def setup
    # TODO: extract it to helper or ...
    # TODO: we shouldn't use V8'a api directly, instead we should use Ext.js so it can pickup the best runtime available
    @context = V8::Context.new
    # TODO paths ...
    eval File.read("test/ext/js/underscore-min.js")
    eval File.read("test/ext/js/backbone-min.js")
  end

  # that's only fake test case
  def test_if_it_works
    js = <<END
var Car = Backbone.Model.extend({
});
END
    eval js
    assert_equal eval("new Car({color: 'red'}).get('color')"), "red"
  end

  private

  def eval(code)
    @context.eval code
  end

  def c2js(code)
    # that's how we can compile Coffee:
    CoffeeScript.compile(code)
  end

end