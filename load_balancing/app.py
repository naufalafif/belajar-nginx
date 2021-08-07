import http.server
import os

APP_PORT = os.getenv('APPPORT',9999)
APPID = os.getenv('APPID')

class HandleRequests(http.server.BaseHTTPRequestHandler):
    def _set_headers(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()

    def _html(self, message):
        """This just generates an HTML document that includes `message`
        in the body. Override, or re-write this do do more interesting stuff.
        """
        content = f"<html><body><h1>{message}</h1></body></html>"
        return content.encode("utf8")  # NOTE: must return a bytes object!

    def do_GET(self):
        self._set_headers()
        self.wfile.write(self._html(f"APPID {APPID}"))

    def do_HEAD(self):
        self._set_headers()

if __name__ == "__main__":
    server = http.server.HTTPServer(('0.0.0.0', APP_PORT), HandleRequests)
    server.serve_forever()