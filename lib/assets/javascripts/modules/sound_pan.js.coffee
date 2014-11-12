module.exports = class SoundPan

  audio_context:null
  panner:null

  range:0

  constructor:(@panner)->
    interval = setInterval @pan,1
    #@panner.setPosition 1, 0, 0

  pan:(range)=>

    @range+=.1

    xDeg = parseInt(@range)
    zDeg = xDeg + 90
    zDeg = 180 - zDeg  if zDeg > 90
    x = Math.sin(xDeg * (Math.PI / 180))
    z = Math.sin(zDeg * (Math.PI / 180))

    console.log x, z

    @panner.setPosition x, 0, z
    return
