class Asteroid extends MovingObject
  @RADIUS = 50
  @COLOR = "steelblue"

  constructor: (pos, vel) ->
    super {
      pos: pos,
      vel: vel,
      radius: @RADIUS,
      color: @COLOR,
      wraps: true
    }

  randomAsteroid: (dimX, dimY) ->
    pos = {
      x: Math.random() * dimX,
      y: Math.random() * dimY
    }
    vel = @randomVec()

    new Asteroid(pos, vel)
