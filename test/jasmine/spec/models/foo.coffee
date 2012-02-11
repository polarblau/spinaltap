describe 'TestApp.Models.Foo', ->


  beforeEach ->
    model = new TestApp.Models.Foo

  describe 'hello', ->

    it 'should return "hello world"', ->
      expect(model.hello()).toEqual("hello world")