use actix_web::{web, App, HttpRequest, HttpResponse, HttpServer, Responder};

async fn healthcheck() -> impl Responder {
    HttpResponse::Ok()
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| App::new().route("/healthcheck}", web::get().to(healthcheck)))
        .bind("127.0.0.1:4000")?
        .run()
        .await
}
