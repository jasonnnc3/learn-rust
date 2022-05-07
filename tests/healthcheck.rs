#[tokio::test]
async fn healthcheck_works() {
// Arrange
spawn_app().await.expect("Failed to spawn our app.");
// We need to bring in `reqwest`
// to perform HTTP requests against our application.
let client = reqwest::Client::new();
// Act
let response = client
.get("http://127.0.0.1:8000/health_check")
.send()
.await
.expect("Failed to execute request.");
