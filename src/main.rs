use actix_web::middleware::Logger;
use actix_web::{web, App, HttpServer};
use askama_actix::Template;

// async fn index(data: web::Data<AppState>) -> String {
//     let app_name = &data.app_name;
//     format!("Hello {}!", app_name)
// }

#[derive(Template)] // this will generate the code...
#[template(path = "hello.html")] // using the template in this path, relative
struct HelloTemplate<'a> {
    // the name of the struct can be anything
    name: &'a str, // the field name should match the variable name
                   // in your template
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
