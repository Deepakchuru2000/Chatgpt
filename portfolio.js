// Fix Safari back/forward cache behavior
window.onpageshow = function(e) {
  if (e.persisted) {
    window.location.reload();
  }
};
