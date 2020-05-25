document.addEventListener('turbolinks:load', function() {
  gtag('config', 'UA-167308723-1')
});


// document.addEventListener('turbolinks:load', function(event) {
//   if (typeof gtag === 'function') {
//     gtag('config', '<%= Rails.application.credentials.dig(:google_analytics) %>', {
//       'page_location': event.data.url
//     })
//   }
// })