class Ship extends MovingObject
  @RADIUS = 10
  @COLOR = "red"

  constructor: (pos, vel) ->
    @direction = Math.PI
    super {
      pos: pos,
      vel: vel,
      radius: @RADIUS,
      color: @COLOR,
      wraps: true
    }


  power: (impulse) ->
    @vel.x += impulse.x * Math.cos(@direction)
    @vel.y += impulse.y * Math.sin(@direction)

  draw: (ctx) ->
    spaceship = document.getElementById("spaceship")

    ctx.save()
    ctx.translate(@pos.x, @pos.y)
    ctx.rotate(@direction - Math.PI / 2)
    ctx.translate(-@pos.x, -@pos.y)
    ctx.drawImage(spaceship, @pos.x - 64, @pos.y - 64)
    ctx.restore()

  move: () ->
    @vel.x /= 1.02 if (Math.abs(@vel.x) > 0)
    @vel.y /= 1.02 if (Math.abs(@vel.y) > 0)
    super

  turn: (dir) ->
    @direction += dir

  fireBullet: () ->
    new Bullet({ x: @pos.x, y: @pos.y }, @dir)
