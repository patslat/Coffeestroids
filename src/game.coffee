class Asteroids.Game
  @DIM_X = 900
  @DIM_Y = 900

  constructor: (ctx) ->
    @ctx = ctx
    @ship = null
    @asteroids = []
    @bullets = []

  start: () =>
    @_bindKeyHandlers()
    step: (timestamp) ->
      @_step()
      requestAnimationFrame(step)

    requestAnimationFrame(step)

  _drawAllTheThings: () ->
    @ctx.clearRect(0, 0, @DIM_X, @DIM_Y)
    @ship.draw(@ctx)

    asteroid.draw() for asteroid in @asteroids
    bullet.draw() for bullet in @bullets

  _moveAllTheThings: () ->
    @ship.move()
    asteroid.move() for asteroid in @asteroids
    bullet.move() for bullet in @bullets
    # TODO delete if offScreen()

  _checkCollisions: () ->
    @_checkAsteroidCollisions()
    @_checkBulletCollisions()

  _checkAsteroidCollisions: () ->
    for asteroid in @asteroids
      console.log("WE'RE HIT") if asteroid.isCollidedWith(@ship)
      @_checkBulletCollisions(asteroid)

  _checkBulletCollisions: (asteroid) ->
    for bullet in @bullets
      console.log("We got one!") if bullet.isCollidedWith(asteroid)

  _step: () ->
    @_checkCollisions()
    @_moveAllTheThings()
    @_drawAllTheThings()

  _addAsteroids: (numAsteroids) ->
    while numAsteroids -= 1
      @asteroids.push(Asteroids.Asteroid.randomAsteroid(Asteroids.Game.DIM_X, Asteroids.Game.DIM_Y))

  _bindKeyHandlers: () =>
    key("w", => @ship.power({ x: 5.0, y: 5.0 }))
    key("a", => @ship.power({ x: 5.0, y: 5.0 }))
    key("d", => @ship.power({ x: 5.0, y: 5.0 }))
    key("space", => @bullets.push(@ship.fireBullet()))
