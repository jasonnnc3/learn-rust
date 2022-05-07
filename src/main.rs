use actix_web::middleware::Logger;
use actix_web::{web, App, HttpServer};
use askama_actix::Template;

#[derive(Template)]
#[template(path = "hello.html")]
struct HelloTemplate<'a> {
    name: &'a str,
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    env_logger::init();

    HttpServer::new(|| {
        App::new().wrap(Logger::default()).service(
            web::scope("/actix")
                .service(web::resource("/").to(|| async { HelloTemplate { name: "world" } })),
        )
    })
    .bind(("127.0.0.1", 4000))?
    .run()
    .await
}
