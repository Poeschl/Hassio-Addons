"""It wraps picoTTS into a simple webserver which responds with a file to a text request."""
from http.server import HTTPServer, BaseHTTPRequestHandler
from urllib.parse import urlparse

from picotts import PicoTTS

PORT = 59126
SPEAK_PATH = "/speak"
PING_PATH = "/ping"


class Handler(BaseHTTPRequestHandler):

    pico_tts = PicoTTS()

    def do_GET(self):
        paths = {SPEAK_PATH: self._speak_path,
                 PING_PATH: self._ping_path}
        paths[urlparse(self.path).path]()

    def _ping_path(self):
        self.send_response(204)

    def _speak_path(self):
        query = urlparse(self.path).query
        request_parameter = dict(qc.split("=") for qc in query.split("&"))

        voice = str(request_parameter.get('voice', "en_US"))
        text = str(request_parameter.get('text', ""))

        wave_file = self._process_sound_request(voice, text)
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(wave_file)

    def _process_sound_request(self, voice, text):
        print("Create wave in " + voice + " for '" + text + "'")

        self.pico_tts.voice = voice
        return self.pico_tts.synth_wav(text)


if __name__ == '__main__':
    httpd = HTTPServer(('', PORT), Handler)
    print("Start server on port " + str(PORT) + '...')
    httpd.serve_forever()
