import vibe.d;
import std.process;
import std.conv;

shared static this() {
	auto port = environment.get("PORT", "5050");
	auto settings = new HTTPServerSettings;
	settings.port = to!short(port);
	settings.bindAddresses = ["0.0.0.0"];
	listenHTTP(settings, &hello);

	logInfo("Listening on port %s", port);
}

void hello(HTTPServerRequest req, HTTPServerResponse res) {
	res.writeBody("Hello vibe.d server");
}
