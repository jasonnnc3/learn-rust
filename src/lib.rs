use actix_web::dev::Server;
use actix_web::{web, App, HttpResponse, HttpServer};

async fn healthcheck() -> HttpResponse {
    HttpResponse::Ok().finish()
}

pub fn run() -> Result<Server, std::io::Error> {
    let server = HttpServer::new(|| App::new().route("/healthcheck", web::get().to(healthcheck)))
        .bind("127.0.0.1:4000")?
        .run();
    Ok(server)
}
