package gw.vertxcontroller;


import org.vertx.java.core.Handler;
import org.vertx.java.core.Vertx;
import org.vertx.java.core.http.HttpServer;
import org.vertx.java.core.json.JsonObject;
import com.nhncorp.mods.socket.io.SocketIOServer;
import com.nhncorp.mods.socket.io.SocketIOSocket;
import com.nhncorp.mods.socket.io.impl.DefaultSocketIOServer;
import com.nhncorp.mods.socket.io.spring.DefaultEmbeddableVerticle;

public class VertxSample extends DefaultEmbeddableVerticle {
	private static SocketIOServer io = null;

	@Override
	public void start(Vertx vertx) {
		
		int port = 12345;
		HttpServer server = vertx.createHttpServer();
		io = new DefaultSocketIOServer(vertx, server);
		
		io.sockets().onConnection(new Handler<SocketIOSocket>() {
			public void handle(final SocketIOSocket socket) {
				socket.on("msg", new Handler<JsonObject>() {
					public void handle(JsonObject event) {
					   io.sockets().emit("response", event);
					}
				});
				socket.on("id", new Handler<JsonObject>() {
					public void handle(JsonObject event) {
						io.sockets().emit("nicresponse", event);
					}	
				});
				socket.on("inmsg", new Handler<JsonObject>() {
					
					public void handle(JsonObject event) {
						System.out.println("handler ::: " + event.getString("inmsg"));
					
						io.sockets().emit("in", event);
					}		
				});
	         socket.on("exit", new Handler<JsonObject>() {

					public void handle(JsonObject event) {
						System.out.println("handler ::: " + event.getString("exit"));
						io.sockets().emit("out", event);
					}		
				});
	         socket.on("list", new Handler<JsonObject>() {
					
					public void handle(JsonObject event) {
						System.out.println("handler ::: " + event.getString("list"));
					
						io.sockets().emit("listmember", event);
					}
				});					
			}	
		});	
		server.listen(port);
	}
}
