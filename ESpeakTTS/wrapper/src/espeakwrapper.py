"""It wraps ESpeakTTS into a simple webserver which responds with a file to a text request."""
from http.server import HTTPServer, BaseHTTPRequestHandler
from subprocess import Popen, PIPE, STDOUT
from tempfile import NamedTemporaryFile
from urllib.parse import urlparse, unquote, unquote_plus


class ESpeakTTS:

    @staticmethod
    def _exec_espeaktts(args):
        cmd = ['espeak']
        cmd.extend(args)

        print("Execute: " + " ".join(cmd))
        process = Popen(cmd, stdout=PIPE, stderr=STDOUT, shell=False)
        process.wait()
        for out in process.stdout:
            print(str(out))
        if process.returncode > 0:
            print("espeak returned exit code: '" + str(process.returncode) + "'")
            exit(process.returncode)

    def generate_wav_file(self, outfilename, lang, text):
        self._exec_espeaktts(["-w", outfilename, "-v", lang, '"' + text + '"'])
        print("Create audio file '" + outfilename + "'")


class Handler(BaseHTTPRequestHandler):
    SPEAK_PATH = "/speak"
    PING_PATH = "/ping"
    ESPEAK_TTS = ESpeakTTS()

    def do_GET(self):
        paths = {self.SPEAK_PATH: self._speak_path,
                 self.PING_PATH: self._ping_path}
        handler_path = paths.get(urlparse(self.path).path, self._error_path)
        handler_path()

    def _error_path(self):
        self.send_response(404)
        self.end_headers()

    def _ping_path(self):
        self.send_response(204)
        self.end_headers()

    def _speak_path(self):
        query = urlparse(self.path).query
        request_parameter = dict(qc.split("=") for qc in query.split("&"))

        lang = str(request_parameter.get('lang', "en-US"))
        text = unquote_plus(unquote(str(request_parameter.get('text', ""))))

        with NamedTemporaryFile(suffix='.wav') as tempFile:
            self.ESPEAK_TTS.generate_wav_file(tempFile.name, lang, text)
            with open(tempFile.name, 'rb') as audiofile:
                wave_data = audiofile.read()
                self.send_response(200)
                self.send_header('Content-type', 'audio/wav')
                self.end_headers()
                self.wfile.write(wave_data)


PORT = 59126

if __name__ == '__main__':
    httpd = HTTPServer(('', PORT), Handler)
    print("Start server on port " + str(PORT) + '...')
    httpd.serve_forever()
