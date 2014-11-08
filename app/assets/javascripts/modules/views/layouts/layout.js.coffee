class Layout

  dom: {}

  constructor:(@dom)->
    @dom = $("body")

module.exports = new Layout
