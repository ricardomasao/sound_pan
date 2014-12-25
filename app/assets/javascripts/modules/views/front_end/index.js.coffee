module.exports = class Frontend

  dom:null
  window: null

  constructor:->
    @window = $ window
    @dom = $ 'section.webgl'
