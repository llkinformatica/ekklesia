
from pyngrok import ngrok

ngrok.set_auth_token("2GGLGLFmpYBXPqs1UUkbhPgZYd5_5HMXMPRtMq7PpgTbzZCLu")

#tunnels = ngrok.get_tunnels()

#ngrok.disconnect(tunnels)

ngrok_tunnel = ngrok.connect(3000)

#tunnels = ngrok.get_tunnels()

print(ngrok_tunnel)