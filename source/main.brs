'********** Copyright 2016 Roku Corp.  All Rights Reserved. **********

sub Main()
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)
    scene = screen.CreateScene("MainScene")
    screen.show()
    m.global = screen.getGlobalNode()

    ' m.global.addField("config", "assocarray", false)
    ' m.global.config = {
    '     publisherEntitlement: true,
    '     publisherTokenKey: "8ZQEDDR8AWVJF8AH",
    '     publisherRefreshToken: "MSEFAJ7A54SE3LBE",
    '     publisherEndPoint: "sample.com/endpoint/1234",
    ' }
    sendAddress = CreateObject("roSocketAddress")
    sendAddress.SetAddress("dev.stedi.me:54321")
    socket = CreateObject("roStreamSocket")
    socket.setSendToAddress(sendAddress)
    If socket.Connect()
        Print "Connected Successfully"
    End If

    while(true)
        msg = wait(0, m.port)
	       msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
end sub
