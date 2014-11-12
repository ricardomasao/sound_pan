SoundPan = require 'sound_pan'

module.exports = class Home

  context: null
  window: null
  list: null
  panner:null

  constructor:->
    @window = $ window;

    @list = $ 'section.home ul'

    @context = new AudioContext()
    @s = @context.createBufferSource()
    @g = @context.createGain()
    @p = @context.createPanner()
    @p.panningModel = 'equalpower';
    @s.connect(@g)
    @g.connect(@p)
    @p.connect(@context.destination)

    #@_get_audio_context()
    @_init()

  _init:()->
    @list.find('li a').bind 'click', @_on_item_click

  _on_item_click:(event)=>
    url = $(event.currentTarget).attr('href')

    @_load_sound url

    event.preventDefault()

  _get_audio_context:()->
    try
      window.AudioContext = window.AudioContext or window.webkitAudioContext
      @context = new AudioContext()
    catch e
      alert "Web Audio API is not supported in this browser"

  _load_sound:(url)->
    request = new XMLHttpRequest()
    request.open "GET", url, true
    request.responseType = "arraybuffer"

    request.onload = @_on_sound_loaded

    request.send()

  _on_sound_loaded:(event)=>
    request = event.currentTarget

    @context.decodeAudioData request.response, ((buffer) =>
      @_play_sound buffer
      return
    ), @_on_error

    return

  _play_sound:(buffer)=>

    #@s.buffer = buffer;
    #@g.gain.value = 2;
    #@s.noteOn(0)

    # source = @context.createBufferSource()
    # source.buffer = buffer
    # source.connect @context.destination
    # source.start 0

    @s.buffer = buffer
    #@s.connect @context.destination

    @s.start 0

    @panner = new SoundPan @p

  _on_error:()=>
    console.log 'error'
