describe 'TestApp.Models.Foo', ->

  model = null

  beforeEach ->
    model = new TestApp.Models.Foo

  describe 'hello()', ->

    it 'should return "hello world"', ->
      expect(model.hello()).toEqual("hello world")