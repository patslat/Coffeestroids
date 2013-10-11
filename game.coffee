class Game
  @DIM_X = 900
  @DIM_Y = 900

  constructor: (ctx) ->
    @ctx = ctx
    @ship = null
    @asteroids = []
    @bullets = []

  draw: () ->
    @ctx.clearRect(0, 0, @DIM_X, @DIM_Y)
    @ship.draw(@ctx)

    asteroid.draw() for asteroid in @asteroids

    bullet.draw() for bullet in @bullets
