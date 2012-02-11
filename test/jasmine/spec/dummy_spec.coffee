describe 'Dummy', ->
	
  beforeEach ->
    dummy = new Dummy

  describe 'foo', ->

    it 'should not be "bar"', ->
      expect(dummy.foo()).toEqual("bar")