import vibe.d;

import p2p;

alias GambleServerSettings = HTTPServerSettings;
alias GambleServerRequest = HTTPServerRequest;
alias GambleServerResponse = HTTPServerResponse;
alias listenGamble = listenHTTP;

shared static this()
{
	auto settings = new GambleServerSettings;
	settings.port = 9999;
	settings.bindAddresses = ["::1", "127.0.0.1"];
	listenGamble(settings, &hello);

	logInfo("Please open gmbl://127.0.0.1:9999/ in your gambler.");
}

void hello(GambleServerRequest req, GambleServerResponse res)
{
	res.writeBody("Hello, Gamble World!");
}


//shared static this()
//{
//	auto settings = new HTTPServerSettings;
//	settings.port = 8080;
//	settings.bindAddresses = ["::1", "127.0.0.1"];
//	listenHTTP(settings, &hello);

//	logInfo("Please open http://127.0.0.1:8080/ in your browser.");
//}

//void hello(HTTPServerRequest req, HTTPServerResponse res)
//{
//	res.writeBody("Hello, World!");
//}

//unittest{
//	assert(1 == 2);
//}
