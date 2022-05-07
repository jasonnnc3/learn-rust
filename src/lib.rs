use actix_web::{web, App, HttpResponse, HttpServer};

async fn healthcheck() -> HttpResponse {
    HttpResponse::Ok().finish()
}

pub async fn run() -> std::io::Result<()> {
    HttpServer::new(|| App::new().route("/healthcheck", web::get().to(healthcheck)))
        .bind("127.0.0.1:4000")?
        .run()
        .await
}
