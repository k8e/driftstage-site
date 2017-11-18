
initHeader = ->
    screenWidth = $(window).width()
    screenHeight = $(window).height()

    if screenWidth > 768
        scale = (screenHeight / 256);
        $('#sky-bg').css({ backgroundSize: (1024 * scale) + 'px ' + screenHeight + 'px' })
        $('#far-bg').css({ backgroundSize: (1024 * scale) + 'px ' + screenHeight + 'px' })
        $('#near-bg').css({ backgroundSize: (1024 * scale) + 'px ' + screenHeight + 'px' })
    else
        $('#sky-bg').css({ backgroundSize: '' })
        $('#far-bg').css({ backgroundSize: '' })
        $('#near-bg').css({ backgroundSize: '' })

    setTimeout initHeader, 1000

panHeader = (lastTime, currentPan) ->
    panSpeed = 0.015
    panTimeout = 20
    screenWidth = $(window).width()

    currentTime = Date.now()
    timeDelta = currentTime - lastTime

    if screenWidth > 768
        currentPan = currentPan + (panSpeed * timeDelta)
        $('#sky-bg').css( { 'background-position-x': currentPan + 'px' } )
        $('#far-bg').css( { 'background-position-x': currentPan * 1.4 + 'px' } )
        $('#near-bg').css( { 'background-position-x': currentPan * 1.7 + 'px' } )
    else
        $('#sky-bg').css( { 'background-position-x': '' } )
        $('#far-bg').css( { 'background-position-x': '' } )
        $('#near-bg').css( { 'background-position-x': '' } )

    callback = -> panHeader(currentTime, currentPan)

    setTimeout callback, panTimeout

$(document).ready ->
    initHeader()
    panHeader(Date.now(), -2800)

    $('.current-year').text(new Date().getFullYear())

    $('#show-gifs').click (e) ->
        e.preventDefault()
        $('#gif').removeClass 'hidden'
        $('#webm').addClass 'hidden'
        $('#gif img').each ->
            img = $(this).attr('data-src')
            $(this).attr('src', img)

    $('#show-webms').click (e) ->
        e.preventDefault()
        $('#webm').removeClass 'hidden'
        $('#gif').addClass 'hidden'
