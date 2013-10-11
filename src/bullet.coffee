class Asteroids.Bullet extends Asteroids.MovingObject
  @RADIUS = 5
  @COLOR = "yellow"
  @VELOCITY = { x: 10, y: 10 }
  constructor: (pos, dir) ->
    @dir = dir
    super {
      pos: pos,
      vel: @VELOCITY,
      radius: @RADIUS,
      color: @COLOR,
      wraps: false
    }
