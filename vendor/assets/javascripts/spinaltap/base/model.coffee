class Spinaltap.Base.Model extends Backbone.Model

  toJSON: ->
    if _.isEmpty(@jsonRoot)
      super()
    else
      json = {}
      json[@jsonRoot] = _.clone(@attributes)
      json