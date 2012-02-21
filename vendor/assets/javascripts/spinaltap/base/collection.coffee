class Spinaltap.Base.Collection extends Backbone.Collection

  parse: (result) ->
    _.map result, (item) => @model.prototype.parse item, @
