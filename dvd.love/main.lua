function love.load()
    love.window.setFullscreen(true, 'desktop')
    love.window.setTitle('DVD')
    dvd = {}
    dvd.img = {love.graphics.newImage('dvd0.png'),love.graphics.newImage('dvd1.png'),love.graphics.newImage('dvd2.png'),love.graphics.newImage('dvd3.png'),love.graphics.newImage('dvd4.png')}
    dvd.x = 0
    dvd.y = 0
    dvd.scale = 2
    dvd.velx = 3/dvd.scale
    dvd.vely = 3/dvd.scale
    dvd.width = dvd.img[1]:getWidth()/ dvd.scale
    dvd.height = dvd.img[1]:getHeight()/dvd.scale
    currentimg = 1
    love.window.setIcon(love.image.newImageData('icon.png'))
end

function love.update(dt)
    if love.keyboard.isDown('escape') then
        love.event.quit()
    end

    dvd.x = dvd.x + dvd.velx
    dvd.y = dvd.y + dvd.vely

    if dvd.x + dvd.width >= love.graphics.getWidth() then
        dvd.x = love.graphics.getWidth() - dvd.width
        dvd.velx = -dvd.velx
        currentimg = random
    elseif dvd.x <= 0 then
        dvd.velx = -dvd.velx
        currentimg = random
    end

    if dvd.y + dvd.height >= love.graphics.getHeight() then
        dvd.y = love.graphics.getHeight() - dvd.height
        dvd.vely = -dvd.vely
        currentimg = random
    elseif dvd.y <= 0 then
        dvd.y = 1
        dvd.vely = -dvd.vely
        currentimg = random
    end
    random = love.math.random(1,4)
end

function love.draw()
    love.graphics.setBackgroundColor(0,0,0,0)
    love.graphics.draw(dvd.img[currentimg], dvd.x, dvd.y, 0, 1/dvd.scale, 1/dvd.scale)
end