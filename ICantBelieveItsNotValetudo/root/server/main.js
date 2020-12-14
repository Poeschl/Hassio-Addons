const http = require('http');
const request = require('request');

const index = `
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <style>
    #floorplan {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);  
    }
  </style>
</head>
<body>
  <img id="floorplan" src="./image">
  <script>
      window.frameElement.style = 'background-color: var(--primary-background-color);'
  </script>
</body>
</html>
`

http.createServer(function (req, resp) {

  var path = req.url;
  
  if (path == '/') {
    resp.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'});
    resp.end(index, 'utf-8');

  } else if (path == '/image') {    
    //Proxy to the original image
    const mapImage = request('http://localhost:3000/api/map/image')
    req.pipe(mapImage)
    mapImage.pipe(resp)

  } else if (path == '/favicon.ico') {
    //Ignore favicon

  } else {
    console.warn('Invalid request ', path)
  }
}).listen(8080);
