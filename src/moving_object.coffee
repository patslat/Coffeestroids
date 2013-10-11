class MovingObject
  constructor: (options) ->
    { @pos, @vel, @radius, @color, @wraps } = options

  @randomVec: () ->
    { x: ((Math.random() * 2) - 1), y: ((Math.random() * 2) - 1) }

  move: () ->
    if @wraps
      @pos.x = (Game.DIM_X + @pos.x + @vel.x) % Game.DIM_X
      @pos.y = (Game.DIM_Y + @pos.y + @vel.y) % Game.DIM_Y
    else
      @pos.x += @vel.x
      @pos.y += @vel.y

  draw: (ctx) ->
    ctx.strokeStyle = this.color
    ctx.lineWidth = 2
    ctx.beginPath()

    ctx.arc(
      @pos.x,
      @pos.y,
      @pos.radius,
      0,
      2 * Math.PI,
      false
    )
    ctx.stroke()

  offScreen: () ->
    (@pos.x > Game.DIM_X ||
     @pos.x < 0          ||
     @pos.y > Game.DIM_Y ||
     @pos.y < 0)

  isCollidedWith: (otherObject) ->
    distance = @_calculateDistance(this, otherObject)

  _calculateDistance: (otherObject) ->
    Math.sqrt(
      Math.pow((@pos.x - otherObject.pos.x), 2) +
      Math.pow((@pos.y - otherObject.pos.y), 2)
    )
